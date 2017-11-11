/*

    Filename:   UnionClient_init_begin.sqf
    Project:    Union Altis Life RPG
    Author:     Merrick & Affect
    Steam:      76561198006439083 & 76561198053094990
    Web:        http://unionrp.ru/

*/
#include "..\script_macros.hpp"
life_firstSpawn = true;
life_session_completed = false;
life_loading_completed = false;

if ([profileName] call UnionClient_system_badProfileName) exitWith {["BadProfileName",false,false] call BIS_fnc_endMission};

999999 cutText["Настройка клиента, пожалуйста подождите...","PLAIN"];
private _timeStamp = diag_tickTime;
"Starting Union Client..." call UnionClient_system_log;
waitUntil {!isNull player && player == player}; //Wait till the player is ready
waitUntil {!(isNull (findDisplay 46))};
"Display 46 Found" call UnionClient_system_log;
DEH_INIT = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

{
	(findDisplay 46 displayCtrl _x) ctrlShow false;
} forEach [1000, 1001, 1002, 1200, 1202];

"Check Client" call UnionClient_system_log;
999999 cutText ["Проверка клиента...","PLAIN"];
//[] call UnionClient_spyglass_clientValidator;
"Setting up Vars" call UnionClient_system_log;
999999 cutText ["Настройка переменных...","PLAIN"];
call UnionClient_system_configuration;
"Setting up Eventhandlers" call UnionClient_system_log;
999999 cutText ["Настройка триггеров...","PLAIN"];
[] call UnionClient_evh_init;
"Setting up user actions" call UnionClient_system_log;
999999 cutText ["Настройка действий...","PLAIN"];
[] call UnionClient_init_actions;

999999 cutText ["Подождите, сервер загружается... Это может занять до 2-х минут... ","PLAIN"];
"Waiting for the server to be ready.." call UnionClient_system_log;
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(life_server_extDB_notLoaded) exitWith {
	"Server did not load extDB" call UnionClient_system_log;
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","PLAIN"];
	999999 cutFadeOut 99999999;
};
waitUntil {!isNil "life_server_isReady"};
waitUntil {!isNil "life_HC_isActive" && {!isNil "life_server_extDB_notLoaded"}};

if (life_server_extDB_notLoaded) exitWith {
    999999 cutText [localize "STR_Init_ExtdbFail","BLACK FADED"];
    999999 cutFadeOut 99999999;
};

[] call UnionClient_session_dataQuery;
999999 cutText ["Запрашиваем данные с сервера...","PLAIN"];
"Waiting for data from the server..." call UnionClient_system_log;
waitUntil {life_session_completed};

999999 cutText["Загрузка клиентской части...","PLAIN"];
"Set player variables" call UnionClient_system_log;
999999 cutText ["Настройка переменных...","PLAIN"];
[player] call UnionClient_system_clearAllLifeVars;
[player,"lifeState","LOADING"] call CBA_fnc_setVarNet;
"Emptying all world fuel pumps.." call UnionClient_system_log;
999999 cutText ["Настройка бензоколонок...","PLAIN"];
[] call UnionClient_system_emptyGasStation;
"Set realname" call UnionClient_system_log;
999999 cutText ["Настройка имен...","PLAIN"];
[] call UnionClient_system_setTag;
[] call UnionClient_system_setTitle;
"Update Passport Config" call UnionClient_system_log;
999999 cutText ["Настройка скинов...","PLAIN"];
[] call UnionClient_system_passportConfig;
[] call UnionClient_system_padSkinConfig;
"Update Face Config" call UnionClient_system_log;
999999 cutText ["Настройка внешности...","PLAIN"];
[] call UnionClient_surgery_Init;

[] call UnionClient_tasks_DeleteAll; //удаляем все задания

"Past Settings Init" call UnionClient_system_log;
[] execFSM "fsm\unclient.fsm";
"Executing client fsm" call UnionClient_system_log;

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call UnionClient_system_keyHandler"];
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["MouseButtonDblClick", {
	0 = [] spawn {
		disableSerialization;
		private _display = findDisplay 54;
		if (!isNull _display) then {
			private _ctrlMarkerChannel = _display displayCtrl 103;
			private _lbItem = _ctrlMarkerChannel lbAdd "Direct Channel";
			_ctrlMarkerChannel lbSetData [_lbItem, "5"];
			private _indexOffset = 0;
			for "_i" from 0 to 5 do {
				if (!channelEnabled _i) then {
					_ctrlMarkerChannel lbDelete (_i - _indexOffset);
					_indexOffset = _indexOffset + 1;
				};
			};
			_ctrlMarkerChannel lbSetCurSel 0;
		};
	};
}];

[] spawn {
	while {true} do{
		//waitUntil {!isnull (findDisplay 602)};
		{
		if ((isPlayer _x && _x != player) && (alive _x)) then {
		_backpack=backpackContainer player;
		_backpack_x=backpackContainer _x;
		if(_backpack==_backpack_x) then {
			removeBackpack player;
			//hint "Дюпать плохо, особенно на нашем топ проекте...";
			["BACKPACKDUPE",[format["Backpack Dupe %1 (%2) with %3 (%4)",GVAR_RNAME(player),steamid,GVAR_RNAME(_x),getPlayerUID _x]]] remoteExecCall ["TON_fnc_customLog",RSERV];
			};
		};
		} forEach nearestObjects [player, ["O_medic_F","C_man_1","B_medic_F","I_Survivor_F"], 20];
		sleep 1;
	};
};

LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","UnionClient_system_playerTags"] call BIS_fnc_addStackedEventHandler;

LIFE_HANDLE_EFFECTS = [] spawn UnionClient_effects_Init;
LIFE_HANDLE_HUD = [] spawn UnionClient_hud_init;

if (LIFE_SETTINGS(getNumber,"life_enableFatigue") isEqualTo 0) then {player enableFatigue false};
player addRating 99999999;

5 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
enableEnvironment true;
showHud true;
showChat true;
showCommandingMenu "";
enableRadio false;
enableSentences false;

999999 cutText ["","PLAIN"];
["SplashNoise"] call UnionClient_gui_DestroyRscLayer;

"Init faction settings" call UnionClient_system_log;

switch (playerSide) do {
	case west: {[] spawn UnionClient_init_cop};
	case civilian: {[] spawn UnionClient_init_civ};
	case east: {[] spawn UnionClient_init_medic};
	case independent: {[] spawn UnionClient_init_reb};
};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", DEH_INIT];
life_loading_completed = true;

format["End of Union Client Init :: Total Execution Time %1 seconds",(diag_tickTime - _timeStamp)] call UnionClient_system_log;