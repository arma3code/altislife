#include "\UnionServer\script_macros.hpp"
/*
    File: fn_removeGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Removes gang from database
*/
private _group = param [0,grpNull,[grpNull]];
private _side = param [1,sideUnknown,[civilian]];
if (isNull _group OR _side isEqualTo sideUnknown) exitWith {};

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

[format ["DELETE FROM gangs WHERE id='%1'",_groupID],1] call DB_fnc_asyncCall;
uisleep 2;
_result = [format ["SELECT id FROM gangs WHERE active='1' AND id='%1'",_groupID],2] call DB_fnc_asyncCall;
if (count _result isEqualTo 0) then {
    [_group] remoteExecCall ["UnionClient_gangs_Disbanded",(units _group)];
    uisleep 3;
    deleteGroup _group;
};

