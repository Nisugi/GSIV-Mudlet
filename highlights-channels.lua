channelColors = channelColors or {
  ["[Help]"] = {3, 148, 252},       -- Blue
  ["[Merchant]"] = {3, 252, 57},    -- Green
  ["[General]"] = {123, 3, 252},    -- Purple
  ["[OOC]"] = {156, 156, 156},      -- Gray
  ["[Realm]"] = {255, 255, 255},    -- White
  ["[Focused]"] = {255, 0, 0}       -- Red
}

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
      local color = channelColors["[Focused]"] or {255, 0, 0} -- Use the same color as `[Focused]` or red
      if selectString(tag, 1) > 0 then
        setFgColor(unpack(color))
        deselect()
      end
    end
  end
end

tempRegexTrigger('<pushStream id="thoughts"/>', function() highlightChannels() end)