-- Initialize the table to store encumbrance data
encumData = encumData or {
  level = 0,
  state = "None",
  description = "You are not encumbered enough to notice."
}

-- Function to process encumbrance data
function processEncumbrance(line)
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
    -- cecho(string.format("[DEBUG] Updated encumData description: '%s'\n", encumData.description))
  end

  -- Remove the processed <dialogData> block from the line
  local cleanedLine = line:gsub("<dialogData.-</dialogData>", "")

  -- Check for remaining text after the <dialogData> block
  if cleanedLine and cleanedLine:match("%S") then -- Non-whitespace check
    -- Suppress original line output
    deleteLine()
    -- Output the remaining text once
    cecho("<reset>" .. cleanedLine:gsub("%s+$", "") .. "\n")
  else
    -- If no remaining text, suppress the line
    deleteLine()
  end
end

-- Register the trigger for <dialogData id='encum'>
tempRegexTrigger("<dialogData id='encum'>", function() processEncumbrance(line) end)
