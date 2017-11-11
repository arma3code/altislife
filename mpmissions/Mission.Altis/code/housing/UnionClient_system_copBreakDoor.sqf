/*
	
	Filename: 	UnionClient_system_copBreakDoor.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house GVAR "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

private _uid = (_house GVAR "house_owner") select 0;
if !([_uid] call UnionClient_system_isUIDActive) exitWith {hint localize "STR_House_Raid_OwnerOff"};

private _door = [_house] call UnionClient_system_nearestDoor;
if (EQUAL(_door,0)) exitWith {hint localize "STR_Cop_NotaDoor"};
if ((_house GVAR[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

call UnionClient_actions_inUse;
private _ownerRet = ObjNull;
{
	if (EQUAL(getPlayerUID _x,_uid)) exitWith {_ownerRet = _x;};
} foreach playableUnits;
if (!isNull _ownerRet) then {			
	[1] remoteExecCall ["UnionClient_system_raidAlert",_ownerRet];
};

//Setup the progress bar
disableSerialization;
private _title = localize "STR_House_Raid_Progress";
private _cP = 0.01;
private _cpRate = 0.007;
private _time = switch (FETCH_CONST(life_donator)) do {
	case 0: {0.2};
	case 1: {0.14};
	case 2: {0.12};
	case 3: {0.1};
	case 4: {0.06};	
};
titleText[_title,"PLAIN"];
while {true} do {
	_cP = _cP + _cpRate;
	[_cP,"police"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
	call UnionClient_animation_kneelWork;
	uiSleep _time;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

if !(_house in life_vehicles) then {
	life_vehicles pushBack _house;
	titleText["Дверь вскрыта и теперь у вас есть ключи от дома","PLAIN"];
};