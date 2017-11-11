/*
	
	Filename: 	UnionClient_system_demoChargeTimer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
["life_timer","PLAIN"] call UnionClient_gui_CreateRscLayer;
private _uiDisp = GVAR_UINS "life_timer";
private _timer = _uiDisp displayCtrl 38301;
private _time = time + (15 * 60);

while {true} do {
	if (isNull _uiDisp) then {
		["life_timer","PLAIN"] call UnionClient_gui_CreateRscLayer;
		_uiDisp = GVAR_UINS "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if (round(_time - time) < 1) exitWith {};
	if !(fed_bank GVAR ["chargeplaced",false]) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	uiSleep 0.08;
};
["life_timer"] call UnionClient_gui_DestroyRscLayer;