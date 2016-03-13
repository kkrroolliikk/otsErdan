function onSay(player, words, param)
	local config = {
		positionPlayer = player:getPosition();
		players = Game.getPlayers();
		lecz = 1;
	}
	config.players[1]:sendPrivateMessage(player, "TEST", TALKTYPE_BROADCAST)
	while config.lecz do
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
		if (player:getHealth() +21 < player:getMaxHealth() or player:getMana() + 21 < player:getMaxMana()) and player:getPosition() == config.positionPlayer then
			config.players[1]:sendPrivateMessage(player, "leczymy sie", TALKTYPE_BROADCAST)
			player:addHealth(20)
			player:addMana(20)
		else	
			config.lecz = 0
			return false
		end
	end
return true
end	
