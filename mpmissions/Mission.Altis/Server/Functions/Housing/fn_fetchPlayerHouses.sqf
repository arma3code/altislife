#include "\UnionServer\script_macros.hpp"
/*
	Filename: 	fn_fetchPlayerHouses.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    1. Fetches all the players houses and sets them up.
    2. Fetches all the players containers and sets them up.
*/
params [
    ["_uid","",[""]]
];
if (_uid isEqualTo "") exitWith {};
//houses.pos, houses.classname
//                                 0       1        2
private _query = format ["SELECT pos, classname, servermap FROM houses WHERE pid='%1' AND owned='1' AND servermap='%2'",_uid,WorldName];
private _houses = [_query,2,true] call DB_fnc_asyncCall;
private _return = [];
{
    private _position = call compile format ["%1",_x select 0];
	private _house = nearestObject [_position,_x select 1];
    _house allowDamage false;
    _return pushBack [_position,_x select 1,_x select 2];
} forEach _houses;

missionNamespace setVariable [format ["houses_%1",_uid],_return];