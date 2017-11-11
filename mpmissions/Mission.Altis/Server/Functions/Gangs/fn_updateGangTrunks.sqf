/*
    File : fn_updateGangTrunk.sqf

    Description:
    Update inventory container gangs
*/

private ["_container","_user","_varDB","_trunkData","_invData","_conditions","_transporters","_query"];
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_user = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if (isNull _container OR isNull _user) exitWith {};
_varDB = _container getVariable ["VarDB",""];
if (_varDB isEqualTo "") exitWith {
	diag_log "varDB null";
};
_trunkData = _container getVariable ["Trunk",[[],0]];
_invData = _container getVariable ["inventory",[[],0]];
_trunkData = [_trunkData] call DB_fnc_mresArray;
_invData = [_invData] call DB_fnc_mresArray;

_query = format ["UPDATE gangsContainers SET inventory='%1', trunk='%2' WHERE class='%3'",_invData,_trunkData,_varDB];
diag_log _query;
[_query,1] call DB_fnc_asyncCall;

