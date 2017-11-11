/*

	Filename: 	UnionClient_system_resHB.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _bed = param [0,objNull,[objNull]];
private _unit = (crew _bed) select 0;

if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (life_inwarzone) exitWith {hint "Вы в зоне боевых действий, реанимация недоступна"};

if !(LSINCAP(_unit)) exitWith {};
if (!isNil {_unit GVAR "draggedBy"}) exitWith {};
if (_unit GVAR ["reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
_unit SVAR ["reviving",player,TRUE];

private _cP = 0;
private _error = false;
private _title = format["Вы реанимируете %1",GVAR_RNAME(_unit)];

player say3D "defib";
titleText[_title,"PLAIN"];

[player] remoteExec ["UnionClient_system_resHBClient",_unit];

while {true} do {
	uiSleep 0.15;
	_cP = _cP + 0.01;
	[_cP,"medic"] call UnionClient_system_progressBar;
	if (_cP >= 1) exitWith {};
	if (player distance _unit > 4 OR (LSDEAD(_unit)) OR (call UnionClient_system_isInterrupted)) exitWith {_error = true};	
	if (_unit GVAR ["reviving",ObjNull] != player) exitWith {_error = true};
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
if (_error) exitWith {titleText["Реанимация прервана!","PLAIN"];};