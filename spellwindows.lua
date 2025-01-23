activeSpells = activeSpells or {}
activeBuffs = activeBuffs or {}
activeCooldowns = activeCooldowns or {}
activeDebuffs = activeDebuffs or {}

-- Function to process and capture spell data
function processSpellFeed(feedType, line)
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

  -- Match and record spell data
  for id, name, time in line:gmatch("<progressBar id='([^']+)' value='[^']+' text=\"([^\"]+)\" [^>]+ time='([^']+)'/>") do
    targetTable[id] = {
      name = name,
      time = time -- Store as a string to maintain formatting
    }
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

-- Register triggers for each spell feed type
tempRegexTrigger("<dialogData id='Active Spells'>", function() processSpellFeed("Active Spells", line) end)
tempRegexTrigger("<dialogData id='Buffs'>", function() processSpellFeed("Buffs", line) end)
tempRegexTrigger("<dialogData id='Cooldowns'>", function() processSpellFeed("Cooldowns", line) end)
tempRegexTrigger("<dialogData id='Debuffs'>", function() processSpellFeed("Debuffs", line) end)
