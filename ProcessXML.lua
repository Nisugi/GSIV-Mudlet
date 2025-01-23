-- Global variables
roomID = roomID or { current = 0, old = 0 }
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