# VEAF-Open-Training-Mission-Syria

All scripts, libraries and documentation needed to build the VEAF Open Training Mission.

## Playing in this mission

See [Playing in the OpenTraining mission](https://github.com/VEAF/VEAF-Open-Training-Mission-Syria/wiki).

## Working on this mission

Requirements:

* DCS World 2.5+
* 7za.exe in your path - you can install [7zip **Extra** from here](https://www.7-zip.org/download.html)
* git
* an IDE (Notepad++, Visual Studio Code, etc.)
* npm - you can install [node.js from here](https://nodejs.org/en/download/)

```shell script
git clone https://github.com/VEAF/VEAF-Open-Training-Mission-Syria.git
cd VEAF-Open-Training-Mission-Syria
build.cmd
```

### Make changes with DCS Mission Editor

*Note: you must avoid editing the mission and scripts at the same time*

To make changes in the Mission Editor, you need to:

* build the mission (command line): build.cmd
* move the built mission in your project root (command line / file explorer): move build/VEAF*.miz .
* open the mission (DCS Mission Editor)
* do all changes what you need (add groups, flight plans, static, etc...)
* save the mission
* test the mission (testing is doubting ?)
* extract the mission (command line): extract.cmd
* then create a branch, commit, push and create a pull request

### Make changes directly to source scripts

*Note: you must avoid editing the mission and scripts at the same time*

To make changes from sources, you need to:

* edit scripts (and save them)
* build the mission (command line): build.cmd
* open the mission (Mission Editor or from Missions / My Mission menu)
* test the mission
* then create a branch, commit, push and create a pull request
