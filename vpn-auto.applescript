-- Connect or reconnect to VPN
-- Set vpnPass variable to your VPN password
-- Set vpnName to your VPN id, not name
-- -- You can find it using "scutil --nc list" command (second column)

set vpnPass to "s0m3c001pa$$w0rd"
set vpnName to "1234C6A1-1234-4321-1234-1234567E8AB1"

tell application "System Events"
	set rc to do shell script "scutil --nc status " & vpnName
	if rc starts with "Connected" then
		do shell script "scutil --nc stop " & vpnName
	end if
	
	do shell script "scutil --nc start " & vpnName
	delay 1
	keystroke vpnPass
	keystroke return
end tell
