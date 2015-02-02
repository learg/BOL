local version = "1.1304"
local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/KeVuong/BOL/master/Common/SOW.lua".."?rand="..math.random(1,1000)
local UPDATE_FILE_PATH = LIB_PATH.."SOW.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

function _AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>SOW:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTOUPDATE then
	local ServerData = GetWebResult(UPDATE_HOST, "/KeVuong/BOL/master/version/SOW.version")
	if ServerData then
		ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		if ServerVersion then
			if tonumber(version) < ServerVersion then
				_AutoupdaterMsg("New version available"..ServerVersion)
				_AutoupdaterMsg("Updating, please don't press F9")
				DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () _AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
			else
				_AutoupdaterMsg("You have got the latest version ("..ServerVersion..")")
			end
		end
	else
		_AutoupdaterMsg("Error downloading version info")
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--require "Vprediction"
class "SOW"

function SOW:__init(VP)
	
	self.hitboxes = {["Kalistar"]=65, ['Braum'] = 80,['RecItemsCLASSIC'] = 65, ['TeemoMushroom'] = 50.0, ['TestCubeRender'] = 65, ['Xerath'] = 65, ['Kassadin'] = 65, ['Rengar'] = 65, ['Thresh'] = 55.0, ['RecItemsTUTORIAL'] = 65, ['Ziggs'] = 55.0, ['ZyraPassive'] = 20.0, ['ZyraThornPlant'] = 20.0, ['KogMaw'] = 65, ['HeimerTBlue'] = 35.0, ['EliseSpider'] = 65, ['Skarner'] = 80.0, ['ChaosNexus'] = 65, ['Katarina'] = 65, ['Riven'] = 65, ['SightWard'] = 1, ['HeimerTYellow'] = 35.0, ['Ashe'] = 65, ['VisionWard'] = 1, ['TT_NGolem2'] = 80.0, ['ThreshLantern'] = 65, ['RecItemsCLASSICMap10'] = 65, ['RecItemsODIN'] = 65, ['TT_Spiderboss'] = 200.0, ['RecItemsARAM'] = 65, ['OrderNexus'] = 65, ['Soraka'] = 65, ['Jinx'] = 65, ['TestCubeRenderwCollision'] = 65, ['Red_Minion_Wizard'] = 48.0, ['JarvanIV'] = 65, ['Blue_Minion_Wizard'] = 48.0, ['TT_ChaosTurret2'] = 88.4, ['TT_ChaosTurret3'] = 88.4, ['TT_ChaosTurret1'] = 88.4, ['ChaosTurretGiant'] = 88.4, ['Dragon'] = 100.0, ['LuluSnowman'] = 50.0, ['Worm'] = 100.0, ['ChaosTurretWorm'] = 88.4, ['TT_ChaosInhibitor'] = 65, ['ChaosTurretNormal'] = 88.4, ['AncientGolem'] = 100.0, ['ZyraGraspingPlant'] = 20.0, ['HA_AP_OrderTurret3'] = 88.4, ['HA_AP_OrderTurret2'] = 88.4, ['Tryndamere'] = 65, ['OrderTurretNormal2'] = 88.4, ['Singed'] = 65, ['OrderInhibitor'] = 65, ['Diana'] = 65, ['HA_FB_HealthRelic'] = 65, ['TT_OrderInhibitor'] = 65, ['GreatWraith'] = 80.0, ['Yasuo'] = 65, ['OrderTurretDragon'] = 88.4, ['OrderTurretNormal'] = 88.4, ['LizardElder'] = 65.0, ['HA_AP_ChaosTurret'] = 88.4, ['Ahri'] = 65, ['Lulu'] = 65, ['ChaosInhibitor'] = 65, ['HA_AP_ChaosTurret3'] = 88.4, ['HA_AP_ChaosTurret2'] = 88.4, ['ChaosTurretWorm2'] = 88.4, ['TT_OrderTurret1'] = 88.4, ['TT_OrderTurret2'] = 88.4, ['TT_OrderTurret3'] = 88.4, ['LuluFaerie'] = 65, ['HA_AP_OrderTurret'] = 88.4, ['OrderTurretAngel'] = 88.4, ['YellowTrinketUpgrade'] = 1, ['MasterYi'] = 65, ['Lissandra'] = 65, ['ARAMOrderTurretNexus'] = 88.4, ['Draven'] = 65, ['FiddleSticks'] = 65, ['SmallGolem'] = 80.0, ['ARAMOrderTurretFront'] = 88.4, ['ChaosTurretTutorial'] = 88.4, ['NasusUlt'] = 80.0, ['Maokai'] = 80.0, ['Wraith'] = 50.0, ['Wolf'] = 50.0, ['Sivir'] = 65, ['Corki'] = 65, ['Janna'] = 65, ['Nasus'] = 80.0, ['Golem'] = 80.0, ['ARAMChaosTurretFront'] = 88.4, ['ARAMOrderTurretInhib'] = 88.4, ['LeeSin'] = 65, ['HA_AP_ChaosTurretTutorial'] = 88.4, ['GiantWolf'] = 65.0, ['HA_AP_OrderTurretTutorial'] = 88.4, ['YoungLizard'] = 50.0, ['Jax'] = 65, ['LesserWraith'] = 50.0, ['Blitzcrank'] = 80.0, ['brush_D_SR'] = 65, ['brush_E_SR'] = 65, ['brush_F_SR'] = 65, ['brush_C_SR'] = 65, ['brush_A_SR'] = 65, ['brush_B_SR'] = 65, ['ARAMChaosTurretInhib'] = 88.4, ['Shen'] = 65, ['Nocturne'] = 65, ['Sona'] = 65, ['ARAMChaosTurretNexus'] = 88.4, ['YellowTrinket'] = 1, ['OrderTurretTutorial'] = 88.4, ['Caitlyn'] = 65, ['Trundle'] = 65, ['Malphite'] = 80.0, ['Mordekaiser'] = 80.0, ['ZyraSeed'] = 65, ['Vi'] = 50, ['Tutorial_Red_Minion_Wizard'] = 48.0, ['Renekton'] = 80.0, ['Anivia'] = 65, ['Fizz'] = 65, ['Heimerdinger'] = 55.0, ['Evelynn'] = 65, ['Rumble'] = 80.0, ['Leblanc'] = 65, ['Darius'] = 80.0, ['OlafAxe'] = 50.0, ['Viktor'] = 65, ['XinZhao'] = 65, ['Orianna'] = 65, ['Vladimir'] = 65, ['Nidalee'] = 65, ['Tutorial_Red_Minion_Basic'] = 48.0, ['ZedShadow'] = 65, ['Syndra'] = 65, ['Zac'] = 80.0, ['Olaf'] = 65, ['Veigar'] = 55.0, ['Twitch'] = 65, ['Alistar'] = 80.0, ['Akali'] = 65, ['Urgot'] = 80.0, ['Leona'] = 65, ['Talon'] = 65, ['Karma'] = 65, ['Jayce'] = 65, ['Galio'] = 80.0, ['Shaco'] = 65, ['Taric'] = 65, ['TwistedFate'] = 65, ['Varus'] = 65, ['Garen'] = 65, ['Swain'] = 65, ['Vayne'] = 65, ['Fiora'] = 65, ['Quinn'] = 65, ['Kayle'] = 65, ['Blue_Minion_Basic'] = 48.0, ['Brand'] = 65, ['Teemo'] = 55.0, ['Amumu'] = 55.0, ['Annie'] = 55.0, ['Odin_Blue_Minion_caster'] = 48.0, ['Elise'] = 65, ['Nami'] = 65, ['Poppy'] = 55.0, ['AniviaEgg'] = 65, ['Tristana'] = 55.0, ['Graves'] = 65, ['Morgana'] = 65, ['Gragas'] = 80.0, ['MissFortune'] = 65, ['Warwick'] = 65, ['Cassiopeia'] = 65, ['Tutorial_Blue_Minion_Wizard'] = 48.0, ['DrMundo'] = 80.0, ['Volibear'] = 80.0, ['Irelia'] = 65, ['Odin_Red_Minion_Caster'] = 48.0, ['Lucian'] = 65, ['Yorick'] = 80.0, ['RammusPB'] = 65, ['Red_Minion_Basic'] = 48.0, ['Udyr'] = 65, ['MonkeyKing'] = 65, ['Tutorial_Blue_Minion_Basic'] = 48.0, ['Kennen'] = 55.0, ['Nunu'] = 65, ['Ryze'] = 65, ['Zed'] = 65, ['Nautilus'] = 80.0, ['Gangplank'] = 65, ['shopevo'] = 65, ['Lux'] = 65, ['Sejuani'] = 80.0, ['Ezreal'] = 65, ['OdinNeutralGuardian'] = 65, ['Khazix'] = 65, ['Sion'] = 80.0, ['Aatrox'] = 65, ['Hecarim'] = 80.0, ['Pantheon'] = 65, ['Shyvana'] = 50.0, ['Zyra'] = 65, ['Karthus'] = 65, ['Rammus'] = 65, ['Zilean'] = 65, ['Chogath'] = 80.0, ['Malzahar'] = 65, ['YorickRavenousGhoul'] = 1.0, ['YorickSpectralGhoul'] = 1.0, ['JinxMine'] = 65, ['YorickDecayedGhoul'] = 1.0, ['XerathArcaneBarrageLauncher'] = 65, ['Odin_SOG_Order_Crystal'] = 65, ['TestCube'] = 65, ['ShyvanaDragon'] = 80.0, ['FizzBait'] = 65, ['ShopKeeper'] = 65, ['Blue_Minion_MechMelee'] = 65.0, ['OdinQuestBuff'] = 65, ['TT_Buffplat_L'] = 65, ['TT_Buffplat_R'] = 65, ['KogMawDead'] = 65, ['TempMovableChar'] = 48.0, ['Lizard'] = 50.0, ['GolemOdin'] = 80.0, ['OdinOpeningBarrier'] = 65, ['TT_ChaosTurret4'] = 88.4, ['TT_Flytrap_A'] = 65, ['TT_Chains_Order_Periph'] = 65, ['TT_NWolf'] = 65.0, ['ShopMale'] = 65, ['OdinShieldRelic'] = 65, ['TT_Chains_Xaos_Base'] = 65, ['LuluSquill'] = 50.0, ['TT_Shopkeeper'] = 65, ['redDragon'] = 100.0, ['MonkeyKingClone'] = 65, ['Odin_skeleton'] = 65, ['OdinChaosTurretShrine'] = 88.4, ['Cassiopeia_Death'] = 65, ['OdinCenterRelic'] = 48.0, ['Ezreal_cyber_1'] = 65, ['Ezreal_cyber_3'] = 65, ['Ezreal_cyber_2'] = 65, ['OdinRedSuperminion'] = 55.0, ['TT_Speedshrine_Gears'] = 65, ['JarvanIVWall'] = 65, ['DestroyedNexus'] = 65, ['ARAMOrderNexus'] = 65, ['Red_Minion_MechCannon'] = 65.0, ['OdinBlueSuperminion'] = 55.0, ['SyndraOrbs'] = 65, ['LuluKitty'] = 50.0, ['SwainNoBird'] = 65, ['LuluLadybug'] = 50.0, ['CaitlynTrap'] = 65, ['TT_Shroom_A'] = 65, ['ARAMChaosTurretShrine'] = 88.4, ['Odin_Windmill_Propellers'] = 65, ['DestroyedInhibitor'] = 65, ['TT_NWolf2'] = 50.0, ['OdinMinionGraveyardPortal'] = 1.0, ['SwainBeam'] = 65, ['Summoner_Rider_Order'] = 65.0, ['TT_Relic'] = 65, ['odin_lifts_crystal'] = 65, ['OdinOrderTurretShrine'] = 88.4, ['SpellBook1'] = 65, ['Blue_Minion_MechCannon'] = 65.0, ['TT_ChaosInhibitor_D'] = 65, ['Odin_SoG_Chaos'] = 65, ['TrundleWall'] = 65, ['HA_AP_HealthRelic'] = 65, ['OrderTurretShrine'] = 88.4, ['OriannaBall'] = 48.0, ['ChaosTurretShrine'] = 88.4, ['LuluCupcake'] = 50.0, ['HA_AP_ChaosTurretShrine'] = 88.4, ['TT_Chains_Bot_Lane'] = 65, ['TT_NWraith2'] = 50.0, ['TT_Tree_A'] = 65, ['SummonerBeacon'] = 65, ['Odin_Drill'] = 65, ['TT_NGolem'] = 80.0, ['Shop'] = 65, ['AramSpeedShrine'] = 65, ['DestroyedTower'] = 65, ['OriannaNoBall'] = 65, ['Odin_Minecart'] = 65, ['Summoner_Rider_Chaos'] = 65.0, ['OdinSpeedShrine'] = 65, ['TT_Brazier'] = 65, ['TT_SpeedShrine'] = 65, ['odin_lifts_buckets'] = 65, ['OdinRockSaw'] = 65, ['OdinMinionSpawnPortal'] = 1.0, ['SyndraSphere'] = 48.0, ['TT_Nexus_Gears'] = 65, ['Red_Minion_MechMelee'] = 65.0, ['SwainRaven'] = 65, ['crystal_platform'] = 65, ['MaokaiSproutling'] = 48.0, ['Urf'] = 65, ['TestCubeRender10Vision'] = 65, ['MalzaharVoidling'] = 10.0, ['GhostWard'] = 1, ['MonkeyKingFlying'] = 65, ['LuluPig'] = 50.0, ['AniviaIceBlock'] = 65, ['TT_OrderInhibitor_D'] = 65, ['yonkey'] = 65, ['Odin_SoG_Order'] = 65, ['RammusDBC'] = 65, ['FizzShark'] = 65, ['LuluDragon'] = 50.0, ['OdinTestCubeRender'] = 65, ['OdinCrane'] = 65, ['TT_Tree1'] = 65, ['ARAMOrderTurretShrine'] = 88.4, ['TT_Chains_Order_Base'] = 65, ['Odin_Windmill_Gears'] = 65, ['ARAMChaosNexus'] = 65, ['TT_NWraith'] = 50.0, ['TT_OrderTurret4'] = 88.4, ['Odin_SOG_Chaos_Crystal'] = 65, ['TT_SpiderLayer_Web'] = 65, ['OdinQuestIndicator'] = 1.0, ['JarvanIVStandard'] = 65, ['TT_DummyPusher'] = 65, ['OdinClaw'] = 65, ['EliseSpiderling'] = 1.0, ['QuinnValor'] = 65, ['UdyrTigerUlt'] = 65, ['UdyrTurtleUlt'] = 65, ['UdyrUlt'] = 65, ['UdyrPhoenixUlt'] = 65, ['ShacoBox'] = 10, ['HA_AP_Poro'] = 65, ['AnnieTibbers'] = 80.0, ['UdyrPhoenix'] = 65, ['UdyrTurtle'] = 65, ['UdyrTiger'] = 65, ['HA_AP_OrderShrineTurret'] = 88.4, ['HA_AP_OrderTurretRubble'] = 65, ['HA_AP_Chains_Long'] = 65, ['HA_AP_OrderCloth'] = 65, ['HA_AP_PeriphBridge'] = 65, ['HA_AP_BridgeLaneStatue'] = 65, ['HA_AP_ChaosTurretRubble'] = 88.4, ['HA_AP_BannerMidBridge'] = 65, ['HA_AP_PoroSpawner'] = 50.0, ['HA_AP_Cutaway'] = 65, ['HA_AP_Chains'] = 65, ['HA_AP_ShpSouth'] = 65, ['HA_AP_HeroTower'] = 65, ['HA_AP_ShpNorth'] = 65, ['ChaosInhibitor_D'] = 65, ['ZacRebirthBloblet'] = 65, ['OrderInhibitor_D'] = 65, ['Nidalee_Spear'] = 65, ['Nidalee_Cougar'] = 65, ['TT_Buffplat_Chain'] = 65, ['WriggleLantern'] = 1, ['TwistedLizardElder'] = 65.0, ['RabidWolf'] = 65.0, ['HeimerTGreen'] = 50.0, ['HeimerTRed'] = 50.0, ['ViktorFF'] = 65, ['TwistedGolem'] = 80.0, ['TwistedSmallWolf'] = 50.0, ['TwistedGiantWolf'] = 65.0, ['TwistedTinyWraith'] = 50.0, ['TwistedBlueWraith'] = 50.0, ['TwistedYoungLizard'] = 50.0, ['Red_Minion_Melee'] = 48.0, ['Blue_Minion_Melee'] = 48.0, ['Blue_Minion_Healer'] = 48.0, ['Ghast'] = 60.0, ['blueDragon'] = 100.0, ['Red_Minion_MechRange'] = 65.0, ['Test_CubeSphere'] = 65,["SRU_OrderMinionRanged"] = 65,["SRU_ChaosMinionRanged"] = 48,["SRU_OrderMinionMelee"] = 48,["SRU_ChaosMinionMelee"] = 65,["SRU_ChaosMinionSiege"] = 65,["SRU_OrderMinionSiege"] = 65,["SRUAP_Turret_Chaos1"] = 88.4,["SRU_AP_Turret_Chaos2"] = 88.4,["SRUAP_Turret_Chaos_Test3"] = 88.4,["SRUAP_Turret_Order1"] = 88.4,["SRU_AP_Turret_Order2"] = 88.4,["SRUAP_Turret_Order_Test3"] = 88.4,}
	self.projectilespeeds = {['Gnar'] = 1400,["Kalistar"] = 2600, ["Velkoz"]= 2000,["TeemoMushroom"] = math.huge,["TestCubeRender"] = math.huge ,["Xerath"] = 2000.0000 ,["Kassadin"] = math.huge ,["Rengar"] = math.huge ,["Thresh"] = 1000.0000 ,["Ziggs"] = 1500.0000 ,["ZyraPassive"] = 1500.0000 ,["ZyraThornPlant"] = 1500.0000 ,["KogMaw"] = 1800.0000 ,["HeimerTBlue"] = 1599.3999 ,["EliseSpider"] = 500.0000 ,["Skarner"] = 500.0000 ,["ChaosNexus"] = 500.0000 ,["Katarina"] = 467.0000 ,["Riven"] = 347.79999 ,["SightWard"] = 347.79999 ,["HeimerTYellow"] = 1599.3999 ,["Ashe"] = 2000.0000 ,["VisionWard"] = 2000.0000 ,["TT_NGolem2"] = math.huge ,["ThreshLantern"] = math.huge ,["TT_Spiderboss"] = math.huge ,["OrderNexus"] = math.huge ,["Soraka"] = 1000.0000 ,["Jinx"] = 2750.0000 ,["TestCubeRenderwCollision"] = 2750.0000 ,["Red_Minion_Wizard"] = 650.0000 ,["JarvanIV"] = 20.0000 ,["Blue_Minion_Wizard"] = 650.0000 ,["TT_ChaosTurret2"] = 1200.0000 ,["TT_ChaosTurret3"] = 1200.0000 ,["TT_ChaosTurret1"] = 1200.0000 ,["ChaosTurretGiant"] = 1200.0000 ,["Dragon"] = 1200.0000 ,["LuluSnowman"] = 1200.0000 ,["Worm"] = 1200.0000 ,["ChaosTurretWorm"] = 1200.0000 ,["TT_ChaosInhibitor"] = 1200.0000 ,["ChaosTurretNormal"] = 1200.0000 ,["AncientGolem"] = 500.0000 ,["ZyraGraspingPlant"] = 500.0000 ,["HA_AP_OrderTurret3"] = 1200.0000 ,["HA_AP_OrderTurret2"] = 1200.0000 ,["Tryndamere"] = 347.79999 ,["OrderTurretNormal2"] = 1200.0000 ,["Singed"] = 700.0000 ,["OrderInhibitor"] = 700.0000 ,["Diana"] = 347.79999 ,["HA_FB_HealthRelic"] = 347.79999 ,["TT_OrderInhibitor"] = 347.79999 ,["GreatWraith"] = 750.0000 ,["Yasuo"] = 347.79999 ,["OrderTurretDragon"] = 1200.0000 ,["OrderTurretNormal"] = 1200.0000 ,["LizardElder"] = 500.0000 ,["HA_AP_ChaosTurret"] = 1200.0000 ,["Ahri"] = 1750.0000 ,["Lulu"] = 1450.0000 ,["ChaosInhibitor"] = 1450.0000 ,["HA_AP_ChaosTurret3"] = 1200.0000 ,["HA_AP_ChaosTurret2"] = 1200.0000 ,["ChaosTurretWorm2"] = 1200.0000 ,["TT_OrderTurret1"] = 1200.0000 ,["TT_OrderTurret2"] = 1200.0000 ,["TT_OrderTurret3"] = 1200.0000 ,["LuluFaerie"] = 1200.0000 ,["HA_AP_OrderTurret"] = 1200.0000 ,["OrderTurretAngel"] = 1200.0000 ,["YellowTrinketUpgrade"] = 1200.0000 ,["MasterYi"] = math.huge ,["Lissandra"] = 2000.0000 ,["ARAMOrderTurretNexus"] = 1200.0000 ,["Draven"] = 1700.0000 ,["FiddleSticks"] = 1750.0000 ,["SmallGolem"] = math.huge ,["ARAMOrderTurretFront"] = 1200.0000 ,["ChaosTurretTutorial"] = 1200.0000 ,["NasusUlt"] = 1200.0000 ,["Maokai"] = math.huge ,["Wraith"] = 750.0000 ,["Wolf"] = math.huge ,["Sivir"] = 1750.0000 ,["Corki"] = 2000.0000 ,["Janna"] = 1200.0000 ,["Nasus"] = math.huge ,["Golem"] = math.huge ,["ARAMChaosTurretFront"] = 1200.0000 ,["ARAMOrderTurretInhib"] = 1200.0000 ,["LeeSin"] = math.huge ,["HA_AP_ChaosTurretTutorial"] = 1200.0000 ,["GiantWolf"] = math.huge ,["HA_AP_OrderTurretTutorial"] = 1200.0000 ,["YoungLizard"] = 750.0000 ,["Jax"] = 400.0000 ,["LesserWraith"] = math.huge ,["Blitzcrank"] = math.huge ,["ARAMChaosTurretInhib"] = 1200.0000 ,["Shen"] = 400.0000 ,["Nocturne"] = math.huge ,["Sona"] = 1500.0000 ,["ARAMChaosTurretNexus"] = 1200.0000 ,["YellowTrinket"] = 1200.0000 ,["OrderTurretTutorial"] = 1200.0000 ,["Caitlyn"] = 2500.0000 ,["Trundle"] = 347.79999 ,["Malphite"] = 1000.0000 ,["Mordekaiser"] = math.huge ,["ZyraSeed"] = math.huge ,["Vi"] = 1000.0000 ,["Tutorial_Red_Minion_Wizard"] = 650.0000 ,["Renekton"] = math.huge ,["Anivia"] = 1400.0000 ,["Fizz"] = math.huge ,["Heimerdinger"] = 1500.0000 ,["Evelynn"] = 467.0000 ,["Rumble"] = 347.79999 ,["Leblanc"] = 1700.0000 ,["Darius"] = math.huge ,["OlafAxe"] = math.huge ,["Viktor"] = 2300.0000 ,["XinZhao"] = 20.0000 ,["Orianna"] = 1450.0000 ,["Vladimir"] = 1400.0000 ,["Nidalee"] = 1750.0000 ,["Tutorial_Red_Minion_Basic"] = math.huge ,["ZedShadow"] = 467.0000 ,["Syndra"] = 1800.0000 ,["Zac"] = 1000.0000 ,["Olaf"] = 347.79999 ,["Veigar"] = 1100.0000 ,["Twitch"] = 2500.0000 ,["Alistar"] = math.huge ,["Akali"] = 467.0000 ,["Urgot"] = 1300.0000 ,["Leona"] = 347.79999 ,["Talon"] = math.huge ,["Karma"] = 1500.0000 ,["Jayce"] = 347.79999 ,["Galio"] = 1000.0000 ,["Shaco"] = math.huge ,["Taric"] = math.huge ,["TwistedFate"] = 1500.0000 ,["Varus"] = 2000.0000 ,["Garen"] = 347.79999 ,["Swain"] = 1600.0000 ,["Vayne"] = 2000.0000 ,["Fiora"] = 467.0000 ,["Quinn"] = 2000.0000 ,["Kayle"] = math.huge ,["Blue_Minion_Basic"] = math.huge ,["Brand"] = 2000.0000 ,["Teemo"] = 1300.0000 ,["Amumu"] = 500.0000 ,["Annie"] = 1200.0000 ,["Odin_Blue_Minion_caster"] = 1200.0000 ,["Elise"] = 1600.0000 ,["Nami"] = 1500.0000 ,["Poppy"] = 500.0000 ,["AniviaEgg"] = 500.0000 ,["Tristana"] = 2250.0000 ,["Graves"] = 3000.0000 ,["Morgana"] = 1600.0000 ,["Gragas"] = math.huge ,["MissFortune"] = 2000.0000 ,["Warwick"] = math.huge ,["Cassiopeia"] = 1200.0000 ,["Tutorial_Blue_Minion_Wizard"] = 650.0000 ,["DrMundo"] = math.huge ,["Volibear"] = 467.0000 ,["Irelia"] = 467.0000 ,["Odin_Red_Minion_Caster"] = 650.0000 ,["Lucian"] = 2800.0000 ,["Yorick"] = math.huge ,["RammusPB"] = math.huge ,["Red_Minion_Basic"] = math.huge ,["Udyr"] = 467.0000 ,["MonkeyKing"] = 20.0000 ,["Tutorial_Blue_Minion_Basic"] = math.huge ,["Kennen"] = 1600.0000 ,["Nunu"] = 500.0000 ,["Ryze"] = 2400.0000 ,["Zed"] = 467.0000 ,["Nautilus"] = 1000.0000 ,["Gangplank"] = 1000.0000 ,["Lux"] = 1600.0000 ,["Sejuani"] = 500.0000 ,["Ezreal"] = 2000.0000 ,["OdinNeutralGuardian"] = 1800.0000 ,["Khazix"] = 500.0000 ,["Sion"] = math.huge ,["Aatrox"] = 347.79999 ,["Hecarim"] = 500.0000 ,["Pantheon"] = 20.0000 ,["Shyvana"] = 467.0000 ,["Zyra"] = 1700.0000 ,["Karthus"] = 1200.0000 ,["Rammus"] = math.huge ,["Zilean"] = 1200.0000 ,["Chogath"] = 500.0000 ,["Malzahar"] = 2000.0000 ,["YorickRavenousGhoul"] = 347.79999 ,["YorickSpectralGhoul"] = 347.79999 ,["JinxMine"] = 347.79999 ,["YorickDecayedGhoul"] = 347.79999 ,["XerathArcaneBarrageLauncher"] = 347.79999 ,["Odin_SOG_Order_Crystal"] = 347.79999 ,["TestCube"] = 347.79999 ,["ShyvanaDragon"] = math.huge ,["FizzBait"] = math.huge ,["Blue_Minion_MechMelee"] = math.huge ,["OdinQuestBuff"] = math.huge ,["TT_Buffplat_L"] = math.huge ,["TT_Buffplat_R"] = math.huge ,["KogMawDead"] = math.huge ,["TempMovableChar"] = math.huge ,["Lizard"] = 500.0000 ,["GolemOdin"] = math.huge ,["OdinOpeningBarrier"] = math.huge ,["TT_ChaosTurret4"] = 500.0000 ,["TT_Flytrap_A"] = 500.0000 ,["TT_NWolf"] = math.huge ,["OdinShieldRelic"] = math.huge ,["LuluSquill"] = math.huge ,["redDragon"] = math.huge ,["MonkeyKingClone"] = math.huge ,["Odin_skeleton"] = math.huge ,["OdinChaosTurretShrine"] = 500.0000 ,["Cassiopeia_Death"] = 500.0000 ,["OdinCenterRelic"] = 500.0000 ,["OdinRedSuperminion"] = math.huge ,["JarvanIVWall"] = math.huge ,["ARAMOrderNexus"] = math.huge ,["Red_Minion_MechCannon"] = 1200.0000 ,["OdinBlueSuperminion"] = math.huge ,["SyndraOrbs"] = math.huge ,["LuluKitty"] = math.huge ,["SwainNoBird"] = math.huge ,["LuluLadybug"] = math.huge ,["CaitlynTrap"] = math.huge ,["TT_Shroom_A"] = math.huge ,["ARAMChaosTurretShrine"] = 500.0000 ,["Odin_Windmill_Propellers"] = 500.0000 ,["TT_NWolf2"] = math.huge ,["OdinMinionGraveyardPortal"] = math.huge ,["SwainBeam"] = math.huge ,["Summoner_Rider_Order"] = math.huge ,["TT_Relic"] = math.huge ,["odin_lifts_crystal"] = math.huge ,["OdinOrderTurretShrine"] = 500.0000 ,["SpellBook1"] = 500.0000 ,["Blue_Minion_MechCannon"] = 1200.0000 ,["TT_ChaosInhibitor_D"] = 1200.0000 ,["Odin_SoG_Chaos"] = 1200.0000 ,["TrundleWall"] = 1200.0000 ,["HA_AP_HealthRelic"] = 1200.0000 ,["OrderTurretShrine"] = 500.0000 ,["OriannaBall"] = 500.0000 ,["ChaosTurretShrine"] = 500.0000 ,["LuluCupcake"] = 500.0000 ,["HA_AP_ChaosTurretShrine"] = 500.0000 ,["TT_NWraith2"] = 750.0000 ,["TT_Tree_A"] = 750.0000 ,["SummonerBeacon"] = 750.0000 ,["Odin_Drill"] = 750.0000 ,["TT_NGolem"] = math.huge ,["AramSpeedShrine"] = math.huge ,["OriannaNoBall"] = math.huge ,["Odin_Minecart"] = math.huge ,["Summoner_Rider_Chaos"] = math.huge ,["OdinSpeedShrine"] = math.huge ,["TT_SpeedShrine"] = math.huge ,["odin_lifts_buckets"] = math.huge ,["OdinRockSaw"] = math.huge ,["OdinMinionSpawnPortal"] = math.huge ,["SyndraSphere"] = math.huge ,["Red_Minion_MechMelee"] = math.huge ,["SwainRaven"] = math.huge ,["crystal_platform"] = math.huge ,["MaokaiSproutling"] = math.huge ,["Urf"] = math.huge ,["TestCubeRender10Vision"] = math.huge ,["MalzaharVoidling"] = 500.0000 ,["GhostWard"] = 500.0000 ,["MonkeyKingFlying"] = 500.0000 ,["LuluPig"] = 500.0000 ,["AniviaIceBlock"] = 500.0000 ,["TT_OrderInhibitor_D"] = 500.0000 ,["Odin_SoG_Order"] = 500.0000 ,["RammusDBC"] = 500.0000 ,["FizzShark"] = 500.0000 ,["LuluDragon"] = 500.0000 ,["OdinTestCubeRender"] = 500.0000 ,["TT_Tree1"] = 500.0000 ,["ARAMOrderTurretShrine"] = 500.0000 ,["Odin_Windmill_Gears"] = 500.0000 ,["ARAMChaosNexus"] = 500.0000 ,["TT_NWraith"] = 750.0000 ,["TT_OrderTurret4"] = 500.0000 ,["Odin_SOG_Chaos_Crystal"] = 500.0000 ,["OdinQuestIndicator"] = 500.0000 ,["JarvanIVStandard"] = 500.0000 ,["TT_DummyPusher"] = 500.0000 ,["OdinClaw"] = 500.0000 ,["EliseSpiderling"] = 2000.0000 ,["QuinnValor"] = math.huge ,["UdyrTigerUlt"] = math.huge ,["UdyrTurtleUlt"] = math.huge ,["UdyrUlt"] = math.huge ,["UdyrPhoenixUlt"] = math.huge ,["ShacoBox"] = 1500.0000 ,["HA_AP_Poro"] = 1500.0000 ,["AnnieTibbers"] = math.huge ,["UdyrPhoenix"] = math.huge ,["UdyrTurtle"] = math.huge ,["UdyrTiger"] = math.huge ,["HA_AP_OrderShrineTurret"] = 500.0000 ,["HA_AP_Chains_Long"] = 500.0000 ,["HA_AP_BridgeLaneStatue"] = 500.0000 ,["HA_AP_ChaosTurretRubble"] = 500.0000 ,["HA_AP_PoroSpawner"] = 500.0000 ,["HA_AP_Cutaway"] = 500.0000 ,["HA_AP_Chains"] = 500.0000 ,["ChaosInhibitor_D"] = 500.0000 ,["ZacRebirthBloblet"] = 500.0000 ,["OrderInhibitor_D"] = 500.0000 ,["Nidalee_Spear"] = 500.0000 ,["Nidalee_Cougar"] = 500.0000 ,["TT_Buffplat_Chain"] = 500.0000 ,["WriggleLantern"] = 500.0000 ,["TwistedLizardElder"] = 500.0000 ,["RabidWolf"] = math.huge ,["HeimerTGreen"] = 1599.3999 ,["HeimerTRed"] = 1599.3999 ,["ViktorFF"] = 1599.3999 ,["TwistedGolem"] = math.huge ,["TwistedSmallWolf"] = math.huge ,["TwistedGiantWolf"] = math.huge ,["TwistedTinyWraith"] = 750.0000 ,["TwistedBlueWraith"] = 750.0000 ,["TwistedYoungLizard"] = 750.0000 ,["Red_Minion_Melee"] = math.huge ,["Blue_Minion_Melee"] = math.huge ,["Blue_Minion_Healer"] = 1000.0000 ,["Ghast"] = 750.0000 ,["blueDragon"] = 800.0000 ,["Red_Minion_MechRange"] = 3000.0000,["SRU_OrderMinionRanged"] = 650,["SRU_ChaosMinionRanged"] = 650,["SRU_OrderMinionMelee"] = math.huge,["SRU_ChaosMinionMelee"] = math.huge,["SRU_ChaosMinionSiege"] = 1200,["SRU_OrderMinionSiege"] = 1200,}
	self.ActiveAttacks = {}
	
	self.ProjectileSpeed = myHero.range > 300 and self:GetProjectileSpeed(myHero) or math.huge
	self.BaseWindupTime = 3
	self.BaseAnimationTime = 0.65
	self.DataUpdated = false

	self.VP = VP
	
	--Callbacks
	self.AfterAttackCallbacks = {}
	self.OnAttackCallbacks = {}
	self.BeforeAttackCallbacks = {}

	self.AttackTable =
		{
			"caitlynheadshotmissile", "frostarrow", "garenslash2", "kennenmegaproc", "lucianpassiveattack", "masteryidoublestrike", "quinnwenhanced", "renektonexecute", "renektonsuperexecute", "rengarnewpassivebuffdash", "trundleq", "xenzhaothrust", "viktorqbuff", "xenzhaothrust2", "xenzhaothrust3"
		}

	self.NoAttackTable =
		{
			"jarvanivcataclysmattack", "monkeykingdoubleattack", "shyvanadoubleattack", "shyvanadoubleattackdragon", "zyragraspingplantattack", "zyragraspingplantattack2", "zyragraspingplantattackfire", "zyragraspingplantattack2fire"
		}


		self.AttackResetTable = 
		{
			"dariusnoxiantacticsonh", "fioraflurry", "garenq",
            "hecarimrapidslash", "jaxempowertwo", "jaycehypercharge", "leonashieldofdaybreak", "luciane", "lucianq",
            "monkeykingdoubleattack", "mordekaisermaceofspades", "nasusq", "nautiluspiercinggaze", "netherblade",
            "parley", "poppydevastatingblow", "powerfist", "renektonpreexecute", "rengarq", "shyvanadoubleattack",
            "sivirw", "takedown", "talonnoxiandiplomacy", "trundletrollsmash", "vaynetumble", "vie", "volibearq",
            "xenzhaocombotarget", "yorickspectral"
		}

	self.LastAttack = 0
	self.EnemyMinions = minionManager(MINION_ENEMY, 2000, myHero, MINION_SORT_MAXHEALTH_ASC)
	self.JungleMinions = minionManager(MINION_JUNGLE, 2000, myHero, MINION_SORT_MAXHEALTH_DEC)
	self.OtherMinions = minionManager(MINION_OTHER, 2000, myHero, MINION_SORT_HEALTH_ASC)
	
	GetSave("SOW").FarmDelay = GetSave("SOW").FarmDelay and GetSave("SOW").FarmDelay or 0
	GetSave("SOW").ExtraWindUpTime = GetSave("SOW").ExtraWindUpTime and GetSave("SOW").ExtraWindUpTime or 50
	GetSave("SOW").Mode3 = GetSave("SOW").Mode3 and GetSave("SOW").Mode3 or string.byte("X")
	GetSave("SOW").Mode2 = GetSave("SOW").Mode2 and GetSave("SOW").Mode2 or string.byte("V")
	GetSave("SOW").Mode1 = GetSave("SOW").Mode1 and GetSave("SOW").Mode1 or string.byte("C")
	GetSave("SOW").Mode0 = GetSave("SOW").Mode0 and GetSave("SOW").Mode0 or 32

	self.Attacks = true
	self.Move = true
	self.mode = -1
	self.checkcancel = 0

	AddProcessSpellCallback(function(unit, spell) self:OnProcessSpell(unit, spell) end)
	WayPointManager.AddCallback(function(NetworkID) self:OnNewWayPoints(NetworkID) end)
	_G.SOWLoaded = true
end

function SOW:LoadToMenu(m, STS)
	
	if not m then
		self.Menu = scriptConfig("Simple OrbWalker [Test]", "SOW")
	else
		self.Menu = m
	end

	if STS then
		self.STS = STS
		self.STS.VP = self.VP
	end
	
	self.Menu:addParam("Enabled", "Enabled", SCRIPT_PARAM_ONOFF, true)
	--Draw
	self.Menu:addSubMenu("Draw", "Draw")
	self.Menu.Draw:addParam("DrawAA", "Draw Attack Range", SCRIPT_PARAM_ONOFF, true)
	self.Menu.Draw:addParam("DrawEnemy", "Draw Enemies Range", SCRIPT_PARAM_ONOFF, true)
	self.Menu.Draw:addParam("DrawHoldZone", "Draw Hold Zone (only Melee)", SCRIPT_PARAM_ONOFF, false)
	
	
	
	self.Menu.Draw:addParam("DrawMinionLasthit", "Draw Minion Lasthit", SCRIPT_PARAM_ONOFF, true)
	self.Menu.Draw:addParam("DrawTarget", "Draw Target", SCRIPT_PARAM_ONOFF, true)
	self.Menu:addSubMenu("Misc", "Misc")
	self.Menu.Misc:addParam("holdzone", "Hold Position",SCRIPT_PARAM_SLICE, 100, 0, 150 )
	self.Menu.Misc:addParam("FarmDelay", "Farm Delay", SCRIPT_PARAM_SLICE, -150, 0, 150)
	self.Menu.Misc:addParam("ExtraWindUpTime", "Extra WindUp Time", SCRIPT_PARAM_SLICE, -150,  0, 150)
	self.Menu.Misc:addParam("PriorizeFarm", "Priorize farm over harass",SCRIPT_PARAM_ONOFF, true)
	self.Menu.Misc:addParam("Packet", "Enable Packet",SCRIPT_PARAM_ONOFF, false)
	
		
	
	self.Menu.Misc.FarmDelay = GetSave("SOW").FarmDelay
	self.Menu.Misc.ExtraWindUpTime = GetSave("SOW").ExtraWindUpTime
	self.Menu:addSubMenu("Melee", "Melee")
	self.Menu.Melee:addParam("Predic", "Predict Movement",SCRIPT_PARAM_ONOFF, true)	
	self.Menu.Melee:addParam("MToTarget", "Move To Target",SCRIPT_PARAM_ONOFF, true)	

	self.Menu:addParam("Hotkeys", "", SCRIPT_PARAM_INFO, "")

	self.Menu:addParam("Mode3", "Last Hit!", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
	self.Mode3ParamID = #self.Menu._param
	self.Menu:addParam("Mode1", "Mixed Mode!", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
	self.Mode1ParamID = #self.Menu._param
	self.Menu:addParam("Mode2", "Lane Clear!", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
	self.Mode2ParamID = #self.Menu._param
	self.Menu:addParam("Mode0", "Combo!", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	self.Mode0ParamID = #self.Menu._param

	self.Menu._param[self.Mode3ParamID].key = GetSave("SOW").Mode3
	self.Menu._param[self.Mode2ParamID].key = GetSave("SOW").Mode2
	self.Menu._param[self.Mode1ParamID].key = GetSave("SOW").Mode1
	self.Menu._param[self.Mode0ParamID].key = GetSave("SOW").Mode0
	
	self.CurrentMode = MODE_NONE
	self.Target = nil
	PrintChat("<font color=\"#6699ff\"><b>Simple OrbWalker: </b></font> <font color=\"#FFFFFF\">Successfully Loaded</b></font>")
	
	AddTickCallback(function() self:OnTick() end)
	AddTickCallback(function() self:CheckConfig() end)
	AddDrawCallback(function() self:_OnDraw() end)
end

function SOW:CheckConfig()
	
	GetSave("SOW").FarmDelay = self.Menu.Misc.FarmDelay
	GetSave("SOW").ExtraWindUpTime = self.Menu.Misc.ExtraWindUpTime

	GetSave("SOW").Mode3 = self.Menu._param[self.Mode3ParamID].key
	GetSave("SOW").Mode2 = self.Menu._param[self.Mode2ParamID].key
	GetSave("SOW").Mode1 = self.Menu._param[self.Mode1ParamID].key
	GetSave("SOW").Mode0 = self.Menu._param[self.Mode0ParamID].key
end

function SOW:DisableAttacks()
	self.Attacks = false
end

function SOW:EnableAttacks()
	self.Attacks = true
end

function SOW:ForceTarget(target)
	self.forcetarget = target
end

function SOW:GetTime()
	return os.clock()
end

function SOW:MyRange(target)
	local myRange = myHero.range + self:GetHitBox(myHero)
	if target and ValidTarget(target) then
		myRange = myRange + self:GetHitBox(target)
	end
	return myRange - 20
end

function SOW:InRange(target)
	local MyRange = self:MyRange(target)
	if target and GetDistanceSqr(target, myHero) <= MyRange * MyRange then
		return true
	end
end

function SOW:ValidTarget(target)
	if target and target.type and (target.type == "obj_BarracksDampener" or target.type == "obj_HQ")  then
		return false
	end
	return ValidTarget(target) and self:InRange(target)
end

function SOW:Attack(target)
	self.LastAttack = self:GetTime() + self:Latency()
	myHero:Attack(target)
end

function SOW:WindUpTime(exact)
	return (1 / (myHero.attackSpeed * self.BaseWindupTime)) + (exact and 0 or GetSave("SOW").ExtraWindUpTime / 1000)
end

function SOW:AnimationTime()
	return (1 / (myHero.attackSpeed * self.BaseAnimationTime))
end

function SOW:Latency()
	return GetLatency() / 2000
end

function SOW:CanAttack()
	if self.LastAttack <= self:GetTime() then
		return (self:GetTime() + self:Latency()  > self.LastAttack + self:AnimationTime())
	end
	return false
end

function SOW:CanMove()
	if self.LastAttack <= self:GetTime() then
		return ((self:GetTime() + self:Latency() > self.LastAttack + self:WindUpTime()) or self.ParticleCreated) and not _G.evade
	end
end

function SOW:BeforeAttack(target)
	local result = false
	for i, cb in ipairs(self.BeforeAttackCallbacks) do
		local ri = cb(target, self.mode)
		if ri then
			result = true
		end
	end
	return result
end

function SOW:RegisterBeforeAttackCallback(f)
	table.insert(self.BeforeAttackCallbacks, f)
end

function SOW:OnAttack(target)
	for i, cb in ipairs(self.OnAttackCallbacks) do
		cb(target, self.mode)
	end
end

function SOW:RegisterOnAttackCallback(f)
	table.insert(self.OnAttackCallbacks, f)
end

function SOW:AfterAttack(target)
	for i, cb in ipairs(self.AfterAttackCallbacks) do
		cb(target, self.mode)
	end
end

function SOW:RegisterAfterAttackCallback(f)
	table.insert(self.AfterAttackCallbacks, f)
end

function SOW:MoveTo(x, y)
	myHero:MoveTo(x, y)
	--print(self:GetTime())
end
function SOW:OrbWalk(target, point)
	point = point or self.forceorbwalkpos
	if self.Attacks and self:CanAttack() and self:ValidTarget(target) and not self:BeforeAttack(target) then
		self:Attack(target)
	elseif self:CanMove() and self.Move then
		if not point then
			if myHero.isMelee then 
				local OBTarget = self:GetTarget() or target
				if OBTarget then
					local pos = self.VP:GetPredictedPos(OBTarget, 0, 2*myHero.ms, myHero, false)
					if pos and self.Menu.Mode0 then
						self:MoveTo(pos.x, pos.z)
					end
				else
						local Mv = Vector(myHero) + 200 * (Vector(mousePos) - Vector(myHero)):normalized()
						self:MoveTo(Mv.x, Mv.z)
				end
			 end	
			else		
			
				local Mv = Vector(myHero) + 200 * (Vector(mousePos) - Vector(myHero)):normalized()
				self:MoveTo(Mv.x, Mv.z)
			--elseif GetDistanceSqr(OBTarget) > 100*100 + math.pow(self:GetHitBox(OBTarget), 2) then
				--local point = self.VP:GetPredictedPos(OBTarget, 0, 2*myHero.ms, myHero, false)
				--if GetDistanceSqr(point) < 100*100 + math.pow(self.VP:GetHitBox(OBTarget), 2) then
					--point = Vector(Vector(myHero) - point):normalized() * 50
				--end
				--self:MoveTo(point.x, point.z)
			--end
		else
			self:MoveTo(point.x, point.z)
		end
	end
end

function SOW:IsAttack(SpellName)
	return (SpellName:lower():find("attack") or table.contains(self.AttackTable, SpellName:lower())) and not table.contains(self.NoAttackTable, SpellName:lower())
end

function SOW:IsAAReset(SpellName)
	return table.contains(self.AttackResetTable,SpellName:lower())
end
function SOW:OnNewWayPoints(NetworkID)
	local object = objManager:GetObjectByNetworkId(NetworkID)
	if object and object.valid and object.type ~= myHero.type then
		local i = 1
		while i <= #self.ActiveAttacks do
			if (self.ActiveAttacks[i].Attacker and self.ActiveAttacks[i].Attacker.valid and self.ActiveAttacks[i].Attacker.networkID == NetworkID and (self.ActiveAttacks[i].starttime + self.ActiveAttacks[i].windUpTime - GetLatency()/2000) > self:GetTime()) then
				local wpts = WayPointManager:GetWayPoints(object)
				if #wpts > 1 then
					table.remove(self.ActiveAttacks, i)
				else
					i = i + 1
				end
			else
				i = i + 1
			end
		end
	end
end

function SOW:OnProcessSpell(unit, spell)
	if not SOWLoaded then return end
	if unit and unit.valid and spell.target and unit.type ~= myHero.type and spell.target.type == 'obj_AI_Minion' and unit.team == myHero.team and spell and spell.name and self:IsAttack(spell.name) and spell.windUpTime and spell.target then
		if GetDistanceSqr(unit) < 4000000 then

			local time = self:GetTime() + spell.windUpTime + GetDistance(spell.target, unit) / self:GetProjectileSpeed(unit) - GetLatency()/2000
			local i = 1
			while i <= #self.ActiveAttacks do
				if (self.ActiveAttacks[i].Attacker and self.ActiveAttacks[i].Attacker.valid and self.ActiveAttacks[i].Attacker.networkID == unit.networkID) or ((self.ActiveAttacks[i].hittime + 3) < self:GetTime()) then
					table.remove(self.ActiveAttacks, i)
				else
					i = i + 1
				end
			end

			table.insert(self.ActiveAttacks, {Attacker = unit, pos = Vector(unit), Target = spell.target, animationTime = spell.animationTime, damage = self:CalcDamageOfAttack(unit, spell.target, spell, 0), hittime=time, starttime = self:GetTime() - GetLatency()/2000, windUpTime = spell.windUpTime, projectilespeed = self:GetProjectileSpeed(unit)})
		end
	end
	if unit.isMe and self:IsAttack(spell.name) then
		if self.debugdps then
			DPS = DPS and DPS or 0
			print("DPS: "..(1000/(self:GetTime()- DPS)).." "..(1000/(self:AnimationTime())))
			DPS = self:GetTime()
		end
		if not self.DataUpdated and not spell.name:lower():find("card") then
			self.BaseAnimationTime = 1 / (spell.animationTime * myHero.attackSpeed)
			self.BaseWindupTime = 1 / (spell.windUpTime * myHero.attackSpeed)
			if self.debug then
				print("<font color=\"#FF0000\">Basic Attacks data updated: </font>")
				print("<font color=\"#FF0000\">BaseWindupTime: "..self.BaseWindupTime.."</font>")
				print("<font color=\"#FF0000\">BaseAnimationTime: "..self.BaseAnimationTime.."</font>")
				print("<font color=\"#FF0000\">ProjectileSpeed: "..self.ProjectileSpeed.."</font>")
			end
			self.DataUpdated = true
		end
		self.LastAttack = self:GetTime() - self:Latency()
		self.checking = true
		self.LastAttackCancelled = false
		self:OnAttack(spell.target)
		self.checkcancel = self:GetTime()
		DelayAction(function(t) self:AfterAttack(t) end, self:WindUpTime() - self:Latency(), {spell.target})

	elseif unit.isMe and self:IsAAReset(spell.name) then
		DelayAction(function() self:resetAA() end, 0.25)
	end
	
	
end

function SOW:GetPredictedHealth(unit, time, delay)
	local IncDamage = 0
	local i = 1
	local MaxDamage = 0
	local count = 0
	delay = delay and delay or 0.07
	while i <= #self.ActiveAttacks do
		if self.ActiveAttacks[i].Attacker and not self.ActiveAttacks[i].Attacker.dead and self.ActiveAttacks[i].Target and self.ActiveAttacks[i].Target.networkID == unit.networkID then
			local hittime = self.ActiveAttacks[i].starttime + self.ActiveAttacks[i].windUpTime + (GetDistance(self.ActiveAttacks[i].pos, unit)) / self.ActiveAttacks[i].projectilespeed + delay
			if self:GetTime() < hittime - delay and hittime < self:GetTime() + time  then
				IncDamage = IncDamage + self.ActiveAttacks[i].damage
				count = count + 1
				if self.ActiveAttacks[i].damage > MaxDamage then
					MaxDamage = self.ActiveAttacks[i].damage
				end
			end
		end
		i = i + 1
	end

	return unit.health - IncDamage, MaxDamage, count
end

function SOW:GetPredictedHealth2(unit, t)  
	local damage = 0
	local i = 1

	while i <= #self.ActiveAttacks do
		local n = 0
		if (self:GetTime() - 0.1) <= self.ActiveAttacks[i].starttime + self.ActiveAttacks[i].animationTime and self.ActiveAttacks[i].Target and self.ActiveAttacks[i].Target.valid and self.ActiveAttacks[i].Target.networkID == unit.networkID and self.ActiveAttacks[i].Attacker and self.ActiveAttacks[i].Attacker.valid and not self.ActiveAttacks[i].Attacker.dead then
			local FromT = self.ActiveAttacks[i].starttime
			local ToT = t + self:GetTime()

			while FromT < ToT do
				if FromT >= self:GetTime() and (FromT + (self.ActiveAttacks[i].windUpTime + GetDistance(unit, self.ActiveAttacks[i].pos) / self.ActiveAttacks[i].projectilespeed)) < ToT then
					n = n + 1
				end
				FromT = FromT + self.ActiveAttacks[i].animationTime
			end
		end
		damage = damage + n * self.ActiveAttacks[i].damage
		i = i + 1
	end

	return unit.health - damage
end




function SOW:resetAA()
	self.LastAttack = 0
end
--TODO: Change this.
function SOW:BonusDamage(minion)
	local AD = myHero:CalcDamage(minion, myHero.totalDamage)
	local BONUS = 0
	if myHero.charName == 'Vayne' then
		if myHero:GetSpellData(_Q).level > 0 and myHero:CanUseSpell(_Q) == SUPRESSED then
			BONUS = BONUS + myHero:CalcDamage(minion, ((0.05 * myHero:GetSpellData(_Q).level) + 0.25 ) * myHero.totalDamage)
		end
		if not VayneCBAdded then
			VayneCBAdded = true
			function VayneParticle(obj)
				if GetDistance(obj) < 1000 and obj.name:lower():find("vayne_w_ring2.troy") then
					VayneWParticle = obj
				end
			end
			AddCreateObjCallback(VayneParticle)
		end
		if VayneWParticle and VayneWParticle.valid and GetDistance(VayneWParticle, minion) < 10 then
			BONUS = BONUS + 10 + 10 * myHero:GetSpellData(_W).level + (0.03 + (0.01 * myHero:GetSpellData(_W).level)) * minion.maxHealth
		end
	elseif myHero.charName == 'Teemo' and myHero:GetSpellData(_E).level > 0 then
		BONUS = BONUS + myHero:CalcMagicDamage(minion, (myHero:GetSpellData(_E).level * 10) + (myHero.ap * 0.3) )
	elseif myHero.charName == 'Corki' then
		BONUS = BONUS + myHero.totalDamage/10
	elseif myHero.charName == 'MissFortune' and myHero:GetSpellData(_W).level > 0 then
		BONUS = BONUS + myHero:CalcMagicDamage(minion, (4 + 2 * myHero:GetSpellData(_W).level) + (myHero.ap/20))
	elseif myHero.charName == 'Varus' and myHero:GetSpellData(_W).level > 0 then
		BONUS = BONUS + (6 + (myHero:GetSpellData(_W).level * 4) + (myHero.ap * 0.25))
	elseif myHero.charName == 'Caitlyn' then
			if not CallbackCaitlynAdded then
				function CaitlynParticle(obj)
					if GetDistance(obj) < 100 and obj.name:lower():find("caitlyn_headshot_rdy") then
							HeadShotParticle = obj
					end
				end
				AddCreateObjCallback(CaitlynParticle)
				CallbackCaitlynAdded = true
			end
			if HeadShotParticle and HeadShotParticle.valid then
				BONUS = BONUS + AD * 1.5
			end
	elseif myHero.charName == 'Orianna' then
		BONUS = BONUS + myHero:CalcMagicDamage(minion, 10 + 8 * ((myHero.level - 1) % 3))
	elseif myHero.charName == 'TwistedFate' then
			if not TFCallbackAdded then
				function TFParticle(obj)
					if GetDistance(obj) < 100 and obj.name:lower():find("cardmaster_stackready.troy") then
						TFEParticle = obj
					elseif GetDistance(obj) < 100 and obj.name:lower():find("card_blue.troy") then
						TFWParticle = obj
					end
				end
				AddCreateObjCallback(TFParticle)
				TFCallbackAdded = true
			end
			if TFEParticle and TFEParticle.valid then
				BONUS = BONUS + myHero:CalcMagicDamage(minion, myHero:GetSpellData(_E).level * 15 + 40 + 0.5 * myHero.ap)  
			end
			if TFWParticle and TFWParticle.valid then
				BONUS = BONUS + math.max(myHero:CalcMagicDamage(minion, myHero:GetSpellData(_W).level * 20 + 20 + 0.5 * myHero.ap) - 40, 0) 
			end
	elseif myHero.charName == 'Draven' then
			if not CallbackDravenAdded then
				function DravenParticle(obj)
					if GetDistance(obj) < 100 and obj.name:lower():find("draven_q_buf") then
							DravenParticleo = obj
					end
				end
				AddCreateObjCallback(DravenParticle)
				CallbackDravenAdded = true
			end
			if DravenParticleo and DravenParticleo.valid then
				BONUS = BONUS + AD * (0.3 + (0.10 * myHero:GetSpellData(_Q).level))
			end
	elseif myHero.charName == 'Nasusbroken' and VIP_USER then
		if myHero:GetSpellData(_Q).level > 0 and myHero:CanUseSpell(_Q) == SUPRESSED then
			local Qdamage = {30, 50, 70, 90, 110}
			NasusQStacks = NasusQStacks or 0
			BONUS = BONUS + myHero:CalcDamage(minion, 10 + 20 * (myHero:GetSpellData(_Q).level) + NasusQStacks)
			if not RecvPacketNasusAdded then
				function NasusOnRecvPacket(p)
					if p.header == 0xFE and p.size == 0xC then
						p.pos = 1
						pNetworkID = p:DecodeF()
						unk01 = p:Decode2()
				 		unk02 = p:Decode1()
						stack = p:Decode4()
						if pNetworkID == myHero.networkID then
							NasusQStacks = stack
						end
					end
				end
				RecvPacketNasusAdded = true
				AddRecvPacketCallback(NasusOnRecvPacket)
			end
		end
	elseif myHero.charName == "Ziggs" then
		if not CallbackZiggsAdded then
			function ZiggsParticle(obj)
				if GetDistance(obj) < 100 and obj.name:lower():find("ziggspassive") then
						ZiggsParticleObj = obj
				end
			end
			AddCreateObjCallback(ZiggsParticle)
			CallbackZiggsAdded = true
		end
		if ZiggsParticleObj and ZiggsParticleObj.valid then
			local base = {20, 24, 28, 32, 36, 40, 48, 56, 64, 72, 80, 88, 100, 112, 124, 136, 148, 160}
			BONUS = BONUS + myHero:CalcMagicDamage(minion, base[myHero.level] + (0.25 + 0.05 * (myHero.level % 7)) * myHero.ap)  
		end
	end

	return BONUS
end

function SOW:KillableMinion()
	local result
	for i, minion in ipairs(self.EnemyMinions.objects) do
		local time = self:WindUpTime(true) + GetDistance(minion, myHero) / self.ProjectileSpeed - 0.07
		local PredictedHealth = self:GetPredictedHealth(minion, time, GetSave("SOW").FarmDelay / 1000)
		if self:ValidTarget(minion) and PredictedHealth < self:CalcDamageOfAttack(myHero, minion, {name = "Basic"}, 0) + self:BonusDamage(minion) and PredictedHealth > -40 then
			result = minion
			break
		end
	end
	return result
end

function SOW:ShouldWait()
	for i, minion in ipairs(self.EnemyMinions.objects) do
		local time = self:AnimationTime() + GetDistance(minion, myHero) / self.ProjectileSpeed - 0.07
		if self:ValidTarget(minion) and self:GetPredictedHealth2(minion, time * 2) < (self:CalcDamageOfAttack(myHero, minion, {name = "Basic"}, 0) + self:BonusDamage(minion)) then
			return true
		end
	end
end

function SOW:ValidStuff()
	local result = self:GetTarget()

	if result then 
		return result
	end

	for i, minion in ipairs(self.EnemyMinions.objects) do
		local time = self:AnimationTime() + GetDistance(minion, myHero) / self.ProjectileSpeed - 0.07
		local pdamage2 = minion.health - self:GetPredictedHealth(minion, time, GetSave("SOW").FarmDelay / 1000)
		local pdamage = self:GetPredictedHealth2(minion, time * 2)
		if self:ValidTarget(minion) and ((pdamage) > 2*self:CalcDamageOfAttack(myHero, minion, {name = "Basic"}, 0) + self:BonusDamage(minion) or pdamage2 == 0) then
			return minion
		end
	end

	for i, minion in ipairs(self.JungleMinions.objects) do
		if self:ValidTarget(minion) then
			return minion
		end
	end

	for i, minion in ipairs(self.OtherMinions.objects) do
		if self:ValidTarget(minion) then
			return minion
		end
	end
end

function SOW:GetTarget(OnlyChampions)
	local result
	local healthRatio

	if self:ValidTarget(self.forcetarget) then
		return self.forcetarget
	elseif self.forcetarget ~= nil then
		return nil
	end

	if (not self.STS or not OnlyChampions) and self:ValidTarget(GetTarget()) and (GetTarget().type == myHero.type or (not OnlyChampions)) then
		return GetTarget()
	end

	if self.STS then
		local oldhitboxmode = self.STS.hitboxmode
		self.STS.hitboxmode = true

		result = self.STS:GetTarget(myHero.range)

		self.STS.hitboxmode = oldhitboxmode
		return result
	end

	for i, champion in ipairs(GetEnemyHeroes()) do
		local hr = champion.health / myHero:CalcDamage(champion, 200)
		if self:ValidTarget(champion) and ((healthRatio == nil) or hr < healthRatio) then
			result = champion
			healthRatio = hr
		end
	end

	return result
end

function SOW:Farm(mode, point)
	if mode == 1 then
		self.EnemyMinions:update()
		local target = self:KillableMinion() or self:GetTarget()
		self:OrbWalk(target, point)
		self.mode = 1
	elseif mode == 2 then
		self.EnemyMinions:update()
		self.OtherMinions:update()
		self.JungleMinions:update()

		local target = self:KillableMinion()
		if target then
			self:OrbWalk(target, point)
		elseif not self:ShouldWait() then

			if self:ValidTarget(self.lasttarget) then
				target = self.lasttarget
			else
				target = self:ValidStuff()
			end
			self.lasttarget = target
			
			self:OrbWalk(target, point)
		else
			self:OrbWalk(nil, point)
		end
		self.mode = 2
	elseif mode == 3 then
		self.EnemyMinions:update()
		local target = self:KillableMinion()
		self:OrbWalk(target, point)
		self.mode = 3
	end
end

function SOW:OnTick()
	if not self.Menu.Enabled then return end
	if myHero.ischanelling then return end
	if self.Menu.Mode0 then
		local target = self:GetTarget(true)
		if target then
			self:OrbWalk(target)
		else
			self:OrbWalk()
		end
		self.mode = 0
	elseif self.Menu.Mode1 then
		self:Farm(1)
	elseif self.Menu.Mode2 then
		self:Farm(2)
	elseif self.Menu.Mode3 then
		self:Farm(3)
	else
		self.mode = -1
	end
end

function SOW:GetHitBox(object)
	--if self.nohitboxmode and object.type and object.type == myHero.type then
		--return 0
	--end
	if not SOWLoaded then return end
	if object and object.type == "obj_BarracksDampener" then 
		return 190
	elseif object and object.type == "obj_HQ" then 
		return 290
	else
		return (self.hitboxes[object.charName] ~= nil and self.hitboxes[object.charName] ~= 0) and self.hitboxes[object.charName]  or 65
	end
end

function SOW:GetProjectileSpeed(unit)
	return self.projectilespeeds[unit.charName] and self.projectilespeeds[unit.charName] or math.huge
end

function SOW:CalcDamageOfAttack(source, target, spell, additionalDamage)
	-- read initial armor and damage values
	local armorPenPercent = source.armorPenPercent
	local armorPen = source.armorPen
	local totalDamage = source.totalDamage + (additionalDamage or 0)
	local damageMultiplier = spell.name:find("CritAttack") and 2 or 1

	-- minions give wrong values for armorPen and armorPenPercent
	if source.type == "obj_AI_Minion" then
		armorPenPercent = 1
	elseif source.type == "obj_AI_Turret" then
		armorPenPercent = 0.7
	end

	-- turrets ignore armor penetration and critical attacks
	if target.type == "obj_AI_Turret" then
		armorPenPercent = 1
		armorPen = 0
		damageMultiplier = 1
	end

	-- calculate initial damage multiplier for negative and positive armor

	local targetArmor = (target.armor * armorPenPercent) - armorPen
	if targetArmor < 0 then -- minions can't go below 0 armor.
		--damageMultiplier = (2 - 100 / (100 - targetArmor)) * damageMultiplier
		damageMultiplier = 1 * damageMultiplier
	else
		damageMultiplier = 100 / (100 + targetArmor) * damageMultiplier
	end

	-- use ability power or ad based damage on turrets
	if source.type == myHero.type and target.type == "obj_AI_Turret" then
		totalDamage = math.max(source.totalDamage, source.damage + 0.4 * source.ap)
	end

	-- minions deal less damage to enemy heros
	if source.type == "obj_AI_Minion" and target.type == myHero.type and source.team ~= TEAM_NEUTRAL then
		damageMultiplier = 0.60 * damageMultiplier
	end

	-- heros deal less damage to turrets
	if source.type == myHero.type and target.type == "obj_AI_Turret" then
		damageMultiplier = 0.95 * damageMultiplier --0.95
	end

	-- minions deal less damage to turrets
	if source.type == "obj_AI_Minion" and target.type == "obj_AI_Turret" then
		damageMultiplier = 0.475 * damageMultiplier
	end

	-- siege minions and superminions take less damage from turrets
	if source.type == "obj_AI_Turret" and (target.charName == "Red_Minion_MechCannon" or target.charName == "Blue_Minion_MechCannon" or target.charName == "SRU_ChaosMinionSiege"or target.charName == "SRU_OrderMinionSiege") then
		damageMultiplier = 0.7 * damageMultiplier
	end

	-- caster minions and basic minions take more damage from turrets
	if source.type == "obj_AI_Turret" and (target.charName == "Red_Minion_Wizard" or target.charName == "Blue_Minion_Wizard" or target.charName == "Red_Minion_Basic" or target.charName == "Blue_Minion_Basic" or target.charName == "SRU_ChaosMinionMelee" or target.charName == "SRU_OrderMinionMelee" or target.charName == "SRU_ChaosMinionRanged" or target.charName == "SRU_OrderMinionRanged") then
		damageMultiplier = (1 / 0.875) * damageMultiplier
	end

	-- turrets deal more damage to all units by default
	if source.type == "obj_AI_Turret" then
		damageMultiplier = 1.05 * damageMultiplier
	end

	-- calculate damage dealt
	return damageMultiplier * totalDamage
end
function SOW:_OnDraw()
	if not self.Menu.Enabled  or not SOWLoaded then return end
				if self.Menu.Draw.DrawAA then 
					self:DrawAARange()
				end
				if self.Menu.Draw.DrawMinionLasthit then 
					 self:DrawKillable()
					
				end	
				
end
function SOW:DrawAARange(width, color)
	local p = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
	if OnScreen(p.x, p.y) then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, self:MyRange() + 25, width or 1, color or ARGB(255, 255, 0, 0))
	end
end
function SOW:DrawCircleNextLvl(x, y, z, radius, width, color, chordlength)
	radius = radius or 300
	quality = math.max(8,math.floor(180/math.deg((math.asin((chordlength/(2*radius)))))))
	quality = 2 * math.pi / quality
	radius = radius*.92
	local points = {}
	for theta = 0, 2 * math.pi + quality, quality do
		local c = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
		points[#points + 1] = D3DXVECTOR2(c.x, c.y)
	end
	DrawLines2(points, width or 1, color or 4294967295)
end

function SOW:DrawCircle2(x, y, z, radius, color)
	local vPos1 = Vector(x, y, z)
	local vPos2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
	local tPos = vPos1 - (vPos1 - vPos2):normalized() * radius
	local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
	if OnScreen({ x = sPos.x, y = sPos.y }, { x = sPos.x, y = sPos.y })  then
		self:DrawCircleNextLvl(x, y, z, radius, 1, color, 75)	
	end
end

function SOW:DrawKillable()
	local minion = self:KillableMinion()
	self:DrawCircle2(minion.x,minion.y,minion.z,100,ARGB(255,0,255,0))
	
end 
