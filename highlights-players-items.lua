playerColors = playerColors or {
  ["Hypate"] = {95, 145, 213},   -- Light blue for Hypate
  ["Nisugi"] = {0, 255, 0},      -- Green for Nisugi
  ["Sugiin"] = {0, 0, 255},      -- Blue for Sugiin
}

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

tempRegexTrigger('<a exist="-[^"]+" noun="[^"]+">([^<]+)</a>', function() highlightPlayers() end)