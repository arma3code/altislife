/*

	Filename: 	UnionClient_system_configuration.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
life_PossibleToggleTime = 0;
life_PadIsPowerOn = false;
life_admin_mode = false;
life_admin_actions = [];
life_admin_uniform = [];
life_last_sold_vid = 0;
life_jumping = false;
life_actions = [];
life_tfWarn = 0;
life_myserver = 0;
life_query_time = time;
life_action_delay = time;
life_santa_delay = time;
life_trunk_vehicle = Objnull;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_connected = false;
life_action_gathering = false;
life_drink = 0;
life_logout_position = [];
life_jail_time = 0;
life_god = false;
life_frozen = false;
life_markers = false;
life_expoints = 0;
life_meth_bb = 0;
life_fadeSound = false;
life_prisonkey = false;
life_action_gangInUse = false;
life_slave = false;
life_veh_trunk_sync = [];
life_atm_timer = time;
life_garage_timer = time;
life_vshop_timer = time;
life_death_timer = false;
life_garage_sp_name = "none";
life_playerTrasnferDone = false;
life_mycrimes = [];
life_ids = [];
life_tempHouses = [];
life_speedTicket = 0;
life_speedCaught = 0;
life_artpoint = "";
life_medic_wantedList = [];
life_medicstatus = -1;
life_medicstatusby = "";
life_smartphoneCash = [];
life_hit_by_car = false;
SetGangLicense = "";
life_gov = false; //губернатор ли я
life_tmp_tax = 0; //налоги на отправку
life_tmp_selled = []; //проданное говно
life_fractionInUse = false;
life_creditInUse = false;
life_haveCredit = [];
life_ltdData = [];
life_deathScreen_canRespawn = false;
life_lastVehicle = vehicle player;

adac_vehicleToUpgrade = ObjNull;
life_DraggedBody = ObjNull;

life_dhl_car = ObjNull;
life_dhl_box = ObjNull;
life_dhl_orderInProgress = false;

life_arc_currentZones = [];
life_arc_currentZone = "";
life_arc_currentPoint = [];

life_firstTime = true;
life_newLife = false;
life_teargas = false;

prison_gear = [];
life_dance = false;

["all"] call UnionClient_system_removeBuff;

life_debuff1 = false;
life_debuff2 = false;
life_debuff3 = false;
life_debuff4 = false;
life_debuff5 = false;

life_buff1 = false;
life_buff2 = false;
life_buff3 = false;
life_buff4 = false;
life_buff5 = false;

life_pvp = false;
life_pvp_start = 0;

life_currentContainer = objNull;
life_ContainerOpened = false;

life_surrended = false;
life_inwarzone = false;

life_karma = 0;
life_tree_chop = [objNull,0];

life_process_info = [];

//spawn func handlers
LIFE_HANDLE_EFFECTS = objNull;
LIFE_HANDLE_HUD = objNull;
LIFE_HANDLE_DRUGS = objNull;
LIFE_HANDLE_DMG = objNull;
LIFE_HANDLE_SICK = objNull;
LIFE_HANDLE_DRUNK = objNull;
LIFE_HANDLE_FOODWATER = objNull;
LIFE_HANDLE_WEIGHT = objNull;
LIFE_HANDLE_PVP = objNull;
LIFE_HANDLE_WARZONES = objNull;
LIFE_HANDLE_POSITION = objNull;
LIFE_HANDLE_TEAMSPEAK = objNull;
LIFE_HANDLE_URAN = objNull;
LIFE_HANDLE_TEMPVARS = objNull;

LIFE_HANDLE_HEROINE = objNull;
LIFE_HANDLE_COCAINE = objNull;
LIFE_HANDLE_MARJ = objNull;
LIFE_HANDLE_LSD = objNull;

//Post process effects
LIFE_PPE_DAMAGE05 = -1;
LIFE_PPE_DRUNK = -1;
LIFE_PPE_DRUGS_DB = -1;
LIFE_PPE_DRUGS_CA = -1;

life_message1 = false;
life_message2 = false;
life_message3 = false;
life_message4 = false;
life_message5 = false;

life_mapFirstTimeOpen = true;

life_indicators_array = [
	"life_hunger",
	"life_thirst",
	"life_death_markers",
	"life_death_endtime",
	"TF_speak_volume_meters",
	"life_grassIndex",
	"life_myPassportID",
	"life_myIdentity",
	"life_myTagID",
	"life_myPadSkinID",
	"life_myTitleID"
];

life_myIdentity = "";
life_death_markers = [];
life_death_endtime = 0;
life_thirst = 100;
life_hunger = 100;
TF_speak_volume_meters = 20;
life_grassIndex = 50;
life_myPassportID = "";
life_deaths = 0;
life_deaths_max = 3;
life_myTagID = "";
life_myPadSkinID = "default";
life_myTitleID = "default";

life_gui_theme = "white";

life_viewDistanceFoot = GVAR_PRNS ["life_viewDistanceFoot",1250];
life_viewDistanceCar = GVAR_PRNS ["life_viewDistanceCar",1250];
life_viewDistanceAir = GVAR_PRNS ["life_viewDistanceAir",1250];
life_myThemeID = GVAR_PRNS ["life_myThemeID","default"];

//параметры домов
life_houses = [];
life_houses_count = 0;
life_house_box = ObjNull;

//параметры группировок
life_gangData = [];

life_clothing_purchase = [[],[],[],[],[]];

life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_action_in_use = false;
life_smartphoneTarget = ObjNull;

life_vehicles = [];
bank_robber = [];

DCASH = 0; //грязные деньги
CASH = 0;
BANK = 0;
life_cashX = round (random(30));
life_dcashX = round (random(20));
life_atmX = round (random(10));
life_moneyCache = life_cashX;
life_dmoneyCache = life_dcashX;
life_atmmoneyCache = life_atmX;

//эффекты наркотиков, болезни, переломы, кровотечения и т.п.
life_config_array =
[
	"life_drug_light",
	"life_drug_hard",
	"life_sickness",
	"life_diarrhea",
	"life_tagson",
	"life_canUseWarZone",
	"life_isGirl",
	"life_showFPS",
	"life_canBill"
];
//обнуляем эффекты
{
	SVAR_MNS [_x,false];
} foreach life_config_array;
life_tagson = true;
life_showHUD = true;
//активные рецепты на сервере
{
	SVAR_MNS [RECIPE_VARNAME(configName _x),false];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgRecipes"));

//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));

//Licenses [license var, civ/cop]
private ["_varName","_sideFlag"];
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");

	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgLicenses"));

call UnionClient_config_loadFromProfile;