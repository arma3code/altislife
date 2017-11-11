/*

	Filename: 	UnionClient_spawn_PointCfg.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _side = param [0,civilian,[civilian]];
private _return = [];

if (count life_logout_position > 0) then {
	if (life_logout_position distance (getMarkerPos "players_spawn_zone") <= 500) then {
		life_logout_position = [_side] call UnionClient_spawn_SafeMarker;
	};
	private _logoutname = format["spawn_%1_%2",steamid,round(daytime * 10000)];
	private _logoutpos = [life_logout_position select 0,life_logout_position select 1,(life_logout_position select 2)+0.5];

	private _marker = createMarkerLocal [ _logoutname, _logoutpos];
	_marker setMarkerPosLocal _logoutpos;

	_return pushBack [_logoutname,"Точка отключения","\union_pack\icons\exit.paa"];
};

private _flag = [playerSide] call UnionClient_system_convertSide;
{
	if ([getText(_x >> "conditions")] call UnionClient_system_conditionsCheck) then {
		_return pushBack [getText(_x >> "spawnMarker"),getText(_x >> "displayName"),getText(_x >> "icon")];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgSpawnPoints" >> worldName >> _flag));

if (count life_houses > 0 && {[LIFE_SETTINGS(getText,"life_houseSpawnCondition")] call UnionClient_system_conditionsCheck}) then {
	private ["_house","_houseName"];
	{
		_house = nearestObject [_x select 0,_x select 1];
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

		_return pushBack [format["house_%1",round ((_x select 0) select 0)],_houseName,"\union_pack\icons\home.paa"];
	} foreach life_houses;
};

if (EQUAL(_return,[])) then {
	life_logout_position = [_side] call UnionClient_spawn_SafeMarker;
	private _logoutname = format["spawn_%1_%2",steamid,round(daytime * 10000)];
	private _logoutpos = [life_logout_position select 0,life_logout_position select 1,(life_logout_position select 2)+0.5];

	private _marker = createMarkerLocal [ _logoutname, _logoutpos];
	_marker setMarkerPosLocal _logoutpos;

	_return pushBack [_logoutname,"Точка отключения","\union_pack\icons\exit.paa"];
};

_return;