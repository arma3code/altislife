/*
	Filename: 	fn_reqHouseInfo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/
#include "\UnionServer\script_macros.hpp"
params [
    ["_house",objNull,[objNull]],
    ["_unit",objNull,[objNull]],
	["_side",sideUnknown,[civilian]]
];

if (isNull _house || isNull _unit || _side isEqualTo sideUnknown) exitWith {};

private _id = owner _unit;
private _housePos = getPosATL _house;
private _houseClass = typeOf _house;

private _query = format ["SELECT pid FROM houses WHERE owned='1' AND pos='%1' AND classname='%2'",_housePos,_houseClass];
private _queryResult = [_query,2] call DB_fnc_asyncCall;

if (EQUAL(_queryResult,[])) exitWith {
    [_house] remoteExecCall ["UnionClient_system_houseMenu",_id];
	_house setVariable ["house_forSell",true,true];
};

_house setVariable ["house_owned",true,true];
[_house,"Этот дом уже находится в собственности!"] remoteExecCall ["UnionClient_system_houseMenu",_id];