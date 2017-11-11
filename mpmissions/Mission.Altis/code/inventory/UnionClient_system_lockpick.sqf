/*
	
	Filename: 	UnionClient_system_lockpick.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _curTarget = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};
if (isNull _curTarget) exitWith {}; //Bad type
private _distance = ((boundingBox _curTarget select 1) select 0) + 2;
if (player distance _curTarget > _distance) exitWith {}; //Too far

if !([_curTarget] call UnionClient_system_isVehicleKind) exitWith {};
if (_curTarget in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

if ([player] call UnionClient_system_isSafeZone) exitWith {hint "Вы находитесь в зеленой зоне! Запрещено грабить, угонять технику и связывать людей!"};

private _title = format[localize "STR_ISTR_Lock_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
call UnionClient_actions_inUse;
[_curTarget] remoteExecCall ["UnionClient_vehicles_alarmSound",RCLIENT];

//Setup the progress bar
disableSerialization;
private _cP = 0;
titleText[_title,"PLAIN"];
private _badDistance = false;

while {true} do {
	_cP = _cP + 0.01;
	[_cP,"key"] call UnionClient_system_progressBar;		
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	if (player distance _curTarget > _distance) exitWith {_badDistance = true};
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};

if (_badDistance) exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"];};
if !("extItem_lockpick" in (magazines player)) exitWith {};

if (random(100) < 10) then {
	["extItem_lockpick"] call UnionClient_system_removeItem;
	hint "Набор отмычек сломался!";
};

private _dice = random(100);
private "_crimeType";
if(_dice < 30) then {
	titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
	life_vehicles pushBack _curTarget;
	_crimeType = "487";
} else {	
	_crimeType = "215";
	[0,"STR_ISTR_Lock_FailedNOTF",true,[GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",west];
	titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
};

[[steamid,GVAR_RNAME(player),_crimeType],"wantedAdd"] call UnionClient_system_hcExec;