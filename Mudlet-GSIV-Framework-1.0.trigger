<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE MudletPackage>
<MudletPackage version="1.001">
	<TriggerPackage>
		<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
			<name>GSIV Framework</name>
			<script></script>
			<triggerType>0</triggerType>
			<conditonLineDelta>0</conditonLineDelta>
			<mStayOpen>0</mStayOpen>
			<mCommand></mCommand>
			<packageName></packageName>
			<mFgColor>#ff0000</mFgColor>
			<mBgColor>#ffff00</mBgColor>
			<mSoundFile></mSoundFile>
			<colorTriggerFgColor>#000000</colorTriggerFgColor>
			<colorTriggerBgColor>#000000</colorTriggerBgColor>
			<regexCodeList />
			<regexCodePropertyList />
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Highlights</name>
				<script>-- Grouping up highlights and tossing them up top so they trigger first.
</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList />
				<regexCodePropertyList />
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Links Players / Items</name>
					<script>-- Define a table of player names mapped to their respective RGB colors
local playerColors = {
  ["Hypate"] = {95, 145, 213},   -- Light blue for Hypate
  ["Nisugi"] = {0, 255, 0},      -- Green for Nisugi
  ["Sugiin"] = {0, 0, 255},      -- Blue for Sugiin
}

-- Get the current line being processed in the MUD client
local line = getCurrentLine()

-- Loop through all matches in the line using a regex pattern to capture XML-like tags and their content
-- gmatch captures:
--   - `tag`: The entire XML tag (e.g., `&lt;a exist="-123" noun="example"&gt;Hypate&lt;/a&gt;`)
--   - `thing`: The content within the tag (e.g., `Hypate`)
for tag, thing in line:gmatch('(&lt;a exist="-[^"]+" noun="[^"]+"&gt;([^&lt;]+)&lt;/a&gt;)') do
  -- Look up the color for the extracted content (`thing`) in the `playerColors` table
  -- If not found, default to a brownish color {168, 100, 82}
  local color = playerColors[thing] or {168, 100, 82}

  -- If a valid color is found or defaulted, apply it to the matched text
  if color then
    -- Select the entire XML tag (`tag`) in the current line
    if selectString(tag, 1) &gt; 0 then
      -- Apply the color to the selected text
      setFgColor(unpack(color))
      -- Deselect to finalize formatting and avoid interfering with other parts of the line
      deselect()
    end
  end
end</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;a exist="-[^"]+" noun="[^"]+"&gt;([^&lt;]+)&lt;/a&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Links MonsterBold</name>
					<script>local creatureColors = {
  ["muscular brindlecat"] = {95, 145, 213},
  ["hulking semi-melanistic panther"] = {255, 0, 0},
  ["spectacled bear"] = {0, 255, 0},
}

local line = getCurrentLine()

for tag, creature in line:gmatch('(&lt;pushBold/&gt;[^&lt;]+&lt;a exist="[^"]+" noun="[^"]+"&gt;([^&lt;]+)&lt;/a&gt;&lt;popBold/&gt;)') do
  local color = creatureColors[creature] or {255, 0, 0}
  if color then
    if selectString(tag, 1) &gt; 0 then
      setFgColor(unpack(color))
      deselect()
    end
  end
end</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;pushBold/&gt;([^&lt;]+)&lt;a exist="[^"]+" noun="[^"]+"&gt;([^&lt;]+)&lt;/a&gt;&lt;popBold/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Links Commands</name>
					<script>selectString(matches[1], 1)
replace(matches[2])

-- uncomment to change color of all caps commands
-- setFgColor(192, 192, 0)
deselect()

</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;d&gt;(.*)&lt;/d&gt;</string>
						<string> &lt;d cmd='[^']+'&gt;(.*)&lt;/d&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
			</TriggerGroup>
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Comms</name>
				<script>-- Cleanup and Highlights.
-- ESP
-- Death msgs
-- Logon
-- Logoff
-- Need Announcement and Send</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList />
				<regexCodePropertyList />
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>popStream</name>
					<script>selectString(matches[1], 1)
replace("")

-- cleans up &lt;popStream/&gt; that ended up on a new line.
-- trying to clean extra prompts that are not on their own line.</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;popStream/&gt;&lt;prompt time="[^"]+"&gt;.+&lt;/prompt&gt;</string>
						<string>&lt;popStream/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Login / Logoff</name>
					<script>selectString(matches[1], 1)
replace("")

-- just removing the beginning tags for these</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;pushStream id="logons"/&gt;</string>
						<string>&lt;pushStream id="death"/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>ESP</name>
					<script>-- Define a table to map channels to colors
local channelColors = {
  ["[Help]"] = {3, 148, 252},       -- Blue
  ["[Merchant]"] = {3, 252, 57},    -- Green
  ["[General]"] = {123, 3, 252},    -- Purple
  ["[OOC]"] = {156, 156, 156},      -- Gray
  ["[Realm]"] = {255, 255, 255},    -- White
  ["[Focused]"] = {255, 0, 0}       -- Red
}

-- Get the current line
local line = getCurrentLine()

-- Match the entire line and extract the channel and name
local channel, name = line:match("(%[.-%]) .-&lt;a [^&gt;]-noun=\"[^\"]+\"&gt;([^&lt;]+)&lt;/a&gt;")

if channel and name then
  -- Check if the channel exists in the color map
  local color = channelColors[channel] or {255, 255, 255} -- Default to white if not found

  -- Highlight the name with the color
  if selectString(channel, 1) &gt; 0 then
    setFgColor(unpack(color))
    deselect() -- Deselect to finalize formatting
  end
end</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;pushStream id="thoughts"/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Speech Window</name>
					<script>-- duplicate line from speech window.
-- using delete to not have a blank line.
deleteLine()</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;pushStream id="speech"/&gt;&lt;preset id='speech'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
			</TriggerGroup>
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Room and Navigation</name>
				<script>-- Deleteing room window feed.
-- Story Window</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList />
				<regexCodePropertyList />
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Room Window</name>
					<script></script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList />
					<regexCodePropertyList />
					<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Nav</name>
						<script>-- compassData = { directions = { w, u, out } } 
-- roomID = { current, old }

if not roomID then
  roomID = { 
    current = 0,
    old = 0
  }
end

roomID["current"] = tonumber(matches[2])

-- just delete instead of replace since it's for the room window
deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;nav rm='([^']+)'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
						<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
							<name>Story Window Title</name>
							<script>selectString(matches[1], 1)
replace("")</script>
							<triggerType>0</triggerType>
							<conditonLineDelta>0</conditonLineDelta>
							<mStayOpen>0</mStayOpen>
							<mCommand></mCommand>
							<packageName></packageName>
							<mFgColor>#ff0000</mFgColor>
							<mBgColor>#ffff00</mBgColor>
							<mSoundFile></mSoundFile>
							<colorTriggerFgColor>#000000</colorTriggerFgColor>
							<colorTriggerBgColor>#000000</colorTriggerBgColor>
							<regexCodeList>
								<string>&lt;streamWindow id='main' title='Story' subtitle="[^"]+" location='center' target='drop'/&gt;</string>
							</regexCodeList>
							<regexCodePropertyList>
								<integer>1</integer>
							</regexCodePropertyList>
						</Trigger>
						<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
							<name>Room Window Title</name>
							<script>-- Title

</script>
							<triggerType>0</triggerType>
							<conditonLineDelta>0</conditonLineDelta>
							<mStayOpen>0</mStayOpen>
							<mCommand></mCommand>
							<packageName></packageName>
							<mFgColor>#ff0000</mFgColor>
							<mBgColor>#ffff00</mBgColor>
							<mSoundFile></mSoundFile>
							<colorTriggerFgColor>#000000</colorTriggerFgColor>
							<colorTriggerBgColor>#000000</colorTriggerBgColor>
							<regexCodeList>
								<string>&lt;streamWindow id='room' title='Room' subtitle="[^"]+" location='center' target='drop' ifClosed='' resident='true'/&gt;&lt;clearStream id='room'/&gt;</string>
							</regexCodeList>
							<regexCodePropertyList>
								<integer>1</integer>
							</regexCodePropertyList>
							<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
								<name>Room Description</name>
								<script>-- Room Description

selectString(matches[1], 1)
replace("")</script>
								<triggerType>0</triggerType>
								<conditonLineDelta>0</conditonLineDelta>
								<mStayOpen>0</mStayOpen>
								<mCommand></mCommand>
								<packageName></packageName>
								<mFgColor>#ff0000</mFgColor>
								<mBgColor>#ffff00</mBgColor>
								<mSoundFile></mSoundFile>
								<colorTriggerFgColor>#000000</colorTriggerFgColor>
								<colorTriggerBgColor>#000000</colorTriggerBgColor>
								<regexCodeList>
									<string>&lt;pushStream id='room'/&gt;&lt;compDef id='room desc'&gt;.+&lt;/compDef&gt;</string>
								</regexCodeList>
								<regexCodePropertyList>
									<integer>1</integer>
								</regexCodePropertyList>
							</Trigger>
							<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
								<name>Room Objects</name>
								<script>-- Room Objects

selectString(matches[1], 1)
replace("")</script>
								<triggerType>0</triggerType>
								<conditonLineDelta>0</conditonLineDelta>
								<mStayOpen>0</mStayOpen>
								<mCommand></mCommand>
								<packageName></packageName>
								<mFgColor>#ff0000</mFgColor>
								<mBgColor>#ffff00</mBgColor>
								<mSoundFile></mSoundFile>
								<colorTriggerFgColor>#000000</colorTriggerFgColor>
								<colorTriggerBgColor>#000000</colorTriggerBgColor>
								<regexCodeList>
									<string>&lt;compDef id='room objs'&gt;.+&lt;/compDef&gt;</string>
								</regexCodeList>
								<regexCodePropertyList>
									<integer>1</integer>
								</regexCodePropertyList>
							</Trigger>
						</TriggerGroup>
					</TriggerGroup>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Room Players</name>
						<script>-- just delete instead of replace since it's for the room window
deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;compDef id='room players'&gt;&lt;/compDef&gt;</string>
							<string>&lt;compDef id='room players'&gt;.+&lt;/compDef&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Room Exits</name>
						<script>-- just delete instead of replace since it's for the room window
deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;compDef id='room exits'&gt;.+&lt;/compDef&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Room Sprite ?</name>
						<script>-- just delete instead of replace since it's for the room window
deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;compDef id='sprite'&gt;&lt;/compDef&gt;</string>
							<string>&lt;compDef id='sprite'&gt;.+&lt;/compDef&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Room End</name>
						<script>-- just delete instead of replace since it's for the room window
deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;popStream id='room'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Room Window Also Here</name>
					<script>-- selectString(matches[1], 1)
-- replace("")

-- Room Windows player feed. Not needed.</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;component id='room players'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Strip XML</name>
						<script>-- local line = getCurrentLine()
-- Use gmatch to find and remove all matches for XML tags
-- for tag in line:gmatch("&lt;[^&gt;]+&gt;") do
--   if selectString(tag, 1) &gt; 0 then
--     replace("")
--   end
-- end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>Also here:</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>--selectString(matches[1], 1)

-- Check if the line is empty after replacing
--if getCurrentLine() == matches[1] then
--  deleteLine() -- Remove the line if it would be blank
--else
--  replace("") -- Otherwise, replace the matched content
--end

deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/component&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Story Window Room Title</name>
					<script>selectString(matches[1], 1)
replace("")

-- Can grab the room title from here.</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;resource picture="[^"]+"/&gt;&lt;style id="roomName" /&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Room Description</name>
					<script>selectString(matches[1], 1)
replace("")

local line = getCurrentLine()
-- Use gmatch to find and remove all matches for XML tags
for tag in line:gmatch("&lt;[^&gt;]+&gt;") do
  if selectString(tag, 1) &gt; 0 then
    replace("")
  end
end

-- cleaning up the tags in our room description, could grab room items here for UI.</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;style id=""/&gt;&lt;style id="roomDesc"/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Also Here</name>
					<script>local line = getCurrentLine()
-- Use gmatch to find and remove all matches for XML tags
for tag in line:gmatch("&lt;[^&gt;]+&gt;") do
  if selectString(tag, 1) &gt; 0 then
    replace("")
  end
end

-- cleaning up tags in our Also Here. Could capture players from here for UI element.</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>Also here:</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Obvious Exits</name>
					<script>-- Strips xml tags from Obvious Exits </script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>Obvious exits: </string>
						<string>Obvious paths:</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Strip XML</name>
						<script>local line = getCurrentLine()
-- Use gmatch to find and remove all matches for XML tags
for tag in line:gmatch("&lt;[^&gt;]+&gt;") do
  if selectString(tag, 1) &gt; 0 then
    replace("")
  end
end
</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;[^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Compass</name>
					<script>if roomID["current"] ~= roomID["old"] then
  compassData = { directions = {} }
end</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;compass&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>North</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "n")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="n"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>East</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "e")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="e"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>South</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "s")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="s"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>West</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "w")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="w"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>NorthEast</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "ne")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="ne"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="no" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>SouthEast</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "se")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="se"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="no" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>SouthWest</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "sw")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="sw"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>NorthWest</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "nw")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="nw"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Up</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "up")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="up"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Down</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "down")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="down"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Out</name>
						<script>if roomID["current"] ~= roomID["old"] then
  table.insert(compassData.directions, "out")
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;dir value="out"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Send Update</name>
						<script>if roomID["current"] ~= roomID["old"] then
  echo("\nCompass Directions: " .. table.concat(compassData.directions, ", ") .. "\n")
end
roomID["old"] = roomID["current"]

deleteLine()

-- deleteLine() prevents the echo's from firing.
-- comment if needing to debug</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/compass&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
			</TriggerGroup>
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Hands</name>
				<script>-- Parse hands for UI elements
-- handsData["left"], handsData["right"], handsData["spell"] 

</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList />
				<regexCodePropertyList />
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Left</name>
					<script>if matches[2] then
    local content = matches[2]
    handsData["left"] = content
end

selectString(matches[1], 1)
replace("")
</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;left[^&gt;]*&gt;([^&lt;]+)&lt;/left&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Right</name>
					<script>if matches[2] then
    local content = matches[2]
    handsData["right"] = content
end

selectString(matches[1], 1)
replace("")
</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;right[^&gt;]*&gt;([^&lt;]+)&lt;/right&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Spell Prep</name>
					<script>if matches[2] then
    local content = matches[2]
    handsData["spell"] = content
end

selectString(matches[1], 1)
replace("")
</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;spell [^&gt;]*&gt;([^&lt;]+)&lt;/spell&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Spell Cast</name>
					<script>if matches[2] then
  local cast_time = tonumber(matches[2])
end

selectString(matches[1], 1)
replace("")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;spell&gt;None&lt;/spell&gt;&lt;castTime value='([^']+)'/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
			</TriggerGroup>
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Character</name>
				<script>-- Vitals - Health, Mana, Stamina, Spirit
-- Injuries
-- Experience
-- Encumbrance
-- Stance
-- Icons for stand, knee, sit, prone

-- Need icons for poison, disease, invis, hidden


-- &lt;indicator id='IconHIDDEN' visible='y'/&gt;</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList />
				<regexCodePropertyList />
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Vitals</name>
					<script>selectString(matches[1], 1)
replace("")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='minivitals'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Skin</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;skin id='.+' name='.+' controls='.+' [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Bar</name>
						<script>local id = matches[2]
local value = tonumber(matches[3])
local text = matches[4]

if vitalsData[id] then
  vitalsData[id].value = value
  vitalsData[id].text = text
  echo(string.format("\nUpdated %s: %d (%s)\n", id, value, text))
end

selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='([^']+)' value='([^']+)' text='([^']+)' [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>deleteLine()
-- comment out delete to enable echo's
selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Experience</name>
					<script>selectString(matches[1], 1)
replace("")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='expr'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Level</name>
						<script>local level = tonumber(matches[2])
expData["level"] = level

selectString(matches[1], 1)
replace("") </script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;label id='yourLvl' value='Level ([^']+)' [^&gt;]+</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Mind</name>
						<script>local value = tonumber(matches[2])
local text = matches[3]
expData["mind"].value = value
expData["mind"].text = text
-- echo("\nmindState " .. matches[2] .. " " .. matches[3])

selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='mindState' value='([^']+)' text='([^']+)' [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Next Level</name>
						<script>local value = tonumber(matches[2])
local text = tonumber(matches[3])
expData["tnl"].value = value
expData["tnl"].text = text
-- echo("\n TNL data " .. value .. " " .. text)

selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='nextLvlPB' value='([^']+)' text='(.+) (?:experience|until next level)?' [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>deleteLine()
-- comment out delete to enable echo's
selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialog&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Skill End</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Encumbrance</name>
					<script>selectString(matches[1], 1)
replace("")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='encum'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Encumbrance Level</name>
						<script>local value = tonumber(matches[2])
local text = matches[3]
encumData["value"] = value
encumData["text"] = text

selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='encumlevel' value='([^']+)' text='([^']+)' [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Encumbrance Blurb</name>
						<script>local blurb = matches[2]
encumData["blurb"] = blurb

selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;label id='encumblurb' value='([^']+)' [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>
selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Stance</name>
					<script>selectString(matches[1], 1)
replace("")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='stance'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Stance Bar</name>
						<script>local value = tonumber(matches[2])
local text = matches[3]
stanceData["value"] = value
stanceData["text"] = text

selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='pbarStance' value='([^']+)' text='([^']+)' [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Indicator Icons</name>
					<script>selectString(matches[1], 1)
replace("")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;indicator id="IconSTANDING" visible="(n|y)"/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Prone</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;indicator id="IconPRONE" visible="(n|y)"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Sitting</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;indicator id="IconSITTING" visible="(n|y)"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Kneeling</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;indicator id="IconKNEELING" visible="(n|y)"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Injuries</name>
					<script>deleteLine()</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id="injuries"&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Injury</name>
						<script>local id = matches[2]
local name = matches[3]

-- Check if the id exists in the injuryData table
if injuryData[id] then
  -- Update the name for the given id
  injuryData[id].name = name
  echo(string.format("\nUpdated %s: %s\n", id, name))
else
  echo(string.format("\nUnknown id: %s\n", id))
end</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;image id="([^']+)" name="([^']+)" height="0" width="0"/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>deleteLine()
-- comment out delete to enable echos
selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
			</TriggerGroup>
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Spell Windows</name>
				<script>-- Removes spell window xml feed from game window
--
-- Records active spells to variables for use with UI creation
-- 
-- activeSpells = { id = { name, time } }
-- activeBuffs
-- activeCooldowns
-- activeDebuffs</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList />
				<regexCodePropertyList />
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Debuffs</name>
					<script>activeDebuffs = {}</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='Debuffs' clear='t'&gt;&lt;/dialogData&gt;&lt;dialogData id='Debuffs'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Spell</name>
						<script>local line = getCurrentLine()

for id, name, time in line:gmatch("&lt;progressBar id='([^']+)' value='[^']+' text=\"([^\"]+)\" left='[^']+' top='[^']+' width='[^']+' height='[^']+' time='([^']+)'/&gt;") do
  activeDebuffs[id] = {
    name = name,
    time = time
  }
  echo(string.format("Captured debuff: ID=%s, Name=%s, Time=%s\n", id, name, time))
end

selectString(line, 1)
replace("")

-- Debugging: Print the entire activeCooldown table
for k, v in pairs(activeDebuffs) do
  echo(string.format("Active Debuff: ID=%s, Name=%s, Time=%s\n", k, v.name, v.time))
end
</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='([^']+)' value='[^']+' text="([^"]+)" [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>No Debuffs</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;label id='lblNone' value='No debuffs found.' top='0' left='0' align='center'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Cooldowns</name>
					<script>activeCooldowns = {}</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='Cooldowns' clear='t'&gt;&lt;/dialogData&gt;&lt;dialogData id='Cooldowns'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Spell</name>
						<script>local line = getCurrentLine()

for id, name, time in line:gmatch("&lt;progressBar id='([^']+)' value='[^']+' text=\"([^\"]+)\" left='[^']+' top='[^']+' width='[^']+' height='[^']+' time='([^']+)'/&gt;") do
  activeCooldowns[id] = {
    name = name,
    time = time
  }
  echo(string.format("Captured cooldown: ID=%s, Name=%s, Time=%s\n", id, name, time))
end

selectString(line, 1)
replace("")

-- Debugging: Print the entire activeCooldown table
for k, v in pairs(activeCooldowns) do
  echo(string.format("Active Cooldown: ID=%s, Name=%s, Time=%s\n", k, v.name, v.time))
end
</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='([^']+)' value='[^']+' text="([^"]+)" [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>No Cooldowns</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;label id='lblNone' value='No cooldowns found.' top='0' left='0' align='center'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Buffs</name>
					<script>activeBuffs = {}
</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='Buffs' clear='t'&gt;&lt;/dialogData&gt;&lt;dialogData id='Buffs'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Spell</name>
						<script>local line = getCurrentLine()

for id, name, time in line:gmatch("&lt;progressBar id='([^']+)' value='[^']+' text=\"([^\"]+)\" left='[^']+' top='[^']+' width='[^']+' height='[^']+' time='([^']+)'/&gt;") do
  activeBuffs[id] = {
    name = name,
    time = time
  }
  echo(string.format("Captured buff: ID=%s, Name=%s, Time=%s\n", id, name, time))
end

selectString(line, 1)
replace("")

-- Debugging: Print the entire activeBuffs table
for k, v in pairs(activeBuffs) do
  echo(string.format("Active Buff: ID=%s, Name=%s, Time=%s\n", k, v.name, v.time))
end
</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='([^']+)' value='[^']+' text="([^"]+)" [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>No Buffs</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;label id='lblNone' value='No buffs found.' top='0' left='0' align='center'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Active Spells</name>
					<script>activeSpells = {}</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='Active Spells' clear='t'&gt;&lt;/dialogData&gt;&lt;dialogData id='Active Spells'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Spell</name>
						<script>local line = getCurrentLine()

for id, name, time in line:gmatch("&lt;progressBar id='([^']+)' value='[^']+' text=\"([^\"]+)\" left='[^']+' top='[^']+' width='[^']+' height='[^']+' time='([^']+)'/&gt;") do
  activeSpells[id] = {
    name = name,
    time = time
  }
  echo(string.format("Captured spell: ID=%s, Name=%s, Time=%s\n", id, name, time))
end

selectString(line, 1)
replace("")

-- Debugging: Print the entire activeSpells table
for k, v in pairs(activeSpells) do
  echo(string.format("Active Spell: ID=%s, Name=%s, Time=%s\n", k, v.name, v.time))
end
</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='[^']+' value='[^']+' text="[^"]+" [^&gt;]+&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>No Spells</name>
						<script>selectString(matches[1], 1)
replace("")</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;label id='lblNone' value='No spells found.' top='0' left='0' align='center'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>End</name>
						<script>deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;/dialogData&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
			</TriggerGroup>
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Prompt</name>
				<script>local serverTime = matches[2]

selectString(matches[1], 1)
replace("")


-- R is Roundtime
-- s is Sitting
-- K is Kneeling
-- P is Prone
-- I is Immobilized (611)</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList>
					<string>^&lt;prompt time="([^"]+)"&gt;</string>
				</regexCodeList>
				<regexCodePropertyList>
					<integer>1</integer>
				</regexCodePropertyList>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>End</name>
					<script>-- Match and select the escaped `&amp;gt;`
selectString(matches[1], 1)

-- Replace `&amp;gt;` with `&gt;` and apply the color
replace("&gt;")
setFgColor(192, 192, 0) -- Apply RGB(192, 192, 192) to the `&gt;` symbol

-- Deselect to avoid interference with other text
deselect()
</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&amp;gt;&lt;/prompt&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
			</TriggerGroup>
			<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
				<name>Tag Suppressant</name>
				<script>-- Stuff we're just squelching right now.</script>
				<triggerType>0</triggerType>
				<conditonLineDelta>0</conditonLineDelta>
				<mStayOpen>0</mStayOpen>
				<mCommand></mCommand>
				<packageName></packageName>
				<mFgColor>#ff0000</mFgColor>
				<mBgColor>#ffff00</mBgColor>
				<mSoundFile></mSoundFile>
				<colorTriggerFgColor>#000000</colorTriggerFgColor>
				<colorTriggerBgColor>#000000</colorTriggerBgColor>
				<regexCodeList />
				<regexCodePropertyList />
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Escaped &gt; and &lt;</name>
					<script>-- these fix the xml display when using something like ;showxml

-- see if there's a way to pull Mudlet's default frontground text color

replaceAll("&amp;gt;", "&gt;")
replaceAll("&amp;lt;", "&lt;")
replaceAll("&amp;quot","\"")
replaceAll("&amp;apos","'")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>.+</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>gag inv stream</name>
					<script>selectString(matches[1], 1)
replace("")</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>50</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;pushStream id='inv'/&gt;Your worn items are:</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>gag inventory item</name>
						<script>deleteLine()</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>^  </string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>1</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Close</name>
						<script>setTriggerStayOpen("gag inv stream", 0)</script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;popStream/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</Trigger>
				<TriggerGroup isActive="yes" isFolder="yes" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>gag combat stream</name>
					<script>deleteLine()
</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;dialogData id='combat'&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
					</regexCodePropertyList>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Combat Window Stance Dropdown</name>
						<script></script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>                       &gt;&lt;dropDownBox id='dDBStance' value="defensive" cmd='_stance %dDBStance%'content_text='offensive,advance,forward,neutral,guarded,defensive' content_value='offensive,advance,forward,neutral,guarded,defensive' align='n' top='70' left='0' anchor_left='cmdDefStance' anchor_right='cmdOffStance' height='20' width='80' tooltip='Stance Selection'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
					<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
						<name>Combat Window Stance Display</name>
						<script></script>
						<triggerType>0</triggerType>
						<conditonLineDelta>0</conditonLineDelta>
						<mStayOpen>0</mStayOpen>
						<mCommand></mCommand>
						<packageName></packageName>
						<mFgColor>#ff0000</mFgColor>
						<mBgColor>#ffff00</mBgColor>
						<mSoundFile></mSoundFile>
						<colorTriggerFgColor>#000000</colorTriggerFgColor>
						<colorTriggerBgColor>#000000</colorTriggerBgColor>
						<regexCodeList>
							<string>&lt;progressBar id='pbarStance' value='100' text='defensive (100%)' top='51'width='130' height='16' left='0' align='n' tooltip='Percent of stance contributing to defense'/&gt;</string>
						</regexCodeList>
						<regexCodePropertyList>
							<integer>0</integer>
						</regexCodePropertyList>
					</Trigger>
				</TriggerGroup>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Mono</name>
					<script>deleteLine()</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;output class="mono"/&gt;</string>
						<string>&lt;output class=""/&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>0</integer>
						<integer>0</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="yes" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>catch-all</name>
					<script>for i=1, #matches do
  selectString(matches[i], 1)
  replace("")
end

-- Pretty good job of removing tags.
-- Can leave extra text behind, so best used to catch the little things / last resort</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;[^&gt;]+&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
				<Trigger isActive="no" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="yes" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
					<name>Component</name>
					<script>for i=1, #matches do
  selectString(matches[i], 1)
  replace("")
end</script>
					<triggerType>0</triggerType>
					<conditonLineDelta>0</conditonLineDelta>
					<mStayOpen>0</mStayOpen>
					<mCommand></mCommand>
					<packageName></packageName>
					<mFgColor>#ff0000</mFgColor>
					<mBgColor>#ffff00</mBgColor>
					<mSoundFile></mSoundFile>
					<colorTriggerFgColor>#000000</colorTriggerFgColor>
					<colorTriggerBgColor>#000000</colorTriggerBgColor>
					<regexCodeList>
						<string>&lt;component [^&gt;]+&gt;.*?&lt;/component&gt;</string>
					</regexCodeList>
					<regexCodePropertyList>
						<integer>1</integer>
					</regexCodePropertyList>
				</Trigger>
			</TriggerGroup>
		</TriggerGroup>
	</TriggerPackage>
	<TimerPackage />
	<AliasPackage>
		<AliasGroup isActive="yes" isFolder="yes">
			<name>enable-accessibility</name>
			<script></script>
			<command></command>
			<packageName>enable-accessibility</packageName>
			<regex></regex>
			<Alias isActive="yes" isFolder="no">
				<name>mudlet accessibility on</name>
				<script>echo("Welcome to Mudlet!\n")
echo("Let's adjust a few preferences to improve the visually impaired experience:\n")

setConfig("autoClearInputLine", true)
echo("Text will now be removed from the input line after it was sent ✓\n")
setConfig("showSentText", false)
echo("Text sent to the game will not appear in the main window ✓\n")

setConfig("caretShortcut", "ctrltab")
echo("Shortcut to switch between input line and main window set to Ctrl+Tab. You can also change it to either Tab or F6 in settings.\n")

if getOS() == "windows" then
  setConfig("blankLinesBehaviour", "hide")
  echo("Blank lines will be removed from the output ✓\n")
end

if getOS() == "mac" then
  echo("\nYou're on a mac and VoiceOver will skip reading text when there's lots of it coming in. Would you like to install a third-party TTS plugin to alleviate this issue?\n")
  echo("Type 'mudlet access reader' if so.\n")
  echo("See https://wiki.mudlet.org/w/Accessibility_on_OSX if you'd like to learn more.\n")
end

echo("\nThat's all, enjoy Mudlet!\n")</script>
				<command></command>
				<packageName></packageName>
				<regex>^mudlet access(?:ibility)? on$</regex>
			</Alias>
			<Alias isActive="yes" isFolder="no">
				<name>mudlet accessibility reader</name>
				<script>uninstallPackage"reader"
installPackage"https://github.com/tspivey/mudlet-reader/releases/latest/download/reader.mpackage"</script>
				<command></command>
				<packageName></packageName>
				<regex>^mudlet access(?:ibility)? reader$</regex>
			</Alias>
		</AliasGroup>
		<AliasGroup isActive="yes" isFolder="yes">
			<name>run-lua-code</name>
			<script></script>
			<command></command>
			<packageName>run-lua-code</packageName>
			<regex></regex>
			<Alias isActive="yes" isFolder="no">
				<name>run lua code</name>
				<script>local f, e = loadstring("return "..matches[2])
if not f then
  f, e = assert(loadstring(matches[2]))
end

local r =
  function(...)
    if not table.is_empty({...}) then
      display(...)
    end
  end
r(f())</script>
				<command></command>
				<packageName></packageName>
				<regex>^lua (.*)$</regex>
			</Alias>
		</AliasGroup>
		<AliasGroup isActive="yes" isFolder="yes">
			<name>echo</name>
			<script></script>
			<command></command>
			<packageName>echo</packageName>
			<regex></regex>
			<Alias isActive="yes" isFolder="no">
				<name>`echo</name>
				<script>local s = matches[2]

s = string.gsub(s, "%$", "\n")
feedTriggers("\n" .. s .. "\n")
echo("\n")</script>
				<command></command>
				<packageName></packageName>
				<regex>`echo (.+)</regex>
			</Alias>
			<Alias isActive="yes" isFolder="no">
				<name>`cecho</name>
				<script>local s = matches[2]

s = string.gsub(s, "%$", "\n")
cfeedTriggers("\n" .. s .. "\n")
echo("\n")</script>
				<command></command>
				<packageName></packageName>
				<regex>`cecho (.+)</regex>
			</Alias>
			<Alias isActive="yes" isFolder="no">
				<name>`decho</name>
				<script>local s = matches[2]

s = string.gsub(s, "%$", "\n")
dfeedTriggers("\n" .. s .. "\n")
echo("\n")</script>
				<command></command>
				<packageName></packageName>
				<regex>`decho (.+)</regex>
			</Alias>
			<Alias isActive="yes" isFolder="no">
				<name>`hecho</name>
				<script>local s = matches[2]

s = string.gsub(s, "%$", "\n")
hfeedTriggers("\n" .. s .. "\n")
echo("\n")</script>
				<command></command>
				<packageName></packageName>
				<regex>`hecho (.+)</regex>
			</Alias>
		</AliasGroup>
		<AliasGroup isActive="yes" isFolder="yes">
			<name>deleteOldProfiles</name>
			<script></script>
			<command></command>
			<packageName>deleteOldProfiles</packageName>
			<regex></regex>
			<Alias isActive="yes" isFolder="no">
				<name>delete old profiles</name>
				<script>deleteOldProfiles(matches[3], matches[2])

--Syntax examples: "delete old profiles"  -&gt; deletes profiles older than 31 days
--					"delete old maps 10"	-&gt; deletes maps older than 10 days</script>
				<command></command>
				<packageName></packageName>
				<regex>^delete old (profiles|maps|modules)(?: (\d+))?$</regex>
			</Alias>
		</AliasGroup>
		<AliasGroup isActive="yes" isFolder="yes">
			<name>generic_mapper</name>
			<script></script>
			<command></command>
			<packageName>generic_mapper</packageName>
			<regex></regex>
			<AliasGroup isActive="yes" isFolder="yes">
				<name>Setup Aliases</name>
				<script></script>
				<command></command>
				<packageName></packageName>
				<regex></regex>
				<Alias isActive="yes" isFolder="no">
					<name>Map Show Alias</name>
					<script>map.showMap()</script>
					<command></command>
					<packageName></packageName>
					<regex>^map show$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Find Map Prompt Alias</name>
					<script>map.find_prompt()</script>
					<command></command>
					<packageName></packageName>
					<regex>^find prompt$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Map Prompt Alias</name>
					<script>-- USE PATTERNS FOR STRING.GSUB
if matches[2] then
  map.make_prompt_pattern(matches[2])
else
  display(map.save.prompt_pattern)
end</script>
					<command></command>
					<packageName></packageName>
					<regex>^map prompt(?: (.*))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Map Ignore Alias</name>
					<script>-- USE PATTERNS FOR STRING.GSUB
if matches[2] then
  map.make_ignore_pattern(matches[2])
else
  display(map.save.ignore_patterns)
end</script>
					<command></command>
					<packageName></packageName>
					<regex>^map ignore(?: (.*))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Move Method Alias</name>
					<script>
if matches[2] then
  map.make_move_method(matches[2])
else
  display(map.save.move_methods)
end</script>
					<command></command>
					<packageName></packageName>
					<regex>^map movemethod(?: (.*))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Debug Alias</name>
					<script>map.configs.debug = not map.configs.debug
map.echo("Map debug set to: " .. (map.configs.debug and "on" or "off"))</script>
					<command></command>
					<packageName></packageName>
					<regex>^map debug$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Update Alias</name>
					<script>map.silentUpdate = false
map.updateVersion()</script>
					<command></command>
					<packageName></packageName>
					<regex>^map update$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Config Alias</name>
					<script>-- adjust pattern to allow no argument, if no argument show general help about configs
if not matches[2] then
	cecho(map.help.config)
else
  local startStr, endStr = string.match(matches[2],"(.*) ([%w%.]+)")
  local vals = {'on', 'off', 'true', 'false'}
  local modes = {'lazy','simple','normal','complex'}
  if (table.contains(vals, endStr) or tonumber(endStr)) or (startStr == "mode" and table.contains(modes, endStr)) then
  	map.setConfigs(startStr, endStr)
  else
  	map.setConfigs(matches[2])
  end
end</script>
					<command></command>
					<packageName></packageName>
					<regex>^map config(?: ([\w\s\.]+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Window Config Alias</name>
					<script>map.setConfigs("map_window",matches[3],matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map window (x|y|w|h|origin|shown)(?: ([\w%]+))?</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Translate Config Alias</name>
					<script>map.setConfigs("lang_dirs", {matches[3], matches[4]}, matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map translate (\w+) (\w+) (\w+)$</regex>
				</Alias>
			</AliasGroup>
			<AliasGroup isActive="yes" isFolder="yes">
				<name>Information Aliases</name>
				<script></script>
				<command></command>
				<packageName></packageName>
				<regex></regex>
				<Alias isActive="yes" isFolder="no">
					<name>Map Quick Start Alias</name>
					<script>map.show_help("quick_start")</script>
					<command></command>
					<packageName></packageName>
					<regex>^map basics$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Help Alias</name>
					<script>map.show_help(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map help(?: (.*))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Rooms Alias</name>
					<script>-- map rooms &lt;area&gt; - shows the list of rooms in an area
map.echoRoomList(matches[2] or getRoomArea(map.currentRoom))</script>
					<command></command>
					<packageName></packageName>
					<regex>^map rooms(?: (.+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Areas Alias</name>
					<script>-- area list - shows the known area list
-- functionality already exists in generic_mapper alias 'map areas'

map.echoAreaList()</script>
					<command></command>
					<packageName></packageName>
					<regex>^map areas$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Room Find Alias</name>
					<script>-- rf &lt;name&gt;, room find &lt;name&gt; - searches for a room of a given name

map.roomFind(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:rf|room find) (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Room Look Alias</name>
					<script>-- rl or room look - displays information about the room you're in
-- rl roomID - displays information on a given room ID (ie, rl 34)
-- rl room name  - displays information on a given room, by it's 
--    name (ie, rl tavern of blah)
map.roomLook(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:rl|room look)(?: (.+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Show Path Alias</name>
					<script>-- showpath roomID - shows you a path from where you are to another room (by it's ID)
-- showpath fromID toID - shows you a path from a given room to another given to 
--                        another room
if not matches[2] and not matches[3] then
  map.echo("Where do you want to showpath to?")
elseif matches[2] and not matches[3] then
  map.echoPath(map.currentRoom, matches[2])
else
  map.echoPath(matches[2], matches[3])
end</script>
					<command></command>
					<packageName></packageName>
					<regex>^showpath(?: (\d+))?(?: (\d+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>List Special Exits Alias</name>
					<script>-- spe list - shows you the list of all known special exists
-- spe list filter - shows you a list of all known special exits, 
--                   filtered by a command (ie. spe list worm warp)
map.listSpecialExits(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^spe list(?: (.+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>List Map Features Alias</name>
					<script>-- feature list - lists all map features created via feature create and the
-- associated room characters

map.listMapFeatures()</script>
					<command></command>
					<packageName></packageName>
					<regex>^feature list$</regex>
				</Alias>
			</AliasGroup>
			<AliasGroup isActive="yes" isFolder="yes">
				<name>Regular Use Aliases</name>
				<script></script>
				<command></command>
				<packageName></packageName>
				<regex></regex>
				<Alias isActive="yes" isFolder="no">
					<name>Map Me Alias</name>
					<script>map.find_me(nil, nil, nil, true)</script>
					<command></command>
					<packageName></packageName>
					<regex>^map me$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Path Alias</name>
					<script>map.find_path(matches[2],matches[3])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map path ([^;]+)(?:\s*;\s*(.+))?</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Recall Alias</name>
					<script>map.set_recall()</script>
					<command></command>
					<packageName></packageName>
					<regex>^map recall$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Character Alias</name>
					<script>map.character = matches[2]</script>
					<command></command>
					<packageName></packageName>
					<regex>^map character (.*)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Map Stop Alias</name>
					<script>raiseEvent("mapStop")
raiseEvent("sysSpeedwalkStopped")</script>
					<command></command>
					<packageName></packageName>
					<regex>^map stop$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Toggle Speedwalk Alias</name>
					<script>map.toggleSpeedwalk(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^mpp(?:\s?(on|off))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Area Lock Alias</name>
					<script>-- arealock, arealock &lt;area&gt; - displays a list of areas you can
-- lock/unlock, can also give it an area name to filter by. If
-- an area is locked the mapper will not attempt to walk through
-- or go through any of the rooms in the area
map.doLockArea(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^arealock(?: (.*))?$</regex>
				</Alias>
			</AliasGroup>
			<AliasGroup isActive="yes" isFolder="yes">
				<name>Map Creation Aliases</name>
				<script></script>
				<command></command>
				<packageName></packageName>
				<regex></regex>
				<Alias isActive="yes" isFolder="no">
					<name>Set Room Area Alias</name>
					<script>map.set_area(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^set area (.*)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Start Mapping Alias</name>
					<script>map.start_mapping(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^start mapping(?: (.*))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Stop Mapping Alias</name>
					<script>map.stop_mapping()</script>
					<command></command>
					<packageName></packageName>
					<regex>^stop mapping$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Shift Room Alias</name>
					<script>map.shift_room(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^shift (.*)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Add Portal Alias</name>
					<script>map.set_portal(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^add portal (.*)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Show Moves Alias</name>
					<script>map.show_moves()</script>
					<command></command>
					<packageName></packageName>
					<regex>^show moves$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Clear Moves Alias</name>
					<script>map.clear_moves()</script>
					<command></command>
					<packageName></packageName>
					<regex>^clear moves$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Add Door Alias</name>
					<script>map.set_door(matches[2],matches[3],matches[4])</script>
					<command></command>
					<packageName></packageName>
					<regex>^add door (\w+)(?: (none|open|closed|locked))?(?: (yes|no))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Merge Rooms Alias</name>
					<script>map.merge_rooms()</script>
					<command></command>
					<packageName></packageName>
					<regex>^merge rooms$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Map Mode Alias</name>
					<script>map.set_mode(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map mode (\w+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Room Exit Alias</name>
					<script>map.set_exit(matches[2],matches[3])</script>
					<command></command>
					<packageName></packageName>
					<regex>^set exit (.+) (\d+)</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Move A Room Alias</name>
					<script>-- rc or room coords [v&lt;id&gt;] &lt;option&gt;, where option will specify the new
-- location of the room. The room ID is optional, it'll move the current
-- room if you don't provide one.


-- want the current room, but we're lost
if matches[2] == '' and (not map.currentRoom or not map.roomexists(map.currentRoom)) then map.echo("Don't know where we are at the moment.") return end

-- want another room, but it doesn't actually exist
if matches[2] ~= '' and not map.roomexists(matches[2]) then map.echo("v"..matches[2].." doesn't exist.") return end

local m = matches[3]
local rid, rname = (matches[2] ~= "" and matches[2] or map.currentRoom),
  (matches[2] ~= "" and getRoomName(matches[2]) or getRoomName(map.currentRoom))
local x,y,z

local function set() -- small func to set things
  setRoomCoordinates(rid, x, y, z)
  map.echo(string.format("%s (%d) is now at %dx, %dy, %dz.\n", rname, rid, x,y,z))
  centerview(rid)
end

-- let's be flexible and allow several ways if giving an arg
-- rc x y z
x,y,z = string.match(m, "(%-?%d+) (%-?%d+) (%-?%d+)")
if x then
  set(); return
end

-- rc xx? yy? zz?
x,y,z = string.match(m, "(%-?%d+)x"), string.match(m, "(%-?%d+)y"), string.match(m, "(%-?%d+)z")
if x or y or z then
  -- merge w/ old coords if any are missing
  local ox, oy, oz = getRoomCoordinates(rid)
  x = x or ox; y = y or oy; z = z or oz
  set(); return
end

-- rc left/west, right/east, ...
local ox, oy, oz = getRoomCoordinates(rid)
local has = table.contains
for w in string.gmatch(m, "%a+") do
  if has({"west", "left", "w", "l"}, w) then
    x = (x or ox) - 1; y = (y or oy); z = (z or oz)
  elseif has({"east", "right", "e", "r"}, w) then
    x = (x or ox) + 1; y = (y or oy); z = (z or oz)
  elseif has({"north", "top", "n", "t"}, w) then
    x = (x or ox); y = (y or oy) + 1; z = (z or oz)
  elseif has({"south", "bottom", "s", "b"}, w) then
    x = (x or ox); y = (y or oy) - 1; z = (z or oz)
  elseif has({"northwest", "topleft", "nw", "tl"}, w) then
    x = (x or ox) - 1; y = (y or oy) + 1; z = (z or oz)
  elseif has({"northeast", "topright", "ne", "tr"}, w) then
    x = (x or ox) + 1; y = (y or oy) + 1; z = (z or oz)
  elseif has({"southeast", "bottomright", "se", "br"}, w) then
    x = (x or ox) + 1; y = (y or oy) - 1; z = (z or oz)
  elseif has({"southwest", "bottomleft", "sw", "bl"}, w) then
    x = (x or ox) - 1; y = (y or oy) - 1; z = (z or oz)
  elseif has({"up", "u"}, w) then
    x = (x or ox); y = (y or oy); z = (z or oz) + 1
  elseif has({"down", "d"}, w) then
    x = (x or ox); y = (y or oy); z = (z or oz) - 1
  end

end
if x then set(); return end

map.echo([[Where do you want to move the room to?
  You can use direct coordinates or relative directions.]])</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:rc|room coords) (?:v(\d+) )?(.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Delete A Room Alias</name>
					<script>-- rld or room delete &lt;option&gt; - where option is the location or ID of the room
-- you'd like to delete

-- want the current room, but we're lost
if not matches[2] and (not map.currentRoom or not map.roomexists(map.currentRoom)) then map.echo("Don't know where we are at the moment.") return end

-- want another room, but it doesn't exist
if matches[2] and tonumber(matches[2]) and not map.roomexists(matches[2]) then map.echo("v"..matches[2].." doesn't exist.") return end

-- or a relative one
if matches[2] and not tonumber(matches[2]) and not map.relativeroom(map.currentRoom, matches[2]) then map.echo("There is no room "..matches[2].. " of us.") return end

local rid = (not matches[2] and map.currentRoom or (tonumber(matches[2]) or map.relativeroom(map.currentRoom, matches[2])))

local n = getRoomName(rid)
deleteRoom(rid)
map.echo(string.format("Deleted the %s (%d) room.\n", (n ~= "" and n or "''"), rid))
centerview(map.currentRoom)</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:rld|room delete) ?(\w+)?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Room Weight Alias</name>
					<script>-- rw &lt;optional room ID or direction&gt; &lt;weight&gt;, where option is the location
-- or ID of the room whose weight you'd like to change.

local weight = tonumber(matches[3]), room
if matches[2] == '' then room = map.currentRoom
else
  room = tonumber(matches[2]) or map.relativeroom(map.currentRoom, matches[2])
end

if not room or not map.roomexists(room) then
  map.echo("Sorry - which room do you want to set the weight on? I don't know where you are at the moment, if you want to do the current room.")
  return
end

if not weight then
  map.echo("What weight do you want to set on #"..room.."?")
end

local oldweight = getRoomWeight(room)
setRoomWeight(room, weight)

if weight &gt; oldweight then
  map.echo("Increased the room weight on #"..room.." ("..getRoomName(room)..") by "..(weight-oldweight).." to "..weight.." - making it less desirable to travel through.")
elseif weight &lt; oldweight then
  map.echo("Decreased the room weight on #"..room.." ("..getRoomName(room)..") by "..(oldweight-weight).." to "..weight.." - making it more desirable to travel through.")
else
  map.echo("The room weight on #"..room.." ("..getRoomName(room)..") is already "..weight..".")
end</script>
					<command></command>
					<packageName></packageName>
					<regex>^rw(?: (\w+))? (\d+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set Exit Weight Alias</name>
					<script>-- rwe &lt;optional room ID, otherwise current&gt; &lt;weight&gt; &lt;exit&gt;, where the weight
-- is a positive number (default for exits is 0). Setting a higher weight will
-- make the exit be less likely to be used.

local room = (matches[2] ~= "" and tonumber(matches[2]) or map.currentRoom)

local weight, exit = tonumber(matches[3]), matches[4]

if not roomExists(room) then map.echo("Room "..room.." doesn't exist. It has to before we can set weights on exits.") return end

setExitWeight(room, exit, weight)

map.echo(string.format("Set the weight on the %d room going %s to %s. If it's a two-way exit, please set the reverse exit as well.", room, exit, weight))</script>
					<command></command>
					<packageName></packageName>
					<regex>^rwe(?: (\d+))? (\d+) (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Create a Link Between Two Rooms Alias</name>
					<script>-- rlk or room link &lt;option&gt; [one] - where option will specify the room and exit
-- to link with. You can also tack on 'one' at the end to make it be a one-way link


-- need the current room, but we're lost
if not map.currentRoom or not map.roomexists(map.currentRoom) then map.echo("Don't know where we are at the moment.") return end

-- make sure the dir is valid
local dir = map.anytolong(matches[3])
if not dir then map.echo(matches[3].." isn't a valid normal exit.") return end

-- if we don't give a room number, then we want to auto-locate an appropriate room nearby.
local otherroom
if matches[2] == "" then
  local w = matches[3]
  local ox, oy, oz, x,y,z = getRoomCoordinates(map.currentRoom)
  local has = table.contains
  if has({"west", "left", "w", "l"}, w) then
    x = (x or ox) - 1; y = (y or oy); z = (z or oz)
  elseif has({"east", "right", "e", "r"}, w) then
    x = (x or ox) + 1; y = (y or oy); z = (z or oz)
  elseif has({"north", "top", "n", "t"}, w) then
    x = (x or ox); y = (y or oy) + 1; z = (z or oz)
  elseif has({"south", "bottom", "s", "b"}, w) then
    x = (x or ox); y = (y or oy) - 1; z = (z or oz)
  elseif has({"northwest", "topleft", "nw", "tl"}, w) then
    x = (x or ox) - 1; y = (y or oy) + 1; z = (z or oz)
  elseif has({"northeast", "topright", "ne", "tr"}, w) then
    x = (x or ox) + 1; y = (y or oy) + 1; z = (z or oz)
  elseif has({"southeast", "bottomright", "se", "br"}, w) then
    x = (x or ox) + 1; y = (y or oy) - 1; z = (z or oz)
  elseif has({"southwest", "bottomleft", "sw", "bl"}, w) then
    x = (x or ox) - 1; y = (y or oy) - 1; z = (z or oz)
  elseif has({"up", "u"}, w) then
    x = (x or ox); y = (y or oy); z = (z or oz) + 1
  elseif has({"down", "d"}, w) then
    x = (x or ox); y = (y or oy); z = (z or oz) - 1
  end

  local carea = getRoomArea(map.currentRoom)
  if not carea then map.echo("Don't know what area are we in.") return end

  otherroom = select(2, next(getRoomsByPosition(carea,x,y,z)))

  if not otherroom then
    map.echo("There isn't a room to the "..w.." that I see - try with an exact room id.") return
  end

else
  if not map.roomexists(matches[2]) then -- check that an explicit other room ID is valid
    map.echo("A room with id "..matches[2].. " doesn't exist.") return
  else
    otherroom = tonumber(matches[2])
  end
end

if map.setExit(map.currentRoom, otherroom, matches[3]) then
  if not matches[4] then map.setExit(otherroom, map.currentRoom, map.ranytolong(matches[3])) end

  map.echo(string.format("Linked %s (%d) to %s (%d) via a %s%s exit.",
    (getRoomName(map.currentRoom) ~= "" and getRoomName(map.currentRoom) or "''"), map.currentRoom, (getRoomName(otherroom) ~= "" and getRoomName(otherroom) or "''"), otherroom, (matches[4] and "one-way " or ''), matches[3]))
else
  map.echo("Couldn't create an exit.")
end
centerview(map.currentRoom)</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:rlk|room link) ?(\d+)? (\w+)( one)?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Delete a Link Alias</name>
					<script>-- urlk or room unlink &lt;direction&gt; - where direction will specify the direction
-- of the exit to unlink. This function will unlink exits both ways, or one way
-- if there is no incoming exit. 


-- need the current room, but we're lost
if not map.currentRoom or not map.roomexists(map.currentRoom) then map.echo("Don't know where we are at the moment.") return end

-- make sure the dir is valid
local dir = map.anytolong(matches[2])
if not dir then map.echo(matches[2].." isn't a valid normal exit.") return end

-- gone already?
if not getRoomExits(map.currentRoom)[dir] then map.echo(dir.." link doesn't exist already.") end

-- locate the room on the other end, so we can unlink it from there as well if necessary
local otherroom
if getRoomExits(getRoomExits(map.currentRoom)[dir])[map.ranytolong(dir)] then
  otherroom = getRoomExits(map.currentRoom)[dir]
end

if map.setExit(map.currentRoom, -1, dir) then
  if otherroom then
    if map.setExit(otherroom, -1, map.ranytolong(dir)) then
      map.echo(string.format("Deleted the %s exit from %s (%d).",
        dir, getRoomName(map.currentRoom), map.currentRoom))
     else map.echo("Couldn't delete the incoming exit.") end
  else
    map.echo(string.format("Deleted the one-way %s exit from %s (%d).",
      dir, getRoomName(map.currentRoom), map.currentRoom))
  end
else
  map.echo("Couldn't delete the outgoing exit.")
end
centerview(map.currentRoom)</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:urlk|room unlink) (\w+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Add/delete Doors Alias</name>
					<script>-- rd &lt;optional room ID, or current if none&gt; &lt;direction&gt; &lt;door status&gt;
-- Direction can be one of the following: e,s,w,n,ne,se,sw,ne. 
-- Door status can be open or o, closed or c, locked or l, clear or gone.
-- To delete a room, use clear or gone. Setting doors is one-way - to set
-- two-way doors, use the alias from the opposite direction.

local room = (matches[2] ~= "" and tonumber(matches[2]) or map.currentRoom)

local direction, status = matches[3], matches[4]

if not roomExists(room) then map.echo("Room "..room.." doesn't exist. It has to before we can make doors in it.") return end

local validdirs = {'e', 's', 'w', 'n', 'ne', 'se', 'sw', 'nw', 'in', 'out', 'up', 'down'}

if not table.contains(validdirs, direction) then
  map.echo("Can't make a door in the '"..direction.."' direction - available choices are:\n  "..table.concat(validdirs, ', '))
  return
end

local statusnum

if status == "" or status == "open" or status == "o" then
  statusnum = 1
elseif status == "closed" or status ==  "c" then
  statusnum = 2
elseif status == "locked" or status ==  "l" then
  statusnum = 3
elseif status == "clear" or status == "gone" then
  statusnum = 0
end

if not statusnum then map.echo("Unrecognized option - a door can be open, closed, locked or gone.") return end

setDoor(room, direction, statusnum)

if statusnum == 0 then
  map.echo("OK, door removed.")
else
  map.echo("OK, door added/adjusted.")
end</script>
					<command></command>
					<packageName></packageName>
					<regex>^rd(?: (\d+))? (\w+)(?: (\w+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Set a Room Character Alias</name>
					<script>-- rcc &lt;character&gt; or rcc &lt;character&gt; &lt;room ID&gt; - where the character is one 
-- letter/number/symbol.

local room = matches[3] or map.currentRoom
room = tonumber(room) or map.relativeroom(map.currentRoom, room)
if not room or not map.roomexists(room) then
  map.echo("Sorry - which room do you want to put this character in? I don't know where you are at the moment, if you want to do the current room.")
  return
end

local char = matches[2]

if char == "clear" then
  setRoomChar(room, ' ')
  map.echo("Cleared the character from "..room.." ("..getRoomName(room)..")")
else
  setRoomChar(room, char)
  map.echo("Set the "..char:sub(1,1).." character on "..room.." ("..getRoomName(room)..")")
end
centerview(map.currentRoom)</script>
					<command></command>
					<packageName></packageName>
					<regex>^rcc ([^ ]+)(?: (\w+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Add a Special Exit Alias</name>
					<script>-- spe &lt;other room&gt; &lt;command&gt; or exit special &lt;other room&gt; &lt;command&gt;, where other
-- room will specify the room to link with, and command the command to us to get
-- to that room.

-- spe clear and spe list match on this
if matches[2] == "clear" or matches[2] == "list" then return end

-- need the current room, but we're lost
if not map.currentRoom or not map.roomexists(map.currentRoom) then map.echo("Don't know where we are at the moment.") return end

local otherroom = tonumber(matches[2]) or map.relativeroom(map.currentRoom, matches[2])

-- need the another room, but it doesn't actually exist
if not otherroom or not map.roomexists(otherroom) then map.echo(matches[2].." doesn't exist.") return end

addSpecialExit(map.currentRoom, tonumber(otherroom), matches[3])
addSpecialExit(map.currentRoom, tonumber(otherroom), matches[3])
map.echo(string.format("Added special exit with command '%s' to %s (%d).", matches[3], getRoomName(otherroom), otherroom))
centerview(map.currentRoom)</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:spe|exit special) (\w+) (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Add a Special Exit From One Remote Room To Another Alias</name>
					<script>-- spev &lt;from room&gt; &lt;to room&gt; &lt;command&gt; - This different than spe, which allows
-- you to link only the current room to another room - this command doesn't
-- require you to be in the starting room. 

local room1, room2 = tonumber(matches[2]), tonumber(matches[3])

if not room1 or not map.roomexists(room1) then
  map.echo("Room #"..matches[2].." doesn't exist - create it first, or make sure you got the room ID right?")
  return
end

if not room2 or not map.roomexists(room2) then
  map.echo("Room #"..matches[3].." doesn't exist - create it first, or make sure you got the room ID right?")
  return
end

addSpecialExit(room1, room2, matches[4])
map.echo(string.format("Added special exit with command '%s' to from %s (%d) to %s (%d).", matches[4], getRoomName(room1), room1, getRoomName(room2), room2))</script>
					<command></command>
					<packageName></packageName>
					<regex>^spev (\d+) (\d+) (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Clear All Special Exits Alias</name>
					<script>-- spe clear &lt;option&gt; or exit special clear &lt;option&gt; - where option is the
-- location or the ID of the room you'd like to clear all special exits in. 

-- want the current room, but we're lost
if not matches[2] and (not map.currentRoom or not map.roomexists(map.currentRoom)) then map.echo("Don't know where we are at the moment.") return end

-- want another room, but it doesn't exist
if matches[2] and tonumber(matches[2]) and not map.roomexists(matches[2]) then map.echo("v"..matches[2].." doesn't exist.") return end

-- or a relative one
if matches[2] and not tonumber(matches[2]) and not map.relativeroom(map.currentRoom, matches[2]) then map.echo("There is no room "..matches[2].. " of us.") return end

local rid = (not matches[2] and map.currentRoom or (tonumber(matches[2]) or map.relativeroom(map.currentRoom, matches[2])))

clearSpecialExits(rid)
map.echo(string.format("Cleared all special exits in %s (%d).\n", getRoomName(rid), rid))</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:spe clear|exit special clear) ?(\w+)?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Move Room To Another Area Alias</name>
					<script>-- room area &lt;different area&gt; - will move the current room to another area you're in

map.roomArea(matches[2], matches[3])</script>
					<command></command>
					<packageName></packageName>
					<regex>^room area (?:v(\d+) )?(.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Add a Room Label Alias</name>
					<script>-- room label &lt;optional another room ID&gt; &lt;optional foreground color&gt; &lt;optional background color&gt; my message

map.roomLabel(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^room label (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>View/delete Area Labels Alias</name>
					<script>-- area labels &lt;area name&gt; - will show the labels in the given area
map.areaLabels(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^area labels ?(.+)?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Create An Area Alias</name>
					<script>-- area add &lt;area name&gt; - will create a new area and automatically give it an ID.

local t = getAreaTable(); local tr = {}; for k,v in pairs(t) do tr[v] = k end
local newid = table.maxn(tr) + 1

setAreaName( newid, matches[2] )
map.echo(string.format("Created new area %s (%d)", matches[2], newid))
centerview(map.currentRoom)</script>
					<command></command>
					<packageName></packageName>
					<regex>^area add (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Delete An Area Alias</name>
					<script>-- area delete &lt;area name&gt; - will delete the given area

map.deleteArea(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^area delete (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Cancel Area Deletion Alias</name>
					<script>-- cancel area deletion - stop area deletion. This will not restore deleted rooms,
-- merely pauses the process.

if not map.deletingarea then map.echo("I wasn't deleting any areas already.") return end

local areaname = map.deletingarea.areaname
map.deletingarea = nil

map.echo("Stopped deleting rooms in the '"..areaname.."'. The area is partially missing its rooms now, you'll want to restart the process to finish it.")</script>
					<command></command>
					<packageName></packageName>
					<regex>^cancel area deletion$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Rename An Area Alias</name>
					<script>-- area rename &lt;new area name&gt; - will rename the current area you're in to the new name
map.renameArea(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^area rename (.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Create Map Feature Alias</name>
					<script>-- feature create &lt;feature&gt; [char &lt;room character&gt;] - will create a new map
-- feature for use on rooms. You can also optionally add a character mark to
-- the feature, which will be set when a map feature is added to a room. 
-- Note: Map feature names are not allowed to contain numbers. 

map.createMapFeature(matches[2]:trim(), (matches[3] and matches[3]:trim()))</script>
					<command></command>
					<packageName></packageName>
					<regex>^feature create (.+?)(?: char (.+))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Add Map Feature To Room Alias</name>
					<script>-- room create feature [v&lt;room id&gt;] &lt;feature&gt;* or *rcf [v&lt;room id&gt;] &lt;feature&gt;
-- adds a created map feature to the room. If the map feature is associated with
-- a character mark, it will be set on the room and existing marks get overwritten.
-- The room number to add the feature to can be given with the optional argument
-- (note that there is no space between the v and the ID). 

map.roomCreateMapFeature(matches[3], matches[2] == "" and map.currentRoom or tonumber(matches[2]))</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:room create feature|rcf) (?:v(\d+) )?(.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Delete Map Feature From Room Alias</name>
					<script>-- room delete feature [v&lt;room id&gt;] &lt;feature&gt;* or *rdf [v&lt;room id&gt;] &lt;feature&gt;
-- removes a map feature from the room. If the map feature is associated with
-- a character mark and its set on the room, a random character mark from the
-- other map features on the room is chosen to replace it. The room number to
-- delete the feature from can be given with the optional argument (note that
-- there is no space between the v and the ID). 

map.roomDeleteMapFeature(matches[3], matches[2] == "" and map.currentRoom or tonumber(matches[2]))</script>
					<command></command>
					<packageName></packageName>
					<regex>^(?:room delete feature|rdf) (?:v(\d+) )?(.+)$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Delete Map Feature Alias</name>
					<script>-- feature delete &lt;feature&gt;* deletes a map feature and removes it from all rooms

map.deleteMapFeature(matches[2]:trim())</script>
					<command></command>
					<packageName></packageName>
					<regex>^feature delete (.+)$</regex>
				</Alias>
			</AliasGroup>
			<AliasGroup isActive="yes" isFolder="yes">
				<name>Map Sharing Aliases</name>
				<script></script>
				<command></command>
				<packageName></packageName>
				<regex></regex>
				<Alias isActive="yes" isFolder="no">
					<name>Save Map Alias</name>
					<script>if saveMap(getMudletHomeDir() .. "/map.dat") then
  map.echo("Map saved.\n")
else
  map.echo("Error.  Map NOT saved.\n")
end
				</script>
					<command></command>
					<packageName></packageName>
					<regex>^map save$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Load Map Alias</name>
					<script>map.load_map(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map load(?: (.*))?$</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Import Map Area Alias</name>
					<script>map.import_area(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map import (.*)</regex>
				</Alias>
				<Alias isActive="yes" isFolder="no">
					<name>Export Map Area Alias</name>
					<script>map.export_area(matches[2])</script>
					<command></command>
					<packageName></packageName>
					<regex>^map export (.*)</regex>
				</Alias>
			</AliasGroup>
		</AliasGroup>
	</AliasPackage>
	<ActionPackage />
	<ScriptPackage>
		<ScriptGroup isActive="yes" isFolder="yes">
			<name>GSIV Vars</name>
			<packageName></packageName>
			<script></script>
			<eventHandlerList />
			<Script isActive="yes" isFolder="no">
				<name>Initialization</name>
				<packageName></packageName>
				<script>-- Initialize the injuryData table with default values
if not injuryData then
  injuryData = {}

  -- List of all body parts (ids)
  local bodyParts = {
    "head", "neck", "rightArm", "leftArm", "rightLeg", "leftLeg", 
    "rightHand", "leftHand", "chest", "abdomen", "back", 
    "rightEye", "leftEye", "nsys"
  }

  -- Populate the table with default values
  for _, id in ipairs(bodyParts) do
    injuryData[id] = { id = id, name = id }
  end
  echo("\nInitializing injuryData\n")
end

function printInjuryData()
    echo("\nCurrent Injuries Data:\n")
    for id, data in pairs(injuryData) do
        echo(string.format("  %s: %s\n", id, data.name))
    end
end


-- Initialize the handsData table with default values
if not handsData then
  handsData = {
    left = "Empty",
    right = "Empty",
    spell = "None"
  }
  echo("\nInitializing handsData\n")
end


-- Initialize the vitalsData table with default values
if not vitalsData then
    vitalsData = {
        health = {value = 0, text = ""},
        mana = {value = 0, text = ""},
        stamina = {value = 0, text = ""},
        spirit = {value = 0, text = ""}
    }
    echo("\nvitalsData initialized.\n")
end


-- Initialize the expData table with default values
if not expData then
  expData = {
    level = 0,
    mind = {
      value = 0,
      text = "clear as a bell"
    },
    tnl = {
      value = 0,
      text = 0
    }
  }
  echo("\nexpData initialized.\n")
end

if not encumData then
  encumData = {
    value = 0,
    text = "None",
    blurb = "You are not encumbered enough to notice."
  }
  echo("\nencumData initialized\n")
end


if not stanceData then
  stanceData = {
    value = 0,
    text = "None"
  }
  echo("\nstanceData initialized\n")
end</script>
				<eventHandlerList />
			</Script>
		</ScriptGroup>
	</ScriptPackage>
	<KeyPackage />
	<VariablePackage>
		<HiddenVariables />
	</VariablePackage>
</MudletPackage>
