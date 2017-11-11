/*

	Filename: 	UnionClient_system_boltcutter.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _building = param [0,ObjNull,[ObjNull]];
if (isNull _building) exitWith {};
if !(_building isKindOf "House_F") exitWith {hint "Вы смотрите не на дверь..."};
//if ([player] call UnionClient_system_isSafeZone) exitWith {hint "Вы находитесь в зеленой зоне! Запрещено грабить, угонять технику и связывать людей!"};
if (_building in life_vehicles OR _building in life_tempHouses) exitWith {hint "У вас уже есть ключи от этого здания"};
if !(typeOf _building isEqualTo "EXT_Land_em_mansion_01_reversed") exitWith {hint "У домов такого типа очень сильная охрана. Настолько силная, что ты можешь управиться с болгаркой и почти задеваешь свою ногу. Лучше тебе уйти."};
private _isFed = if ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {true} else {false};

private ["_marker","_uid"];
private _error = "";
if (!_isFed) then {
	if (isNil {_building GVAR "house_owner"}) exitWith {_error = "У дома не прописан владелец"};
	_uid = (_building GVAR "house_owner") select 0;
	if !([_uid] call UnionClient_system_isUIDActive) exitWith {_error = localize "STR_House_OwnerOffline"};
} else {
	private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
	if (west countSide playableUnits < _minCops) exitWith {_error = format[localize "STR_Civ_NotEnoughCops",_minCops]};
};
if (_error != "") exitWith {hint _error};

private _door = [_building] call UnionClient_system_nearestDoor;
if (EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear";}; //Not near a door to be broken into.

if ((_building GVAR [format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {
	hint "Дверь уже была открыта, возможно в связи аномалиями на острове. Теперь она заперта и вы можете снова попробовать ее вскрыть";
	_building SVAR [format["bis_disabled_Door_%1",_door],1,true];
};

if (_isFed) then {
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["UnionClient_system_broadcast",west];
} else {
	_marker = createMarker [format["%1_houserob", steamid], position player];//make dynamic markers. for each player!
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText "!Внимание! Домушник!";
	_marker setMarkerType "mil_warning";
	private _ownerRet = ObjNull;
	{
		if (EQUAL(getPlayerUID _x,_uid)) exitWith {_ownerRet = _x;};
	} foreach playableUnits;
	if (!isNull _ownerRet) then {
		[0] remoteExecCall ["UnionClient_system_raidAlert",_ownerRet];
	};
};

call UnionClient_actions_inUse;

//Setup the progress bar
disableSerialization;
private _title = localize "STR_ISTR_Bolt_Process";
private _cP = 0;

private _cpRate = switch (typeOf _building) do {
	case "Land_Dome_Big_F": {0.001;};
	case "Land_Research_house_V1_F": {0.001;};
	default {0.0015;}
};
titleText[_title,"PLAIN"];

while {true} do {
	_cP = _cP + _cpRate;
	[_cP,"lock"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;
if (!isNil "_marker") then {deleteMarker _marker;};

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};

if (_isFed) then {
	_building SVAR [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
} else {
	if(random(100) > 60) then {
		if (!(_building in life_tempHouses)) then {life_tempHouses pushBack _building};

		[[steamid,GVAR_RNAME(player),"459"],"wantedAdd"] call UnionClient_system_hcExec;

		titleText["Вы вскрыли входную дверь и завладели ключами!","PLAIN"];
	} else {
		titleText["Не удалось вскрыть дверь. Попробуйте еще.","PLAIN"];
	};
};