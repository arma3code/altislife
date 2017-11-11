#include "..\..\script_macros.hpp"
/*
    File : fn_updateGangBank.sqf

    Description:
    Update gang bank
    [grpPlayer,playerSide,(_gFund+_value),"add",_value,steamid,GVAR_RNAME(player)]
    [C Foxtrot 4-3,CIV,61110,"add",55555,"76561198006439083","Marker"]
*/
params [
	["_group",grpNull,[grpNull]],
	["_side",sideUnknown,[civilian]],
	["_value",0,[0]],
	["_modifier","",[""]],
	["_value2",0,[0]],
    ["_uid","",[""]],
	["_namep","",[""]],
	["_unit",ObjNull,[ObjNull]]
];
_side = switch(_side) do {
	case civilian:{"civ"};
	case west:{"cop"};
	case independent:{"reb"};
	case east:{"med"};
};
if (isNull _ownerID OR isNull _gangName) exitWith {};
private _groupID = _group getVariable ["gang_id",-1];
switch (_modifier) do {
	case "add": {
		_group setVariable ["gang_bank",_value,true];
		_query = format ["UPDATE gangs SET bank='%1' WHERE id='%2' AND side='%3'",_value,_groupID,_side];
		[_query,1] call DB_fnc_asyncCall;
		["GANGBANK",format ["Gangbank deposit UID - %1 || VALUE - %2 || SIDE - %3 || GANG ID - %4",_uid,_value,_side,_groupID]] call TON_fnc_customLog;
		["atm","take",round (_value2 * 1.05),"gangDeposit"] remoteExecCall ["UnionClient_system_myCash",(owner _unit)];
	};
	case "remove": {
		_group setVariable ["gang_bank",_value,true];
		_query = format ["UPDATE gangs SET bank='%1' WHERE id='%2' AND side='%3'",_value,_groupID,_side];
		[_query,1] call DB_fnc_asyncCall;
		["GANGBANK",format ["Gangbank withdraw UID - %1 || VALUE - %2 || SIDE - %3 || GANG ID - %4",_uid,_value,_side,_groupID]] call TON_fnc_customLog;
		["atm","add",_value2,"TakeMoneyFromGang"] remoteExecCall ["UnionClient_system_myCash",(owner _unit)];
	};
};

//добавить проверок из закладки J4FG
