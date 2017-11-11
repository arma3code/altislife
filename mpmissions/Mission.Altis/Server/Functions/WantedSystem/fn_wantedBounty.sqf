/*
    File: fn_wantedBounty.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Checks if the person is on the bounty list and awards the cop for killing them.
    [[_unit,player,false],"wantedBounty"] call UnionClient_system_hcExec;
    _unit - наказывают
    player - наказавший

*/
private ["_unit","_cop","_half","_unitUid","_query","_queryResult","_amount"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_cop = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_half = [_this,2,false,[false]] call BIS_fnc_param;
if (isNull _unit || isNull _cop) exitWith {};

_unitUid = getPlayerUID _unit;
_query = format ["SELECT wantedID, wantedName, wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_unitUid];
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (count _queryResult != 0) then {
    _amount = _queryResult select 3;
    if (_amount != 0) then {
        if (_half) then {
            [((_amount) / 2),_amount] remoteExecCall ["UnionClient_system_bountyReceive",(owner _cop)];
        } else {
            [_amount,_amount] remoteExecCall ["UnionClient_system_bountyReceive",(owner _cop)];
        };
    };
};
