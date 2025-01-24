-- Global variables
roomID = roomID or { current = 0, old = 0 }

-- Function to process room navigation
function captureRoomID()
  roomID["current"] = tonumber(matches[2])
  deleteLine()
end

-- Function to process the prompt
function processPrompt(line)
  local promptContent = line:match("<prompt time=\"[^\"]+\">(.*)&gt;</prompt>")
    
  if promptContent then
    cecho(string.format("<reset>%s>\n", promptContent))
  else
    cecho("<reset>>\n")
  end
  deleteLine()
end

tempRegexTrigger("<prompt time=\".-\">.-</prompt>", function() processPrompt(line) end)

tempRegexTrigger("<nav rm='([^']+)'/>", function() captureRoomID() end)