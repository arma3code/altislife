/*

	Filename: 	UnionClient_system_removeWeapons.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_cop","_ItemInfo","_uniform","_vest","_headgear ","_pWeapon","_sWeapon","_hWeapon","_whitelist","_itemArray","_reward"];
_cop = param [0,Objnull,[objNull]];
if (EQUAL(_cop,player)) exitWith {};
if (ISPSIDE(west)) exitWith {};
if ([LIFE_SETTINGS(getText,"life_weaponSearchException")] call UnionClient_system_conditionsCheck) exitWith {};

if (isNull _cop OR !(GVAR_RESTRAINED(player))) exitWith {};

_whitelist = 
[
	"hgun_Rook40_F",
	"hgun_P07_F",
	"hgun_mas_bhp_F",
	"hgun_mas_m9_F",
	"hgun_mas_glock_F",
	"hgun_mas_mak_F",
	"hgun_mas_uzi_F",
	"hgun_Pistol_heavy_02_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_mas_mp7p_F",

	"SMG_03_TR_khaki",
	"SMG_03C_TR_khaki",	
	
	"Extremo_Tool_Axe", 
	"Extremo_Tool_PickAxe", 
	"Extremo_Tool_Shovel",
	"Extremo_Tool_Hoe",
	
	"NVGoggles_OPFOR",
	"NVGoggles_INDEP", 
	"NVGoggles",
	
	"extItem_CarltonDraught",
	"extItem_Coopers",
	"extItem_Corona",
	"extItem_Jimbeam",
	"extItem_SmithsChips",
	"extItem_Steak",
	"extItem_defibrillator", 
	"extItem_ItemRepairKit", 
	"extItem_bottleclean_100", 
	"extItem_bottleclean_50",
	"extItem_canteen_clean_3",
	"extItem_canteen_clean_2",
	"extItem_canteen_clean_1",
	"extItem_canopener",
	"extItem_matches",
	"extItem_Fuelcan",
	"extItem_Fuelcan_empty",
	"extItem_ItemDetoxin",
	"extItem_ItemRadX",
	"extItem_bottle_empty",
	"extItem_canteen_empty",
	"extItem_canteen_salt",
	"extItem_bottle_salt",
	"extItem_knife",
	"extItem_Waterpure",
	"extItem_antibiotic",
	"extItem_vitaminbottle",
	"extItem_bandage",
	"extItem_painkillers",
	"extItem_ItemMorphine",
	"extItem_ItemSurgeryKit",
	"extItem_Buffout",
	"extItem_Meat",
	"extItem_MeatC",
	"extItem_cereal",
	"extItem_TacticalBacon",
	"extItem_BakedBeans",
	"extItem_franta",
	"extItem_Spirit",
	"extItem_redgull",
	"extItem_woodenLog",
	
	"tf_microdagr",
	"tf_fadak",
	"tf_anprc154",
	"tf_anprc148jem",

	"16Rnd_9x21_Mag",
	"30Rnd_9x21_Mag",
	"15Rnd_mas_9x21_Mag",
	"17Rnd_mas_9x21_Mag",
	"8Rnd_mas_9x18_Mag",
	"25Rnd_mas_9x19_Mag",
	"6Rnd_45ACP_Cylinder",
	"11Rnd_45ACP_Mag",
	"40Rnd_mas_46x30_Mag",
	"50Rnd_570x28_SMG_03",

	"acc_flashlight",

	"V_Rangemaster_belt",
	"V_BandollierB_khk",
	"V_TacVest_khk",
	"V_TacVest_brn",
	"EXT_Tac_Vest_1",
	"EXT_Tac_Vest_2",
	"EXT_Tac_Vest_3",
	"EXT_Tac_Vest_4",
	"EXT_Tac_Vest_5",
	"EXT_Tac_Vest_6",
	"V_TacVestIR_blk",
	
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_redwhite",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_Poor_2",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla3_1",
	"U_OrestesBody",
	"U_IG_Guerilla2_3",
	"U_C_HunterBody_grn",
	"U_C_WorkerCoveralls",
	"U_PMC_BluePlaidShirt_BeigeCords",
	"U_PMC_RedPlaidShirt_DenimCords",
	"U_PMC_BluPolo_BgPants",
	"U_PMC_WhtPolo_BluPants",
	"U_PMC_WhtPolo_GrnPants",
	"U_PMC_BrnPolo_BgPants",
	"U_PMC_GrnPolo_BgPants",
	"U_PMC_WhtPolo_BgPants",
	"U_PMC_WTShirt_DJeans",
	"TRYK_U_B_PCUGs_gry_R",
	"TRYK_U_B_PCUGs_OD_R",
	"TRYK_U_B_PCUGs_gry",
	"TRYK_U_B_PCUGs_OD",
	"TRYK_U_B_wh_tan_Rollup_CombatUniform",
	"TRYK_shirts_DENIM_BL",
	"TRYK_shirts_DENIM_BWH",
	"TRYK_shirts_DENIM_od",
	"TRYK_shirts_DENIM_R",
	"TRYK_shirts_DENIM_RED2",
	"TRYK_shirts_DENIM_WH",
	"TRYK_shirts_DENIM_WHB",
	"TRYK_shirts_DENIM_ylb",
	"TRYK_U_denim_hood_nc",
	"TRYK_U_denim_jersey_blk",
	"TRYK_U_denim_jersey_blu",
	"TRYK_U_B_RED_T_BR",
	"TRYK_U_B_Denim_T_BK",
	"TRYK_U_B_Denim_T_WH",
	"rds_uniform_assistant",
	"rds_uniform_schoolteacher",
	"rds_uniform_citizen1",
	"rds_uniform_citizen2",
	"rds_uniform_citizen3",
	"rds_uniform_citizen4",
	"rds_uniform_Profiteer1",
	"rds_uniform_Profiteer2",
	"rds_uniform_Profiteer3",
	"rds_uniform_Profiteer4",
	"rds_uniform_Villager1",
	"rds_uniform_Villager2",
	"rds_uniform_Villager3",
	"rds_uniform_Villager4",
	"rds_uniform_Woodlander1",
	"rds_uniform_Woodlander2",
	"rds_uniform_Worker1",
	"rds_uniform_Worker2",
	"rds_uniform_Worker3",
	"rds_uniform_Worker4",
	"IRA_Soldier_Outfit_10",
	"A3L_CivShirtAdidasMake",
	"A3L_CivShirtAdidas",
	"A3L_CivShirtAnotherCat",
	"A3L_CivShirtBillabong",
	"A3L_CivShirtBillabong2",
	"A3LCatShirt",
	"A3LCloudShirt",
	"A3LCokeShirt",
	"A3L_CivShirtDiamond",
	"A3L_CivShirtDJ",
	"A3L_CivShirtGetHigh",
	"A3LHandShirt",
	"A3L_CivShirtHollister",
	"A3L_CivShirtKeepCalm",
	"A3L_CivShirtNikeCamo",
	"A3L_CivShirtNikeDoIt2",
	"A3L_CivShirtNikeDoIt",
	"A3L_CivShirtNikeFeet",
	"A3L_CivShirtOhBoy",
	"A3LPikaShirt",
	"A3L_CivShirtProbe",
	"A3L_CivShirtRelationships",
	"A3L_CivShirtThanksObama",
	"A3LTigerShirt",
	"A3L_CivShirtVans2",
	"A3L_CivShirtVans",
	"A3L_CivShirtVolcomLogo",
	"A3L_CivShirtVolcomMonster",
	"A3L_CivShirtVolcom",
	"A3LWolfShirt",
	"rds_uniform_priest",
	"TRYK_SUITS_BLK_F",
	"TRYK_SUITS_BR_F",
	"U_Extremo_Taxi",
	"A3L_Dude_Outfit",
	"A3L_Farmer_Outfit",
	"A3L_Worker_Outfit",
	"BluePlaid_uni",
	"GreenPlaid_uni",
	"OrangePlaid_uni",
	"PinkPlaid_uni",
	"RedPlaid_uni",
	"YellowPlaid_uni",
	"BlGnGy_uni",
	"BlGyBr_uni",
	"checkered_uni",
	"GbGyBr_uni",
	"GnBlBr_uni",
	"GnGyBr_uni",
	"poloranger_uni",
	"GyBlBr_uni",
	"MotherTrucker_uni",
	"OrBlBr_uni",
	"OrGnGy_uni",
	"OrGyBr_uni",
	"PkGnGy_uni",
	"PkGyBr_uni",
	"RdBlBr_uni",
	"RdGnGy_uni",
	"RdGyBr_uni",
	"sohoku_uni",
	"WhBlBr_uni",
	"YlBlBr_uni",
	"YlGnGy_uni",			
	"cg_awesome1",
	"cg_bb1",
	"cg_beats1",
	"cg_bendozlia3",
	"cg_bipolar1",
	"cg_burgerking1",
	"cg_chickens1",
	"cg_condoms1",
	"cg_csgo1",
	"cg_deeznuts1",
	"cg_et1",
	"cg_evolution1",
	"cg_ferrari1",
	"cg_fightclub1",
	"cg_gameover1",
	"cg_herpderp1",
	"cg_hand1",
	"cg_homer1",
	"cg_iamstupid1",
	"cg_illuminati1",
	"cg_jason1",
	"cg_joker1",
	"cg_kfc1",
	"cg_leppy1",
	"cg_lsd1",
	"cg_peanut1",
	"cg_pika1",
	"cg_rageface1",
	"cg_shark1",
	"cg_stoned1",
	"cg_turtles1",
	"cg_upyours1",
	"cg_rastaciv",
	"KAEL_SUITS_BR_F15",
	"KAEL_SUITS_BR_F16",
	"KAEL_SUITS_BR_F17",
	"KAEL_SUITS_BR_F18",
	"KAEL_SUITS_BR_F19",
	"KAEL_SUITS_BR_F20",
	"KAEL_SUITS_BR_F21",
	"KAEL_SUITS_BR_F22",
	"KAEL_SUITS_BR_F23",
	"KAEL_SUITS_BR_F24",
	"KAEL_SUITS_BR_F25",
	"KAEL_SUITS_BR_F29",
	"KAEL_SUITS_BR_F30",
	"KAEL_SUITS_BR_F31",
	"KAEL_SUITS_BR_F32",
	"KAEL_SUITS_BR_F33",
	"KAEL_SUITS_BR_F34",
	"KAEL_SUITS_BR_F35",
	"EXT_U_Rocker_01",
	"EXT_U_Rocker_02",
	"EXT_U_Rocker_03",
	"EXT_U_Rocker_04",

	"U_C_Man_casual_1_F",
	"U_C_Man_casual_2_F",
	"U_C_Man_casual_3_F",
	"U_C_Man_casual_4_F",
	"U_C_Man_casual_5_F",
	"U_C_Man_casual_6_F",
	"U_C_man_sport_1_F",
	"U_C_man_sport_2_F",
	"U_C_man_sport_3_F"
];

_uniform = PUNIFORM;
_vest = PVEST;
_headgear = PHEADGEAR;
_pWeapon = RIFLE;
_sWeapon = LAUNCHER;
_hWeapon = PISTOL;
_reward = 0;

if (!(EQUAL(_pWeapon,"")) && {!(_pWeapon in _whitelist)}) then {
	player removeWeapon _pWeapon;
	_reward = _reward + (round((M_CONFIG(getNumber,"LifeCfgItems",_pWeapon,"price")) / 4)); 
	_ItemInfo = [_pWeapon] call UnionClient_system_itemDetails;
	systemchat format["%1, ваше нелегальное оружие (%3) изъято сотрудником полиции %2", GVAR_RNAME(player), GVAR_RNAME(_cop), _ItemInfo select 1];
};

if (!(EQUAL(_hWeapon,"")) && {!(_hWeapon in _whitelist)}) then {
	player removeWeapon _hWeapon;
	_reward = _reward + (round((M_CONFIG(getNumber,"LifeCfgItems",_hWeapon,"price")) / 4));
	_ItemInfo = [_hWeapon] call UnionClient_system_itemDetails;	
	systemchat format["%1, ваше нелегальное оружие (%3) изъято сотрудником полиции %2", GVAR_RNAME(player), GVAR_RNAME(_cop), _ItemInfo select 1];
};

if (!(EQUAL(_sWeapon,"")) && {!(_sWeapon in _whitelist)}) then {
	player removeWeapon _sWeapon;
	{
		if (_x in ["RPG7_PG7V","RPG7_PG7VR"]) then {player removeMagazine _x};
	} foreach (magazines player);
	_reward = _reward + (round((M_CONFIG(getNumber,"LifeCfgItems",_sWeapon,"price")) / 4));
	_ItemInfo = [_sWeapon] call UnionClient_system_itemDetails;
	systemchat format["%1, ваше нелегальное оружие (%3) изъято сотрудником полиции %2", GVAR_RNAME(player), GVAR_RNAME(_cop), _ItemInfo select 1];
};

//удаляем нелегал
{
	if !(_x in _whitelist) then {
		if ([_x] call UnionClient_system_removeItem) then {
			_reward = _reward + (round((M_CONFIG(getNumber,"LifeCfgItems",_x,"price")) / 4));
		};
	};
} forEach (items player);

if (!(EQUAL(_vest,"")) && {!(_vest in _whitelist)}) then {
	removeVest player;	
	systemchat format["%1, ваша нелегальная разгрузка изъята сотрудником полиции %2", GVAR_RNAME(player), GVAR_RNAME(_cop)];
};

if (!(EQUAL(_uniform,"")) && {!(_uniform in _whitelist)}) then {
	removeUniform player;	
	systemchat format["%1, ваша нелегальная одежда изъята сотрудником полиции %2", GVAR_RNAME(player), GVAR_RNAME(_cop)];
};

if (_reward > 0) then {
	[player,_reward] remoteExecCall ["UnionClient_system_removeWeaponsReward",_cop];
};

[] call UnionClient_system_saveGear;