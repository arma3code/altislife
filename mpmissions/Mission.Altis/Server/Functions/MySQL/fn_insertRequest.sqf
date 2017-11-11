#include "\UnionServer\script_macros.hpp"
/*
    File: fn_insertRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Adds a player to the database upon first joining of the server.
    Recieves information from core\sesison\fn_insertPlayerInfo.sqf
*/
private ["_queryResult","_query","_alias"];
params [
    "_uid",
    "_name",
    ["_returnToSender",objNull,[objNull]]
];

//Error checks
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if (isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

_query = format ["SELECT playerid, name FROM players WHERE playerid='%1'",_uid];


_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Insert Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

//Double check to make sure the client isn't in the database...
if (_queryResult isEqualType "") exitWith {[] remoteExecCall ["UnionClient_session_dataQuery",(owner _returnToSender)];}; //There was an entry!
if (count _queryResult != 0) exitWith {[] remoteExecCall ["UnionClient_session_dataQuery",(owner _returnToSender)];};

//Clense and prepare some information.
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.
//licenses fix temp maybe
private _Rebarray = [];
{
    _Rebarray pushBack [format ["license_%1_%2","reb",M_CONFIG(getText,"LifeCfgLicenses",configName _x,"variable")],0];
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'","reb"] configClasses (missionConfigFile >> "LifeCfgLicenses"));
_Rebarray = [_Rebarray] call DB_fnc_mresArray;
///////////////
private _Civarray = [];
{
    _Civarray pushBack [format ["license_%1_%2","civ",M_CONFIG(getText,"LifeCfgLicenses",configName _x,"variable")],0];
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'","civ"] configClasses (missionConfigFile >> "LifeCfgLicenses"));
_Civarray = [_Civarray] call DB_fnc_mresArray;
//Prepare the query statement..
_query = format ["INSERT INTO players (playerid, name, cash, bankacc, cop_licenses, med_licenses, civ_licenses, reb_licenses, gear, config, indicators, recipes, servermap) VALUES('%1', '%2', '0', '25000','""[]""','""[]""','%4','%5','""[]""','""[]""','""[]""','""[]""','%3')",
    _uid,
    _name,
    worldName,
    _Civarray,
    _Rebarray
];

[_query,1] call DB_fnc_asyncCall;
[] remoteExecCall ["UnionClient_session_dataQuery",(owner _returnToSender)];
