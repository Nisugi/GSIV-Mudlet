-- Initialize the required data tables
vitalsData = vitalsData or {}
handsData = handsData or { left = "Empty", right = "Empty", spell = "None" }
statusIndicators = statusIndicators or {}
compassData = compassData or { directions = {} }
encumData = encumData or { level = 0, state = "None" }
stanceData = stanceData or { value = 0 }
mindStateData = mindStateData or { value = 0, text = "clear as a bell" }

-- Function to process the UI update blurb
function processUIUpdate(line)
  -- Extract vitals data (mana, health, spirit, stamina)
  for id, value, text in line:gmatch("<progressBar id='(mana|health|spirit|stamina)' value='(.-)' text='(.-)'") do
    vitalsData[id] = { value = tonumber(value) or 0, text = text }
    -- cecho(string.format("[DEBUG] Updated vitalsData: %s = %s (%s)\n", id, value, text))
  end

  -- Extract encumbrance data
  local encumValue, encumText = line:match("<progressBar id='encumlevel' value='(.-)' text='(.-)'")
  if encumValue and encumText then
    encumData.level = tonumber(encumValue) or 0
    encumData.state = encumText
    -- cecho(string.format("[DEBUG] Updated encumData: level=%d, state='%s'\n", encumData.level, encumData.state))
  end

  -- Extract stance data
  local stanceValue = line:match("<progressBar id='pbarStance' value='(.-)'")
  if stanceValue then
    stanceData.value = tonumber(stanceValue) or 0
    -- cecho(string.format("[DEBUG] Updated stanceData: value=%d\n", stanceData.value))
  end

  -- Extract mind state data
  local mindValue, mindText = line:match("<progressBar id='mindState' value='(.-)' text='(.-)'")
  if mindValue and mindText then
    mindStateData.value = tonumber(mindValue) or 0
    mindStateData.text = mindText
    -- cecho(string.format("[DEBUG] Updated mindStateData: value=%d, text='%s'\n", mindStateData.value, mindStateData.text))
  end

  -- Extract spell data
  local spell = line:match("<spell>(.-)</spell>")
  if spell then
    handsData.spell = spell
    -- cecho(string.format("[DEBUG] Updated handsData.spell: '%s'\n", spell))
  end

  -- Extract hands data
  for tagType, content in line:gmatch("<(left|right)>(.-)</%1>") do
    handsData[tagType] = content
    -- cecho(string.format("[DEBUG] Updated handsData.%s: '%s'\n", tagType, content))
  end

  -- Extract status indicators
  for id, visible in line:gmatch("<indicator id='(.-)' visible='(.-)'/>") do
    statusIndicators[id] = visible == "y"
    -- cecho(string.format("[DEBUG] Updated statusIndicators: %s = %s\n", id, visible == "y" and "true" or "false"))
  end

  -- Extract compass directions
  compassData.directions = {} -- Reset directions
  for direction in line:gmatch("<dir value='(.-)'/>") do
    table.insert(compassData.directions, direction)
    -- cecho(string.format("[DEBUG] Added compass direction: '%s'\n", direction))
  end

  -- Debug: Log complete update
  -- cecho("[DEBUG] UI update processing complete.\n")
end

tempRegexTrigger("<progressBar id='mana'.*<compass>.*</compass>", function() processUIUpdate(line) end)
