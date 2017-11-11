/*

	Filename: 	UnionClient_system_escInterupt.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _display = _this select 0;
private _ctrlRespawn = _display displayCtrl 1010;
private _ctrlAddons = _display displayCtrl 121;
private _ctrlManual = _display displayCtrl 122;
private _ctrlSave = _display displayCtrl 103;
private _ctrlAbort = _display displayCtrl 104;
private _ctrlTitle = _display displayCtrl 1050;

private _canUseControls = {
	if (playerSide in [west,east]) exitWith {true};
	if (GVAR_RESTRAINED(player) OR !(NOTATTACHED(player)) OR GVAR_MNS["life_pvp",false]) then {false} else {true};
};

private _waitTime = diag_tickTime + LIFE_SETTINGS(getNumber,"life_exitTimer");

_ctrlAbort ctrlSetTooltip "Сохранение и выход";
_ctrlAbort ctrlSetEventHandler ["ButtonClick","[] spawn UnionClient_system_logout; (findDisplay 49) closeDisplay 2; true"];

_ctrlRespawn ctrlEnable false;
_ctrlAbort ctrlEnable false;

_ctrlManual ctrlEnable false;
_ctrlSave ctrlEnable false;
_ctrlAddons ctrlEnable false;

if (call _canUseControls) then {
	while {!isNull _display && diag_tickTime < _waitTime} do {
		_ctrlAbort ctrlSetText format[localize "STR_NOTF_AbortESC",[(_waitTime - diag_tickTime),"SS.MS"] call BIS_fnc_secondsToString];
		_ctrlAbort ctrlCommit 0;
		_ctrlRespawn ctrlSetText format[localize "STR_NOTF_RespESC",[(_waitTime - diag_tickTime),"SS.MS"] call BIS_fnc_secondsToString];
		_ctrlRespawn ctrlCommit 0;
		uiSleep 0.01;
		closeDialog 0;	
	};

	_ctrlAbort ctrlSetText localize "STR_DISP_INT_ABORT";
	_ctrlAbort ctrlCommit 0;
	_ctrlRespawn ctrlSetText localize "STR_DISP_INT_Resp";
	_ctrlRespawn ctrlCommit 0;
	
	_ctrlRespawn ctrlEnable true;
	_ctrlAbort ctrlEnable true;
};