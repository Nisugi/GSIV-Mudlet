-- Inventory Stream
local inventoryStreamActive = false
local inventoryItemTrigger = nil -- Placeholder for dynamically created trigger

-- Function to handle the start of the inventory stream
function startInventoryStream()
  inventoryStreamActive = true
  deleteLine()

  -- Create the trigger for inventory items dynamically
  inventoryItemTrigger = tempRegexTrigger("^  ", processInventoryItem)
end

-- Function to process inventory item lines
function processInventoryItem()
  if inventoryStreamActive then
    deleteLine()
  end
end

-- Function to handle the end of the inventory stream
function closeInventoryStream()
  inventoryStreamActive = false

  -- Delete the dynamically created trigger for inventory items
  if inventoryItemTrigger then
    killTrigger(inventoryItemTrigger)
    inventoryItemTrigger = nil
  end
  deleteLine()
end

-- <clearStream id='inv' ifClosed=''
tempRegexTrigger("<pushStream id='inv'/>Your worn items are:", startInventoryStream)
tempRegexTrigger("<popStream/>", closeInventoryStream)