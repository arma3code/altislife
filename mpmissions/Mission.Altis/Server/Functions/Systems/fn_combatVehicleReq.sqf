#include "..\..\script_macros.hpp"
/*
    File: fn_combatVehicleReq.sqf
    Author: Merrick

    Description:
    При попытке взять боевую технику, ставим счетчик если все норм - отдаем технику.
    [player,_cfgClass,life_combatVehMarker,_maximum] remoteExec ["TON_fnc_combatVehicleReq",RSERV];
    [cop_21,"cop_gh","cop_air_2",0]
*/
private _unit = param [0,objNull,[objNull]];
private _classname = param [1,"",[""]];
private _vehmarker = param [2,"",[""]];
private _maximum = param [3,0,[0]];

//Error checks
if (isNull _unit || _classname isEqualTo "" || _vehmarker isEqualTo "") exitWith {
    if (!isNull _unit) then {
        [[]] remoteExec ["UnionClient_system_getCombatVehicleMenu",(owner _unit)];
    };
};

private _query = format ["SELECT times FROM battleveh WHERE classname='%1'",_classname];
private _times = [_query,2,true] call DB_fnc_asyncCall;
if (_times isEqualTo []) exitWith {
    ["У этой техники превышен лимит доставаний","error"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];
};

_times = _times select 0 select 0;
if (_times >= _maximum) exitWith {
    ["У этой техники превышен лимит доставаний","error"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];
};
_query = format ["UPDATE battleveh SET times=times+'1' WHERE classname='%1'",_classname];
[_query,1] call DB_fnc_asyncCall;


[_classname,_vehmarker] remoteExec ["UnionClient_system_getCombatVehicleDone",(owner _unit)];