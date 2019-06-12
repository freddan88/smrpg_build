###### README

### smrpg_build ( Bashscript for: Windows / Linux to compile SMRPG Sourcemod plugin )

[Code License: MIT](https://choosealicense.com/licenses/mit/)

| My Links: ||
| --------: | --------------------------------------------------
| WebPage:  | [leemann.se/fredrik](http://www.leemann.se/fredrik)
| YouTube:  | [youtube.com/FreLee54](https://www.youtube.com/user/FreLee54)
| Donate:   | [paypal.me/freddan88](https://www.paypal.me/freddan88)
| GitHub:   | [github.com/freddan88/smrpg_build](https://github.com/freddan88/smrpg_build)

#### Description:

<pre>
Easy to use script to compile and install smrpg from Source
smrpg is a plugin for sourcemod programed by: peace-maker...

I didn´t find the original build-script to work so I created my own
I take no responsibility for this script, use at your own risk
Security and bugs shall be reported to each individual project

This script will download all dependencies and compile them with the plugin
</pre>

#### Script tested on:

- Windows using babun Shell version 1.2.0
- Linux CentOS 7 64Bit
- Linux Debian 9.9.0 64Bit
- Linux Ubuntu 18.04.2 LTS 64Bit

#### Plugins tested on:

- SRCDS playing Counter-Strike Source
- SRCDS playing Counter-Strike: Global Offensive<br/>
( Some plugins may not work due to incompatibility with CSGO )

#### Plugins, dependencies and authors:

Username: drifter<br/>
Plugin: dhooks<br/>
URL: http://users.alliedmods.net/~drifter/builds<br/>

Username: bcserv<br/>
Plugin: smlib<br/>
URL: https://github.com/bcserv/smlib<br/>

Username: peace-maker<br/>
Plugin: smrpg<br/>
URL: https://github.com/peace-maker/smrpg<br/>

Username: PremyslTalich/KissLick<br/>
Plugin: ColorVariables<br/>
URL: https://github.com/PremyslTalich/ColorVariables<br/>

Username: Drixevel<br/>
Plugin: Chat-Processor<br/>
URL: https://github.com/Drixevel/Chat-Processor<br/>

Username: Impact123<br/>
Plugin: AutoExecConfig<br/>
URL: https://github.com/Impact123/AutoExecConfig<br/>

Username: GoD Tony<br/>
Plugin: Updater<br/>
URL: https://bitbucket.org/GoD_Tony/updater<br/>

Username: minimoney1<br/>
Plugin: simple-chat-processor<br/>
URL: https://bitbucket.org/minimoney1/simple-chat-processor<br/>

Community: AlliedModders<br/>
Modification: SourceMod<br/>
URL: https://www.sourcemod.net<br/>

Info: AlliedModders<br/>
URL: https://www.alliedmods.net<br/>

__Instructions:__

---

#### WINDOWS

> Installation

1. Download and install babun Shell:<br/>
http://babun.github.io/

2. Open babun and install dependencies:
    ```Bash
    pact install zip unzip wget curl git nano
    ```

3. Use 'git clone' to clone this repo to your computer:
    ```Bash
    git clone https://github.com/freddan88/smrpg_build.git
    ```

4. Download and extract sourcemod to smrpg_build/build<br/>
https://www.sourcemod.net/downloads.php?branch=stable

_Tip: You can use wget from Babun and then unzip to extract it, example:_

```Bash
cd ./smrpg_build
wget https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6275-windows.zip
unzip sourcemod-1.9.0-git6275-windows.zip -d ./build
```

> Configuration

1. Use nano in babun to edit and uncoment the two lines used by dhooks for Windows

<pre>
cd smrpg_build
nano ./smrpg_build.sh
</pre>

_Example:_

<pre>
Change from:
    # Windows:
    # wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-windows.zip
    # unzip -qqo dhooks*windows.zip
</pre>

<pre>
Change to:
    # Windows:
    wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-windows.zip
    unzip -qqo dhooks*windows.zip
</pre>

_Tip: You can change the version getting downloaded by changing the URL - Download dhooks from: http://users.alliedmods.net/~drifter/builds/dhooks

2. Save the changes and continue reading below for usage

> Usage

1. Make sure babun is opened in the folder named smrpg_build and execute the script
    ```Bash
    ./smrpg_build.sh
    ```

2. When the script is done compiling you will have a zip file containing the plugins

3. The folders addons and cfg found in ./build can be used for new installations of SRCDS

_Tip: Download and install metamod to this directory to enable autoloading of sourcemod_<br/>
Download from: https://www.sourcemm.net/downloads.php?branch=stable

_Example using wget in babun:_

```Bash
cd ./smrpg_build
wget https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-windows.zip
unzip mmsource-1.10.7-git968-windows.zip -d ./build
```

__WARNING__
adminmenu_maplist.ini, admins_simple.ini, databases.cfg are all included in sourcemod/configs<br/>
Keep this in mind before you install the plugins or else you may owerwrite your own files by accident...

---

#### LINUX

> Installation

1. Install dependencies:

    _Ubuntu_
    ```Bash
    apt-get install zip unzip wget curl git nano lib32ncurses5 lib32z1 lib32stdc++6
    ```
    _CentOS_
    ```
    yum install zip unzip wget curl git nano glibc.i686 libstdc++.i686
    ```

2. Use 'git clone' to clone this repo to your computer:
    ```
    git clone https://github.com/freddan88/smrpg_build.git
    ```

3. Download and extract sourcemod to smrpg_build/build<br/>
https://www.sourcemod.net/downloads.php?branch=stable

_Tip: You can use wget from Bash and then tar to extract it, example:_

```Bash
cd ./smrpg_build
wget https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6275-linux.tar.gz
tar -xvzf sourcemod-*-linux.tar.gz -C ./build
```

> Configuration

1. Use nano in bash to edit and uncoment the two lines used by dhooks for Linux

<pre>
nano ./smrpg_build.sh
</pre>

_Example:_

<pre>
Change from:
    # Linux:
    # wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-linux.tar.gz
    # tar -zxf dhooks*linux.tar.gz
</pre>

<pre>
Change to:
    # Linux:
    wget -q http://users.alliedmods.net/~drifter/builds/dhooks/2.2/dhooks-2.2.0-hg126-linux.tar.gz
    tar -zxf dhooks*linux.tar.gz
</pre>

_Tip: You can change the version getting downloaded by changing the URL - Download dhooks from: http://users.alliedmods.net/~drifter/builds/dhooks

2. Save the changes and continue reading below for usage

> Usage

1. Change permissions on the script¨
    ```Bash
    chmod 754 ./smrpg_build.sh
    ```

2. Execute the script
    ```Bash
    ./smrpg_build.sh
    ```

3. When the script is done compiling you will have a zip file containing the plugins

4. The folders addons and cfg found in ./build can be used for new installations of SRCDS

_Tip: Download and install metamod to this directory to enable autoloading of sourcemod_<br/>
Download from: https://www.sourcemm.net/downloads.php?branch=stable

_Example using wget in bash:_

```Bash
cd ./smrpg_build
wget https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git968-linux.tar.gz
tar -xvzf mmsource-*-linux.tar.gz -C ./build
```

__WARNING__
adminmenu_maplist.ini, admins_simple.ini, databases.cfg are all included in sourcemod/configs<br/>
Keep this in mind before you install the plugins or else you may owerwrite your own files by accident...

---

Script: [www.leemann.se/fredrik](http://www.leemann.se/fredrik)<br/>
Donate: [paypal.me/freddan88](https://www.paypal.me/freddan88)
