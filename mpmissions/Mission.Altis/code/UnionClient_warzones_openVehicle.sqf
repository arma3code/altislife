/*

	Filename: 	UnionClient_warzones_openVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"]};

private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {};
if !((typeOf _vehicle) isEqualTo WZ_SETTINGS(getText,"vehClass")) exitWith {};
if (_vehicle GVAR ["opened",false]) exitWith {titleText["Уже вскрыто","PLAIN"]};

call UnionClient_actions_inUse;

disableSerialization;
private _cP = 0;
private _cpRate = 0.003;

titleText["Вскрываем обломки","PLAIN"];

while {true} do {
	_cP = _cP + _cpRate;
	[_cP,"lock"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};

if (_vehicle GVAR ["opened",false]) exitWith {titleText["Уже вскрыто","PLAIN"]};

[_vehicle,"opened",true] call CBA_fnc_setVarNet;
titleText["Открываем...","PLAIN"];