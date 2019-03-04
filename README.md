### smrpg_build ( Bashscript for: Windows / Linux to compile Sourcemod plugin )

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

#### Tested on:

- Windows using babun Shell version 1.2.0

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

Username: minimoney1<br/>
Plugin: simple-chat-processor<br/>
URL: https://bitbucket.org/minimoney1/simple-chat-processor<br/>

#### Instructions:

__WINDOWS__

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

_Tip: You can change the version getting downloaded by changing the URL - Download dhooks from: http://users.alliedmods.net/~drifter/builds/dhooks_

2. Save the changes and continue reading below for usage

> Usage

1. Make sure babun is opened in the folder named smrpg_build and execute the script
    ```Bash
    ./smrpg_build.sh
    ```

2. When the script is done compiling you will have a zip file containing the plugins

3. The folders addons and cfg found in ./build can be used for new installations of SRCDS

_Tip: You can download and install metamod to this directory to<br/>
Download from: https://www.sourcemm.net/downloads.php?branch=stable_

__WARNING__
adminmenu_maplist.ini, admins_simple.ini, databases.cfg are all included in sourcemod/configs<br/>
Keep this in mind before you install the plugins or else you may owerwrite your own files by accident...

---

__LINUX__

> Installation

> Configuration

> Usage