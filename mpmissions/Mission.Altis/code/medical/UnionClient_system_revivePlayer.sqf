/*

	Filename: 	UnionClient_system_revivePlayer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _target = param [0,ObjNull,[ObjNull]];
if (isNull _target) exitWith {};
if (life_inwarzone) exitWith {hint "Вы в зоне боевых действий, реанимация недоступна"};
if (ISPSIDE(civilian) OR ISPSIDE(independent)) exitWith {hint "У вас нет навыков для реанимации. Используйте больничную койку."};
if (ISPSIDE(east) && !("extItem_defibrillator" in (magazines player))) exitWith {hint "У вас нет дефибриллятора, необходимого для реанимации в полевых условиях"};

if !(LSINCAP(_target)) exitWith {hint "Цель не в критическом состоянии"};
if (!isNil {_target GVAR "draggedBy"}) exitWith {hint "Его кто-то несет..."};
if (_target GVAR ["reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if (player distance _target > 5) exitWith {}; //Not close enough.

if (playerSide == west && ((west countSide playableUnits) > LIFE_SETTINGS(getNumber,"life_cop_min") OR (east countSide playableUnits) > LIFE_SETTINGS(getNumber,"life_med_min")) && !([player] call UnionClient_system_isHospitalNear)) exitWith {hint format["Полицейских на острове больше %1, или медиков больше %2, а значит реанимировать можно только через больничную койку или дефибриллятор",LIFE_SETTINGS(getNumber,"life_cop_min"),LIFE_SETTINGS(getNumber,"life_med_min")];};

private _targetName = GVAR_RNAME(_target);
private _title = format[localize "STR_Medic_Progress",_targetName];

call UnionClient_actions_inUse;

_target SVAR ["reviving",player,TRUE];
private _badDistance = false;
private _cP = 0;

disableSerialization;
player say3D "defib";
titleText[_title,"PLAIN"];

while {true} do {
	_cP = _cP + 0.01;
	[_cP,"medic"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	if (player distance _target > 4) exitWith {_badDistance = true;};
	if !(LSINCAP(_target)) exitWith {};
	if (_target GVAR ["reviving",ObjNull] != player) exitWith {};
	call UnionClient_animation_kneelWork;
	uiSleep 0.15;
};

//Kill the UI display and check for various states
["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false;_target SVAR ["Reviving",objNull,false];};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};

if (_target GVAR ["reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
[_target,"reviving"] call UnionClient_system_clearGlobalVar;

if !(LSINCAP(_target)) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if (_badDistance) exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]};

if (ISPSIDE(east)) then {
	private _reviveFee = (LIFE_SETTINGS(getNumber,"life_revive_fee")) * 10;
	["atm","add",_reviveFee] call UnionClient_system_myCash;
	titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[_reviveFee] call UnionClient_system_numberText],"PLAIN"];
};

[player] remoteExec ["UnionClient_system_revived",_target];