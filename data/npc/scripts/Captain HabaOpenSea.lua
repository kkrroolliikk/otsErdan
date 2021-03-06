local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
        if not npcHandler:isFocused(cid) then
                return false
        end

	local player = Player(cid)
	if msgcontains(msg, "svargrond") then
                npcHandler:say("You wannga go Svargrond?", cid)
                npcHandler.topic[cid] = 1
        elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			player:teleportTo(Position(32352, 31124, 6), false)
		end
	end





	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
