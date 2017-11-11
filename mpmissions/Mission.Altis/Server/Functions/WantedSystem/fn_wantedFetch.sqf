#include "\UnionServer\script_macros.hpp"
private ["_ret","_list","_jlist","_result","_queryResult","_units","_inStatement","_crims"];
_ret = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _ret) exitWith {};
_ret = owner _ret;
_inStatement = "";
_list = [];
_jlist = [];
_units = [];
//{if ((side _x) isEqualTo civilian) then {_units pushBack (getPlayerUID _x)};} forEach playableUnits;
{if ((side _x) isEqualTo civilian || (side _x) isEqualTo independent) then {_units pushBack (getPlayerUID _x)};} forEach playableUnits;
if (_units isEqualTo []) exitWith {[_list,_jlist] remoteExec ["UnionClient_system_wantedList",_ret];};

{
    if !(_units isEqualTo []) then {
        if (_inStatement isEqualTo "") then {
            _inStatement = "'" + _x + "'";
        } else {
            _inStatement = _inStatement + ", '" + _x + "'";
        };
    } else {
        _inStatement = _x;
    };
} forEach _units;

_queryResult = [format ["SELECT wantedID, wantedName, wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID in (%1)",_inStatement],2,true] call DB_fnc_asyncCall;

{
    _crims = [_x select 2] call DB_fnc_mresToArray;
    _list pushBack [_x select 0,_x select 1,_crims,_x select 3];
} forEach _queryResult;

_queryResult = [format ["SELECT arrested FROM players WHERE arrested='1' AND playerid in (%1)",_inStatement],2,true] call DB_fnc_asyncCall;

{
    _jlist pushBack (_x);
} forEach _queryResult;

if (_jlist isEqualTo []) exitWith {[_list,_jlist] remoteExec ["UnionClient_system_wantedList",_ret];};

[_list,_jlist] remoteExec ["UnionClient_system_wantedList",_ret];