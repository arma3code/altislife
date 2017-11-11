/*
	
	Filename: 	UnionClient_actions_captureProcessor.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _vendor = param [0,ObjNull,[ObjNull]];

if !(ISPSIDE(independent)) exitWith {hint localize "STR_PRCNOT_OnlyIndep"};
if !(NOTINVEH(player)) exitWith {hint localize "STR_pAct_NotFromVehicle"};

private _gangResource = call compile (LIFE_SETTINGSWORLD(getText,worldName,"life_gangResources"));
if !(_gangResource isEqualType []) exitWith {hint "Error in config life_gangResources"};
if !(_vendor in _gangResource) exitWith {hint localize "STR_PRCNOT_cantBeConroled"};

private _group = _vendor GVAR ["gangOwner",grpNull];
if (isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"]};
if (EQUAL(_group,grpPlayer)) exitWith {titleText[localize "STR_PRCNOT_AlreadyCaptured","PLAIN"]};
if (_vendor GVAR ["inCapture",FALSE]) exitWith {hint localize "STR_pAct_CaptureInProg"};

private _lastCapture = _vendor GVAR ["lastCapture",0];
if (!(EQUAL(_lastCapture,0)) && ((time - _lastCapture) < 900)) exitWith {
	hint format[localize "STR_GNOTF_CaptureTimeOut", round ((900 - (time - _lastCapture))/60)];
};

private _vendorTitle = switch (_vendor) do {
	case coke_processor: {localize "STR_Item_Cocaine"};
	case mari_processor: {localize "STR_Item_Marijuana"};
	case heroin_processor: {localize "STR_Item_Heroin"};
	case meth_processor: {localize "STR_Item_Meth"};
	case uran_processor: {localize "STR_MF_ResGathUranus"};
	case uran_processor_clean: {localize "STR_MF_ResGathUranus"};
};

private ["_gangName","_action","_cpRate"];
if (!isNull _group) then {
	_gangName = _group GVAR ["gang_name",""];
	_action = [
		format[localize "STR_GNOTF_ProcUnderControl",_gangName,_vendorTitle],
		localize "STR_GNOTF_ProcCaptureTitle",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;	
	_cpRate = 0.0045;	
} else {
	_action = [
		format[localize "STR_GNOTF_ProcCaptureConfirm",_vendorTitle],
		localize "STR_GNOTF_ProcCaptureTitle",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	_cpRate = 0.0075;
};

if (!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]};
call UnionClient_actions_inUse;
[_vendor,"inCapture",true] call CBA_fnc_setVarNet;

if (!isNil "_gangName") then {
	[[0,1],format[localize "STR_GNOTF_ProcCaptureInProgress",GANG_NAME,_gangName,_vendorTitle]] remoteExecCall ["UnionClient_system_broadcast",independent];
};

disableSerialization;
titleText[localize "STR_GNOTF_ProcCaptureTitle","PLAIN"];

private _cP = 0;
while {true} do {
	_cP = _cP + _cpRate;
	[_cP,"criminal"] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

[_vendor,"inCapture"] call UnionClient_system_clearGlobalVar;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};

[_vendor,"gangOwner",grpPlayer] call CBA_fnc_setVarNet;
[_vendor,"canProcess",[]] call CBA_fnc_setVarNet;
[_vendor,"lastCapture",time] call CBA_fnc_setVarNet;

[[0,1],format[localize "STR_GNOTF_ProcCaptureDone",GANG_NAME,_vendorTitle]] remoteExecCall ["UnionClient_system_broadcast",independent];