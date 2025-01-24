-- Initialize the table to store stance data
stanceData = stanceData or {
  value = 0,
  text = "Unknown"
}

-- Function to process stance data
function processStance(line)
  local value, text = line:match("<progressBar id='pbarStance' value='(.-)' text='(.-)'")
  if value and text then
    stanceData.value = tonumber(value) or 0
    stanceData.text = text
    -- cecho(string.format("[DEBUG] Updated stanceData: value=%d, text='%s'\n", stanceData.value, stanceData.text))
  end

  local cleanedLine = line:gsub("<dialogData.-</dialogData>", "")
  if cleanedLine and cleanedLine:match("%S") then
    deleteLine()
    cecho("\n<reset>" .. cleanedLine:gsub("%s+$", "") .. "\n")
  else
    deleteLine()
  end
end

tempRegexTrigger("<dialogData id='stance'>", function() processStance(line) end)