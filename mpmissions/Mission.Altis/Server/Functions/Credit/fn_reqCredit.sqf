#include "\UnionServer\script_macros.hpp"
/*
    File: fn_reqCredit.sqf
    Author: Merrick

    Description:
    Запрос кредита

    [player,steamid,playerSide,life_houses_count,(life_houses_count * LIFE_SETTINGS(getNumber,"life_houseCreditPrice"))] remoteExec ["TON_fnc_reqCredit",RSERV];
    life_haveCredit {
	0
	1
	2 стим айди
	3 сумма
	4
	5 дата
	6
}
life_haveCredit = [0,0,"76561198006439083",312312,"27-21-23","27-21-23",0]
*/
params [
	["_unit",ObjNull,[ObjNull]],
	["_steamid","",[""]],
	["_side",sideUnknown,[civilian]],
	["_price",0,[0]],
	["_pid",0,[0]]
];
if (isNull _unit || _steamid isEqualTo "" || _side isEqualTo sideUnknown || !(_side isEqualTo civilian) exitWith {
	life_creditInUse = false;
    owner _unit publicVariableClient "life_creditInUse";
};
//private _time = (call TON_fnc_getServerTime);
//private _date = format["[%3-%2-%1]",_time select 0 call TON_fnc_doubledigits,_time select 1 call TON_fnc_doubledigits,_time select 2 call TON_fnc_doubledigits];

life_haveCredit = [];