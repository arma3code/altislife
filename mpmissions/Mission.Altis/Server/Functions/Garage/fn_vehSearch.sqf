#include "\UnionServer\script_macros.hpp"
/*
    File: fn_vehSearch.sqf
    Author: Merrick

    Description:
    Sends a request to query the database information and returns vehicles.
_retArray params ["_side","_classname","_type","_pid","_servermap","_name"];
*/
private _plate = param [0];
private _unit = param [1,objNull,[objNull]];
//Error checks
if (isNull _unit) exitWith {
    if (!isNull _unit) then {
        [[]] remoteExec ["UnionClient_vehdatabase_SearchDone",(owner _unit)];
    };
};

private _query = format ["SELECT side, classname, type, pid, servermap FROM vehicles WHERE plate='%1'",_plate];


private _queryResult = [_query,2,true] call DB_fnc_asyncCall;


if (EQUAL(_queryResult,[])) exitWith {[_queryResult] remoteExec ["UnionClient_vehdatabase_SearchDone",(owner _unit)]};

private _query = format ["SELECT name FROM players WHERE playerid='%1'",_queryResult select 0 select 3];


private _name = [_query,2,false] call DB_fnc_asyncCall;

(_queryResult select 0) pushBack (_name select 0);


[_queryResult] remoteExec ["UnionClient_vehdatabase_SearchDone",(owner _unit)];