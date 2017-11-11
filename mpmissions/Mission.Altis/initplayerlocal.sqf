/*

	Filename: 	initPlayerLocal.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "script_macros.hpp"
"InitPlayerLocal begin..." call UnionClient_system_log;

//HC-клиент
if (!hasInterface && !isServer) exitWith {
    [_this select 0] call compile preprocessFileLineNumbers "\ExtremoHC\initHC.sqf";
};

//if !([] call UnionClient_spyglass_checkMods) exitWith {};
//"InitPlayerLocal - All mods are fine..." call UnionClient_system_log;

CONST(BIS_fnc_endMission,BIS_fnc_endMission);

//--- Disable sound and hide scene
0 fadeSound 0;
0 fadeMusic 0;
0 fadeRadio 0;
enableRadio false;
enableSentences false;
enableEnvironment false;
["SplashNoise", "BLACK"] call UnionClient_gui_CreateRscLayer;
showHud false;
showChat false;
showCommandingMenu "";

[] spawn UnionClient_spyglass_initSpy;

private _platform = LIFE_SETTINGSWORLD(getNumber,worldName,"life_platformZlevel");

"respawn_east" setMarkerPosLocal [markerPos "respawn_east" select 0, markerPos "respawn_east" select 1, _platform];
"respawn_west" setMarkerPosLocal [markerPos "respawn_west" select 0, markerPos "respawn_west" select 1, _platform];
"respawn_civilian" setMarkerPosLocal [markerPos "respawn_civilian" select 0, markerPos "respawn_civilian" select 1, _platform];
"respawn_guerrila" setMarkerPosLocal [markerPos "respawn_guerrila" select 0, markerPos "respawn_guerrila" select 1, _platform];
"cargo_spawn" setMarkerPosLocal [markerPos "cargo_spawn" select 0, markerPos "cargo_spawn" select 1, _platform];

[] spawn UnionClient_init_begin;

"InitPlayerLocal done!" call UnionClient_system_log;