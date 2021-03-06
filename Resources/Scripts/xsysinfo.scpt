-- Debug command do not touch!
--set cmd to ""
on textualcmd(cmd)
	
	-- Script Version (Don't change.. else havoc happens...)
	set currentversion to "1.5.1"
	
	
	-- Color Defines (Do NOT Change These!)
	set FBlack to (ASCII character 3) & "01"
	set FNBblue to (ASCII character 3) & "02"
	set FGreen to (ASCII character 3) & "03"
	set FRed to (ASCII character 3) & "04"
	set FBrown to (ASCII character 3) & "05"
	set FPurple to (ASCII character 3) & "06"
	set FOrange to (ASCII character 3) & "07"
	set FYellow to (ASCII character 3) & "08"
	set FLGreen to (ASCII character 3) & "09"
	set FTeal to (ASCII character 3) & "10"
	set FCyan to (ASCII character 3) & "11"
	set FBlue to (ASCII character 3) & "12"
	set FPink to (ASCII character 3) & "13"
	set FGrey to (ASCII character 3) & "14"
	set FLGrey to (ASCII character 3) & "15"
	set FNull to ASCII character 0
	set FWhite to ASCII character 3
	set FBold to ASCII character 2
	set FItalic to ASCII character 1
	set nl to ASCII character 10
	
	-- Trying to read user set options, and if not write the default values for them.
	-- This regards showing the final dot/separator.
	try
		set HideFinalDot to do shell script "defaults read xeon3d.xsysinfo hidefinaldot"
	on error
		try
			do shell script ("defaults write xeon3d.xsysinfo hidefinaldot True")
			set HideFinalDot to "True"
		on error
			set msg to "/echo There was an error writing defaults hidefinaldot"
			return msg
		end try
	end try
	-- This regards if it takes into account every mounted disk/net share or just the startupdisk
	try
		set allDisks to do shell script "defaults read xeon3d.xsysinfo alldisks"
	on error
		try
			do shell script ("defaults write xeon3d.xsysinfo alldisks False")
			set allDisks to "False"
		on error
			set msg to "/echo There was an error with the allDisks variable"
			return msg
		end try
	end try
	-- This regards if the Textual Build version is shown or not
	try
		set ViewTextualBuild to do shell script "defaults read xeon3d.xsysinfo viewtextualbuild"
	on error
		try
			do shell script ("defaults write xeon3d.xsysinfo viewtextualbuild False")
			set ViewTextualBuild to "False"
		on error
			set msg to "/echo There was an error with the ViewTextualBuild variable"
			return msg
		end try
	end try
	-- This regards if the script's output is formatted or not
	try
		set Simple to do shell script "defaults read xeon3d.xsysinfo simple"
	on error
		try
			do shell script ("defaults write xeon3d.xsysinfo simple False")
			set Simple to "False"
		on error
			set msg to "/echo There was an error with the Simple variable"
			return msg
		end try
	end try
	-- This regards if the temperature app used is the commandline one or the graphical one
	try
		set aangMode to do shell script "defaults read xeon3d.xsysinfo aangmode"
	on error
		try
			do shell script ("defaults write xeon3d.xsysinfo aangmode False")
			set aangMode to "False"
		on error
			set msg to "/echo There was an error with the aangMode variable"
			return msg
		end try
	end try
	
	-- This regards if the script should warn the user about an available update at runtime.
	try
		set autocheckupdate to do shell script "defaults read xeon3d.xsysinfo autocheckupdate"
	on error
		try
			do shell script ("defaults write xeon3d.xsysinfo autocheckupdate False")
			set autocheckupdate to "False"
		on error
			set msg to "/echo There was an error with the autocheckupdate variable"
			return msg
		end try
	end try
	
	-- Defines the Bars' Colors
	set FColor1 to FGreen
	set FColor2 to FRed
	set FColor3 to FWhite
	
	if Simple is true or Simple is "True" then -- Don't touch.
		set FColor1 to ""
		set FColor2 to ""
		set FWhite to ""
		set FBold to ""
		set FItalic to ""
	end if
	
	if cmd contains "simple" then --Also don't touch.
		set FColor1 to ""
		set FColor2 to ""
		set FWhite to ""
		set FBold to ""
		set FItalic to ""
	end if
	
	-- Original toggles below.
	if cmd is "" or cmd is "simple" then --Default output when no options or just "simple" is supplied at runtime (edit to taste)
		set ViewMac to true
		set ViewCPU to true
		set ViewCurrentCPUSpeed to false
		set ViewCap to false
		set ViewCache to false
		set ViewFSB to false
		set ViewTemp to false
		set ViewRam to true
		set ViewBars to true
		set ViewDisk to true
		set ViewDisplay to true
		set ViewGFXBus to false
		set ViewResolutions to true
		set ViewAudio to false
		set ViewPower to true
		set ViewOSXVersion to true
		set ViewKernelArch to true
		set ViewOSXBuild to true
		set ViewKernel to false
		set ViewKernelBuild to false
		set ViewUptime to true
		set ViewClient to true
		set ViewScriptVersion to true
		
		--The start of the script (edit below this and I wont help you) - MOST THINGS WILL BREAK IF YOU CHANGE ANYTHING BELOW THIS.            
		
	else --Toggled output
		set ViewMac to false
		set ViewCPU to false
		set ViewCurrentCPUSpeed to false
		set ViewCap to false
		set ViewCache to false
		set ViewFSB to false
		set ViewTemp to false
		set ViewRam to false
		set ViewBars to false
		set ViewDisk to false
		set ViewDisplay to false
		set ViewGFXBus to false
		set ViewResolutions to false
		set ViewAudio to false
		set ViewPower to false
		set ViewOSXVersion to false
		set ViewKernelArch to false
		set ViewOSXBuild to false
		set ViewKernel to false
		set ViewKernelBuild to false
		set ViewUptime to false
		set ViewClient to false
		set ViewScriptVersion to false
		if cmd contains "mac" then
			set ViewMac to true
		end if
		if cmd contains "cpu" then
			set ViewCPU to true
		end if
		if cmd contains "speed" then
			set ViewCurrentCPUSpeed to true
		end if
		if cmd contains "cap" then
			set ViewCap to true
		end if
		if cmd contains "cache" then
			set ViewCache to true
		end if
		if cmd contains "fsb" then
			set ViewFSB to true
		end if
		if cmd contains "temp" then
			set ViewTemp to true
		end if
		if cmd contains "ram" then
			set ViewRam to true
		end if
		if cmd contains "bar" then
			set ViewBars to true
		end if
		if cmd contains "mem" then
			set ViewRam to true
		end if
		if cmd contains "hd" then
			set ViewDisk to true
		end if
		if cmd contains "gpu" or cmd contains "graphics" or cmd contains "video" then
			set ViewDisplay to true
			set ViewGFXBus to true
			set ViewResolutions to true
		end if
		if cmd contains "res" then
			set ViewResolutions to true
		end if
		if cmd contains "audio" then
			set ViewAudio to true
		end if
		if cmd contains "power" then
			set ViewPower to true
		end if
		if cmd contains "osxversion" then
			set ViewOSXVersion to true
			if cmd contains "osxbuild" then
				set ViewOSXBuild to true
			end if
			if cmd contains "kernarch" then
				set ViewKernelArch to true
			end if
		end if
		if cmd contains "kernel" then
			set ViewKernel to true
			if cmd contains "kernbuild" then
				set ViewKernelBuild to true
			end if
		end if
		if cmd contains "uptime" then
			set ViewUptime to true
		end if
		if cmd contains "client" then
			set ViewClient to true
		end if
		if cmd contains "script" then
			set ViewScriptVersion to true
		end if
		if cmd is "version" then
			if currentversion contains "beta" then
				set msg to "Script Version: xsysinfo " & currentversion & " for Textual - Ask Xeon3D (irc.wyldryde.org/#textual) for a copy if you want it!"
			else
				set msg to "Script Version: xsysinfo " & currentversion & " for Textual - Get it @ http://xsysinfo.xeon3d.net"
			end if
			return msg
		end if
		
		if cmd is "options" then
			set msg to "/echo Possible Options:" & nl & ¬
				"/echo To change an option type '/xsysinfo <option name> toggle'. Example: /xsysinfo simple toggle " & nl & ¬
				"/echo • hidefinaldot - Defines if the final dot (separator) is shown." & FBold & " - Current Status: " & FBold & FRed & HideFinalDot & nl & ¬
				"/echo • alldisks - Defines if the script considers every mounted disk / net share as available disk space or not." & FBold & " - Current Status: " & FBold & FRed & allDisks & nl & ¬
				"/echo • viewtextualbuild - Defines if the Textual Build version is shown." & FBold & " - Current Status: " & FBold & FRed & ViewTextualBuild & nl & ¬
				"/echo • simple - Defines if the formatting is removed from the output of the script." & FBold & " - Current Status: " & FBold & FRed & Simple & nl & ¬
				"/echo • aangmode - Defines if the script uses the text (True) or GUI (False) version of the temperature app." & FBold & " - Current Status: " & FBold & FRed & aangMode & nl & ¬
				"/echo • autocheckupdate - Defines if the script checks for updates at each time it runs." & FBold & " - Current Status: " & FBold & FRed & autocheckupdate
			return msg
		end if
		
		if cmd is "hidefinaldot" then
			if HideFinalDot is "True" then
				set msg to "/echo The last dot (separator) is currently " & FBold & "NOT" & FBold & " being shown. To change this type '/xsysinfo hidefinaldot toggle'"
				return msg
			else if HideFinalDot is "False" then
				set msg to "/echo The last dot (separator) is currently " & FBold & "BEING" & FBold & " shown. To change this type '/xsysinfo hidefinaldot toggle'"
				return msg
			end if
		end if
		
		if cmd is "hidefinaldot toggle" then
			if HideFinalDot is "True" then
				do shell script "defaults write xeon3d.xsysinfo hidefinaldot False"
				return "/echo The final dot (separator) is now being SHOWN!"
			else if HideFinalDot is "False" then
				do shell script "defaults write xeon3d.xsysinfo hidefinaldot True"
				return "/echo The final dot (separator) is now being HIDDEN!"
			end if
		end if
		
		if cmd is "alldisks" then
			if allDisks is "True" then
				set msg to "/echo The script will use " & FBold & "All mounted disks" & FBold & ". To change this type '/xsysinfo alldisks toggle'"
				return msg
			else if allDisks is "False" then
				set msg to "/echo The script will use " & FBold & "the Startup disk only" & FBold & ". To change this type '/xsysinfo alldisks toggle'"
				return msg
			end if
		end if
		
		if cmd is "alldisks toggle" then
			if allDisks is "True" then
				do shell script "defaults write xeon3d.xsysinfo alldisks False"
				return "/echo The script will now use the Startup disk only!"
			else if allDisks is "False" then
				do shell script "defaults write xeon3d.xsysinfo alldisks True"
				return "/echo The script will now use all mounted disks!"
			end if
		end if
		
		if cmd is "viewtextualbuild" then
			if ViewTextualBuild is "True" then
				set msg to "/echo The script will " & FBold & "show" & FBold & " Textual's Build Version. To change this type '/xsysinfo ViewTextualBuild toggle'"
				return msg
			else if ViewTextualBuild is "False" then
				set msg to "/echo The script " & FBold & "won't show" & FBold & " Textual's Build Version. To change this type '/xsysinfo ViewTextualBuild toggle'"
				return msg
			end if
		end if
		
		if cmd is "viewtextualbuild toggle" then
			if ViewTextualBuild is "True" then
				do shell script "defaults write xeon3d.xsysinfo viewtextualbuild False"
				return "/echo The script " & FBold & "won't show" & FBold & " Textual's Build Version."
			else
				do shell script "defaults write xeon3d.xsysinfo viewtextualbuild True"
				return "/echo The script will " & FBold & "show" & FBold & " Textual's Build Version."
			end if
		end if
		
		if cmd is "simple" then
			if Simple is "True" then
				set msg to "/echo The script " & FBold & "will remove" & FBold & " the formatting from the output. To change this type '/xsysinfo simple toggle'"
				return msg
			else if Simple is "False" then
				set msg to "/echo The script " & FBold & "won't remove" & FBold & " the formatting from the output. To change this type '/xsysinfo simple toggle'"
				return msg
			end if
		end if
		
		if cmd is "simple toggle" then
			if Simple is "True" then
				do shell script "defaults write xeon3d.xsysinfo simple False"
				return "/echo The script " & FBold & "won't remove" & FBold & " the formatting from the output."
			else if Simple is "False" then
				do shell script "defaults write xeon3d.xsysinfo simple True"
				return "/echo The script " & FBold & "will remove" & FBold & " the formatting from the output."
			end if
		end if
		
		if cmd is "aangmode" then
			if aangMode is "True" then
				set msg to "/echo The script will use " & FBold & "the command line version" & FBold & " of the temperature app. To change this type '/xsysinfo aangmode toggle'"
				return msg
			else if aangMode is "False" then
				set msg to "/echo The script will use" & FBold & "the GUI version" & FBold & " of the temperature app. To change this type '/xsysinfo aangmode toggle'"
				return msg
			end if
		end if
		
		if cmd is "aangmode toggle" then
			if aangMode is "True" then
				do shell script "defaults write xeon3d.xsysinfo aangmode False"
				return "/echo The script will now use the " & FBold & "GUI version" & FBold & " of the temperature app."
			else if aangMode is "False" then
				do shell script "defaults write xeon3d.xsysinfo aangmode True"
				return "/echo The script will now use the " & FBold & "command line version" & FBold & " of the temperature app."
			end if
		end if
		
		if cmd is "autocheckupdate" then
			if autocheckupdate is "True" then
				set msg to "/echo The script will " & FBold & "check" & FBold & " for updates at runtime. To change this type '/xsysinfo autocheckupdate toggle'"
				return msg
			else if autocheckupdate is "False" then
				set msg to "/echo The script will " & FBold & "not check" & FBold & " for updates at runtime. To change this type '/xsysinfo autocheckupdate toggle'"
				return msg
			end if
		end if
		
		if cmd is "autocheckupdate toggle" then
			if autocheckupdate is "True" then
				do shell script "defaults write xeon3d.xsysinfo autocheckupdate False"
				return "/echo The script " & FBold & "will not check" & FBold & " for updates at runtime."
			else if autocheckupdate is "False" then
				do shell script "defaults write xeon3d.xsysinfo autocheckupdate True"
				return "/echo The script " & FBold & "will check" & FBold & " for updates at runtime."
			end if
		end if
		
		
		-- Update "engine" 2.1
		if cmd is "update" then
			set LatestVersionMD5 to do shell script "curl http://www.xeon3d.net/xsysinfo/files/textual/latestmd5"
			set latestversion to do shell script "curl http://www.xeon3d.net/xsysinfo/files/textual/latestversion"
			set LatestVersionURL to "http://www.xeon3d.net/xsysinfo/files/textual/xsysinfo" & latestversion & ".zip"
			set aspath to path to application support from user domain
			set aspath to POSIX path of aspath & "Textual/Scripts/"
			set aspath to "'" & aspath
			if latestversion contains "DOCTYPE" then
				return "/debug echo Error updating XSysInfo. Please try again later or download newest version here: http://xsysinfo.xeon3d.net " & nl & "/debug echo Cannot access the LatestVersion file."
			end if
			if latestversion is greater than currentversion then
				set the DestinationFile to aspath & "update.zip'"
				do shell script "rm -f " & DestinationFile
				set DownloadNewVersion to do shell script "curl -C - " & LatestVersionURL & " -o " & DestinationFile
				--debug output *do not uncomment*
				--return "md5 -q '" & POSIX path of application support
				if LatestVersionMD5 is not (do shell script "md5 -q " & DestinationFile) then
					if LatestVersionMD5 contains "DOCTYPE" then
						return "/debug echo Error updating XSysInfo. Please try again later or download newest version here: http://xsysinfo.xeon3d.net " & nl & "/debug echo Cannot access the LatestVersionMD5 file."
					end if
					return "/debug echo Error updating XSysInfo. Please try again later or download newest version here: http://xsysinfo.xeon3d.net " & nl & "/debug echo Online MD5: " & LatestVersionMD5 & nl & "/debug echo Local MD5: " & (do shell script "md5 -q " & DestinationFile)
				end if
				set InstallUpdateResult to do shell script "unzip -o " & DestinationFile & " -d " & aspath & "'"
				-- Debug command!
				-- return InstallUpdateResult
				if InstallUpdateResult contains "inflating:" then
					set ResultMessage to "/echo Successefully updated XSysInfo to version " & latestversion & " from " & currentversion & "." & nl & "/echo Changelog: http://www.xeon3d.net/xsysinfo/files/textual/Changelog"
					return ResultMessage
				else if InstallUpdateResult contains "cannot" then
					set ResultMessage to "/echo Error updating XSysInfo. Please try again later"
					return ResultMessage
				end if
			else if latestversion is equal to currentversion then
				set ResultMessage to "/echo XSysInfo is already up to date. (Your script version: " & currentversion & "; Latest released script version: " & latestversion & ")"
				return ResultMessage
			else if currentversion is greater than latestversion then
				set ResultMessage to "/echo Your copy of XSysInfo is newer than the last released version. (Your script version: " & currentversion & "; Latest released script version: " & latestversion & ")"
				return ResultMessage
			end if
		end if
		
		
		if cmd is "refresh" then
			tell application "Finder"
				if exists POSIX file "/tmp/SPHardwareDataType.txt" then
					do shell script "rm -rf /tmp/SPHardwareDataType.txt"
				end if
				if exists POSIX file "/tmp/SPDisplaysDataType.txt" then
					do shell script "rm -rf /tmp/SPDisplaysDataType.txt"
				end if
			end tell
		end if
		
		if cmd is "help" then
			set helpmsg to "/echo " & FBold & "Usage:" & FBold & " /xsysinfo [labels] [simple]" & nl & ¬
				"/echo If run without arguments, it'll show a predefined set of system details that can be customized by typing '/xsysinfo options'" & nl & ¬
				"/echo Possible labels:" & nl & "/echo mac, cpu, speed, cap, cache, fsb, temp, ram, bar, mem, hd, gpu, res, audio, power, osxversion, osxbuild, kernel, kernarch, kernbuild, uptime, client." & nl & ¬
				"/echo There are also some special labels: 'about' shows some info about the script; " & nl & ¬
				"/echo The 'simple' label makes the script output without any formatting (colors, bold, etc...); " & nl & ¬
				"/echo The 'update' label updates the script and the 'version' label displays the current version."
			return helpmsg
		end if
		
		if cmd is "help temp" then
			set helpmsg to "/echo For the script to show your temperatures (Cpu & HD on Macs, HD only on Hackintoshes)," & nl & "/echo download tempmonitor from http://www.mediafire.com/?ksvdp56vu2z52bs and put it in /usr/bin" & nl & "/echo After that, edit the script's source and set ViewTemp to true or run xsysinfo with the cputemp (if on a real Mac) or hdtemp (on a real Mac or Hack) or both options at runtime."
			return helpmsg
		end if
	end if
	
	if cmd is "about" then
		set helpmsg to "/echo XSysInfo " & currentversion & " - A System Information Script for the Textual IRC Client" & nl & ¬
			"/echo Homepage: http://xsysinfo.xeon3d.net / http://www.xeon3d.net" & nl & ¬
			"/echo Coded by Marcos Alves - xeon3d@xeon3d.net - Xeon3D @ irc://irc.wyldryde.org/#textual" & nl & ¬
			"/echo Loosely based on KSysInfo for Linkinus by KanadaKid" & nl & ¬
			"/echo Some code/fixes by Aang / ePirat @ irc://irc.wyldryde.org/#textual" & nl & ¬
			"/echo Many thanks for the #textual users for testing/using it and reporting bugs. Keep 'em coming!"
		return helpmsg
	end if
	
	tell application "Finder"
		
		set msg to ""
		
		
		
		set latestversion to do shell script "curl http://www.xeon3d.net/xsysinfo/files/textual/latestversion"
		if autocheckupdate is "True" then
			if latestversion is greater than currentversion then
				set msg to "/echo Info: XSysInfo " & FBold & latestversion & FBold & " has been released. You're currently running XSysInfo " & FBold & currentversion & FBold & "." & nl & "/echo To update to the latest version type '/xsysinfo update' (without the quotes). To disable this check type '/xsysinfo autocheckupdate'." & nl & msg
			end if
		end if
		
		if exists POSIX file "/tmp/SPHardwareDataType.txt" then
		else
			set listDataTypes to do shell script "system_profiler -listdatatypes"
			if listDataTypes contains "SPHardwareDataType" then
				do shell script "system_profiler SPHardwareDataType > /tmp/SPHardwareDataType.txt"
			else
				do shell script "system_profiler > /tmp/SPHardwareDataType.txt"
			end if
		end if
		
		
		--Temperature support
		if ViewTemp is true then
			if aangMode is false then
				if exists POSIX file "/Applications/TemperatureMonitor.app/Contents/MacOS/tempmonitor" then
					set cpuresult to do shell script "/Applications/TemperatureMonitor.app/Contents/MacOS/tempmonitor -l -a -c | grep 'SMC CPU A PROXIMITY' | awk '{print $5}'"
					set hdresult to do shell script "/Applications/TemperatureMonitor.app/Contents/MacOS/tempmonitor -l -a -c | grep 'SMART Disk' | head -n1 | awk '{print $6}'"
					--                      Debug Command
					--                      set CPUResult to "69"
				else
					if cmd contains "temp" then
						set msg to "/echo Please download the app from http://www.bresink.de/osx/0TemperatureMonitor/download.php5 and copy Temperature Monitor (not the lite version) to your Applications Folder." & "
    " & "/echo If you don't want to show temperatures don't use the 'temp' option."
						return msg
					else if cmd is "" then
						set msg to "/echo Please download the app from http://www.bresink.de/osx/0TemperatureMonitor/download.php5 and copy Temperature Monitor (not the lite version) to your Applications Folder." & "
    " & "/echo If you don't want to show temperatures set the viewTemp variable to false in the script's source code."
						return msg
					end if
				end if
			else if aangMode is "True" then
				if exists POSIX file "/usr/bin/tempmonitor" then
					set cpuresult to do shell script "/usr/bin/tempmonitor -l -a -c | grep 'SMC CPU A PROXIMITY' | awk '{print $5}'"
					set hdresult to do shell script "/usr/bin/tempmonitor -l -a -c | grep 'SMART Disk' | head -n1 | awk '{print $6}'"
					--Debug Command
					--set CPUResult to "68"
				else
					if cmd contains "temp" then
						set msg to "/echo Please download the zip from http://www.mediafire.com/?ksvdp56vu2z52bs and extract tempmonitor to /usr/bin folder." & "
    " & "/echo If you don't want to show temperatures don't use the 'temp' option."
						return msg
					else if cmd is "" then
						set msg to "/echo Please download the zip from http://www.mediafire.com/?ksvdp56vu2z52bs and extract tempmonitor to /usr/bin folder." & "
    " & "/echo If you don't want to show temperatures set the viewTemp variable to false in the script's source code."
						return msg
					end if
				end if
			end if
		end if
		
		--Mac Model
		if ViewMac is true then
			set machineName to do shell script "sysctl -n hw.model"
			
			if machineName is "iMac4,1" then
				set MacModel to "iMac (Early 2006)"
			else if machineName is "iMac4,2" then
				set MacModel to "iMac (Mid 2006)"
			else if machineName is "iMac5,2" then
				set MacModel to "iMac (Late 2006 CD)"
			else if machineName is "iMac5,1" then
				set MacModel to "iMac (Late 2006)"
			else if machineName is "iMac6,1" then
				set MacModel to "iMac (24-inch Late 2006)"
			else if machineName is "iMac7,1" then
				set MacModel to "iMac (Mid 2007)"
			else if machineName is "iMac8,1" then
				set MacModel to "iMac (Early 2008)"
			else if machineName is "iMac9,1" then
				set MacModel to "iMac (2009)"
			else if machineName is "iMac10,1" then
				set MacModel to "iMac (Late 2009 C2D)"
			else if machineName is "iMac11,1" then
				set MacModel to "iMac (Late 2009 Core iX)"
			else if machineName is "iMac11,2" then
				set MacModel to "iMac (Mid 2010 21.5')"
			else if machineName is "iMac11,3" then
				set MacModel to "iMac (Mid 2010 27')"
			else if machineName is "iMac12,1" then
				set MacModel to "iMac (Mid 2011 21.5')"
			else if machineName is "iMac12,2" then
				set MacModel to "iMac (Mid 2011 27')"
				-- Mac Minis
			else if machineName is "Macmini1,1" then
				set MacModel to "Mac Mini (2006)"
			else if machineName is "Macmini2,1" then
				set MacModel to "Mac Mini (2007)"
			else if machineName is "Macmini3,1" then
				set MacModel to "Mac Mini (2009)"
			else if machineName is "Macmini4,1" then
				set MacModel to "Mac Mini (2010)"
				-- Mac Pros
			else if machineName is "MacPro1,1" then
				set MacModel to "Mac Pro (Original)"
			else if machineName is "MacPro2,1" then
				set MacModel to "Mac Pro (2007 8-core)"
			else if machineName is "MacPro3,1" then
				set MacModel to "Mac Pro (Early 2008)"
			else if machineName is "MacPro4,1" then
				set MacModel to "Mac Pro (Early 2009)"
			else if machineName is "MacPro5,1" then
				set MacModel to "Mac Pro (Mid 2010)"
				-- MacBooks
			else if machineName is "MacBook1,1" then
				set MacModel to "MacBook (Original 2006)"
			else if machineName is "MacBook2,1" then
				set MacModel to "MacBook (2006/7)"
			else if machineName is "MacBook3,1" then
				set MacModel to "MacBook (Late 2007)"
			else if machineName is "MacBook4,1" then
				set MacModel to "MacBook (2008)"
			else if machineName is "MacBook5,1" then
				set MacModel to "MacBook (Late 2008, Aluminum)"
			else if machineName is "MacBook5,2" then
				set MacModel to "MacBook (2009)"
			else if machineName is "MacBook6,1" then
				set MacModel to "MacBook (Late 2009)"
			else if machineName is "MacBook7,1" then
				set MacModel to "MacBook (Mid 2010)"
				--MacBook Airs
			else if machineName is "MacBookAir1,1" then
				set MacModel to "MacBook Air (Original)"
			else if machineName is "MacBookAir2,1" then
				set MacModel to "MacBook Air (2008/9)"
			else if machineName is "MacBookAir3,1" then
				set MacModel to "MacBook Air (Late 2010, 11')"
			else if machineName is "MacBookAir3,2" then
				set MacModel to "MacBook Air (Late 2010, 13')"
				--MacBook Pros
			else if machineName is "MacBookPro1,1" then
				set MacModel to "MacBook Pro (Original)"
			else if machineName is "MacBookPro1,2" then
				set MacModel to "MacBook Pro (Original 17')"
			else if machineName is "MacBookPro2,2" then
				set MacModel to "MacBook Pro (C2D 15')"
			else if machineName is "MacBookPro2,1" then
				set MacModel to "MacBook Pro (C2D 17')"
			else if machineName is "MacBookPro3,1" then
				set MacModel to "MacBook Pro (2007)"
			else if machineName is "MacBookPro4,1" then
				set MacModel to "MacBook Pro (2008)"
			else if machineName is "MacBookPro5,1" then
				set MacModel to "MacBook Pro (Late 2008)"
			else if machineName is "MacBookPro5,5" then
				set MacModel to "MacBook Pro (Mid 2009, 13')"
			else if machineName is "MacBookPro5,4" then
				set MacModel to "MacBook Pro (Mid 2009, 15')"
			else if machineName is "MacBookPro5,3" then
				set MacModel to "MacBook Pro (Mid 2009, 15')"
			else if machineName is "MacBookPro5,2" then
				set MacModel to "MacBook Pro (2009, 17')"
			else if machineName is "MacBookPro7,1" then
				set MacModel to "MacBook Pro (Mid 2010, 13')"
			else if machineName is "MacBookPro6,2" then
				set MacModel to "MacBook Pro (Mid 2010, 15')"
			else if machineName is "MacBookPro6,1" then
				set MacModel to "MacBook Pro (Mid 2010, 17')"
			else if machineName is "MacBookPro8,1" then
				set MacModel to "MacBook Pro (Early 2011, 13')"
			else if machineName is "MacBookPro8,2" then
				set MacModel to "MacBook Pro (Early 2011, 15')"
			else if machineName is "MacBookPro8,3" then
				set MacModel to "MacBook Pro (Early 2011, 17')"
				-- xServes
			else if machineName is "Xserve1,1" then
				set MacModel to "Xserve (Original)"
			else if machineName is "Xserve2,1" then
				set MacModel to "Xserve (Early 2008)"
			else if machineName is "Xserve3,1" then
				set MacModel to "Xserve (Early 2009)"
			else if machineName is "" then
				set MacModel to "Unknown"
			else
				set MacModel to machineName
			end if
			set msg to msg & FBold & "Mac: " & FBold & MacModel & " • "
		end if
		
		
		--CPU Info
		if ViewCPU is true then
			set corecheck to do shell script "sysctl -n machdep.cpu.cores_per_package"
			set msg to msg & FBold & "CPU: " & FBold
			set cputype to do shell script "sysctl machdep.cpu.brand_string | awk '{ print $2,$3,$4,$5,$6,$7,$8,$9 }'"
			repeat
				if cputype contains "@ " then
					set AppleScript's text item delimiters to "@ "
					set cpu1 to text item 1 of cputype
					set cpu2 to text items 2 thru end of cputype
					set cputype to cpu1 & cpu2
				else
					exit repeat
				end if
			end repeat
			repeat
				if cputype contains "(R)" then
					set AppleScript's text item delimiters to "(R)"
					set cpu1 to text item 1 of cputype
					set cpu2 to text items 2 thru end of cputype
					set cputype to cpu1 & cpu2
				else
					exit repeat
				end if
			end repeat
			repeat
				if cputype contains "Processor " then
					set AppleScript's text item delimiters to "Processor "
					set cpu1 to text item 1 of cputype
					set cpu2 to text items 2 thru end of cputype
					set cputype to cpu1 & cpu2
				else
					exit repeat
				end if
			end repeat
			repeat
				if cputype contains "CPU " then
					set AppleScript's text item delimiters to "CPU "
					set cpu1 to text item 1 of cputype
					set cpu2 to text items 2 thru end of cputype
					set cputype to cpu1 & cpu2
				else
					exit repeat
				end if
			end repeat
			repeat
				if cputype contains "(TM)" then
					set AppleScript's text item delimiters to "(TM)"
					set cpu1 to text item 1 of cputype
					set cpu2 to text items 2 thru end of cputype
					set cputype to cpu1 & cpu2
				else
					exit repeat
				end if
			end repeat
			if cputype contains "GHz" then
				set AppleScript's text item delimiters to "GHz"
				set cputype to text item 1 of cputype & "GHz"
			end if
			set msg to msg & cputype
			
			--Current CPU Speed
			if ViewCurrentCPUSpeed is true then
				set cpufreq to do shell script "sysctl -n hw.cpufrequency"
				if cpufreq / 1000000 ≥ 990 then
					set temp to (cpufreq / 100000000) / 10
					set msg to msg & " @ " & "" & (round temp * 100) / 100 & "GHz"
				else
					set temp to (cpufreq / 1000000)
					set msg to msg & " @ " & "" & (round temp * 100) / 100 & "MHz"
				end if
			end if
			
			
			--CPU Features
			if ViewCap is true then
				set features to do shell script "sysctl -n machdep.cpu.features"
				set extfeatures to do shell script "sysctl -n machdep.cpu.extfeatures"
				set logicalcheck to do shell script "sysctl -n machdep.cpu.logical_per_package"
				set msg to msg & " ["
				if features contains "SSE3" then
					set msg to msg & "SSE3"
				else
					set msg to msg & "SSE2"
				end if
				if features contains "SSSE3" then
					set msg to msg & "" & "/SSSE3"
				end if
				if features contains "PAE" then
					set msg to msg & "" & "/PAE"
				end if
				if extfeatures contains "XD" then
					if cputype contains "AMD" then
						set msg to msg & "" & "/NX"
					else
						set msg to msg & "" & "/XD"
					end if
				end if
				if features contains "MMX" then
					if cputype contains "AMD" then
						set msg to msg & "" & "/3DNow!"
					end if
				end if
				if features contains "EST" then
					if cputype contains "AMD" then
						set msg to msg & "" & "/PowerNow!"
					else
						set msg to msg & "" & "/EST"
					end if
				end if
				if features contains "VMX" then
					set msg to msg & "" & "/VMX"
				end if
				if extfeatures contains "EM64T" then
					if cputype contains "AMD" then
						set msg to msg & "" & "/AMD64"
					else
						set msg to msg & "" & "/EM64T"
					end if
				end if
				if logicalcheck contains 2 then
					if corecheck contains 0 then
						if cputype contains "AMD" then
							set msg to msg & "" & "/DualCore"
						else
							set msg to msg & "" & "/HTT"
						end if
					end if
					if corecheck contains 1 then
						if cputype contains "AMD" then
							set msg to msg & "" & "/DualCore"
						else
							set msg to msg & "" & "/HTT"
						end if
					end if
					if corecheck contains 2 then
						if cputype does not contain "Intel Pentium M" then
							set msg to msg & "" & "/DualCore"
						end if
					end if
				end if
				if corecheck is "4" then
					set msg to msg & "" & "/QuadCore"
				end if
				if corecheck contains 6 then
					set msg to msg & "" & "/SixCore"
				end if
				if corecheck contains 8 then
					set msg to msg & "" & "/OctoCore"
				end if
				set msg to msg & "]"
			end if
			
			
			
			
			--CPU Temps
			if ViewTemp is true then
				if cpuresult is "" then
					set msg to msg
				else
					set msg to msg & FBold & " Temp: " & FBold & cpuresult & "ºC"
				end if
			else
				set msg to msg
			end if
			set msg to msg & " • "
		end if
		
		-- Note: All the above are inside the ViewCPU block.
		
		--L2 Cache
		if ViewCache is true then
			set coreicheck to do shell script "sysctl machdep.cpu.brand_string"
			if coreicheck contains "Core(TM) i" then
				set cpucache to do shell script "sysctl -n hw.l3cachesize"
				set msg to msg & FBold & "L3: " & FBold & (round (cpucache / 1024 / 1024)) & "MiB • "
			else
				set cpucache to do shell script "sysctl -n hw.l2cachesize"
				set msg to msg & FBold & "L2: " & FBold & (round (cpucache / 1024 / 1024)) & "MiB • "
			end if
		end if
		
		
		--Front Side Bus
		if ViewFSB is true then
			set fsb to do shell script "sysctl -n hw.busfrequency"
			set fsbtype to do shell script "cat /tmp/SPHardwareDataType.txt"
			set temp to round (fsb / 1000000) rounding down
			if cputype contains "AMD" then
				set msg to msg & FBold & "HT:" & FBold
				set msg to msg & " " & temp & "MHz • "
			else if fsbtype contains "Interconnect" then
				set msg to msg & FBold & "QPI:" & FBold
				set msg to msg & " " & (temp / 1000) & " GT/s • "
			else
				set msg to msg & FBold & "FSB:" & FBold
				set msg to msg & " " & temp & " MT/s • "
			end if
		end if
		
		--Ram
		if ViewRam is true then
			set memtotal to do shell script "sysctl hw.memsize"
			set AppleScript's text item delimiters to ": "
			set memtotal to text item 2 of memtotal
			set memtotal to memtotal / 1024 / 1024 as integer
			set topresult to do shell script "top -l 1 | head -n 7 | tail -n 1"
			set AppleScript's text item delimiters to ", "
			set memitems to text items of topresult
			set AppleScript's text item delimiters to ""
			set usedmem to text item 4 of memitems
			set AppleScript's text item delimiters to "M"
			set usedmem to text item 1 of usedmem
			
			set mempercent to (usedmem / memtotal) * 100 as integer
			set mempercent to mempercent as text
			set activebar to round (mempercent / 10) rounding to nearest
			set activebar to activebar
			if memtotal ≥ 1024 then
				set memtotal to (memtotal round) / 1024
				set memmeasure to "GiB"
			else
				set memmeasure to "MiB"
			end if
			if usedmem ≥ 1024 then
				set usedmem to usedmem / 1024
				set usedmem to (round (usedmem * 100)) / 100
				set usedmeasure to "GiB"
			else
				set usedmem to (round (usedmem * 100)) / 100
				set usedmeasure to "MiB"
			end if
			set memspeed to do shell script "system_profiler SPMemoryDataType | grep 'Speed:' | awk '{ print $2,$3 }'"
			set AppleScript's text item delimiters to " MHz"
			set memspeed to text item 1 of memspeed
			if memspeed contains "Empty" then
				set AppleScript's text item delimiters to " "
				set memspeed to last text item of memspeed
			end if
			set msg to msg & FBold & "RAM: " & FBold & usedmem & usedmeasure & "/" & memtotal & memmeasure & " @ " & memspeed & "MHz"
			--RAMBar
			if ViewBars is true then
				if activebar = 0 then
					set fullbar to FColor1 & "❙❙❙❙❙❙❙❙❙❙" & FWhite
				else if activebar = 1 then
					set fullbar to FColor2 & "❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙❙❙❙" & FWhite
				else if activebar = 2 then
					set fullbar to FColor2 & "❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙❙❙" & FWhite
				else if activebar = 3 then
					set fullbar to FColor2 & "❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙❙" & FWhite
				else if activebar = 4 then
					set fullbar to FColor2 & "❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙" & FWhite
				else if activebar = 5 then
					set fullbar to FColor2 & "❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙" & FWhite
				else if activebar = 6 then
					set fullbar to FColor2 & "❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙" & FWhite
				else if activebar = 7 then
					set fullbar to FColor2 & "❙❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙" & FWhite
				else if activebar = 8 then
					set fullbar to FColor2 & "❙❙❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙" & FWhite
				else if activebar = 9 then
					set fullbar to FColor2 & "❙❙❙❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙" & FWhite
				else if activebar = 10 then
					set fullbar to FColor2 & "❙❙❙❙❙❙❙❙❙❙" & FWhite
				end if
				set msg to msg & " [" & fullbar & "]"
			end if
			set msg to msg & " • "
		end if
		
		--HDD
		if ViewDisk is true then
			set allFree to 0
			set allSpace to 0
			if allDisks is "True" then
				set myList to list disks
				repeat with i in myList
					set diskName to (i as string)
					try
						set freespace to round (the (free space of disk diskName) / 1024 / 1024)
						set totalspace to round (the (capacity of disk diskName) / 1024 / 1024)
						set allFree to allFree + freespace
						set allSpace to allSpace + totalspace
					end try
				end repeat
				set allUsed to allSpace - allFree
			else
				set allUsed to do shell script "df -k | tail +2 | awk '{print $3}' | tail -r | tail -1"
				set allUsed to (allUsed / 1024)
				set allSpace to do shell script "df -k | tail +2 | awk '{print $2}' | tail -r | tail -1"
				set allSpace to (allSpace / 1024)
			end if
			set hdpercent to round ((allUsed / allSpace) * 100) rounding to nearest
			set allUsed to allUsed / 1024
			set allUsed to (round allUsed * 100) / 100
			set allSpace to allSpace / 1024
			set allSpace to (round allSpace * 100) / 100
			if allUsed is greater than 1024 then
				set allUsed to allUsed / 1024
				set allUsed to (round allUsed * 100) / 100
				set usedunit to "TiB"
			else
				set usedunit to "GiB"
			end if
			if allSpace is greater than 1024 then
				set allSpace to allSpace / 1024
				set allSpace to (round allSpace * 100) / 100
				set spaceunit to "TiB"
			else
				set spaceunit to "GiB"
			end if
			if ViewBars is true then
				--Calculate and Draw bar size only if viewbars is true
				set hdbar to round (hdpercent / 10) rounding to nearest
				if hdbar = 0 then
					set hdfullbar to FColor1 & "❙❙❙❙❙❙❙❙❙❙" & FWhite
				else if hdbar = 1 then
					set hdfullbar to FColor2 & "❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙❙❙❙" & FWhite
				else if hdbar = 2 then
					set hdfullbar to FColor2 & "❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙❙❙" & FWhite
				else if hdbar = 3 then
					set hdfullbar to FColor2 & "❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙❙" & FWhite
				else if hdbar = 4 then
					set hdfullbar to FColor2 & "❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙❙" & FWhite
				else if hdbar = 5 then
					set hdfullbar to FColor2 & "❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙❙" & FWhite
				else if hdbar = 6 then
					set hdfullbar to FColor2 & "❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙❙" & FWhite
				else if hdbar = 7 then
					set hdfullbar to FColor2 & "❙❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙❙" & FWhite
				else if hdbar = 8 then
					set hdfullbar to FColor2 & "❙❙❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙❙" & FWhite
				else if hdbar = 9 then
					set hdfullbar to FColor2 & "❙❙❙❙❙❙❙❙❙" & FColor3 & "|" & FColor1 & "❙" & FWhite
				else if hdbar = 10 then
					set hdfullbar to FColor2 & "❙❙❙❙❙❙❙❙❙❙" & FWhite
				end if
				--HD Temperature
				if ViewTemp is true then
					if hdresult is "" then
						set msg to msg & FBold & "HD: " & FBold & allUsed & usedunit & "/" & allSpace & spaceunit & " [" & hdfullbar & "]"
					else
						set msg to msg & FBold & "HD: " & FBold & allUsed & usedunit & "/" & allSpace & spaceunit & " [" & hdfullbar & "] " & FBold & "Temp: " & FBold & hdresult & "ºC"
					end if
				else
					set msg to msg & FBold & "HD: " & FBold & allUsed & usedunit & "/" & allSpace & spaceunit & " [" & hdfullbar & "]"
				end if
			else
				if ViewTemp is true then
					if hdresult is "" then
						set msg to msg & FBold & "HD: " & FBold & allUsed & usedunit & "/" & allSpace & spaceunit
					else
						set msg to msg & FBold & "HD: " & FBold & allUsed & usedunit & "/" & allSpace & spaceunit & FBold & " Temp: " & FBold & hdresult & "ºC"
					end if
				else
					set msg to msg & FBold & "HD: " & FBold & allUsed & usedunit & "/" & allSpace & spaceunit
				end if
			end if
			set msg to msg & " • "
		end if
		
		--Display
		if ViewDisplay is true then
			if exists POSIX file "/tmp/SPDisplaysDataType.txt" then
			else
				do shell script "system_profiler SPDisplaysDataType > /tmp/SPDisplaysDataType.txt"
			end if
			set gfxcard to do shell script "cat /tmp/SPDisplaysDataType.txt | head | grep -a 'Chipset Model:'"
			set AppleScript's text item delimiters to ":"
			set gfxcard to text item 2 of gfxcard
			set msg to msg & FBold & "GPU:" & FBold & gfxcard & " "
			--GFXBus
			if ViewGFXBus is true then
				set bus to do shell script "cat /tmp/SPDisplaysDataType.txt | head | grep -a 'Bus:' | awk '{print $2}'"
				set msg to msg & "[" & bus & "] "
			end if
			--VRAM
			set vram to do shell script "cat /tmp/SPDisplaysDataType.txt | head | grep -a 'VRAM (Total):' | awk '{print $3 $4}'"
			set msg to msg & "[" & vram & "] "
			--Resolutions
			if ViewResolutions is true then
				set displaycheck to do shell script "cat /tmp/SPDisplaysDataType.txt | grep -a 'Resolution:' -c"
				if displaycheck contains "0" then
					set respretty to ""
				else
					if displaycheck contains "1" then
						--set resolution to do shell script "system_profiler SPDisplaysDataType | grep -a 'Resolution:'"
						set respretty to do shell script "cat /tmp/SPDisplaysDataType.txt | grep -a 'Resolution:' | awk '{print $2$3$4}' | head -n1"
						set msg to msg & FBold & "Res: " & FBold & respretty
					else
						--set resolution to do shell script "system_profiler SPDisplaysDataType | grep -a 'Resolution:'"
						set respretty to do shell script "cat /tmp/SPDisplaysDataType.txt | grep -a 'Resolution:' | awk '{print $2$3$4}' | head -n1"
						set respretty2 to do shell script "cat /tmp/SPDisplaysDataType.txt | grep -a 'Resolution:' | awk '{print $2$3$4}' | tail -n 1"
						set msg to msg & FBold & "Res: " & FBold & respretty & " & " & respretty2
					end if
				end if
			end if
			set msg to msg & " • "
		end if
		
		--Audio
		if ViewAudio is true then
			set kextstat to do shell script "kextstat"
			if kextstat contains "IOAudioFamily" then
				if kextstat contains "AC97" then
					set audio to "AC'97"
				else if kextstat contains "AppleHDA" then
					set audio to "Apple HDA"
				else if kextstat contains "AppleAzaliaAudio" then
					set audio to "Azalia"
				else if kextstat contains "AppleUSBAudio" then
					set audio to "SB Live! 24-Bit External"
				else if kextstat contains "voodoohda" then
					set audio to "VoodooHDA"
				else
					set audio to "Unknown"
				end if
			else
				set audio to "None"
			end if
			set msg to msg & FBold & "Audio: " & FBold & audio & " • "
		end if
		
		--Power
		if ViewPower is true then
			do shell script "pmset -g ps > /tmp/batstats"
			set pstats to do shell script "cat /tmp/batstats | tail -n1 | awk '{print $2,$3,$4}'"
			if pstats is "drawing from 'AC" then
				set msg to msg
			else
				set AppleScript's text item delimiters to ";"
				set pcharge to text item 1 of pstats
				set pstatus to text item 2 of pstats
				set timeleft to text item 3 of pstats as string
				if pstatus = " charging" then
					if timeleft is " (no" then
						set msg to msg & FBold & "Power: " & FBold & pcharge & " [charging]. • "
					else
						set msg to msg & FBold & "Power: " & FBold & pcharge & " [charging]," & timeleft & " left. • "
					end if
				else if pstatus = " discharging" then
					if timeleft is " (no" then
						set msg to msg & FBold & "Power: " & FBold & pcharge & " • "
					else
						set msg to msg & FBold & "Power: " & FBold & pcharge & "," & timeleft & " left. • "
					end if
				else if pstatus = " charged" then
					set msg to msg & FBold & "Power: " & FBold & pcharge & " • "
				end if
			end if
		end if
		
		--OS Version
		if ViewOSXVersion is true then
			set osxversion to do shell script "system_profiler SPSoftwareDataType | grep -a 'System Version:' | awk '{print $3,$4,$5,$6}'"
			set msg to msg & FBold & "OS: " & FBold & osxversion & " "
			if ViewKernelArch is true then
				set FindKernelArch to do shell script "uname -a"
				if FindKernelArch contains "x86_64" then
					set KernelArch to "64-bit"
				else if FindKernelArch contains "i386" then
					set KernelArch to "32-bit"
				else
					set KernelArch to "Unknown"
				end if
				
				set msg to msg & KernelArch & " "
			end if
			if ViewOSXBuild is true then
				set OSXBuild to do shell script "system_profiler SPSoftwareDataType | grep -a 'System Version:' | awk '{print $7}'"
				set msg to msg & OSXBuild & " "
			end if
			set msg to msg & "• "
		end if
		
		
		--Kernel Version
		if ViewKernel is true then
			set temp to do shell script "uname -v"
			set AppleScript's text item delimiters to ";"
			set temp to text item 2 of temp
			set AppleScript's text item delimiters to ":"
			set kernbuilder to text item 1 of temp
			if kernbuilder contains "made by" then
				set AppleScript's text item delimiters to "made by"
				set kernbuilder to text item 2 of kernbuilder
			end if
			if kernbuilder contains "root" then
				set kernbuilder to " Darwin"
			end if
			
			set kernver to do shell script "uname -r"
			set msg to msg & FBold & "Kernel:" & FBold & kernbuilder & " " & kernver
			if ViewKernelBuild = true then
				set xnupre to do shell script "uname -v"
				if xnupre contains "legacy" then
					-- for hacks with legacy kernels
					set xnubuild to do shell script "uname -v | awk '{print $11}' | cut -b 1-31"
				else if xnupre contains "11.0" then
					-- for OS X 10.7 Lion
					set xnubuild to do shell script "uname -v | awk '{print $11}' | cut -b 6-21"
				else
					-- for OS X 10.6 Snow Leopard
					set xnubuild to do shell script "uname -v | awk '{print $11}' | cut -b 6-20"
				end if
				set msg to msg & " " & "(" & xnubuild & ")"
			end if
			set msg to msg & " • "
		end if
		
		
		--Uptime
		if ViewUptime is true then
			set uptime to do shell script "uptime | awk '{sub(/.*up[ ]+/,\"\",$0) ; sub(/,[ ]+[0-9]+ user.*/,\"\",$0);sub(/,/,\"\",$0) ;print $0}'"
			repeat
				if uptime contains "  " then
					set AppleScript's text item delimiters to "  "
					set temp1 to text item 1 of uptime
					set temp2 to text items 2 thru end of uptime
					set uptime to temp1 & " " & temp2
				else
					exit repeat
				end if
			end repeat
			set msg to msg & FBold & "Uptime: " & FBold & uptime & " • "
		end if
		
		
		--Client
		if ViewClient is true then
			set linkver to version of application "Textual"
			if ViewTextualBuild is "True" then
				set linkpath to POSIX path of (path to application "Textual")
				set temp to do shell script "cat " & linkpath & "/Contents/Info.plist | grep Reference -A 1"
				set AppleScript's text item delimiters to "<string>"
				set temp to text item 2 of temp
				set AppleScript's text item delimiters to "</string>"
				set linkbuild to text item 1 of temp
				set msg to msg & FBold & "Client: " & FBold & "Textual " & linkver & " [" & linkbuild & "] • "
			else
				set msg to msg & FBold & "Client: " & FBold & "Textual " & linkver & " • "
			end if
		end if
		
		
		--Script Version
		if ViewScriptVersion is true then
			set msg to msg & FBold & "Script: " & FBold & "xsysinfo " & currentversion & " • "
		end if
		
		--Remove last separator
		if HideFinalDot is "True" then
			repeat until msg does not end with " "
				set msg to text 1 thru -2 of msg
			end repeat
			repeat until msg does not end with "•"
				set msg to text 1 thru -2 of msg
			end repeat
		end if
		
		
	end tell
	return msg
end textualcmd
