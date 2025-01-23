-- GSIV Framework: Comprehensive Highlight Management Script

-- Global Variables
playerColors = playerColors or {
    ["Hypate"] = {95, 145, 213},   -- Light blue for Hypate
    ["Nisugi"] = {0, 255, 0},      -- Green for Nisugi
    ["Sugiin"] = {0, 0, 255},      -- Blue for Sugiin
}

creatureColors = creatureColors or {
    ["muscular brindlecat"] = {95, 145, 213},
    ["hulking semi-melanistic panther"] = {255, 0, 0},
    ["spectacled bear"] = {0, 255, 0},
}

channelColors = channelColors or {
    ["[Help]"] = {3, 148, 252},       -- Blue
    ["[Merchant]"] = {3, 252, 57},    -- Green
    ["[General]"] = {123, 3, 252},    -- Purple
    ["[OOC]"] = {156, 156, 156},      -- Gray
    ["[Realm]"] = {255, 255, 255},    -- White
    ["[Focused]"] = {255, 0, 0}       -- Red
}

-- Default color for monsterBold numbers
monsterBold = {255, 255, 0} -- Yellow

-- Player Highlight Functions
function highlightPlayers()
    local line = getCurrentLine()
    for tag, playerName in line:gmatch('(<a exist="-[^"]+" noun="[^"]+">([^<]+)</a>)') do
        local color = playerColors[playerName] or {168, 100, 82} -- Default color (brownish)
        if color and selectString(tag, 1) > 0 then
            setFgColor(unpack(color))
            deselect()
        end
    end
end

function addPlayerColor(playerName, r, g, b)
    if not playerName or not r or not g or not b then
        cecho("<red>Usage: addPlayerColor(\"name\", r, g, b)\n")
        return
    end
    playerColors[playerName] = {tonumber(r), tonumber(g), tonumber(b)}
    cecho(string.format("<green>Added/Updated player: %s with color RGB(%d, %d, %d)\n", playerName, r, g, b))
end

function removePlayerColor(playerName)
    if not playerName or not playerColors[playerName] then
        cecho("<red>Player not found. Usage: removePlayerColor(\"name\")\n")
        return
    end
    playerColors[playerName] = nil
    cecho(string.format("<yellow>Removed player: %s\n", playerName))
end

function listPlayerColors()
    cecho("<cyan>Player Colors:\n")
    for playerName, color in pairs(playerColors) do
        cecho(string.format("  - %s: RGB(%d, %d, %d)\n", playerName, color[1], color[2], color[3]))
    end
end

-- Creature Highlight Functions
function highlightCreatures()
    local line = getCurrentLine()
    for tag, creatureName in line:gmatch('(<pushBold/>([^<]+)<a exist="[^"]+" noun="[^"]+">([^<]+)</a><popBold/>)') do
        local color = creatureColors[creatureName] or {255, 0, 0} -- Default color (red)
        if color and selectString(tag, 1) > 0 then
            setFgColor(unpack(color))
            deselect()
        end
    end
end

function addCreatureColor(creatureName, r, g, b)
    if not creatureName or not r or not g or not b then
        cecho("<red>Usage: addCreatureColor(\"name\", r, g, b)\n")
        return
    end
    creatureColors[creatureName] = {tonumber(r), tonumber(g), tonumber(b)}
    cecho(string.format("<green>Added/Updated creature: %s with color RGB(%d, %d, %d)\n", creatureName, r, g, b))
end

function removeCreatureColor(creatureName)
    if not creatureName or not creatureColors[creatureName] then
        cecho("<red>Creature not found. Usage: removeCreatureColor(\"name\")\n")
        return
    end
    creatureColors[creatureName] = nil
    cecho(string.format("<yellow>Removed creature: %s\n", creatureName))
end

function listCreatureColors()
    cecho("<cyan>Creature Colors:\n")
    for creatureName, color in pairs(creatureColors) do
        cecho(string.format("  - %s: RGB(%d, %d, %d)\n", creatureName, color[1], color[2], color[3]))
    end
end

-- Command Highlight Function
function highlightCommands()
    local line = getCurrentLine()
    -- could add a color setting
    -- Handle <d cmd='...'>(optional content)</d> tags
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

-- Channel Highlight Function
function highlightChannels()
    local line = getCurrentLine()

    -- Match for general `[Channel]` messages
    local channel = line:match("%[.-%]")
    if channel then
        local color = channelColors[channel] or {255, 255, 255} -- Default to white
        if selectString(channel, 1) > 0 then
            setFgColor(unpack(color))
            deselect()
        end
    end

    -- Match for `[Focused to <name>]` messages
    for tag, name in line:gmatch('(%[Focused to <a exist="[^"]+" noun="[^"]+">([^<]+)</a>])') do
        if name then
            local color = channelColors["[Focused]"] or {255, 0, 0} -- Use the same color as `[Focused]`
            if selectString(tag, 1) > 0 then
                setFgColor(unpack(color))
                deselect()
            end
        end
    end
end

-- Monster Bold Highlight Function
function highlightMonsterBold()
    local line = getCurrentLine()
    for tag, number in line:gmatch('(<pushBold/>([^<]+)<popBold/>)') do
        if selectString(tag, 1) > 0 then
            setFgColor(unpack(monsterBold))
            deselect()
        end
    end
end

-- Register Triggers
tempRegexTrigger('<a exist="-[^"]+" noun="[^"]+">([^<]+)</a>', function() highlightPlayers() end)
tempRegexTrigger('<pushBold/>([^<]+)<a exist="[^"]+" noun="[^"]+">([^<]+)</a><popBold/>', function() highlightCreatures() end)
tempRegexTrigger("<d cmd='[^']+'>.*</d>", function() highlightCommands() end)
tempRegexTrigger("<d>.*</d>", function() highlightCommands() end)
tempRegexTrigger('<pushBold/>([^<]+)<popBold/>', function() highlightMonsterBold() end)
tempRegexTrigger('<pushStream id="thoughts"/>', function() highlightChannels() end)

cecho("<green>Color the World Script loaded successfully!\n")
