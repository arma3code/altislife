/*

	Filename: 	UnionClient_gangs_Init.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_group","_wait"];

switch (playerSide) do {
	case civilian: {[player] join (createGroup civilian)};
	case independent: {[player] join (createGroup independent)};
	case west: {[player] join (createGroup west)};
	case east: {[player] join (createGroup east)};
};

if (EQUAL(life_gangData,[])) exitWith {
	systemChat "У вас нет группы";
	[false] call UnionClient_gangs_ClearLicense;
};

systemChat "Инициализация группы...";

_wait = round(random(4));
uiSleep _wait;

{
	_groupName = _x GVAR "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x GVAR["gang_owner",""];
		_groupID = _x GVAR "gang_id";
		if (EQUAL(_groupOwner,"") OR isNil "_groupID") exitWith {};
		if (EQUAL((life_gangData select 0),_groupID) && (EQUAL((life_gangData select 1),_groupOwner))) exitWith {_group = _x};
	};
} foreach allGroups;

if (!isNil "_group") then {
	[player] join _group;
	if (EQUAL((life_gangData select 1),steamid)) then {
		_group selectLeader player;
		[player,_group] remoteExecCall ["UnionClient_gangs_NewLeaderClient",_group];
	};
} else {
	_group = grpPlayer;
	_group SVAR ["gang_id",(life_gangData select 0),true];
	_group SVAR ["gang_owner",(life_gangData select 1),true];
	if !(EQUAL((life_gangData select 2),"-1")) then {[_group,"gang_deputy",life_gangData select 2] call CBA_fnc_setVarNet};
	_group SVAR ["gang_name",(life_gangData select 3),true];
	_group SVAR ["gang_membersCount",(count (life_gangData select 4)),true];
	_group SVAR ["gang_members",(life_gangData select 4),true];
	_group SVAR ["gang_maxMembers",(life_gangData select 5),true];
	_group SVAR ["gang_bank",(life_gangData select 6),true];
	if !(EQUAL((life_gangData select 7),[])) then {[_group,"gang_info",life_gangData select 7] call CBA_fnc_setVarNet};
	if !(EQUAL((life_gangData select 8),"-1")) then {
		[_group,"gang_license",life_gangData select 8] call CBA_fnc_setVarNet;
		if !(EQUAL((life_gangData select 9),0)) then {[_group,"gang_warpoints",life_gangData select 9] call CBA_fnc_setVarNet};
	} else {
		[false] call UnionClient_gangs_ClearLicense;
	};
	_group SVAR ["gang_side",playerSide,true];
};
systemChat format ["Инициализация группы завершена. Вы состоите в группе %1",_group GVAR ["gang_name",""]];