# Set-ExecutionPolicy RemoteSigned
wget http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-windows.zip -OutFile dhooks.zip
Expand-Archive -Path .\dhooks.zip -DestinationPath . -Force
##
wget https://github.com/PremyslTalich/ColorVariables/archive/master.zip -OutFile cv.zip
Expand-Archive -Path .\cv.zip -DestinationPath . -Force
Copy-Item -Path .\ColorVariables*\addons -Destination . -Force -Recurse
Remove-Item -Path .\ColorVariables* -Force -Recurse
##
New-Item -Path . -Name sourcemod -ItemType directory
wget https://github.com/bcserv/smlib/archive/master.zip -OutFile smlib.zip
Expand-Archive -Path .\smlib.zip -DestinationPath . -Force
Copy-Item -Path .\smlib-master\* -Destination .\sourcemod -Force -Recurse
Remove-Item -Path .\smlib-master -Force -Recurse
##
wget https://github.com/peace-maker/smrpg/archive/master.zip -OutFile smrpg.zip
Expand-Archive -Path .\smrpg.zip -DestinationPath . -Force
Copy-Item -Path .\smrpg-master\* -Destination .\sourcemod -Force -Recurse
Remove-Item -Path .\smrpg-master -Force -Recurse
##
wget https://github.com/Drixevel/Chat-Processor/archive/master.zip -OutFile cp.zip
Expand-Archive -Path .\cp.zip -DestinationPath . -Force
Copy-Item -Path .\Chat-Processor*\* -Destination .\sourcemod -Force -Recurse
Remove-Item -Path .\Chat-Processor* -Force -Recurse
##
wget https://bitbucket.org/minimoney1/simple-chat-processor/get/949b2e410fa5.zip -OutFile scp.zip
Expand-Archive -Path .\scp.zip -DestinationPath . -Force
Copy-Item -Path .\minimoney1*\* -Destination .\sourcemod -Force -Recurse
Remove-Item -Path .\minimoney1* -Force -Recurse
##
wget https://github.com/Impact123/AutoExecConfig/archive/development.zip -OutFile aec.zip
Expand-Archive -Path .\aec.zip -DestinationPath . -Force
Move-Item -Path .\AutoExecConfig*\autoexecconfig.sp -Destination .\sourcemod\scripting -Force
Move-Item -Path .\AutoExecConfig*\autoexecconfig.inc -Destination .\sourcemod\scripting\include -Force
Remove-Item -Path .\AutoExecConfig* -Force -Recurse
##
wget https://bitbucket.org/GoD_Tony/updater/get/12181277db77.zip -OutFile updater.zip
Expand-Archive -Path .\updater.zip -DestinationPath . -Force
Copy-Item -Path .\GoD_Tony*\* -Destination .\sourcemod\scripting -Force -Recurse
Remove-Item -Path .\GoD_Tony* -Force -Recurse
##
Copy-Item -Path .\sourcemod -Destination .\addons -Force -Recurse
Copy-Item -Path .\addons\sourcemod\scripting\include\* -Destination .\addons\sourcemod\scripting\includes -Force -Recurse
Remove-Item -Path .\sourcemod -Force -Recurse
Remove-Item -Path .\addons\sourcemod\*.yml -Force
Remove-Item -Path .\addons\sourcemod\*.sh -Force
Remove-Item -Path .\addons\sourcemod\.* -Force
Remove-Item -Path .\*.zip -Force
##
Remove-Item -Path .\addons\sourcemod\plugins\* -Force
New-Item -Path .\addons\sourcemod\plugins\disabled -Name errors -ItemType directory
New-Item -Path .\addons\sourcemod\plugins -Name upgrades -ItemType directory
##
# Download manualy for csgo:
# https://forums.alliedmods.net/showthread.php?t=255298