#!/bin/bash

# Copy the url for the latest dhooks-package from:
# http://users.alliedmods.net/~drifter/builds/dhooks
# -------------------------------------------------|

# Windows:
wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-windows.zip
unzip -qq dhooks-2.2.0-hg126-windows.zip

# Linux:
# wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-linux.tar.gz
# tar -zxf dhooks-2.2.0-hg126-linux.tar.gz

array_giturls=(
	"git clone -q https://github.com/bcserv/smlib.git addons/src"
	"git clone -q https://github.com/peace-maker/smrpg.git addons/src"
	"git clone -q https://github.com/KissLick/ColorVariables.git addons/src"
	"git clone -q https://github.com/Drixevel/Chat-Processor.git addons/src"
	"git clone -q https://github.com/Impact123/AutoExecConfig.git addons/src"
	"git clone -q https://bitbucket.org/minimoney1/simple-chat-processor.git addons/src"
)

rm -rf dhooks-*.*
autoversion_file="./addons/sourcemod/scripting/include/smrpg/smrpg_autoversion.inc"

giturls_length=${#array_giturls[@]}

for((i=0; i<=$giturls_length - 1; i++)); do
	
	echo " "
	echo "Running: ${array_giturls[i]}"
	${array_giturls[i]}

	if [[ "${array_giturls[i]}" = *smrpg.git* ]]; then

		cd addons/src
		mkdir -p plugins
		smrpg_rev=$(git rev-list --count HEAD)
		smrpg_cset=$(git rev-parse --short HEAD)
		smrpg_major=$(echo $ver | cut -d'.' -f'1')
		smrpg_minor=$(echo $ver | cut -d'.' -f'2' | cut -d'-' -f'1')
		smrpg_ver=$(cat scripting/include/smrpg.inc | grep -o '#define SMRPG_VERSION.*' | cut -d'"' -f'2')
		wget -q http://www.sourcemod.net/vbcompiler.php\?file_id\=141520 -O ./plugins/csgo_movement_unlocker.smx
		curl -s https://forums.alliedmods.net/attachment.php\?attachmentid\=141521\&d\=1495261818 -o ./gamedata/csgo_movement_unlocker.games.txt
		wget -q https://forums.alliedmods.net/attachment.php\?attachmentid\=141520\&d\=1421117043 -O ./scripting/csgo_movement_unlocker.sp
		cd ../..
	fi

	pluginfiles=$(ls addons/src | grep -v "LICENSE" | grep -v ".md" | grep -v ".txt" | grep -v ".sh" | grep -v ".png")

	for pluginfile in $pluginfiles; do

		if [[ $pluginfile = autoexecconfig.inc ]]; then
			mv ./addons/src/$pluginfile ./addons/sourcemod/scripting/include
		elif [[ $pluginfile = autoexecconfig.sp ]]; then
			mv ./addons/src/$pluginfile ./addons/sourcemod/scripting
		elif [[ $pluginfile = addons ]]; then
			cp -rf ./addons/src/$pluginfile/sourcemod/scripting/includes ./addons/sourcemod/scripting/includes
			cp -rf ./addons/src/$pluginfile/sourcemod/scripting/includes/colorvariables.inc ./addons/sourcemod/scripting/include/colorvariables.inc
		else
			cp -rf ./addons/src/$pluginfile ./addons/sourcemod
		fi
	done

	rm -rf ./addons/src
done

echo " "
echo "#if defined _smrpg_version_included" > $autoversion_file
echo "#endinput" >> $autoversion_file
echo "#endif" >> $autoversion_file
echo "#define _smrpg_version_included" >> $autoversion_file
echo " " >> $autoversion_file
echo "#define SMRPG_V_TAG \"\"" >> $autoversion_file
echo "#define SMRPG_V_RELEASE	0" >> $autoversion_file
echo "#define SMRPG_V_MAJOR $smrpg_major" >> $autoversion_file
echo "#define SMRPG_V_MINOR $smrpg_minor" >> $autoversion_file
echo "#define SMRPG_V_REV $smrpg_rev" >> $autoversion_file
echo "#define SMRPG_V_CSET \"$smrpg_cset\"" >> $autoversion_file
echo "#define SMRPG_VERSION \"$smrpg_ver\"" >> $autoversion_file

cd ./addons/sourcemod/scripting
ls smrpg*.sp upgrades/smrpg*.sp > smrpg_plugins.txt
mkdir -p ./plugins/upgrades

cd ../..

pwd
find . -type f -follow -print > filepaths.txt
exit 0

# wget -q http://www.sourcemod.net/vbcompiler.php\?file_id\=141520 -O ../plugins/csgo_movement_unlocker.smx
# wget -q https://forums.alliedmods.net/attachment.php?attachmentid=141521&d=1495261818 -O ../gamedata/csgo_movement_unlocker.games.txt
# wget -q https://forums.alliedmods.net/attachment.php\?attachmentid\=141520\&d\=1421117043 -O csgo_movement_unlocker.sp

for plugin in $(cat plugins.txt); do
	
	filename=$(echo $plugin | cut -f'1' -d'.')
	file_ext=$(echo $plugin | cut -f'2' -d'.')
	
	# echo $filename
	# echo $file_ext
	# echo $plugin
	
	./spcomp.* ./$plugin -o ./plugins/$filename
	
done

cd ../..

# cd addons/sourcemod
# echo smrpg-compiled-$(date +'%Y%m%d').zip
# unzip sourcemod-1.9.0-git6275-windows.zip -d build