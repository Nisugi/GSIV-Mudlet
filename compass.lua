-- Initialize the compass data and room IDs
compassData = compassData or { directions = {} }
roomID = roomID or { current = 0, old = 0 }

-- Function to process compass data and clean the line
function processCompass(line)
    -- Check if the room has changed
    if roomID.current ~= roomID.old then
        compassData.directions = {}

        for direction in line:gmatch('<dir value="(.-)"/>') do
            table.insert(compassData.directions, direction)
        end

        roomID.old = roomID.current
    end

    local cleanedLine = line:gsub("<compass>.-</compass>", "")

    -- Call the existing processPrompt function to handle the prompt
    processPrompt(cleanedLine)
end

tempRegexTrigger("<compass>", function() processCompass(line) end)
