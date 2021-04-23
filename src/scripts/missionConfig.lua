-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mission configuration file for the VEAF framework
-- see https://github.com/VEAF/VEAF-Mission-Creation-Tools
--
-- This configuration is tailored for the Syria OpenTraining mission
-- see https://github.com/VEAF/VEAF-Open-Training-Mission-Syria
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veaf.config.MISSION_NAME = "OpenTraining_Syria"
veaf.config.MISSION_EXPORT_PATH = nil -- use default folder

-- play the radio beacons (for the public OT mission)
--TODO (Zip)
veafBeacons = true

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize QRA
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veaf then
    VeafQRA.new()
    :setName("QRA_Palmyra")
    :addGroup("QRA_Palmyra")
    :setRadius(30000)
    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    :start()

    VeafQRA.new()
    :setName("QRA_Bassel")
    :addGroup("QRA_Bassel")
    :setRadius(30000)
    :setCoalition(coalition.side.RED)
    :addEnnemyCoalition(coalition.side.BLUE)
    :start()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize all the scripts
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRadio then
    veaf.logInfo("init - veafRadio")
    veafRadio.initialize(true)

    if veafBeacons then
        -- add the beacons
        -- veafRadio.startBeacon("Bienvenue-blue", 15, 120, "251.0,124.0,121.5,30.0", "am,am,am,fm", nil, "bienvenue-veaf-fr.mp3", 1.0, 2)
    end
end
if veafSpawn then
    veaf.logInfo("init - veafSpawn")
    veafSpawn.initialize()
end
if veafGrass then
    veaf.logInfo("init - veafGrass")
    veafGrass.initialize()
end
if veafCasMission then
    veaf.logInfo("init - veafCasMission")
    veafCasMission.initialize()
end
if veafTransportMission then
    veaf.logInfo("init - veafTransportMission")
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
    veaf.logInfo("init - veafShortcuts")
    veafShortcuts.initialize()

    -- you can add all the shortcuts you want here. Shortcuts can be any VEAF command, as entered in a map marker.
    -- here are some examples :

    -- veafShortcuts.AddAlias(
    --     VeafAlias.new()
    --         :setName("-sa11")
    --         :setDescription("SA-11 Gadfly (9K37 Buk) battery")
    --         :setVeafCommand("_spawn group, name sa11")
    --         :setBypassSecurity(true)
    -- )
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- No MOOSE settings menu. Comment out this line if required.
if _SETTINGS then
    _SETTINGS:SetPlayerMenuOff()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure ASSETS
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafAssets then
    veafAssets.logInfo("Loading configuration")
    veafAssets.Assets = {
		-- list the assets in the mission below
		{sort=1, name="A1-Magic", description="Magic (E-2D)", information="U282.20 (15)", linked="A1-Magic-escort"},  
		{sort=2, name="A2-Focus", description="Focus (E-3A)", information="U281.10 (16)", linked="A2-Focus-escort"},  
        
        {sort=3, name="CSG-71 Roosevelt", description="Roosevelt (CVN)", information="Tacan 12X RHR\nICLS 11\nU227 (12)"},  
		{sort=4, name="CSG-74 Stennis", description="Stennis (CVN)", information="Tacan 13X STS\nICLS 13\nU221 (13)"},  
		{sort=5, name="CSG-01 Tarawa", description="Tarawa (LHA)", information="Tacan 14X TAA\nU225 (14)"},  
		
        {sort=6, name="T1-Texaco-N", description="Texaco-N (KC-135 MPRS)", information="Tacan 60Y\nU290.10 (17)\nZone NORD", linked="T1-Texaco-N-escort"},  
		{sort=7, name="T2-Texaco-S", description="Texaco-S (KC-135 MPRS)", information="Tacan 61Y\nU290.30 (18)\nZone SUD", linked="T2-Texaco-S-escort"},  
		{sort=8, name="S1-Shell-N", description="Shell-N (KC-135)", information="Tacan 62Y\nU290.40 (19)\nZone NORD", linked="S1-Shell-N-escort"},  
		{sort=9, name="S2-Shell-S", description="Shell-S (KC-135)", information="Tacan 63Y\nU290.50 (20)\nZone SUD", linked="S2-Shell-S-escort"},  
        
		{sort=10, name="CVN-74 Stennis S3B-Tanker", description="Texaco-7 (S3-B)", information="Tacan 74X\nU290.70\nZone PA"},  
		{sort=11, name="CVN-71 Roosevelt S3B-Tanker", description="Texaco-8 (S3-B)", information="Tacan 71X\nU290.80\nZone PA"},  
        
		{sort=12, name="Overlordsky", description="100 (A-50, RED)", information="U312", linked="Overlordsky-escort"}, 
        {sort=13, name="P1-Petrolsky", description="900 (IL-78M, RED)", information="U267", linked="P1-Petrolsky-escort"},  
    }

    veaf.logInfo("init - veafAssets")
    veafAssets.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure MOVE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafMove then
    veafMove.logInfo("Setting move tanker radio menus")
    -- keeping the veafMove.Tankers table empty will force veafMove.initialize() to browse the units, and find the tankers
    veaf.logInfo("init - veafMove")
    veafMove.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT MISSION
-------------------------------------------------------------------------------------------------------------------------------------------------------------

if veafCombatMission then 
	veafCombatMission.logInfo("Loading configuration")

    veafCombatMission.addCapMission("CAP-DEF-Kuznetsov-Easy", "CAP over Kuznetzov", "Kill the fighters defending the russian fleet.", true, true)
    veafCombatMission.addCapMission("CAP-Aleppo-Mig21-Fox1", "CAP from Aleppo over Hatay", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Aleppo-Mig29S-Fox3", "CAP from Aleppo over Hatay", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Kuznetsov-Su33-Fox1-Medium", "CAP over Kuznetzov", "Kill the fighters defending the russian fleet.", true, true)
    veafCombatMission.addCapMission("CAP-Kuznetsov-Su33-Fox1-Easy", "CAP over Kuznetzov", "Kill the fighters defending the russian fleet.", true, true)
    veafCombatMission.addCapMission("CAP-Tabqa-Su27-Fox1", "CAP from Tabqa over CU05 (Scud factory)", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Tabqa-Mig29S-Fox3", "CAP from Tabqa over CU05 (Scud factory)", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Palmyra-Mig21-Fox1", "CAP from Tabqa over CT44 (Desert camp)", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Palmyra-F14A-Fox3", "CAP from Tabqa over CT44 (Desert camp)", "Kill all the ennemy fighters.", true, true)
    veafCombatMission.addCapMission("CAP-Palmyra-F14B-Fox3", "CAP from Tabqa over CT44 (Desert camp)", "Kill all the ennemy fighters.", true, true)

	veaf.logInfo("init - veafCombatMission")
    veafCombatMission.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure COMBAT ZONE
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafCombatZone then 
	veafCombatZone.logInfo("Loading configuration")

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatZone_desertRangeEasy")
			:setFriendlyName("Training at KhalKhalah Desert RANGE")
			:setBriefing("The KhalKhalah RANGE is located 35 nm east of the KhalKhalah airbase, in the desert")
            :setTraining(true)
	)

    veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatZone_Camp")
			:setFriendlyName("Camp militaire")
			:setBriefing(
[[Nos services de renseignements on localisé un camp Syrien aux coordonnés N33°46’423 E37°19’659 // 37S CT 45146 38323 qui sert de camp d’entrainement aux TALIBAN pour déstabiliser nos défenses par des actions kamikazes. 
Il est impératif de neutraliser ce camp avant que les premiers Djihadistes aient fini leur formation.
Les photos prises par les Mirages F1 de la ER 2/33 montre quelques ZU-23, mais il y a une grande possibilité de présence de MANPADS]])
    )

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatZone_SCUD_Factory")
			:setFriendlyName("combatZone_SCUD_Factory")
			:setBriefing("TBD briefing for combatZone_SCUD_Factory")
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatZone_antakya")
			:setFriendlyName("Antakya Urban Operations")
            :setBriefing("Destroy the road block located on the West of Antakya City\nNeutralize streets patrols.\nNo fly zone on North-East (Manpads)!")
            :setTraining(true)
	)

    veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatZone_rangeKiryatEasy")
			:setFriendlyName("Kiryat RANGE - easy")
			:setBriefing("The Kiryat RANGE (located 7 nm south of Kiryat airbase) is set-up for training with defenseless targets")
            :setTraining(true)
	)

	veafCombatZone.AddZone(
		VeafCombatZone.new()
			:setMissionEditorZoneName("combatZone_rangeKiryatMedium")
			:setFriendlyName("Kiryat RANGE - medium")
            :setBriefing("The Kiryat RANGE (located 7 nm south of Kiryat airbase) is set-up for training with some defense")
            :setTraining(true)
	)


    veaf.logInfo("init - veafCombatZone")
    veafCombatZone.initialize()

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure WW2 settings based on loaded theatre
-------------------------------------------------------------------------------------------------------------------------------------------------------------
local theatre = string.lower(env.mission.theatre)
veafNamedPoints.logInfo(string.format("theatre is %s", theatre))
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

	veafNamedPoints.Points = {
               -- Turkish Airports
            {name="INCIRLIK AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("37.001944", "35.425833"), {atc=true, tower="V129.40, U360.10", tacan="21X", runways={{name="05", hdg=50, ils="109.30"}, {name="23", hdg=230, ils="111.70"}}})},
            {name="ADANA SAKIRPASA INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.981944", "35.280278"), {atc=true, tower="V121.10, U251.00", runways={{name="05", hdg=51, ils="108.70"}, {name="23", hdg=231}}})},
            {name="HATAY AIRPORT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.360278", "36.285000"), {atc=true, tower="V128.50, U250.25", runways={{name="04", hdg=40, ils="108.90"}, {name="22", hdg=220, ils="108.15"}}})},
            {name="GANZIANTEP",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.947057", "37.478579"), {atc=true, tower="V120.10, U250.05", runways={{name="10", hdg=100}, {name="28", hdg=280, ils="109.10"}}})},

            -- Syrian Airports
            {name="MINAKH HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.521944", "37.041111"), {atc=true, tower="V120.60, U250.80", runways={{name="10", hdg=97}, {name="28", hdg=277}}})},
            {name="ALEPPO INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.180556", "37.224167"), {atc=true, tower="V119.10, U250.85", runways={{name="09", hdg=93}, {name="27", hdg=273}}})},
            {name="KUWEIRES AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.186944", "37.583056"), {atc=true, tower="V120.50, U251.10", runways={{name="10", hdg=97}, {name="28", hdg=277}}})},
            {name="JIRAH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("36.097500", "37.940278"), {atc=true, tower="V118.10, U250.30", runways={{name="10", hdg=96}, {name="28", hdg=276}}})},
            {name="TAFTANAZ HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.972222", "36.783056"), {atc=true, tower="V122.80, U251.45", runways={{name="10", hdg=100}, {name="28", hdg=280}}})},
            {name="ABU AL DUHUR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.732778", "37.101667"), {atc=true, tower="V122.20, U250.45", runways={{name="09", hdg=89}, {name="27", hdg=269}}})},
            {name="TABQA AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.754444", "38.566667"), {atc=true, tower="V118.50, U251.40", runways={{name="09", hdg=88}, {name="27", hdg=268}}})}, 
            {name="BASSEL AL ASSAD (KHMEIMIM)", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.400833", "35.948611"), {atc=true, tower="V118.10, U250.55", runways={{name="17R", hdg=174, ils="109.10"}, {name="17L", hdg=174}, {name="35R", hdg=354}, {name="35L", hdg=354}}})}, 
            {name="HAMA AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("35.118056", "36.711111"), {atc=true, tower="V118.05, U250.20", runways={{name="09", hdg=96}, {name="27", hdg=276}}})},
            {name="AL QUSAYR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.570833", "36.571944"),  {atc=true, tower="V119.20, U251.55", runways={{name="10", hdg=98}, {name="28", hdg=278}}})}, 
            {name="PALYMYRA AIRPORT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.557222", "38.316667"), {atc=true, tower="V121.90, U250.90", runways={{name="08", hdg=80}, {name="26", hdg=260}}})}, 
            {name="AN NASIRIYAH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.918889", "36.866389"), {atc=true, tower="V122.30, U251.65", runways={{name="04", hdg=41}, {name="22", hdg=221}}})},
            {name="AL DUMAYR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.609444", "36.748889"), {atc=true, tower="V120.30, U251.95", runways={{name="06", hdg=62}, {name="24", hdg=242}}})}, 
            {name="MEZZEH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.477500", "36.223333"), {atc=true, tower="V120.70, U250.75", runways={{name="06", hdg=57}, {name="24", hdg=237}}})}, 
            {name="MARJ AS SULTAN NTH HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.500278", "36.466944"), {atc=true, tower="V122.70, U250.60", runways={{name="08", hdg=80}, {name="26", hdg=260}}})}, 
            {name="MARJ AS SULTAN STH HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.486944", "36.475278"), {atc=true, tower="V122.90, U251.90", runways={{name="09", hdg=90}, {name="27", hdg=270}}})}, 
            {name="QABR AS SITT HELIPT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.458611", "36.357500"), {atc=true, tower="V122.60, U250.95", runways={{name="05", hdg=50}, {name="23", hdg=230}}})},
            {name="DAMASCUS INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.415000", "36.519444"), {atc=true, tower="V118.50, U251.85", runways={{name="05R", hdg=46}, {name="05L", hdg=46}, {name="23R", hdg=226, ils="109.90"}, {name="23L", hdg=226}}})},
            {name="MARJ RUHAYYIL AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.286389", "36.457222"), {atc=true, tower="V120.80, U250.65", runways={{name="06", hdg=59}, {name="24", hdg=239}}})},
            {name="KHALKHALAH AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.077222", "36.558056"), {atc=true, tower="V122.50, U250.35", runways={{name="07", hdg=72}, {name="15", hdg=147}, {name="25", hdg=252}, {name="33", hdg=327}}})},
            {name="SAYQUAL AB",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.679816", "37.218204"), {atc=true, tower="V120.40, U251.30", runways={{name="08", hdg=80}, {name="26", hdg=260}}})},
            {name="SHAYRAT AB",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.494819", "36.903173"), {atc=true, tower="V120.20, U251.35", runways={{name="11", hdg=110}, {name="29", hdg=290}}})},
            {name="TIYAS AB",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.522645", "37.627498"), {atc=true, tower="V120.50, U251.50", runways={{name="09", hdg=90}, {name="27", hdg=270}}})},
        
            -- Lebanese Airports
            {name="RENE MOUAWAD AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.589444", "36.011389"), {atc=true, tower="V121.00, U251.20", runways={{name="06", hdg=59}, {name="24", hdg=239}}})},
            {name="HAJAR AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("34.283333", "35.680278"),  {atc=true, tower="V121.50, U251.60", runways={{name="02", hdg=25}, {name="20", hdg=205}}})},
            {name="BEIRUT INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.821111", "35.488333"), {atc=true, tower="V118.90, U251.80", runways={{name="03", hdg=30, ils="110.70"}, {name="16", hdg=164, ils="110.10"}, {name="17", hdg=175, ils="109.50"}, {name="21", hdg=210}, {name="34", hdg=344}, {name="35", hdg=355}}})},
            {name="RAYAK AB", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.852222", "35.990278"),  {atc=true, tower="V124.40, U251.15", runways={{name="04", hdg=42}, {name="22", hdg=222}}})},
            {name="NAQOURA HELIPT",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.107877", "35.127728"), {atc=true, tower="V122.00, U251.70"})},
    
            -- Israeli Airports
            {name="KIRYAT SHMONA AIRPORT", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("33.216667", "35.596667"), {atc=true, tower="V118.40, U250.50", runways={{name="03", hdg=34}, {name="21", hdg=214}}})},
            {name="HAIFA INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.809167", "35.043056"), {atc=true, tower="V127.80, U250.15", runways={{name="16", hdg=158}, {name="34", hdg=338}}})},
            {name="RAMAT DAVID INTL", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.665000", "35.179444"), {atc=true, tower="V118.60, U251.05", runways={{name="09", hdg=85}, {name="11", hdg=107}, {name="15", hdg=143}, {name="27", hdg=265}, {name="29", hdg=287}, {name="33", hdg=323}}})}, 
            {name="MEGIDDO AIRFIELD", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.597222", "35.228611"), {atc=true, tower="V119.90, U250.70", runways={{name="09", hdg=89}, {name="27", hdg=269}}})}, 
            {name="EYN SHEMER AIRFIELD", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.440556", "35.007500"), {atc=true, tower="V123.40, U250.00", runways={{name="09", hdg=96}, {name="27", hdg=276}}})}, 
    
            -- Jordan Airports
            {name="KING HUSSEIN AIR COLLEGE", point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.356389", "36.259167"), {atc=true, tower="V118.30, U250.40", runways={{name="13", hdg=128}, {name="31", hdg=308}}})},
            {name="H4",point=veafNamedPoints.addDataToPoint(coord.LLtoLO("32.539122", "38.195841"), {atc=true, tower="V122.60, U250.10", runways={{name="10", hdg=100}, {name="28", hdg=280}}})}, 

              -- points of interest
            {name="RANGE KhalKhalah",point=coord.LLtoLO("33.036180", "37.196608")},
	}

    veafNamedPoints.logInfo("Loading configuration")

    veafNamedPoints.logInfo("init - veafNamedPoints")

    veafNamedPoints.initialize()
    if theatre == "syria" then
        veafNamedPoints.addAllSyriaCities()
    elseif theatre == "caucasus" then
        veafNamedPoints.addAllCaucasusCities()
    elseif theatre == "persiangulf" then
        veafNamedPoints.addAllPersianGulfCities()
    elseif theatre == "thechannel" then
        veafNamedPoints.addAllTheChannelCities()
    else
        veafNamedPoints.logWarning(string.format("theatre %s is not yet supported by veafNamedPoints", theatre))
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure SECURITY
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSecurity then
    veafSecurity.password_L9["6ade6629f9219d87a011e7b8fbf8ef9584f2786d"] = true -- set the L9 password (the lowest possible security)
    veafSecurity.logInfo("Loading configuration")
    veaf.logInfo("init - veafSecurity")
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
    veaf.logInfo("init - veafCarrierOperations")
    -- the carriers will be automatically found
    veafCarrierOperations.initialize(true)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- configure CTLD 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if ctld then
    ctld.staticBugWorkaround = false --  DCS had a bug where destroying statics would cause a crash. If this happens again, set this to TRUE

    ctld.disableAllSmoke = false -- if true, all smoke is diabled at pickup and drop off zones regardless of settings below. Leave false to respect settings below

    ctld.hoverPickup = true --  if set to false you can load crates with the F10 menu instead of hovering... Only if not using real crates!

    ctld.enableCrates = true -- if false, Helis will not be able to spawn or unpack crates so will be normal CTTS
    ctld.slingLoad = false -- if false, crates can be used WITHOUT slingloading, by hovering above the crate, simulating slingloading but not the weight...
    -- There are some bug with Sling-loading that can cause crashes, if these occur set slingLoad to false
    -- to use the other method.
    -- Set staticBugFix  to FALSE if use set ctld.slingLoad to TRUE

    ctld.enableSmokeDrop = true -- if false, helis and c-130 will not be able to drop smoke

    ctld.maxExtractDistance = 125 -- max distance from vehicle to troops to allow a group extraction
    ctld.maximumDistanceLogistic = 500 -- max distance from vehicle to logistics to allow a loading or spawning operation
    ctld.maximumSearchDistance = 8000 -- max distance for troops to search for enemy
    ctld.maximumMoveDistance = 2000 -- max distance for troops to move from drop point if no enemy is nearby

    ctld.minimumDeployDistance = 1000 -- minimum distance from a friendly pickup zone where you can deploy a crate

    ctld.numberOfTroops = 10 -- default number of troops to load on a transport heli or C-130 
                                -- also works as maximum size of group that'll fit into a helicopter unless overridden
    ctld.enableFastRopeInsertion = true -- allows you to drop troops by fast rope
    ctld.fastRopeMaximumHeight = 18.28 -- in meters which is 60 ft max fast rope (not rappell) safe height

    ctld.vehiclesForTransportRED = { "BRDM-2", "BTR_D" } -- vehicles to load onto Il-76 - Alternatives {"Strela-1 9P31","BMP-1"}
    ctld.vehiclesForTransportBLUE = { "M1045 HMMWV TOW", "M1043 HMMWV Armament" } -- vehicles to load onto c130 - Alternatives {"M1128 Stryker MGS","M1097 Avenger"}

    ctld.aaLaunchers = 3 -- controls how many launchers to add to the kub/buk when its spawned.
    ctld.hawkLaunchers = 5 -- controls how many launchers to add to the hawk when its spawned.

    ctld.spawnRPGWithCoalition = true --spawns a friendly RPG unit with Coalition forces
    ctld.spawnStinger = false -- spawns a stinger / igla soldier with a group of 6 or more soldiers!

    ctld.enabledFOBBuilding = true -- if true, you can load a crate INTO a C-130 than when unpacked creates a Forward Operating Base (FOB) which is a new place to spawn (crates) and carry crates from
    -- In future i'd like it to be a FARP but so far that seems impossible...
    -- You can also enable troop Pickup at FOBS

    ctld.cratesRequiredForFOB = 1 -- The amount of crates required to build a FOB. Once built, helis can spawn crates at this outpost to be carried and deployed in another area.
    -- The large crates can only be loaded and dropped by large aircraft, like the C-130 and listed in ctld.vehicleTransportEnabled
    -- Small FOB crates can be moved by helicopter. The FOB will require ctld.cratesRequiredForFOB larges crates and small crates are 1/3 of a large fob crate
    -- To build the FOB entirely out of small crates you will need ctld.cratesRequiredForFOB * 3

    ctld.troopPickupAtFOB = true -- if true, troops can also be picked up at a created FOB

    ctld.buildTimeFOB = 120 --time in seconds for the FOB to be built

    ctld.crateWaitTime = 120 -- time in seconds to wait before you can spawn another crate

    ctld.forceCrateToBeMoved = true -- a crate must be picked up at least once and moved before it can be unpacked. Helps to reduce crate spam

    ctld.radioSound = "beacon.ogg" -- the name of the sound file to use for the FOB radio beacons. If this isnt added to the mission BEACONS WONT WORK!
    ctld.radioSoundFC3 = "beaconsilent.ogg" -- name of the second silent radio file, used so FC3 aircraft dont hear ALL the beacon noises... :)

    ctld.deployedBeaconBattery = 30 -- the battery on deployed beacons will last for this number minutes before needing to be re-deployed

    ctld.enabledRadioBeaconDrop = true -- if its set to false then beacons cannot be dropped by units

    ctld.allowRandomAiTeamPickups = false -- Allows the AI to randomize the loading of infantry teams (specified below) at pickup zones

    ctld.allowAiTeamPickups = false -- Allows the AI to automatically load infantry teams (specified below) at pickup zones

    -- Simulated Sling load configuration

    ctld.minimumHoverHeight = 7.5 -- Lowest allowable height for crate hover
    ctld.maximumHoverHeight = 12.0 -- Highest allowable height for crate hover
    ctld.maxDistanceFromCrate = 5.5 -- Maximum distance from from crate for hover
    ctld.hoverTime = 10 -- Time to hold hover above a crate for loading in seconds

    -- end of Simulated Sling load configuration

    -- AA SYSTEM CONFIG --
    -- Sets a limit on the number of active AA systems that can be built for RED.
    -- A system is counted as Active if its fully functional and has all parts
    -- If a system is partially destroyed, it no longer counts towards the total
    -- When this limit is hit, a player will still be able to get crates for an AA system, just unable
    -- to unpack them

    ctld.AASystemLimitRED = 20 -- Red side limit

    ctld.AASystemLimitBLUE = 20 -- Blue side limit

    --END AA SYSTEM CONFIG --

    -- ***************** JTAC CONFIGURATION *****************

    ctld.JTAC_LIMIT_RED = 10 -- max number of JTAC Crates for the RED Side
    ctld.JTAC_LIMIT_BLUE = 10 -- max number of JTAC Crates for the BLUE Side

    ctld.JTAC_dropEnabled = true -- allow JTAC Crate spawn from F10 menu

    ctld.JTAC_maxDistance = 10000 -- How far a JTAC can "see" in meters (with Line of Sight)

    ctld.JTAC_smokeOn_RED = true -- enables marking of target with smoke for RED forces
    ctld.JTAC_smokeOn_BLUE = true -- enables marking of target with smoke for BLUE forces

    ctld.JTAC_smokeColour_RED = 4 -- RED side smoke colour -- Green = 0 , Red = 1, White = 2, Orange = 3, Blue = 4
    ctld.JTAC_smokeColour_BLUE = 1 -- BLUE side smoke colour -- Green = 0 , Red = 1, White = 2, Orange = 3, Blue = 4

    ctld.JTAC_jtacStatusF10 = true -- enables F10 JTAC Status menu

    ctld.JTAC_location = true -- shows location of target in JTAC message

    ctld.JTAC_lock = "all" -- "vehicle" OR "troop" OR "all" forces JTAC to only lock vehicles or troops or all ground units

    -- ***************** Pickup, dropoff and waypoint zones *****************

    -- Available colors (anything else like "none" disables smoke): "green", "red", "white", "orange", "blue", "none",

    -- Use any of the predefined names or set your own ones

    -- You can add number as a third option to limit the number of soldier or vehicle groups that can be loaded from a zone.
    -- Dropping back a group at a limited zone will add one more to the limit

    -- If a zone isn't ACTIVE then you can't pickup from that zone until the zone is activated by ctld.activatePickupZone
    -- using the Mission editor

    -- You can pickup from a SHIP by adding the SHIP UNIT NAME instead of a zone name

    -- Side - Controls which side can load/unload troops at the zone

    -- Flag Number - Optional last field. If set the current number of groups remaining can be obtained from the flag value

    --pickupZones = { "Zone name or Ship Unit Name", "smoke color", "limit (-1 unlimited)", "ACTIVE (yes/no)", "side (0 = Both sides / 1 = Red / 2 = Blue )", flag number (optional) }
    ctld.pickupZones = {
        { "pickzone1", "none", -1, "yes", 0 },
        { "pickzone2", "none", -1, "yes", 0 },
        { "pickzone3", "none", -1, "yes", 0 },
        { "pickzone4", "none", -1, "yes", 0 },
        { "pickzone5", "none", -1, "yes", 0 },
        { "pickzone6", "none", -1, "yes", 0 },
        { "pickzone7", "none", -1, "yes", 0 },
        { "pickzone8", "none", -1, "yes", 0 },
        { "pickzone9", "none", -1, "yes", 0 }, 
        { "pickzone10", "none", -1, "yes", 0 },
        { "pickzone11", "none", -1, "yes", 0 }, 
        { "pickzone12", "none", -1, "yes", 0 }, 
        { "pickzone13", "none", -1, "yes", 0 }, 
        { "pickzone14", "none", -1, "yes", 0 },
        { "pickzone15", "none", -1, "yes", 0 },
        { "pickzone16", "none", -1, "yes", 0 },
        { "pickzone17", "none", -1, "yes", 0 },
        { "pickzone18", "none", -1, "yes", 0 },
        { "pickzone19", "none", 5, "yes", 0 },
        { "pickzone20", "none", 10, "yes", 0, 1000 }, -- optional extra flag number to store the current number of groups available in

        { "CVN-74 Stennis", "none", 10, "yes", 0, 1001 }, -- instead of a Zone Name you can also use the UNIT NAME of a ship
        { "LHA-1 Tarawa", "none", 10, "yes", 0, 1002 }, -- instead of a Zone Name you can also use the UNIT NAME of a ship
    }

    -- dropOffZones = {"name","smoke colour",0,side 1 = Red or 2 = Blue or 0 = Both sides}
    ctld.dropOffZones = {
        { "dropzone1", "green", 2 },
        { "dropzone2", "blue", 2 },
        { "dropzone3", "orange", 2 },
        { "dropzone4", "none", 2 },
        { "dropzone5", "none", 1 },
        { "dropzone6", "none", 1 },
        { "dropzone7", "none", 1 },
        { "dropzone8", "none", 1 },
        { "dropzone9", "none", 1 },
        { "dropzone10", "none", 1 },
    }


    --wpZones = { "Zone name", "smoke color",  "ACTIVE (yes/no)", "side (0 = Both sides / 1 = Red / 2 = Blue )", }
    ctld.wpZones = {
        { "wpzone1", "green","yes", 2 },
        { "wpzone2", "blue","yes", 2 },
        { "wpzone3", "orange","yes", 2 },
        { "wpzone4", "none","yes", 2 },
        { "wpzone5", "none","yes", 2 },
        { "wpzone6", "none","yes", 1 },
        { "wpzone7", "none","yes", 1 },
        { "wpzone8", "none","yes", 1 },
        { "wpzone9", "none","yes", 1 },
        { "wpzone10", "none","no", 0 }, -- Both sides as its set to 0
    }


    -- ******************** Transports names **********************

    -- Use any of the predefined names or set your own ones
    ctld.transportPilotNames = {
    }

    for i = 1, 24 do
        table.insert(ctld.transportPilotNames, string.format("yak #%03d",i))
    end

    for i = 1, 10 do
        table.insert(ctld.transportPilotNames, string.format("transport #%03d",i))
    end

    for i = 1, 79 do
        table.insert(ctld.transportPilotNames, string.format("helicargo #%03d",i))
    end

    -- *************** Optional Extractable GROUPS *****************

    -- Use any of the predefined names or set your own ones

    ctld.extractableGroups = {
        "extract #001",
        "extract #002",
        "extract #003",
        "extract #004",
        "extract #005",
        "extract #006",
        "extract #007",
        "extract #008",
        "extract #009",
        "extract #010",
        "extract #011",
        "extract #012",
        "extract #013",
        "extract #014",
        "extract #015",
        "extract #016",
        "extract #017",
        "extract #018",
        "extract #019",
        "extract #020",
        "extract #021",
        "extract #022",
        "extract #023",
        "extract #024",
        "extract #025",
    }

    -- ************** Logistics UNITS FOR CRATE SPAWNING ******************

    -- Use any of the predefined names or set your own ones
    -- When a logistic unit is destroyed, you will no longer be able to spawn crates

    ctld.logisticUnits = {
        "logistic #001",
        "logistic #002",
        "logistic #003",
        "logistic #004",
        "logistic #005",
        "logistic #006",
        "logistic #007",
        "logistic #008",
        "logistic #009",
        "logistic #010",
        "logistic #011",
        "logistic #012",
        "logistic #013",
        "logistic #014",
        "logistic #015",
        "logistic #016",
        "logistic #017",
        "logistic #018",
        "logistic #019",
        "logistic #020",
    }

    -- ************** UNITS ABLE TO TRANSPORT VEHICLES ******************
    -- Add the model name of the unit that you want to be able to transport and deploy vehicles
    -- units db has all the names or you can extract a mission.miz file by making it a zip and looking
    -- in the contained mission file
    ctld.vehicleTransportEnabled = {
        "76MD", -- the il-76 mod doesnt use a normal - sign so il-76md wont match... !!!! GRR
        "C-130",
    }


    -- ************** Maximum Units SETUP for UNITS ******************

    -- Put the name of the Unit you want to limit group sizes too
    -- i.e
    -- ["UH-1H"] = 10,
    --
    -- Will limit UH1 to only transport groups with a size 10 or less
    -- Make sure the unit name is exactly right or it wont work

    ctld.unitLoadLimits = {
        ["Mi-8MT"] = 24

        -- Remove the -- below to turn on options
        -- ["SA342Mistral"] = 4,
        -- ["SA342L"] = 4,
        -- ["SA342M"] = 4,

    }


    -- ************** Allowable actions for UNIT TYPES ******************

    -- Put the name of the Unit you want to limit actions for
    -- NOTE - the unit must've been listed in the transportPilotNames list above
    -- This can be used in conjunction with the options above for group sizes
    -- By default you can load both crates and troops unless overriden below
    -- i.e
    -- ["UH-1H"] = {crates=true, troops=false},
    --
    -- Will limit UH1 to only transport CRATES but NOT TROOPS
    --
    -- ["SA342Mistral"] = {crates=fales, troops=true},
    -- Will allow Mistral Gazelle to only transport crates, not troops

    ctld.unitActions = {
        ["Yak-52"] = {crates=false, troops=true}

        -- Remove the -- below to turn on options
        -- ["SA342Mistral"] = {crates=true, troops=true},
        -- ["SA342L"] = {crates=false, troops=true},
        -- ["SA342M"] = {crates=false, troops=true},

    }

    -- ************** INFANTRY GROUPS FOR PICKUP ******************
    -- Unit Types
    -- inf is normal infantry
    -- mg is M249
    -- at is RPG-16
    -- aa is Stinger or Igla
    -- mortar is a 2B11 mortar unit
    -- You must add a name to the group for it to work
    -- You can also add an optional coalition side to limit the group to one side
    -- for the side - 2 is BLUE and 1 is RED
    ctld.loadableGroups = {
        {name = "Standard Group", inf = 6, mg = 2, at = 2 }, -- will make a loadable group with 5 infantry, 2 MGs and 2 anti-tank for both coalitions
        {name = "Anti Air", inf = 2, aa = 3  },
        {name = "Anti Tank", inf = 2, at = 6  },
        {name = "Mortar Squad", mortar = 6 },
        {name = "Mortar Squad x 4", mortar = 24},
        -- {name = "Mortar Squad Red", inf = 2, mortar = 5, side =1 }, --would make a group loadable by RED only
    }

    -- ************** SPAWNABLE CRATES ******************
    -- Weights must be unique as we use the weight to change the cargo to the correct unit
    -- when we unpack
    --
    ctld.spawnableCrates = {
        -- name of the sub menu on F10 for spawning crates
        ["Ground Forces"] = {
            --crates you can spawn
            -- weight in KG
            -- Desc is the description on the F10 MENU
            -- unit is the model name of the unit to spawn
            -- cratesRequired - if set requires that many crates of the same type within 100m of each other in order build the unit
            -- side is optional but 2 is BLUE and 1 is RED
            -- dont use that option with the HAWK Crates
            { weight = 500, desc = "HMMWV - TOW", unit = "M1045 HMMWV TOW", side = 2 },
            { weight = 505, desc = "HMMWV - MG", unit = "M1043 HMMWV Armament", side = 2 },

            { weight = 510, desc = "BTR-D", unit = "BTR_D", side = 1 },
            { weight = 515, desc = "BRDM-2", unit = "BRDM-2", side = 1 },

            { weight = 520, desc = "HMMWV - JTAC", unit = "Hummer", side = 2, }, -- used as jtac and unarmed, not on the crate list if JTAC is disabled
            { weight = 525, desc = "SKP-11 - JTAC", unit = "SKP-11", side = 1, }, -- used as jtac and unarmed, not on the crate list if JTAC is disabled

            { weight = 100, desc = "2B11 Mortar", unit = "2B11 mortar" },

            { weight = 250, desc = "SPH 2S19 Msta", unit = "SAU Msta", side = 1, cratesRequired = 3 },
            { weight = 255, desc = "M-109", unit = "M-109", side = 2, cratesRequired = 3 },

            { weight = 252, desc = "Ural-375 Ammo Truck", unit = "Ural-375", side = 1, cratesRequired = 2 },
            { weight = 253, desc = "M-818 Ammo Truck", unit = "M 818", side = 2, cratesRequired = 2 },

            { weight = 800, desc = "FOB Crate - Small", unit = "FOB-SMALL" }, -- Builds a FOB! - requires 3 * ctld.cratesRequiredForFOB
        },
        ["AA Crates"] = {
            { weight = 50, desc = "Stinger", unit = "Stinger manpad", side = 2 },
            { weight = 55, desc = "Igla", unit = "SA-18 Igla manpad", side = 1 },

            -- HAWK System
            { weight = 540, desc = "HAWK Launcher", unit = "Hawk ln", side = 2},
            { weight = 545, desc = "HAWK Search Radar", unit = "Hawk sr", side = 2 },
            { weight = 550, desc = "HAWK Track Radar", unit = "Hawk tr", side = 2 },
            { weight = 551, desc = "HAWK PCP", unit = "Hawk pcp" , side = 2 }, -- Remove this if on 1.2
            { weight = 552, desc = "HAWK Repair", unit = "HAWK Repair" , side = 2 },
            -- End of HAWK

            -- KUB SYSTEM
            { weight = 560, desc = "KUB Launcher", unit = "Kub 2P25 ln", side = 1},
            { weight = 565, desc = "KUB Radar", unit = "Kub 1S91 str", side = 1 },
            { weight = 570, desc = "KUB Repair", unit = "KUB Repair", side = 1},
            -- End of KUB

            -- BUK System
            --        { weight = 575, desc = "BUK Launcher", unit = "SA-11 Buk LN 9A310M1"},
            --        { weight = 580, desc = "BUK Search Radar", unit = "SA-11 Buk SR 9S18M1"},
            --        { weight = 585, desc = "BUK CC Radar", unit = "SA-11 Buk CC 9S470M1"},
            --        { weight = 590, desc = "BUK Repair", unit = "BUK Repair"},
            -- END of BUK

            { weight = 595, desc = "Early Warning Radar", unit = "1L13 EWR", side = 1 }, -- cant be used by BLUE coalition

            { weight = 405, desc = "Strela-1 9P31", unit = "Strela-1 9P31", side = 1, cratesRequired = 3 },
            { weight = 400, desc = "M1097 Avenger", unit = "M1097 Avenger", side = 2, cratesRequired = 3 },

        },
    }

    -- if the unit is on this list, it will be made into a JTAC when deployed
    ctld.jtacUnitTypes = {
        "SKP", "Hummer" -- there are some wierd encoding issues so if you write SKP-11 it wont match as the - sign is encoded differently...
    }

    -- automatically add all the human-manned transport helicopters to ctld.transportPilotNames
    veafTransportMission.initializeAllHelosInCTLD()

    -- automatically add all the carriers and FARPs to ctld.logisticUnits
    veafTransportMission.initializeAllLogisticInCTLD()
    
    veaf.logInfo("init - ctld")
    ctld.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the remote interface
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafRemote then
    veaf.logInfo("init - veafRemote")
    veafRemote.initialize()
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize the interpreter
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafInterpreter then
    veaf.logInfo("init - veafInterpreter")
    veafInterpreter.initialize()
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize Skynet-IADS
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSkynet then
    veaf.logInfo("init - veafSkynet")
    veafSkynet.initialize(
        false, --includeRedInRadio=true
        false, --debugRed
        false, --includeBlueInRadio
        false --debugBlue
    )
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialize veafSanctuary
-------------------------------------------------------------------------------------------------------------------------------------------------------------
if veafSanctuary then
    veafSanctuary.initialize()
end
