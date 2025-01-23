-- Command Highlight Function
function highlightCommands()
  local line = getCurrentLine()

  for tag, cmdAttribute, content in line:gmatch("(<d cmd='([^']*)'>(.*)</d>)") do
    if cmdAttribute == "" then
      cmdAttribute = "<No Command>" -- Placeholder for missing cmd
    end
    if content == "" then
      content = "<No Content>" -- Placeholder for empty tag content
    end

    -- Replace the entire tag with its content (or placeholder)
    if selectString(tag, 1) > 0 then
      replace(content)
      deselect()
    end
  end

  -- Handle <d>...</d> tags (without cmd attribute)
  for tag, content in line:gmatch("(<d>(.*)</d>)") do
    if content == "" then
      content = "<No Content>" -- Placeholder for empty tags
    end

    -- Replace the entire tag with its content
    if selectString(tag, 1) > 0 then
      replace(content)
      deselect()
    end
  end
end

tempRegexTrigger("<d cmd='[^']+'>.*</d>", function() highlightCommands() end)
tempRegexTrigger("<d>.*</d>", function() highlightCommands() end)