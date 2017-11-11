/*

	Filename: 	UnionClient_evh_onPlayerKilled.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_killer",ObjNull,[ObjNull]]
];

if !(EQUAL(_unit,_killer)) exitWith {};

if ((vehicle _unit) != _unit) then {
	unassignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

["all"] call UnionClient_system_removeBuff;
[] call UnionClient_hud_hide;
[] call UnionClient_effects_Terminate;

cutText["","BLACK OUT",0];
1 fadeSound 0;
playMusic "DeathMusic";

[_unit,"medicStatus"] call UnionClient_system_clearGlobalVar;
[_unit,"lifeState","DEAD"] call CBA_fnc_setVarNet;

life_medicstatus = -1;
life_medicstatusby = "";

disableSerialization;
if (!isNull (findDisplay 49)) then {(findDisplay 49) closeDisplay 0} else {closeDialog 0};

["Death_Screen_V2"] call UnionClient_gui_DestroyRscLayer;
[_unit] spawn UnionClient_system_respawnScreen;
