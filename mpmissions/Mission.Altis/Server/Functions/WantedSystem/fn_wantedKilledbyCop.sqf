/*
    File: fn_wantedBounty.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Checks if the person is on the bounty list and awards the cop for killing them.
    [_unit,_killer,steamid,playerSide]

*/
params [
    ["_unit",objNull,[objNull]],
    ["_cop",objNull,[objNull]],
    ["_unitId","",[""]],
    ["_side",sideUnknown,[civilian]]
];
if (isNull _unit || isNull _cop || _unitId isEqualTo "" || _side isEqualTo sideUnknown) exitWith {};
if (_side isEqualTo west) exitWith {};
//waitUntil {!alive _unit OR _unit getVariable ["lifeState",""] isEqualTo "HEALTHY"};
if (_unit getVariable ["lifeState",""] isEqualTo "HEALTHY") exitWith {};

_query = format ["SELECT wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_unitId];
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (count _queryResult != 0) then {
    _amount = _queryResult select 0;
    if (_amount != 0) then {
        [((_amount) / 2),_amount] remoteExecCall ["UnionClient_system_bountyReceive",(owner _cop)];
        [_unitId] call TON_fnc_wantedRemove;
    };
};
