--Coded by Albo1125.
--Modified by Kevin

local hospitalPassword = "ems" --change this password to your liking and don't share it with the patients ;-)
local defaultsecs = 180
local maxsecs = 1000

-----------------------------

AddEventHandler('chatMessage', function(source, n, message)
    cm = stringsplit(message, " ")

    if(cm[1] == "/hospitalme") then
		CancelEvent()
		local hT = defaultsecs
		if cm[2] ~= nil then
			hT = tonumber(cm[2])
		end
		if hT > maxsecs then
			hT = maxsecs
		end

		print("Hospitalizing ".. GetPlayerName(source) .. " for ".. hT .." secs")
		TriggerClientEvent("HP", source, hT)
		TriggerClientEvent('chatMessage', -1, 'DOCTOR', { 0, 0, 0 }, GetPlayerName(source) ..' hospitalized for '.. hT ..' secs')
    elseif cm[1] == "/unhospital" then
		CancelEvent()
		if cm[2] == hospitalPassword then
			local tPID = tonumber(cm[3])
			if GetPlayerName(tPID) ~= nil then
				print("Unhospital ".. GetPlayerName(tPID).. " - cm entered by ".. GetPlayerName(source))
				TriggerClientEvent("UnJP", tPID)
			end
		else
			print("Incorrect hospitalPassword entered by ".. GetPlayerName(source))
		end
	elseif cm[1] == "/hospital" then
		CancelEvent()
		if tablelength(cm) > 2 then
			if cm[2] == hospitalPassword then
				local tPID = tonumber(cm[3])
				local hT = defaultsecs
				if tablelength(cm) > 3 then
					if cm[4] ~= nil then
						hT = tonumber(cm[4])
					end
				end
				if hT > maxsecs then
					hT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("Hospitalizing ".. GetPlayerName(tPID).. " for ".. hT .." secs - cm entered by ".. GetPlayerName(source))
					TriggerClientEvent("HP", tPID, hT)
					TriggerClientEvent('chatMessage', -1, 'DOCTOR', { 0, 0, 0 }, GetPlayerName(tPID) ..' hospitalized for '.. hT ..' secs')
				end
			else
				print("Incorrect hospitalPassword entered by ".. GetPlayerName(source))
			end
		end
	end
end)

print('RG Hospitalizer by Kevin.')
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
--Coded by Albo1125
--Modified by Kevin.
