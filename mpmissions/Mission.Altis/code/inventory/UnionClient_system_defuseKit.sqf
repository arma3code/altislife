/*
	
	Filename: 	UnionClient_system_defuseKit.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vault = param [0,ObjNull,[ObjNull]];
if (isNull _vault) exitWith {};
if (typeOf _vault != LIFE_SETTINGS(getText,"life_vaultBoxClass")) exitWith {};
if !(_vault GVAR ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Defuse_Nothing"};

call UnionClient_actions_inUse;

disableSerialization;
titleText[localize "STR_ISTR_Defuse_Process","PLAIN"];
private _cP = 0;

while {true} do {
	_cP = _cP + 0.0035;
	[_cP,"police"] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

[_vault,"chargeplaced"] call UnionClient_system_clearGlobalVar;
[0,"STR_ISTR_Defuse_Success"] remoteExecCall ["UnionClient_system_broadcast",west];