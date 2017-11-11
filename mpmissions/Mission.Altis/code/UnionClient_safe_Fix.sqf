/*
	
	Filename: 	UnionClient_safe_Fix.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _vault = _this select 0;
if !(_vault GVAR ["safe_open",false]) exitWith {hint localize "STR_Cop_VaultLocked"};

call UnionClient_actions_inUse;

disableSerialization;
titleText[localize "STR_Cop_RepairVault","PLAIN"];
private _cP = 0;
while {true} do {
	_cP = _cP + .012;
	[_cP,"repair"] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR (call UnionClient_system_isInterrupted) OR life_interrupted) exitWith {};
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;
};

//Kill the UI display and check for various states
["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

[_vault,"safe_open"] call UnionClient_system_clearGlobalVar;
hint localize "STR_Cop_VaultRepaired";