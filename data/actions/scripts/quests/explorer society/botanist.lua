function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 4138 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 16 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 17)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4870)
		target:remove()
	elseif target.itemid == 4149 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 19 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 20)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4871)
		target:remove()
	elseif target.itemid == 4142 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 23 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 25)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4872)
		target:remove()
	end
	return true
end
