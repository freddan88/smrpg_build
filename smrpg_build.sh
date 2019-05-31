#!/bin/bash
#
# Date: 2019-05-31
# Author: www.leemann.se/fredrik
# YouTube: https://www.youtube.com/user/FreLee54
#
# WebPage: http://www.leemann.se/fredrik
# Donate: https://www.paypal.me/freddan88
# GitHub: https://github.com/freddan88/smrpg_build
#
# Copy the url for the latest dhooks-package from:
# http://users.alliedmods.net/~drifter/builds/dhooks
# -------------------------------------------------|

# Windows:
# wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-windows.zip
# unzip -qqo dhooks*windows.zip

# Linux:
# wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-linux.tar.gz
# tar -zxf dhooks*linux.tar.gz

################
root_path=$(pwd)
rm -rf dhooks-*.*

if [ ! -d "$root_path/build" ]; then
	echo " "
	echo "Error no directory: ./build"
	echo " "
	exit
elif [ ! -d "$root_path/build/smrpg_assets" ]; then
	echo " "
	echo "Error missing smrpg_assets in: ./build"
	echo " "
	exit
elif [ ! -d "$root_path/build/addons/sourcemod" ]; then
	echo " "
	echo "Error missing sourcemod in: ./build"
	echo " "
	exit
fi

array_giturls=(
	"git clone -q https://github.com/bcserv/smlib.git addons/src"
	"git clone -q https://github.com/peace-maker/smrpg.git addons/src"
	"git clone -q https://github.com/KissLick/ColorVariables.git addons/src"
	"git clone -q https://github.com/Drixevel/Chat-Processor.git addons/src"
	"git clone -q https://github.com/Impact123/AutoExecConfig.git addons/src"
	"git clone -q https://bitbucket.org/minimoney1/simple-chat-processor.git addons/src"
)

autoversion_file="./addons/sourcemod/scripting/include/smrpg/smrpg_autoversion.inc"

giturls_length=${#array_giturls[@]}

for((i=0; i<=$giturls_length - 1; i++)); do

	echo " "
	echo "Running: ${array_giturls[i]}"
	${array_giturls[i]}

	if [[ "${array_giturls[i]}" = *smrpg.git* ]]; then

		cd ./addons/src
		smrpg_rev=$(git rev-list --count HEAD)
		smrpg_cset=$(git rev-parse --short HEAD)
		smrpg_major=$(echo $ver | cut -d'.' -f'1')
		smrpg_minor=$(echo $ver | cut -d'.' -f'2' | cut -d'-' -f'1')
		smrpg_ver=$(cat scripting/include/smrpg.inc | grep -o '#define SMRPG_VERSION.*' | cut -d'"' -f'2')
		curl -s https://forums.alliedmods.net/attachment.php\?attachmentid\=141521\&d\=1495261818 -o ./gamedata/csgo_movement_unlocker.games.txt
		wget -q https://forums.alliedmods.net/attachment.php\?attachmentid\=141520\&d\=1421117043 -O ./scripting/csgo_movement_unlocker.sp
		wget -q https://bitbucket.org/GoD_Tony/updater/get/v1.2.2.zip -O ./updater.zip && unzip -qqo updater.zip
		cp -rf ./GoD_Tony-updater*/include ./GoD_Tony-updater*/updater ./GoD_Tony-updater*/updater.sp ./scripting
		rm -rf ./GoD_Tony-updater* && rm -f updater.zip
		cd $root_path
	fi

	pluginfiles=$(ls ./addons/src | grep -v "LICENSE" | grep -v ".md" | grep -v ".txt" | grep -v ".sh" | grep -v ".png")

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
	rm -rf ./addons/sourcemod/plugins
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
mkdir -p ./plugins/{upgrades,disabled/errors}
cd $root_path

cp -f ./build/smrpg_assets/* ./addons/sourcemod/configs
cp -rf ./addons/sourcemod ./build/addons
cd ./build/addons/sourcemod/scripting

for plugin in $(cat smrpg_plugins.txt); do

	filename=$(echo $plugin | cut -f'1' -d'.')
	file_ext=$(echo $plugin | cut -f'2' -d'.')
	# echo $filename
	# echo $file_ext
	# echo $plugin

	if [[ "$plugin" = *smrpg_chattags.sp* ]]; then
		./spcomp ./$plugin -o ./plugins/disabled/errors/smrpg_chattags_cp.smx -E
		./spcomp ./$plugin -o ./plugins/disabled/errors/smrpg_chattags_scp.smx -E USE_SIMPLE_PROCESSOR=
		echo " "
		echo "Disabling some plugins due to errors in there sourcecode"
		echo "Moving disabled plugins to: plugins/disabled/errors..."
		echo " "
	elif [[ "$plugin" = *smrpg_upgrade_example.sp* ]]; then
		echo " "
		echo Skipping: $plugin
		echo " "
	else
		./spcomp ./$plugin -o ./plugins/$filename -E
	fi
done

./spcomp ./csgo_movement_unlocker.sp -o ./plugins/disabled/csgo_movement_unlocker.smx -E
./spcomp ./custom-chatcolors-cp.sp -o ./plugins/disabled/errors/custom-chatcolors-cp.smx -E
./spcomp ./simple-chatprocessor.sp -o ./plugins/disabled/errors/simple-chatprocessor.smx -E
./spcomp ./chat-processor.sp -o ./plugins/disabled/errors/chat-processor.smx -E
./spcomp ./cp-scp-wrapper.sp -o ./plugins/disabled/errors/cp-scp-wrapper.smx -E

rm -f $root_path/addons/sourcemod/scripting/smrpg_plugins.txt
rm -rf $root_path/addons/sourcemod/scripting/plugins
cp -rf ./plugins $root_path/addons/sourcemod
rm -f ./smrpg_plugins.txt
cp -rf ./plugins ..
rm -rf ./plugins
cd $root_path

zip -qr smrpg-compiled-$(date +'%Y%m%d-%s').zip ./addons
rm -rf ./addons

echo " "
exit 0