<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE MudletPackage>
<MudletPackage version="1.001">
	<ScriptPackage>
		<Script isActive="yes" isFolder="no">
			<name>Process XML</name>
			<packageName></packageName>
			<script>-- Global variables
roomID = roomID or { current = 0, old = 0 }
handsData = handsData or { left = "Empty", right = "Empty", spell = "None" }
castRoundTime = castRoundTime or nil
activeSpells = activeSpells or {}
activeBuffs = activeBuffs or {}
activeCooldowns = activeCooldowns or {}
activeDebuffs = activeDebuffs or {}

-- Function to process room navigation
function captureRoomID()
    roomID["current"] = tonumber(matches[2])
    -- echo(string.format("&lt;green&gt;Room ID updated: current = %d, old = %d\n", roomID["current"], roomID["old"]))
    deleteLine()
end

-- Function to delete specific lines
function deleteSpecifiedLines()
    deleteLine()
end

-- Function to process the prompt
function processPrompt()
    local line = getCurrentLine()

    -- Match the prompt content
    local promptContent = line:match("&lt;prompt time=\"[^\"]+\"&gt;(.*)&amp;gt;&lt;/prompt&gt;")
    
    if promptContent then
        cecho(string.format("&lt;reset&gt;%s&gt;", promptContent))
    end

    selectString(matches[1], 1)
    replace("")

end

-- Function to process and capture spell data
function processSpellFeed(feedType)
    -- Get the current line
    local line = getCurrentLine()
    if not line or line == "" then
        cecho(string.format("&lt;red&gt;Error: No valid line to process for feed type: %s\n", feedType))
        return
    end

    local targetTable

    -- Determine the target table based on feed type
    if feedType == "Active Spells" then
        targetTable = activeSpells
    elseif feedType == "Buffs" then
        targetTable = activeBuffs
    elseif feedType == "Cooldowns" then
        targetTable = activeCooldowns
    elseif feedType == "Debuffs" then
        targetTable = activeDebuffs
    else
        cecho(string.format("&lt;red&gt;Unknown feed type: %s\n", feedType))
        return
    end

--    cecho(string.format("&lt;cyan&gt;Processing feed type: %s\n", feedType))

    -- Match and record spell data
    for id, name, time in line:gmatch("&lt;progressBar id='([^']+)' value='[^']+' text=\"([^\"]+)\" [^&gt;]+ time='([^']+)'/&gt;") do
        cecho(string.format("&lt;yellow&gt;Matched ID=%s, Name=%s, Time=%s\n", id, name, time))
        targetTable[id] = {
            name = name,
            time = time -- Store as a string to maintain formatting
        }
--        cecho(string.format("&lt;green&gt;Added to %s: ID=%s, Name=%s, Time=%s\n", feedType, id, name, time))
    end

    -- Clean up the line after processing
    deleteLine()
end

-- Debugging command to print the tables
function printSpellTables()
    cecho("&lt;cyan&gt;Active Spells:\n")
    for id, spell in pairs(activeSpells) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, spell.name, spell.time))
    end
    cecho("&lt;cyan&gt;Buffs:\n")
    for id, buff in pairs(activeBuffs) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, buff.name, buff.time))
    end
    cecho("&lt;cyan&gt;Cooldowns:\n")
    for id, cooldown in pairs(activeCooldowns) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, cooldown.name, cooldown.time))
    end
    cecho("&lt;cyan&gt;Debuffs:\n")
    for id, debuff in pairs(activeDebuffs) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, debuff.name, debuff.time))
    end
end

-- sdigj
function processTagRemoval()
  local line = getCurrentLine()
  
  -- Keep removing tags until no more tags are found
  while true do
    local tag = line:match("&lt;[^&gt;]+&gt;")
    if not tag then break end -- Exit loop when no tags are found
    selectString(tag, 1)
    replace("")
    line = getCurrentLine() -- Update the line to reflect the replaced text
  end
end

function processFixSymbols()
  replaceAll("&amp;gt;", "&gt;")
  replaceAll("&amp;lt;", "&lt;")
  replaceAll("&amp;quot","\"")
  replaceAll("&amp;apos","'")
end

-- Function to process hand and spell data
function processHand(tagType)
    local rawContent = matches[1] -- Grab the matched content directly
    if rawContent then
        -- Remove any XML-like tags from the content
        local strippedContent = rawContent:gsub("&lt;[^&gt;]+&gt;", "")
        handsData[tagType] = strippedContent
       -- cecho(string.format("&lt;green&gt;Updated %s hand: %s\n", tagType, strippedContent))
    end
   selectString(matches[1], 1)
   replace("")
end

-- Function to process spell cast time and handle the `&lt;spell&gt;` tag
function processSpellAndCastTime()
    local spellTagContent = matches[1] -- Matched entire spell tag content
    local castTimeValue = matches[2]   -- Captured the cast time value

    -- Strip the `&lt;spell&gt;` content and replace "None" with an empty string
    if spellTagContent:find("&lt;spell&gt;None&lt;/spell&gt;") then
        local cleanedLine = spellTagContent:gsub("&lt;spell&gt;None&lt;/spell&gt;", "")
        selectString(spellTagContent, 1)
        replace(cleanedLine)
    end

    -- Update the castRoundTime from the cast time value
    if castTimeValue then
        castRoundTime = tonumber(castTimeValue)
       -- cecho(string.format("&lt;cyan&gt;Updated cast round time: %d\n", castRoundTime))
    end
end

-- Inventory Stream
-- Initialize variables
local inventoryStreamActive = false
local inventoryItemTrigger = nil -- Placeholder for dynamically created trigger

-- Function to handle the start of the inventory stream
function startInventoryStream()
    inventoryStreamActive = true
   -- cecho("&lt;green&gt;Inventory stream started.\n")
    deleteLine()

    -- Create the trigger for inventory items dynamically
    inventoryItemTrigger = tempRegexTrigger("^  ", processInventoryItem)
end

-- Function to process inventory item lines
function processInventoryItem()
    if inventoryStreamActive then
        deleteLine() -- Remove the line from the output
    end
end

-- Function to handle the end of the inventory stream
function closeInventoryStream()
    inventoryStreamActive = false
 --   cecho("&lt;red&gt;Inventory stream closed.\n")
    setTriggerStayOpen("gag inv stream", 0)

    -- Delete the dynamically created trigger for inventory items
    if inventoryItemTrigger then
        killTrigger(inventoryItemTrigger)
        inventoryItemTrigger = nil
    end
    deleteLine()
end


-- Trigger to start the inventory stream
-- &lt;clearStream id='inv' ifClosed=''
tempRegexTrigger("&lt;pushStream id='inv'/&gt;Your worn items are:", startInventoryStream)
tempRegexTrigger("&lt;popStream/&gt;", closeInventoryStream)

-- Register a combined trigger for &lt;left&gt;, &lt;right&gt;, and &lt;spell&gt; tags
tempRegexTrigger("&lt;left[^&gt;]*&gt;[^&lt;]*&lt;/left&gt;", function() processHand("left") end)
tempRegexTrigger("&lt;right[^&gt;]*&gt;[^&lt;]*&lt;/right&gt;", function() processHand("right") end)
tempRegexTrigger("&lt;spell[^&gt;]*&gt;[^&lt;]*&lt;/spell&gt;", function() processHand("spell") end)
tempRegexTrigger("&lt;spell&gt;None&lt;/spell&gt;&lt;castTime value='([^']+)'/&gt;", function() processSpellAndCastTime() end)

-- Register triggers for room navigation
tempRegexTrigger("&lt;nav rm='([^']+)'/&gt;", function() captureRoomID() end)

-- Register triggers for specific lines to delete
tempRegexTrigger("&lt;compDef id='room players'&gt;", function() deleteSpecifiedLines() end)
tempRegexTrigger("&lt;compDef id='room exits'&gt;", function() deleteSpecifiedLines() end)
tempRegexTrigger("&lt;compDef id='sprite'&gt;", function() deleteSpecifiedLines() end)
tempRegexTrigger("&lt;component id='room objs'&gt;", function() deleteSpecifiedLines() end)
tempRegexTrigger("&lt;component id='room players'&gt;", function() deleteSpecifiedLines() end)
tempRegexTrigger("&lt;pushStream id=\"speech\"/&gt;&lt;preset id='speech'&gt;", function() deleteSpecifiedLines() end)
tempRegexTrigger("&lt;output class=\"(?:mono)?\"/&gt;", function() deleteSpecifiedLines() end)
tempRegexTrigger("&lt;dialogData id='combat'&gt;", function() deleteSpecifiedLines() end)
-- putting these here in case they're needed.
-- tempRegexTrigger("&lt;/dialogData&gt;", function() deleteSpecifiedLines() end)
-- tempRegexTrigger("&lt;popStream id='room'/&gt;", function() deleteSpecifiedLines() end)

-- Register trigger for the prompt
tempRegexTrigger("&lt;prompt time=\"[^\"]+\"&gt;.*&amp;gt;&lt;/prompt&gt;", function() processPrompt() end)
tempRegexTrigger("(&amp;gt;|&amp;lt;|&amp;quot|&amp;apos)", function() processFixSymbols() end)

-- Register triggers for each spell feed type
tempRegexTrigger("&lt;dialogData id='Active Spells'", function() processSpellFeed("Active Spells") end)
tempRegexTrigger("&lt;dialogData id='Buffs'", function() processSpellFeed("Buffs") end)
tempRegexTrigger("&lt;dialogData id='Cooldowns'", function() processSpellFeed("Cooldowns") end)
tempRegexTrigger("&lt;dialogData id='Debuffs'", function() processSpellFeed("Debuffs") end)

-- This is a catch-all, does a great job removing the tags but can leave text behind.
-- Disable to troubleshoot, or build out functionality from the xml feed.
 tempRegexTrigger("&lt;[^&gt;]+&gt;", function() processTagRemoval() end)

cecho("&lt;green&gt;Process XML Script loaded successfully!\n")</script>
			<eventHandlerList />
		</Script>
	</ScriptPackage>
</MudletPackage>
