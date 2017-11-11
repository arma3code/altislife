/*
	Filename: 	fn_chopshopsell.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

#include "\UnionServer\script_macros.hpp"

private ["_displayName","_plate""_uid"];
params [
	["_unit",ObjNull,[ObjNull]],
	["_vehicle",ObjNull,[ObjNull]],
	["_price",0,[0]]
];

//Error checks
if (isNull _vehicle || isNull _unit) exitWith  {
    life_action_inUse = false;
    owner _unit publicVariableClient "life_action_inUse";
};

_displayName = typeOf _vehicle;
_unit = owner _unit;

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if !(_dbInfo isEqualTo []) then {
    _uid = (_dbInfo select 0);
    _plate = (_dbInfo select 1);
    _query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
    [_query,1] call DB_fnc_asyncCall;
	["CHOPSHOP",format ["UID='%1' PLATE='%2' DISPLAYNAME='%3' QUERY='%4'",_uid,_plate,_displayName,_query]] remoteExecCall ["TON_fnc_customLog",RSERV];
};


deleteVehicle _vehicle;
life_action_inUse = false;
_unit publicVariableClient "life_action_inUse";
[_displayName,_price] remoteExecCall ["UnionClient_garage_SellVehicleDone",_unit];
