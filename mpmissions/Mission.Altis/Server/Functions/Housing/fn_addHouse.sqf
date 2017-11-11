#include "\UnionServer\script_macros.hpp"
/*
	Filename: 	fn_addHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Inserts the players newly bought house in the database.
*/
params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

if (isNull _house || _uid isEqualTo "" || isNull _unit) exitWith {};

private _housePos = getPosATL _house;
private _houseClass = typeOf _house;
//                                           0     1      2          3        4       5     6          7         8             0     1      2      3             4          5    6  7   8
private _query = format ["INSERT INTO houses (pid, pos, classname, inventory, trunk, owned, security, slots, servermap) VALUES('%1', '%2', '%3', '""[[],0]""', '""[[],0]""', '1', 0, 0,'%4')",_uid,_housePos,_houseClass,WorldName];
[_query,1] call DB_fnc_asyncCall;

uiSleep 0.8;

_query = format ["SELECT id FROM houses WHERE pos='%1' AND classname='%2' AND owned='1'",_housePos,_houseClass];
private _queryResult = [_query,2] call DB_fnc_asyncCall;
_house setVariable ["house_id",(_queryResult select 0),true];
