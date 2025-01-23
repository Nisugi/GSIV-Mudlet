-- This is a catch-all, does a great job removing the tags but can leave text behind.
function processTagRemoval()
  local line = getCurrentLine()
  -- Keep removing tags until no more tags are found
  while true do
    local tag = line:match("<[^>]+>")
    if not tag then break end -- Exit loop when no tags are found
    selectString(tag, 1)
    replace("")
    line = getCurrentLine() -- Update the line to reflect the replaced text
  end
end
-- Disable to troubleshoot, or build out functionality from the xml feed.
tempRegexTrigger("<[^>]+>", function() processTagRemoval() end)



-- Function to delete specific lines
function deleteSpecifiedLines()
  deleteLine()
end

-- Register triggers for specific lines to delete
tempRegexTrigger("<compDef id='room players'>", function() deleteSpecifiedLines() end)
tempRegexTrigger("<compDef id='room exits'>", function() deleteSpecifiedLines() end)
tempRegexTrigger("<compDef id='sprite'>", function() deleteSpecifiedLines() end)
tempRegexTrigger("<component id='room objs'>", function() deleteSpecifiedLines() end)
tempRegexTrigger("<component id='room players'>", function() deleteSpecifiedLines() end)
tempRegexTrigger("<pushStream id=\"speech\"/><preset id='speech'>", function() deleteSpecifiedLines() end)
tempRegexTrigger("<output class=\"(?:mono)?\"/>", function() deleteSpecifiedLines() end)
tempRegexTrigger("<dialogData id='combat'>", function() deleteSpecifiedLines() end)
-- putting these here in case they're needed.
-- tempRegexTrigger("</dialogData>", function() deleteSpecifiedLines() end)
-- tempRegexTrigger("<popStream id='room'/>", function() deleteSpecifiedLines() end)



function processFixSymbols()
  replaceAll("&gt;", ">")
  replaceAll("&lt;", "<")
  replaceAll("&quot","\"")
  replaceAll("&apos","'")
end

tempRegexTrigger("(&gt;|&lt;|&quot|&apos)", function() processFixSymbols() end)
