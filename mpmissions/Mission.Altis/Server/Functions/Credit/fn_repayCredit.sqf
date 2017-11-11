#include "\UnionServer\script_macros.hpp"
/*
    File: fn_repayCredit.sqf
    Author: Merrick

    Description:
    Запрос на погашение кредита

    [player,steamid,playerSide,life_haveCredit select 0] remoteExec ["TON_fnc_repayCredit",RSERV];
*/
params [
	["_unit",ObjNull,[ObjNull]],
	["_steamid","",[""]],
	["_side",sideUnknown,[civilian]],
	["_price",0,[0]]
];
if (isNull _unit || _steamid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {
	life_creditInUse = false;
    owner _unit publicVariableClient "life_creditInUse";
};
_query = format ["UPDATE players SET jail_time='%1' WHERE playerid='%2'", _time,_playeruid];

[_query,1] call DB_fnc_asyncCall;