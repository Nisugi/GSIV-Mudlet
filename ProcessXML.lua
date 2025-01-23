-- Global variables
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
    -- echo(string.format("<green>Room ID updated: current = %d, old = %d\n", roomID["current"], roomID["old"]))
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
    local promptContent = line:match("<prompt time=\"[^\"]+\">(.*)&gt;</prompt>")
    
    if promptContent then
        cecho(string.format("<reset>%s>", promptContent))
    end

    selectString(matches[1], 1)
    replace("")

end

-- Function to process and capture spell data
function processSpellFeed(feedType)
    -- Get the current line
    local line = getCurrentLine()
    if not line or line == "" then
        cecho(string.format("<red>Error: No valid line to process for feed type: %s\n", feedType))
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
        cecho(string.format("<red>Unknown feed type: %s\n", feedType))
        return
    end

--    cecho(string.format("<cyan>Processing feed type: %s\n", feedType))

    -- Match and record spell data
    for id, name, time in line:gmatch("<progressBar id='([^']+)' value='[^']+' text=\"([^\"]+)\" [^>]+ time='([^']+)'/>") do
        cecho(string.format("<yellow>Matched ID=%s, Name=%s, Time=%s\n", id, name, time))
        targetTable[id] = {
            name = name,
            time = time -- Store as a string to maintain formatting
        }
--        cecho(string.format("<green>Added to %s: ID=%s, Name=%s, Time=%s\n", feedType, id, name, time))
    end

    -- Clean up the line after processing
    deleteLine()
end

-- Debugging command to print the tables
function printSpellTables()
    cecho("<cyan>Active Spells:\n")
    for id, spell in pairs(activeSpells) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, spell.name, spell.time))
    end
    cecho("<cyan>Buffs:\n")
    for id, buff in pairs(activeBuffs) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, buff.name, buff.time))
    end
    cecho("<cyan>Cooldowns:\n")
    for id, cooldown in pairs(activeCooldowns) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, cooldown.name, cooldown.time))
    end
    cecho("<cyan>Debuffs:\n")
    for id, debuff in pairs(activeDebuffs) do
        cecho(string.format("  ID: %s, Name: %s, Time: %s\n", id, debuff.name, debuff.time))
    end
end

-- sdigj
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

function processFixSymbols()
  replaceAll("&gt;", ">")
  replaceAll("&lt;", "<")
  replaceAll("&quot","\"")
  replaceAll("&apos","'")
end

-- Function to process hand and spell data
function processHand(tagType)
    local rawContent = matches[1] -- Grab the matched content directly
    if rawContent then
        -- Remove any XML-like tags from the content
        local strippedContent = rawContent:gsub("<[^>]+>", "")
        handsData[tagType] = strippedContent
       -- cecho(string.format("<green>Updated %s hand: %s\n", tagType, strippedContent))
    end
   selectString(matches[1], 1)
   replace("")
end

-- Function to process spell cast time and handle the `<spell>` tag
function processSpellAndCastTime()
    local spellTagContent = matches[1] -- Matched entire spell tag content
    local castTimeValue = matches[2]   -- Captured the cast time value

    -- Strip the `<spell>` content and replace "None" with an empty string
    if spellTagContent:find("<spell>None</spell>") then
        local cleanedLine = spellTagContent:gsub("<spell>None</spell>", "")
        selectString(spellTagContent, 1)
        replace(cleanedLine)
    end

    -- Update the castRoundTime from the cast time value
    if castTimeValue then
        castRoundTime = tonumber(castTimeValue)
       -- cecho(string.format("<cyan>Updated cast round time: %d\n", castRoundTime))
    end
end

-- Inventory Stream
-- Initialize variables
local inventoryStreamActive = false
local inventoryItemTrigger = nil -- Placeholder for dynamically created trigger

-- Function to handle the start of the inventory stream
function startInventoryStream()
    inventoryStreamActive = true
   -- cecho("<green>Inventory stream started.\n")
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
 --   cecho("<red>Inventory stream closed.\n")
    setTriggerStayOpen("gag inv stream", 0)

    -- Delete the dynamically created trigger for inventory items
    if inventoryItemTrigger then
        killTrigger(inventoryItemTrigger)
        inventoryItemTrigger = nil
    end
    deleteLine()
end


-- Trigger to start the inventory stream
-- <clearStream id='inv' ifClosed=''
tempRegexTrigger("<pushStream id='inv'/>Your worn items are:", startInventoryStream)
tempRegexTrigger("<popStream/>", closeInventoryStream)

-- Register a combined trigger for <left>, <right>, and <spell> tags
tempRegexTrigger("<left[^>]*>[^<]*</left>", function() processHand("left") end)
tempRegexTrigger("<right[^>]*>[^<]*</right>", function() processHand("right") end)
tempRegexTrigger("<spell[^>]*>[^<]*</spell>", function() processHand("spell") end)
tempRegexTrigger("<spell>None</spell><castTime value='([^']+)'/>", function() processSpellAndCastTime() end)

-- Register triggers for room navigation
tempRegexTrigger("<nav rm='([^']+)'/>", function() captureRoomID() end)

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

-- Register trigger for the prompt
tempRegexTrigger("<prompt time=\"[^\"]+\">.*&gt;</prompt>", function() processPrompt() end)
tempRegexTrigger("(&gt;|&lt;|&quot|&apos)", function() processFixSymbols() end)

-- Register triggers for each spell feed type
tempRegexTrigger("<dialogData id='Active Spells'", function() processSpellFeed("Active Spells") end)
tempRegexTrigger("<dialogData id='Buffs'", function() processSpellFeed("Buffs") end)
tempRegexTrigger("<dialogData id='Cooldowns'", function() processSpellFeed("Cooldowns") end)
tempRegexTrigger("<dialogData id='Debuffs'", function() processSpellFeed("Debuffs") end)

-- This is a catch-all, does a great job removing the tags but can leave text behind.
-- Disable to troubleshoot, or build out functionality from the xml feed.
 tempRegexTrigger("<[^>]+>", function() processTagRemoval() end)

cecho("<green>Process XML Script loaded successfully!\n")