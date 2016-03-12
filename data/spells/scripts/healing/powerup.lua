local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_SUBID, 1)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 1 * 30 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 5)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 1000)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 5)
condition:setParameter(CONDITION_PARAM_MANATICKS, 1000)
combat:setCondition(condition)

local condition2 = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 30000)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
condition:setFormula(-1, 20, -1, 20)
combat:setCondition(condition2)

function onCastSpell(creature, var)
	local player = creature:getPlayer()
	local cos = player:getCondition(CONDITION_CONDITION_YELLTICKS)
	local cos2 = player:getCondition(CONDITION_OUTFIT)
	local cos3 = player:getLevel()
		
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, cos)
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, cos2)
	if cos then
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, cos3)
	end

--	if CONDITION_INFIGHT == false then
		return combat:execute(creature, var)
--	else
--		creature:sendTextMessage(MESSAGE_EVENT_ADVENCE, CONDITION_INFIGHT)
--		return false
--	end
end
