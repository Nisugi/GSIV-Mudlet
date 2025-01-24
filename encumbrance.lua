-- Initialize the table to store encumbrance data
encumData = encumData or {
  level = 0,
  state = "None",
  description = "You are not encumbered enough to notice."
}

roundTime = roundTime or 0
roomPlayers = roomPlayers or {}

-- Function to process encumbrance data
function processEncumbrance(line)
  -- Match and extract the progressBar value and text
  local value, state = line:match("<progressBar id='encumlevel' value='(.-)' text='(.-)'")
  if value and state then
    encumData.level = tonumber(value) or 0
    encumData.state = state
    -- cecho(string.format("[DEBUG] Updated encumData: level=%d, state='%s'\n", encumData.level, encumData.state))
  end

  -- Match and extract the label's value (description)
  local description = line:match("<label id='encumblurb' value='(.-)'")
  if description then
    encumData.description = description
    -- Debug: Updated description
    -- cecho(string.format("[DEBUG] Updated encumData description: '%s'\n", encumData.description))
  end

  -- Match and extract the roundTime value
  local roundTimeValue = line:match("<roundTime value='(.-)'/>")
  if roundTimeValue then
    roundTime = tonumber(roundTimeValue) or 0
    -- Debug: Updated roundTime
    -- cecho(string.format("[DEBUG] Updated roundTime: %d\n", roundTime))
  end

  -- Process <component> tags for room players
  for player in line:gmatch("<component id='room players'>(.-)</component>") do
    -- Extract player names from the component
    for name in player:gmatch('<a exist="[^"]+" noun="([^"]+)">[^<]+</a>') do
      table.insert(roomPlayers, name)
      -- Debug: Updated room players
      -- cecho(string.format("[DEBUG] Added player to roomPlayers: '%s'\n", name))
    end
  end

  -- Remove <dialogData>, <roundTime>, and <component> tags from the line
  local cleanedLine = line
    :gsub("<dialogData.-</dialogData>", "")
    :gsub("<roundTime value='.-'/>", "")
    :gsub("<component.->.-</component>", "")

  -- Check for remaining text after removing tags
  if cleanedLine and cleanedLine:match("%S") then -- Non-whitespace check
    -- Suppress original line output and push remaining text
    deleteLine()
    cecho("<reset>" .. cleanedLine:gsub("%s+$", "") .. "\n")
  else
    -- If no remaining text, suppress the line
    deleteLine()
  end
end

tempRegexTrigger("<dialogData id='encum'>", function() processEncumbrance(line) end)
