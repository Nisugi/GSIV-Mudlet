-- Enhanced stats monsterbold color. Can set different than npcs monsterbold.
-- Placed here so trigger is checked after the hostile creature trigger checks.
monsterBold = {255, 255, 0}
function highlightMonsterBold()
  local line = getCurrentLine()
  for tag, number in line:gmatch('(<pushBold/>([^<]+)<popBold/>)') do
    if selectString(tag, 1) > 0 then
      setFgColor(unpack(monsterBold))
      deselect()
    end
  end
end


-- custom color per creature
creatureColors = creatureColors or {
  ["muscular brindlecat"] = {95, 145, 213},
  ["hulking semi-melanistic panther"] = {255, 0, 0},
  ["spectacled bear"] = {0, 255, 0},
}

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

tempRegexTrigger('<pushBold/>([^<]+)<a exist="[^"]+" noun="[^"]+">([^<]+)</a><popBold/>', function() highlightCreatures() end)

-- this is expected to trigger on things like enhanced stats that are monsterbolded, 
-- allowing you to have them a different color than hostile targets.
tempRegexTrigger('<pushBold/>([^<]+)<popBold/>', function() highlightMonsterBold() end)