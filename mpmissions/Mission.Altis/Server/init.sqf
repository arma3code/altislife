#include "script_macros.hpp"
/*
	Filename: 	init.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
publicVariable "life_server_isReady";
private _extDBNotLoaded = "";
serv_sv_use = [];
life_cleanupQueue = [];
life_economyUpdata = true;//Включение динамик маркета в ФСМ
life_save_civilian_position = if (LIFE_SETTINGS(getNumber,"save_civilian_position") isEqualTo 0) then {false} else {true};
fn_whoDoneIt = compile preprocessFileLineNumbers "\UnionServer\Functions\Systems\fn_whoDoneIt.sqf";
TON_fnc_doubledigits = {
    if (_this < 10) exitWith {"0"+str _this};
    str _this
};

{
    missionNamespace setVariable [_x select 0,_x select 1,true];
} forEach [
    //Restart
    ["forceRestartTime", 14400],
    ["server_ddos_air", false],
    ["server_ddos_ts", false],
    ["server_restartsoon", false],
    //gangs
    ["life_westGangId", 1],
    ["life_eastGangId", 2],
    //TASKFORCE
    ["tf_radio_server_name", "Union Altis Life"],
    ["tf_radio_channel_name", "TaskForceRadio Channel"],
    ["tf_radio_channel_password", "fdsfsASDgfdf234234DFDA"],
	//Gov
	["server_creditTax",0],
    ["server_donat_vehicles",["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F","B_APC_Wheeled_01_cannon_F","I_mas_BTR60","I_mas_BRDM2","I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_AA_F","O_APC_Tracked_02_AA_F","O_mas_ZSU_OPF_01","B_APC_Tracked_01_CRV_F","I_APC_tracked_03_cannon_F","B_MBT_01_cannon_F","B_MBT_01_TUSK_F","I_mas_BMP1P_AAF_01","I_mas_BMP1_AAF_01","I_mas_BMP2_HQ_AAF_01","I_mas_BMP2_AAF_01","O_MBT_02_cannon_F","I_MBT_03_cannon_F","I_mas_T55_AAF_01","I_mas_T34_AAF_01","B_Heli_Light_01_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F","I_Heli_light_03_dynamicLoadout_F","EC635_CSAT","B_mas_UH1Y_F","B_mas_UH60M","O_Heli_Attack_02_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F"]],
	["server_tax",0],
	["server_bank",0],
	["server_poor",0],
	["server_mar_legal",false],
	["server_slavery",false],
    ["server_candidates",[]],
	["server_govinfo",[]],
	["server_warzones",[]],
	//Economy
	["sell_array", []],
	["buy_array", []],
	["life_illegal_items", []],
	//---
	["ObjectsToHide", []],
    ["life_JailSmallPoints", [[3294.85,12477.6,0.00143909],[3294.34,12479.8,0.00143909],[3297.23,12480.4,0.00143909]]],
	["life_JailBigPoints", [[23784,16090.5,0.00143909],[23782.9,16092.1,0.00143909],[23783.7,16092.7,0.00143909],[23784.6,16091.4,0.00143909],[23785.8,16093.1,0.00143909],[23787.9,16093.7,0.00143909],[23786.9,16095.1,0.00143909]]]
];


TON_fnc_getServerTime = {(call compile (EXTDB "9:LOCAL_TIME"))select 1};
TON_fnc_UpTime = {(call compile (EXTDB "9:UPTIME:MINUTES")) select 1};
TON_fnc_DateAdd = {(call compile (EXTDB format ["9:DATEADD:%1:[%2,0,0,0]",(call TON_fnc_getServerTime),_this]))  select 1};
TON_fnc_getRealTime = {
   private _time = (call TON_fnc_getServerTime);
   format ["Union Altis Life  [%4:%5 %3-%2-%1]",_time select 0 call TON_fnc_doubledigits,_time select 1 call TON_fnc_doubledigits,_time select 2 call TON_fnc_doubledigits,_time select 3 call TON_fnc_doubledigits,_time select 4 call TON_fnc_doubledigits]
};
TON_fnc_addTime = {
    private _time1 = _this select 0;
    private _time2 = _this select 1;
    (call compile (EXTDB format ["9:TIMEDIFF:HOURS:%1:%2",_time1,_time2])) select 1
};
missionNamespace setVariable ["server_timeText",(call TON_fnc_getRealTime),true];
//Prepare the headless client.
life_HC_isActive = false;
publicVariable "life_HC_isActive";
HC_Life = false;
publicVariable "HC_Life";

//[] execVM "\UnionServer\initHC.sqf";//Включает хедлессклиент
east setFriend [west, 1];
east setFriend [civilian, 1];
east setFriend [independent, 1];

west setFriend [east, 1];
west setFriend [civilian, 1];
west setFriend [independent, 1];

independent setFriend [east, 1];
independent setFriend [civilian, 1];
independent setFriend [west, 1];

civilian setFriend [east, 1];
civilian setFriend [independent, 1];
civilian setFriend [west, 1];

// Prepare extDB before starting the initialization process for the server.
if (isNil {uiNamespace getVariable "life_sql_id"}) then {
    life_sql_id = round(random(9999));
    CONSTVAR(life_sql_id);
    uiNamespace setVariable ["life_sql_id",life_sql_id];
        try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(life_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDBNotLoaded = [true, _exception];
    };
	if (_extDBNotLoaded isEqualType []) exitWith {};

	//EXTDB "9:START_RCON:RCON";
	//EXTDB "9:ADD_PROTOCOL:RCON:rcon";

    EXTDB "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    life_sql_id = uiNamespace getVariable "life_sql_id";
    CONSTVAR(life_sql_id);
    diag_log "extDB3: Still Connected to Database";
};


if (_extDBNotLoaded isEqualType []) exitWith {
    life_server_extDB_notLoaded = true;
    publicVariable "life_server_extDB_notLoaded";
};
life_server_extDB_notLoaded = false;
publicVariable "life_server_extDB_notLoaded";

/* Run stored procedures for SQL side cleanup */
["CALL resetLifeVehicles",1] call DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall;
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;
["CALL deleteOldGangs",1] call DB_fnc_asyncCall;
["CALL deleteOldVips",1] call DB_fnc_asyncCall;

private _timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------- Starting Life Server Init ------------------------------------";
diag_log "------------------------------------------ Version 4.4R3 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

[8,true,12] execFSM "\UnionServer\FSM\timeModule.fsm";
cleanupFSM = [] execFSM "\UnionServer\FSM\cleanup.fsm";
server_monitorFSM = [] execFSM "\UnionServer\FSM\server_monitor.fsm";

if (LIFE_SETTINGS(getNumber,"save_civilian_position_restart") isEqualTo 1) then {
    [] spawn {
        _query = "UPDATE players SET connected = '0' WHERE connected = '1'";
        [_query,1] call DB_fnc_asyncCall;
    };
};

["UPDATE players SET first_time = '1' WHERE first_time = '0'",1] call DB_fnc_asyncCall;
["UPDATE players SET deaths = '0' WHERE deaths > '0'",1] call DB_fnc_asyncCall;
["UPDATE battleveh SET times = '0'",1] call DB_fnc_asyncCall;
["UPDATE economy SET sellprice = '90000' WHERE resource = 'goldbar'",1] call DB_fnc_asyncCall;
/* Map-based server side initialization. */
master_group attachTo[bank_obj,[0,0,0]];

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */
/* life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; */

/* Set the amount of gold in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn TON_fnc_federalUpdate;
[] spawn TON_fnc_loadPrices;
/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\UnionServer\functions.sqf";

/* Set OwnerID players for Headless Client */
TON_fnc_requestClientID =
{
    (_this select 1) setVariable ["life_clientID", owner (_this select 1), true];
};
"life_fnc_RequestClientId" addPublicVariableEventHandler TON_fnc_requestClientID;

/* Miscellaneous mission-required stuff */
life_wanted_list = [];

/*[] spawn {
    for "_i" from 0 to 1 step 0 do {
        uiSleep (30 * 60);
        {
            if (isNull _x) then {
                diag_log format ["life_server init.sqf - Dealer_%1 is objNull - mission runtime %2",_forEachIndex + 1,time];
            } else {
                _x setVariable ["sellers",[],true];
            };
        } forEach [
            missionNameSpace getVariable ["Dealer_1",objNull],
            missionNameSpace getVariable ["Dealer_2",objNull],
            missionNameSpace getVariable ["Dealer_3",objNull]
        ];
    };
};*/

[] spawn TON_fnc_initHouses;
[] spawn TON_fnc_initGang;
//cleanup = [] spawn TON_fnc_cleanup;

/* Setup the federal reserve building(s) */
private _dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
private _rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable [format ["bis_disabled_Door_%1",_i],1,true]; _dome animate [format ["Door_%1_rot",_i],0];};
_dome setVariable ["locked",true,true];
_rsb setVariable ["locked",true,true];
_rsb setVariable ["bis_disabled_Door_1",1,true];
_dome allowDamage false;
_rsb allowDamage false;

/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
publicVariable "life_server_isReady";

/* Initialize hunting zone(s) */
aiSpawn = ["hunt_zone",50] spawn TON_fnc_huntingZone;
turtleSpawn = [["turtle_1","turtle_2","turtle_3"],75] spawn TON_fnc_turtleZone;

// We create the attachment point to be used for objects to attachTo load virtually in vehicles.
life_attachment_point = "Land_HelipadEmpty_F" createVehicle [0,0,0];
life_attachment_point setPosASL [0,0,0];
life_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]];

// Sharing the point of attachment with all players.
publicVariable "life_attachment_point";

//Губернатор систем--->>>
diag_log "Loding gov";
//check if governor is ready to be elected
/* _result = ["SELECT time FROM rules",2] call DB_fnc_asyncCall;
//96 hours is 7 days, edit to your own liking
if ((_result select 0) >= 156) then {
	["UPDATE players SET voted=0",1] call DB_fnc_asyncCall;
	_winner = ((["SELECT uid FROM politics ORDER BY votecount DESC",2,true] call DB_fnc_asyncCall) select 0) select 0;
	[format ["UPDATE rules SET uid='%1', time=0",_winner],1] call DB_fnc_asyncCall;
	["CALL deleteCandidates",1] call DB_fnc_asyncCall;
}; */

//The server_govinfo array was also meant to host data regarding what the "laws" currently are, however that's going to be up to you.
server_govinfo = (["SELECT uid, name FROM rules",2] call DB_fnc_asyncCall);
publicVariable "server_govinfo";

//Set up data relating to who is already running for president at server start
server_candidates = (["SELECT uid,name,invest,policy FROM politics WHERE active=1",2,true] call DB_fnc_asyncCall);
publicVariable "server_candidates";

//[] spawn TON_fnc_serverGovUpdeta;
//[] spawn TON_fnc_serverPricesUpdeta;

/* [] spawn {
	for "_i" from 0 to 1 step 0 do {
		uiSleep (60 * 60);
		["UPDATE rules SET time=time+1",1] call DB_fnc_asyncCall;
	};
}; */

//губернатор всё
{
    if (!isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;

[] execVM "\UnionServer\Functions\Systems\fn_battleground.sqf";
[] execVM "\UnionServer\Functions\Systems\fn_RCON_Restart.sqf";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";