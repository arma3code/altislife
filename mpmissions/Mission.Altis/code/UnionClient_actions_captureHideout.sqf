/*
	
	Filename: 	UnionClient_actions_captureHideout.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _hideout = nearestObject [player, "Land_InfoStand_V1_F"];
private _group = _hideout GVAR ["gangOwner",grpNull];

if (isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
if (EQUAL(_group,grpPlayer)) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
if (_hideout GVAR ["inCapture",FALSE]) exitWith {hint localize "STR_GNOTF_Captured";};

private ["_action","_cpRate"];
if(!isNull _group) then {
	private _gangName = _group GVAR ["gang_name",""];
	_action = [
		format[localize "STR_GNOTF_AlreadyControlled",_gangName],
		localize "STR_GNOTF_CurrentCapture",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
call UnionClient_actions_inUse;

//Setup the progress bar
disableSerialization;
private _title = localize "STR_GNOTF_Capturing";
private _cP = 0;
titleText[_title,"PLAIN"];
while {true} do {
	_cP = _cP + _cpRate;
	[_cP,"criminal"] call UnionClient_system_progressBar;
	[_hideout,"inCapture",true] call CBA_fnc_setVarNet;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	call UnionClient_animation_kneelWork;	
	uiSleep 0.26;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

[_hideout,"inCapture"] call UnionClient_system_clearGlobalVar;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};

titleText[localize "STR_GNOTF_CaptureDone","PLAIN"];
[_hideout,"gangOwner",grpPlayer] call CBA_fnc_setVarNet;