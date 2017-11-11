#include "\UnionServer\script_macros.hpp"
/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends a request to query the database information and returns vehicles.
*/
private _pid = param [0,"",[""]];
private _side = param [1,sideUnknown,[west]];
private _type = param [2,"",[""]];
private _unit = param [3,objNull,[objNull]];

//Error checks
if (_pid isEqualTo "" || _side isEqualTo sideUnknown || _type isEqualTo "" || isNull _unit) exitWith {
    if (!isNull _unit) then {
        [[]] remoteExec ["UnionClient_garage_Menu",(owner _unit)];
    };
};

_unit = owner _unit;

_side = switch (_side) do {
    case west: {"cop"};
    case east: {"med"};
    case civilian: {"civ"};
    case independent: {"reb"};
    default {"Error"};
};

/* if (_type isEqualTo "Gang") then {
    _pid = (group _unit) getVariable ["gang_owner",""];
}; */

if (_side isEqualTo "Error") exitWith {
    [[]] remoteExec ["UnionClient_garage_Menu",(owner _unit)];
};

private _query = switch (_type) do {
//                             0      1        2       3        4            5      6           7           8       9     10      11        12
    case "Car":{format ["SELECT id, classname, color, spname, tuning_data, insure, baseprice ,material, inventory, fuel, gear, servermap, parking FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND type='Car'",_pid]};
	case "Air":{format ["SELECT id, classname, color, spname, tuning_data, insure, baseprice ,material, inventory, fuel, gear, servermap, parking FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND type='Air'",_pid]};
    case "Ship":{format ["SELECT id, classname, color, spname, tuning_data, insure, baseprice ,material, inventory, fuel, gear, servermap, parking FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND type='Ship'",_pid]};
    case "All":{format ["SELECT id, classname, color, spname, tuning_data, insure, baseprice ,material, inventory, fuel, gear, servermap, parking FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND type='%2'",_pid]};
    case "Gang":{format ["SELECT id, classname, color, spname, tuning_data, insure, baseprice ,material, inventory, fuel, gear, servermap, parking FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND type='%2'",_pid]};
    case "Transfer":{format ["SELECT id, side, classname, pid, alive, active, plate, color, material, spname, tuning_data, baseprice, servermap FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND servermap !='%2'",_pid,worldName]};
    case "Parking":{format ["SELECT id, classname, plate, parking FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND parking != '[]'",_pid]};
};
if !(_type isEqualTo "Parking") then {
    if ((_side isEqualTo "civ") OR (_side isEqualTo "reb")) then {
        _query = _query + " AND side IN ('civ', 'reb')";
    } else {
        _query = _query + format [" AND side = '%1'",_side];
    };
};
private _tickTime = diag_tickTime;
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["getVehicles Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};
if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["UnionClient_garage_Menu",(owner _unit)];
};

if (_type == "Parking") exitWith {
[_queryResult] remoteExec ["UnionClient_parking_MenuRet",_unit];
};
if (_type == "Transfer") exitWith {
[_queryResult] remoteExec ["UnionClient_system_vehTransferMenu",_unit];
};

[_queryResult] call TON_fnc_getArrayVeh;

[_queryResult] remoteExec ["UnionClient_garage_Menu",_unit];