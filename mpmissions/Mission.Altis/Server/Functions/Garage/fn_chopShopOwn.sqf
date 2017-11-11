/*
	Filename: 	fn_shopShopOwn.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

#include "\UnionServer\script_macros.hpp"
private ["_plate","_displayName","_query","_sql"];
params [
	["_unit",ObjNull,[ObjNull]],
	["_vehicle",ObjNull,[ObjNull]],
	["_price",0,[0]],
	["_pid","",[""]],
	["_name","",[""]],
	["_side",sideUnknown,[civilian]]
];

if (isNull _unit || isNull _vehicle || _pid isEqualTo "") exitWith {
	life_action_inUse = false;
    owner _unit publicVariableClient "life_action_inUse";
};

_displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");

_side = switch (_side) do {
    case west: {"cop"};
    case civilian: {"civ"};
    case east: {"med"};
    case independent: {"reb"};
    default {"Error"};
};

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if !(_dbInfo isEqualTo []) then {
    _uid = (_dbInfo select 0);
    _plate = (_dbInfo select 1);

    _query = format ["UPDATE vehicles SET pid='%3', side='%4' WHERE pid='%1' AND plate='%2'",_uid,_plate,_pid,_side];

    [_query,1] call DB_fnc_asyncCall;

	["CHOPSHOP",format ["uid=%1 plate=%2 pid=%3 side=%4 displayName=%5 query=%6",_uid,_plate,_pid,_side,_displayName,_query]] remoteExecCall ["TON_fnc_customLog",RSERV];
};

_vehicle setVariable ["dbInfo",[_pid,_plate],true];
_vehicle setVariable ["vehicle_info_owners",[[_pid,_name]],true];
["cash","take",_price] remoteExecCall ["UnionClient_system_myCash",(owner _unit)];
life_action_inUse = false;
owner _unit publicVariableClient "life_action_inUse";

["Вы перебили машину, теперь вы можете поставить её в гараж.","done"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];