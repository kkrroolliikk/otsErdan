local config = {
        [8] = {newValue = 9, transformId = 4866},
        [11] = {newValue = 12, transformId = 4867},
        [13] = {newValue = 14, transformId = 4868}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
        local storage = config[player:getStorageValue(Storage.ExplorerSociety.QuestLine)]
        if not storage then
                return true
        end

        if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 8 then
                if target.itemid ~= 4993  then
                        return false
		end
        elseif player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 11 then
                if target.itemid ~= 4994 then
                        return false
		end
        elseif player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 13 then
                if target.itemid ~= 4992 then
                        return false
		end
	else
		return false
        end

        player:setStorageValue(Storage.ExplorerSociety.QuestLine, storage.newValue)
        toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
        item:transform(storage.transformId)
        target:remove()
        return true
end
