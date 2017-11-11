/*
	Filename: 	fn_vehiclesell.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Checks whether or not the vehicle is persistent or temp and sells it.
*/

#include "\UnionServer\script_macros.hpp"

private ["_displayName","_plate""_uid"];
params [
	["_vid",0,[0]],
	["_pid","",[""]],
	["_price",0,[0]],
	["_type","",[""]],
	["_vehicle","",[""]],
	["_unit",ObjNull,[ObjNull]],
	["_unitName","",[""]],
	["_vidlast",0,[0]]
];

//Error checks
if (_vehicle isEqualTo "" || isNull _unit) exitWith  {
    life_action_inUse = false;
    owner _unit publicVariableClient "life_action_inUse";
};
//configu
if (_vidlast == _vid) exitWith {
	["DUPE",format ["VehicleSellDUPE VID - '%1' || PID - '%2' || PRICE - '%3' || TYPE = '%4' || PLAYER ='%5' || CLASSNAME = '%6'",_vid,_pid,_price,_type,_unitName,_vehicle]] call TON_fnc_customLog;
	life_action_inUse = false;
    owner _unit publicVariableClient "life_action_inUse";
};
life_last_sold_vid = _vid;
owner _unit publicVariableClient "life_last_sold_vid";

_unit = owner _unit;

_query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND id='%2' AND type='%3'",_pid,_vid, _type];
[_query,1] call DB_fnc_asyncCall;

[_vehicle,_price] remoteExecCall ["UnionClient_garage_SellVehicleDone",_unit];

["VEHICLESELL",format ["VehicleSell VID - '%1' || PID - '%2' || PRICE - '%3' || TYPE = '%4' || PLAYER ='%5' || CLASSNAME = '%6'",_vid,_pid,_price,_type,_unitName,_vehicle]] call TON_fnc_customLog;