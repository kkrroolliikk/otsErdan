local drunk = createConditionObject(CONDITION_DRUNK)
setConditionParam(drunk, CONDITION_PARAM_TICKS, 24*60*1000)

function statup(cid)
local ppos = getPlayerPosition(cid) 
doPlayerAddHealth(cid,(getPlayerLevel(cid) * math.random(1,3)))
doPlayerAddMana(cid,(getPlayerLevel(cid) * math.random(1,3)))
doSendMagicEffect(ppos,26)
end

function check1(cid)
	if (hasCondition(cid, CONDITION_DRUNK) == TRUE) then
		if (hasCondition(cid, CONDITION_INFIGHT) == FALSE) then
			if getPlayerHealth(cid) == getPlayerMaxHealth(cid) then
				if getPlayerMana(cid) == getPlayerMaxMana(cid) then
			                  mayNotMove(cid, 0)
			                  doRemoveCondition(cid, 11) 
				else
					  addEvent(statup,1000,cid) 
					  addEvent(check1,1000,cid) 
				end
			else
				  addEvent(statup,1000,cid) 
				  addEvent(check1,1000,cid) 
			end
		else
			  mayNotMove(cid, 0)
			  stopEvent(statup)
			  stopEvent(check1)
			  doRemoveCondition(cid, 11) 
		end
	else
		  mayNotMove(cid, 0)
		  stopEvent(statup)
		  stopEvent(check1)
		  doRemoveCondition(cid, 11) 
	end
end

function onCastSpell(cid, var)  
    if(hasCondition(cid, CONDITION_INFIGHT) == FALSE) then  
         if(hasCondition(cid, CONDITION_DRUNK) == FALSE) then  
                  doTargetCombatCondition(0, cid, drunk, CONST_ME_NONE)
                  mayNotMove(cid, 1)
                  addEvent(check1,1000,cid) 
         end
    end
end
