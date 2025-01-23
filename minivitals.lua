-- Initialize the tables to store vital and spell data
vitalsData = vitalsData or {}
castRoundTime = nil
handsData = handsData or { left = "Empty", right = "Empty", spell = "None" }

-- Function to process vital data
function processVitals(line)
  -- Loop through all <dialogData> blocks in the line
  for block in line:gmatch("<dialogData.->.-</dialogData>") do
    -- Process progress bars in the block
    for barId, value, text in block:gmatch("<progressBar id='(.-)' value='(.-)' text='(.-)' .-/>") do
      local barValue = tonumber(value) or 0
        vitalsData[barId] = {
          value = barValue,
          text = text
        }
        -- cecho(string.format("[DEBUG] Updated %s: value=%d, text='%s'\n", barId, barValue, text))
      end

      -- Extract <castTime> data and store it
      local castTimeValue = block:match("<castTime value='(%d+)'/>")
        if castTimeValue then
          castRoundTime = tonumber(castTimeValue)
          -- cecho(string.format("[DEBUG] Updated castRoundTime: %d\n", castRoundTime))
        end

        -- Extract <spell> data and store it in handsData
        local spell = block:match("<spell>(.-)</spell>")
        if spell then
          handsData["spell"] = spell
          -- cecho(string.format("[DEBUG] Updated handsData['spell']: '%s'\n", spell))
        end
    end
    deleteLine()
end

-- Trigger to process <dialogData> blocks for minivitals
tempRegexTrigger("<dialogData id='minivitals'>", function() processVitals(line) end)

-- Function to process hand feed
function processHand(tagType)
  local rawContent = matches[1]
  if rawContent then
    local strippedContent = rawContent:gsub("<[^>]+>", "")
    handsData[tagType] = strippedContent
    -- cecho(string.format("<green>Updated %s hand: %s\n", tagType, strippedContent))
  end
  selectString(matches[1], 1)
  replace("")
end

-- Triggers for left and right hand feeds
tempRegexTrigger("<left[^>]*>[^<]*</left>", function() processHand("left") end)
tempRegexTrigger("<right[^>]*>[^<]*</right>", function() processHand("right") end)
