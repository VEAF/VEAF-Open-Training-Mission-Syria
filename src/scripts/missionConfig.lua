-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission configuration file for the VEAF framework
-- see https://github.com/VEAF/VEAF-Mission-Creation-Tools
--
-- This configuration is tailored for the Syria OpenTraining mission
-- see https://github.com/VEAF/VEAF-Open-Training-Mission-Syria
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.config.MISSION_NAME = "OpenTraining_Syria"
veaf.config.MISSION_EXPORT_PATH = nil -- use default folder

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize QRA
-------------------------------------------------------------------------------------------------------------------------------------------------------------
VeafQRA.ToggleAllSilence(false) --this will set all QRA messages ON if the argument is "true" and all QRA messages to OFF is the argument is "false".

if veaf then
    QRA_Palmyra = VeafQRA:new()
    :setName("QRA_Palmyra")
    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    :setTriggerZone("QRA_Palmyra")
    :setRandomGroupsToDeployByEnemyQuantity(1, { "QRA_Palmyra-1", "QRA_Palmyra-2", "QRA_Palmyra-3" }, 1) -- 1 human in the zone
    :setRandomGroupsToDeployByEnemyQuantity(2, { "QRA_Palmyra-4", "QRA_Palmyra-5", "QRA_Palmyra-6" }, 1) -- 1 human in the zone
    :setDelayBeforeRearming(10) -- seconds before the QRA is rearmed
    :setDelayBeforeActivating(60) -- seconds before the QRA is activated, since the first enemy enters the zone
    :setReactOnHelicopters() --Sets if the QRA reacts to helicopters entering the zone
    :setAirportLink("Palmyra")
    :start()
end

if veaf then
    QRA_Bassel = VeafQRA:new()
    :setName("QRA_Bassel")
    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    :setTriggerZone("QRA_Bassel")
    :setRandomGroupsToDeployByEnemyQuantity(1, { "QRA_Bassel-1", "QRA_Bassel-2", "QRA_Bassel-3" }, 1) -- 1 human in the zone
    :setRandomGroupsToDeployByEnemyQuantity(2, { "QRA_Bassel-4", "QRA_Bassel-5", "QRA_Bassel-6" }, 1) -- 1 human in the zone
    :setDelayBeforeRearming(10) -- seconds before the QRA is rearmed
    :setDelayBeforeActivating(60) -- seconds before the QRA is activated, since the first enemy enters the zone
    :setReactOnHelicopters() --Sets if the QRA reacts to helicopters entering the zone
    :setAirportLink("Bassel Al-Assad")
    :start()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize all the scripts
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRadio then
    -- the RADIO module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("init - veafRadio")
    veafRadio.initialize(true)
end
if veafSpawn then
    -- the SPAWN module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("init - veafSpawn")
    veafSpawn.initialize()
end
if veafGrass then
    veaf.loggers.get(veaf.Id):info("init - veafGrass")
    veafGrass.initialize()
end
if veafCasMission then
    veaf.loggers.get(veaf.Id):info("init - veafCasMission")
    veafCasMission.initialize()
end
if veafTransportMission then
    veaf.loggers.get(veaf.Id):info("init - veafTransportMission")
    veafTransportMission.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- change some default parameters
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.DEFAULT_GROUND_SPEED_KPH = 25

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize SHORTCUTS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafShortcuts then
    -- the SHORTCUTS module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("init - veafShortcuts")
    veafShortcuts.initialize()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure ASSETS
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafAssets then
    veaf.loggers.get(veaf.Id):info("Loading configuration")
    veafAssets.Assets = {
		-- list the assets in the mission below
		{sort=1, name="MAGIC", description="MAGIC (E-3A)", information="U282.20 (15)", linked="MAGIC - ESCORTE"},  
		{sort=2, name="DARKSTAR", description="DARKSTAR (E-3A)", information="U281.10 (16)", linked="DARKSTAR - ESCORTE"},  
        
        {sort=3, name="CVN-71 - Roosevelt", description="Roosevelt (CVN)", information="Tacan 12X RHR\nICLS 11\nU227 (12)\nLink4 227MHz\nACLS available"},  
		{sort=4, name="CVN-74 - John C. Stennis", description="Stennis (CVN)", information="Tacan 13X STS\nICLS 13\nU226 (13)\nLink4 226MHz\nACLS available"},  
		{sort=5, name="LHA-1 Tarawa", description="Tarawa (LHA)", information="Tacan 14X TAA\nU225 (14)"},  
        {sort=6, name="Admiral Kuznetsov", description="Admiral Kuznetsov (CV)", information="V121.5"},
		
        {sort=7, name="TEXACO 1-1", description="Texaco 1-1 (KC-135 MPRS)", information="Tacan 60Y\nU290.10 (17)\nZone NORD", linked="TEXACO 1-1 - ESCORTE"},  
		{sort=8, name="TEXACO 2-1", description="Texaco 2-1 (KC-135 MPRS)", information="Tacan 61Y\nU290.30 (18)\nZone SUD", linked="TEXACO 2-1 - ESCORTE"},  
		{sort=9, name="SHELL 1-1", description="SHELL 1-1 (KC-135)", information="Tacan 62Y\nU290.40 (19)\nZone NORD", linked="SHELL 1-1 - ESCORTE"},  
		{sort=10, name="SHELL 2-1", description="SHELL 2-1 (KC-135)", information="Tacan 63Y\nU290.50 (20)\nZone SUD", linked="SHELL 2-1 - ESCORTE"},  
        
		{sort=11, name="CVN-74 - John C. Stennis S3B", description="Navy One 1-1 (S3-B)", information="Tacan 74X\nU290.70\nZone PA"},  
		{sort=12, name="CVN-71 - Roosevelt S3B", description="Navy One 2-1 (S3-B)", information="Tacan 71X\nU290.80\nZone PA"},  
        
		{sort=13, name="A-50", description="A-50 (A-50, RED)", information="U282.2 (15)", linked="A-50 - ESCORTE"}, 
        {sort=14, name="IL-78M", description="IL-78M (IL-78M, RED)", information="U290.1 (17)", linked="IL-78M - ESCORTE"},  
    }

    veaf.loggers.get(veaf.Id):info("init - veafAssets")
    veafAssets.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure MOVE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafMove then
    veaf.loggers.get(veaf.Id):info("Setting move tanker radio menus")
    -- keeping the veafMove.Tankers table empty will force veafMove.initialize() to browse the units, and find the tankers automatically
    veaf.loggers.get(veaf.Id):info("init - veafMove")
    veafMove.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT MISSION
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafCombatMission then 
	veaf.loggers.get(veaf.Id):info("Loading configuration")

    -- veafCombatMission.addCapMission("CAP-DEF-Kuznetsov-Easy", "CAP over Kuznetzov", "Kill the fighters defending the russian fleet.", true, true)
    veafCombatMission.addCapMission("CAP-Aleppo-Mig21-Fox1", "CAP from Aleppo over Hatay Fox1", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Aleppo-Mig29S-Fox3", "CAP from Aleppo over Hatay Fox3", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Kuznetsov-Su33-Fox1-Easy", "CAP over Kuznetzov Fox1 Easy", "Kill the fighters defending the russian fleet.", true, true)
    veafCombatMission.addCapMission("CAP-Kuznetsov-Su33-Fox1-Medium", "CAP over Kuznetzov Fox1 Medium", "Kill the fighters defending the russian fleet.", true, true)
    veafCombatMission.addCapMission("CAP-Tabqa-Su27-Fox1", "CAP from Tabqa over CU05 (Scud factory) Fox1", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Tabqa-Mig29S-Fox3", "CAP from Tabqa over CU05 (Scud factory) Fox3", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Palmyra-Mig21-Fox1", "CAP from Palmyra over CT44 (Desert camp) Fox1", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Palmyra-F14A-Fox3", "CAP from Palmyra over CT44 (Desert camp) Fox3 (F14A)", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Palmyra-F14B-Fox3", "CAP from Palmyra over CT44 (Desert camp) Fox3 (F14B)", "Kill all the ennemy fighters.", true, true)

    veafCombatMission.AddMission(
		VeafCombatMission:new()
		:setName("ELINT-Mission-West")
		:setFriendlyName("ELINT gathering over the West zone")
		:setBriefing([[
ATIS on 282.125, SAM CONTROL on 282.225
A C-130 pair will fly reciprocical headings, trying to pinpoint enemy SAMS.
Don't let them be destroyed by the enemy !]])
		:addElement(
			VeafCombatMissionElement:new()
			:setName("ELINT-W")
			:setGroups({
				"ELINT-C-130-W-1",
				"ELINT-C-130-W-2"
            })
			:setSkill("Good")
		)
        :setSecured(true)
		:initialize()
	)

    veafCombatMission.AddMission(
		VeafCombatMission:new()
		:setName("ELINT-Mission-East")
		:setFriendlyName("ELINT gathering over the East zone")
		:setBriefing([[
ATIS on 282.125, SAM CONTROL on 282.225
A C-130 pair will fly reciprocical headings, trying to pinpoint enemy SAMS.
Don't let them be destroyed by the enemy !]])
		:addElement(
			VeafCombatMissionElement:new()
			:setName("ELINT-E")
			:setGroups({
				"ELINT-C-130-E-1",
				"ELINT-C-130-E-2"
            })
			:setSkill("Good")
		)
        :setSecured(true)
		:initialize()
	)

    veaf.loggers.get(veaf.Id):info("init - veafCombatMission")
    veafCombatMission.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT ZONE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafCombatZone then 
    veaf.loggers.get(veaf.Id):info("Loading configuration")

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("CombatZone_Desert-Rang-Easy")
			:setFriendlyName("Training at KhalKhalah Desert RANGE")
			:setBriefing("The KhalKhalah RANGE is located 35 nm east of the KhalKhalah airbase, in the desert")
            :setTraining(true)
	)

    veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("CombatZone_Camp")
			:setFriendlyName("Camp militaire")
			:setBriefing(
[[Nos services de renseignements on localisé un camp Syrien aux coordonnés N33°46’423 E37°19’659 // 37S CT 45146 38323 qui sert de camp d’entrainement aux TALIBAN pour déstabiliser nos défenses par des actions kamikazes. 
Il est impératif de neutraliser ce camp avant que les premiers Djihadistes aient fini leur formation.
Les photos prises par les Mirages F1 de la ER 2/33 montre quelques ZU-23, mais il y a une grande possibilité de présence de MANPADS]])
    )

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("CombatZone_SCUD-Factory")
			:setFriendlyName("CombatZone_SCUD-Factory")
			:setBriefing("TBD briefing for CombatZone_SCUD-Factory")
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("CombatZone_Antakya")
			:setFriendlyName("Antakya Urban Operations")
            :setBriefing("Destroy the road block located on the West of Antakya City\nNeutralize streets patrols.\nNo fly zone on North-East (Manpads)!")
            :setTraining(true)
	)

    veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("CombatZone_Range-Kiryat-Easy")
			:setFriendlyName("Kiryat RANGE - easy")
			:setBriefing("The Kiryat RANGE (located 7 nm south of Kiryat airbase) is set-up for training with defenseless targets")
            :setTraining(true)
	)

	veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("CombatZone_Range-Kiryat-Medium")
			:setFriendlyName("Kiryat RANGE - medium")
            :setBriefing("The Kiryat RANGE (located 7 nm south of Kiryat airbase) is set-up for training with some defense")
            :setTraining(true)
	)

    veafCombatZone.AddZone(
		VeafCombatZone:new()
			:setMissionEditorZoneName("CombatZone_Protect-Hama")
			:setFriendlyName("Protect HAMA")
			:setBriefing(
[[Les alliés protègent des archéologues occupés à étudier les ruines proches du stade de HAMA.
On nous a averti qu'un convoi d'artillerie autotractée était en cours d'acheminement (ETA 30 minutes).
Ce sont nos cibles principales !
La zone de rassemblement du convoi est protégée par des blindés et de la défense anti-aérienne (cibles secondaires)
]])
    )

    veaf.loggers.get(veaf.Id):info("init - veafCombatZone")
    veafCombatZone.initialize()

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure WW2 settings based on loaded theatre
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local theatre = string.lower(env.mission.theatre)
veaf.loggers.get(veaf.Id):info(string.format("theatre is %s", theatre))
veaf.config.ww2 = false
if theatre == "thechannel" then
    veaf.config.ww2 = true
elseif theatre == "normandy" then
    veaf.config.ww2 = true
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure NAMEDPOINTS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafNamedPoints then
    -- the NAMED POINTS module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("Loading configuration")

    
    -- here you can add points of interest, that will be added to the default points
    local customPoints = {
        {name="RANGE KhalKhalah",point=coord.LLtoLO("33.036180", "37.196608")}
    }
    veaf.loggers.get(veaf.Id):info("init - veafNamedPoints")
    veafNamedPoints.initialize(customPoints)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure SECURITY
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSecurity then
    -- the SECURITY module is mandatory as it is used by many other modules
    veafSecurity.password_L9["6ade6629f9219d87a011e7b8fbf8ef9584f2786d"] = true -- set the L9 password (the lowest possible security)
    veaf.loggers.get(veaf.Id):info("Loading configuration")
    veaf.loggers.get(veaf.Id):info("init - veafSecurity")
    veafSecurity.initialize()

    -- force security in order to test it when dynamic loading is in place (change to TRUE)
    if (false) then
        veaf.SecurityDisabled = false
        veafSecurity.authenticated = false
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CARRIER OPERATIONS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafCarrierOperations then
    veaf.loggers.get(veaf.Id):info("init - veafCarrierOperations")
    veafCarrierOperations.initialize(true)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CTLD
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if ctld then
    veaf.loggers.get(veaf.Id):info("init - ctld")
    function configurationCallback()
        veaf.loggers.get(veaf.Id):info("configuring CTLD for %s", veaf.config.MISSION_NAME)
      end
    ctld.initialize(configurationCallback)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CSAR
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if csar then
    veaf.loggers.get(veaf.Id):info("init - csar")
    function configurationCallback()
        veaf.loggers.get(veaf.Id):info("configuring CSAR for %s", veaf.config.MISSION_NAME)
    end
    csar.initialize(configurationCallback)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the remote interface
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRemote then
    veaf.loggers.get(veaf.Id):info("init - veafRemote")
    veafRemote.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize Skynet-IADS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSkynet then
    veaf.loggers.get(veaf.Id):info("init - veafSkynet")
    veafSkynet.initialize(
        false, --includeRedInRadio=true
        false, --debugRed
        false, --includeBlueInRadio
        false --debugBlue
    )
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the interpreter
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafInterpreter then
    -- the INTERPRETER module is mandatory as it is used by many other modules
    veaf.loggers.get(veaf.Id):info("init - veafInterpreter")
    veafInterpreter.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize veafSanctuary
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSanctuary then
    veaf.loggers.get(veaf.Id):info("init - veafSanctuary")
    veafSanctuary.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize Hound Elint
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafHoundElint and false then -- don't use Hound Elint
    veaf.loggers.get(veaf.Id):info("init - veafHoundElint")
    veafHoundElint.initialize(
        "ELINT", -- prefix
        { -- red
            --global parameters
            markers = true, --enables or disables markers on the map for detected radars
            disableBDA = false, --disables notifications that a radar has dropped off scope
            platformPositionErrors = true, --enables INS drift / GPS errors for ELINT platforms
            NATOmessages = false, --provides positions relative to the bullseye
            NATO_SectorCallsigns = false, --uses a different pool for sector callsigns
            ATISinterval = 180, --refresh delay of the ATIS, beware that this has an impact on performance
            preBriefedContacts = {
                --"Stuff",
                --"Thing",
            }, --contains the name of units placed in the ME which will be designated as pre-briefed (exact location) and who's position will be indicated exactly by Hound until the unit moved 100m away
            debug = false, --set this to true to make sure your configuration is correct and working as intended
        },
        { -- blue
            sectors = {
                --Global sector, mandatory inclusion if you want a global ATIS/controller etc., encompasses the whole map so it'll be very crowded in terms of comms
                [veafHoundElint.globalSectorName] = {
                    callsign = "Global Sector", --defines a specific callsign for the sector which will be used by the ATIS etc., if absent or nil Hound will assign it a callsign automatically, NATO format of regular Hound format. If true, callsign will be equal to the sector name
                    atis = {
                        freq = 282.175,
                        speed = 1,
                        --additional params
                        reportEWR = false --enables or disables the ATIS announcing EWRs as threats instead of it giving a very short message for such radars
                    },
                    controller = {
                        freq = 282.225,
                        --additional params
                        voiceEnabled = true --enables or disables voice for the controller which will otherwise be text only
                    },
                    notifier = {
                        freq = 282.2,
                        --additional params
                    },
                    disableAlerts = false, --disables alerts on the ATIS/Controller when a new radar is detected or destroyed
                    transmitterUnit = nil, --use the Unit/Pilot name to set who the transmitter is for the ATIS etc. This can be a static, and aircraft or a vehicule/ship
                    disableTTS = false,
                },
                --sector named "Latakia", will be geofenced to the mission editor polygon drawing (free or rect.) called "Latakia" (case sensitive)
                ["Latakia"] = {
                    callsign = true, --defines a specific callsign for the sector which will be used by the ATIS etc., if absent or nil Hound will assign it a callsign automatically, NATO format of regular Hound format. If true, callsign will be equal to the sector name
                    atis = {
                        freq = 281.075,
                        speed = 1,
                        --additional params
                        reportEWR = false --enables or disables the ATIS announcing EWRs as threats instead of it giving a very short message for such radars
                    },
                    controller = {
                        freq = 281.125,
                        --additional params
                        voiceEnabled = true --enables or disables voice for the controller which will otherwise be text only
                    },
                    notifier = {
                        freq = 281.1,
                        --additional params
                    },
                    disableAlerts = false, --disables alerts on the ATIS/Controller when a new radar is detected or destroyed
                    transmitterUnit = nil, --use the Unit/Pilot name to set who the transmitter is for the ATIS etc. This can be a static, and aircraft or a vehicule/ship
                    disableTTS = false,
                },
            },
            --global parameters
            markers = true, --enables or disables markers on the map for detected radars
            disableBDA = false, --disables notifications that a radar has dropped off scope
            platformPositionErrors = true, --enables INS drift / GPS errors for ELINT platforms
            NATOmessages= true, --provides positions relative to the bullseye
            NATO_SectorCallsigns = true, --uses a different pool for sector callsigns
            ATISinterval = 180, --refresh delay of the ATIS, beware that this has an impact on performance
            preBriefedContacts = {
                --"Stuff",
                --"Thing",
            }, --contains the name of units or groups placed in the ME which will be designated as pre-briefed (exact location) and who's position will be indicated exactly by Hound until the unit moved 100m away. If multiple radars are within a specified group, they'll all be added as pre-briefed targets
            debug = false, --set this to true to make sure your configuration is correct and working as intended
        }
        --this is the entire range of possible entries for the notifier, the controller and the ATIS settings
        -- args = {
        --     freq = 250.000,
        --     modulation = "AM",
        --     volume = "1.0",
        --     speed = <speed> -- number default is 0/1 for controller/atis. range is -10 to +10 on windows TTS. for google it's 0.25 to 4.0
        --     gender = "male"|"female",
        --     culture = "en-US"|"en-UK" -- (any installed on your system)
        --     isGoogle = true/false -- use google TTS (requires additional STTS config)
        --     voiceEnabled = true/false (for the controller only) -- to set if the controllers uses text or TTS
        --     reportEWR = true/false (for ATIS only) -- set to tell the ATIS to report EWRs as threats
        --     enableBDA = true/false (true by default) -- set to enable BDA/emissions drop on radars
        -- }
    )

    -- automatically start the two ELINT missions
    veafCombatMission.ActivateMission("ELINT-Mission-East", true)
    veafCombatMission.ActivateMission("ELINT-Mission-West", true)
end

-- Silence ATC on all the airdromes
veaf.silenceAtcOnAllAirbases()

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission S001 - Défense de Wujha Al Hajar - https://github.com/VEAF/VEAF-Open-Training-Mission-Syria/wiki/Mission-S001
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s001-1")
        :setDescription("Mission S001 - 1 - before mission start")
        :setBatchAliases({
            "-armor#u36SYC4652696450, side blue, radius 10",
            "-point#u36SYC4652696450 C001-Wujha",
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s001-2")
        :setDescription("Mission S001 - 2 - before takeoff")
        :setBatchAliases({
            "-convoy#U36SYC5520894925, side red, defense 3, armor 3, spacing 0.5, dest C001-Wujha",
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s001-3")
        :setDescription("Mission S001 - 3 - optional (more defenses)")
        :setBatchAliases({
            "-sa8#U36SYC5015196779, side red, radius 0",
            "-sa15#U36SYC5019896649, side red, radius 0",            
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission S002 - Attaque de l'usine de SCUD - https://github.com/VEAF/VEAF-Open-Training-Mission-Syria/wiki/Mission-S002
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s002-1")
        :setDescription("Mission S002 - 1 - before mission start")
        :setBatchAliases({
            "-zonestart CombatZone_SCUD-Factory",
            "-point#U37SCU0477856197 SCUD",
            "-convoy#U37SCU0150289523!120, side red, size 5, defense 4, armor 3, dest SCUD, name TIGER",           
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s002-2")
        :setDescription("Mission S002 - 2 - before takeoff (CAP)")
        :setBatchAliases({
            --"-airstart CAP-Tabqa-Su27-Fox1/Excellent/1, silent",
            "-cap#u37sdv133260 su27-fox1, skill excellent, dist 110, capradius 80, hdg 238",
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s002-3")
        :setDescription("Mission S002 - 3 - optional (more CAP)")
        :setBatchAliases({
            --"-airstart CAP-Tabqa-Mig29S-Fox3/Excellent/2, silent",        
            "-cap#u37sdv133260 Mig29S-fox3, skill excellent, dist 110, capradius 80, hdg 238, multiplier 2",
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission S501 - Escorte / CAS - https://github.com/VEAF/VEAF-Open-Training-Mission-Syria/wiki/Mission-S501
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s501-1")
        :setDescription("Mission S501 - 1 - before mission start")
        :setBatchAliases({

            -- Alliés
            "-point#U37SBT44561200 PALAIS",
            "-infantry#U37SBT44561200, side blue, radius 50",
            
            -- Héliport Qabr as Sitt
            "-infantry#U37SBT5442105271, side red, defense 0, armor 0, multiplier 2",
            
            -- CP1 - infantry
            "-infantry#U37SBT51460900, side red, defense 0, armor 0, multiplier 2, radius 50, spacing 2",
            "-point#U37SBT51460900 W3",
            
            -- CP2 - infantry
            "-infantry#U37SBT50571054, side red, defense 0, armor 0, multiplier 4, radius 50, spacing 2",
            "-point#U37SBT50571054 W4",
            
            -- CP3 - infantry & light armor
            "-infantry#U37SBT47031156, side red, defense 0, armor 2, multiplier 2, radius 50, spacing 2",
            "-point#U37SBT47031156 W5",
            
            -- armor (uniquement si flight CAS disponible)
            "-armor#U37SBT558031, side red, defense 0, radius 50, spacing 3",
            "-armor#U37SBT591012, side red, defense 0, radius 50, spacing 3",
            "-armor#U37SBT446113, side red, defense 2, radius 50, spacing 3",

        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s501-2")
        :setDescription("Mission S501 - 2 - after arrival at DAMAS")
        :setBatchAliases({
            -- Alliés, démarrer le convoi NEPTUNE à destination du PALAIS
            "-transport#U37SBS685995, side blue, armor 1, defense 0, size 4, dest PALAIS",
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s502")
        :setDescription("Mission S502 - Naqoura")
        :setBatchAliases({
            
        -- checkpoints XB94
        "-infantry#U36SXB9608344273, side red, size 5, defense 0, spacing 0.5, armor 1",
        "-infantry#U36SXB9545447899, side red, size 6, defense 1, spacing 0.5, armor 2",

        -- checkpoints XB95
        "-infantry#U36SXB9623854088, side red, size 8, defense 2, spacing 0.5, armor 3",
        "-infantry#U36SXB9658555153, side red, size 8, defense 2, spacing 0.5, armor 3",

        -- checkpoints XB96
        "-armor#U36SXB9732261900, side red, spacing 0.5",
        "-armor#U36SXB9674163486, side red, spacing 0.5",

        -- Contested Heliport Naqoura XB96
        "-armor#U36SXB9886165320, side red, spacing 0.5",

        -- Optional: SEAD mission Naqoura (XB96)
        "-sa6#U36SXB9903665467, side red, spacing 0.5",

        -- Eglantine - Convoi bleu de Haifa vers Naqoura (CAS)
        "-transport#U36SXB9145429587, side blue, defense 1, dest NAQOURA HELIPT, size 3, armor 1, spacing 0.5"
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)

veafShortcuts.AddAlias(
    VeafAlias:new()
        :setName("-s503")
        :setDescription("Mission S503 - Majdal Shams")
        :setBatchAliases({
            
        "-point#N33:15:26E35:45:51 YB58",
        "-point#U36SYB6040388494 ANTENNA",
        "-point#U36SYB5758091493 ANTENNA2",
        "-sa18#N33:16:32E35:48:21",
        "-manpads#N33:18:13E35:47:44, radius 2500",
        "-armor#N33:18:42E35:47:25, dest YB58",
        "-armor#N33:19:53E35:46:04",
        "-transport#N33:19:53E35:46:04, dest YB58"
        })
        :setPassword("4190b6cb3eae1a1affe99114accccc36a9f1be4d") -- briefingsyria21
)
