-- Initialize the table to store experience data
expData = expData or {
    level = "Unknown",
    mindState = { value = 0, text = "Unknown" },
    nextLevel = { value = 0, text = "Unknown" }
}

-- Function to process experience data
function processExperience(line)
    local level = line:match("<label id='yourLvl' value='(.-)'")
    if level then
        expData.level = level
        -- cecho(string.format("[DEBUG] Updated expData.level: '%s'\n", expData.level))
    end

    local mindValue, mindText = line:match("<progressBar id='mindState' value='(.-)' text='(.-)'")
    if mindValue and mindText then
        expData.mindState.value = tonumber(mindValue) or 0
        expData.mindState.text = mindText
        -- cecho(string.format("[DEBUG] Updated expData.mindState: value=%d, text='%s'\n", expData.mindState.value, expData.mindState.text))
    end

    local nextValue, nextText = line:match("<progressBar id='nextLvlPB' value='(.-)' text='(.-)'")
    if nextValue and nextText then
        -- Extract only the numeric portion from the text (e.g., "42958334 experience" or "42958334 until next level")
        local numericValue = nextText:match("(%d+)")
        expData.nextLevel.value = tonumber(nextValue) or 0
        expData.nextLevel.experience = tonumber(numericValue) or 0
        -- cecho(string.format("[DEBUG] Updated expData.nextLevel: progress=%d, remaining=%d\n", expData.nextLevel.value, expData.nextLevel.text))
    end
    deleteLine()
end

tempRegexTrigger("<dialogData id='expr'>", function() processExperience(line) end)