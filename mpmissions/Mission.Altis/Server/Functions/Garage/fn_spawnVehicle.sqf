#include "\UnionServer\script_macros.hpp"
params [
    ["_vid",-1,[0]],
    ["_pid","",[""]],
    ["_sp",[],[[],""]],
	["_unit",objNull,[objNull]],
	["_price",0,[0]],
	["_dir",0,[0]],
	["_sp_name","",[""]]   
];

private _unit_return = _unit;
private _name = name _unit;
private _side = side _unit;
_unit = owner _unit;

if (_vid isEqualTo -1 || _pid isEqualTo "") exitWith {};
if (_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;
private _servIndex = serv_sv_use find _vid;
//                               0   1       2        3     4     5      6       7      8        9       10    11     12          13       14           15
private _query = format ["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory, gear, fuel, tuning_data, spname, baseprice, material, side FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];
private _tickTime = diag_tickTime;
private _queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {};

private _vInfo = _queryResult;

if (isNil "_vInfo") exitWith {serv_sv_use deleteAt _servIndex;};
if (_vInfo isEqualTo []) exitWith {serv_sv_use deleteAt _servIndex;};

if ((_sp_name isEqualTo (_vInfo select 13)) OR ((_vInfo select 13) isEqualTo "") OR ((_vInfo select 13) isEqualTo "none")) then {

if ((_vInfo select 5) isEqualTo 0) exitWith {
    serv_sv_use deleteAt _servIndex;
    [1,"STR_Garage_SQLError_Destroyed",true,[_vInfo select 2]] remoteExecCall ["UnionClient_system_broadcast",_unit];
};

if ((_vInfo select 6) isEqualTo 1) exitWith {
    serv_sv_use deleteAt _servIndex;
    [1,"STR_Garage_SQLError_Active",true,[_vInfo select 2]] remoteExecCall ["UnionClient_system_broadcast",_unit];
};

private _nearVehicles = if (!(_sp isEqualType "")) then {nearestObjects[_sp,["Car","Air","Ship"],10]} else {[]};

if !(_nearVehicles isEqualTo []) exitWith {
    serv_sv_use deleteAt _servIndex;
    [_price,_unit_return] remoteExecCall ["UnionClient_garage_Refund",_unit];
    [1,"STR_Garage_SpawnPointError",true] remoteExecCall ["UnionClient_system_broadcast",_unit];
};

_query = format ["UPDATE vehicles SET active='1', insure='0' WHERE pid='%1' AND id='%2'",_pid,_vid];

[_query,1] call DB_fnc_asyncCall;

private _trunk = [(_vInfo select 9)] call DB_fnc_mresToArray;
private _gear = [(_vInfo select 10)] call DB_fnc_mresToArray;
                     
[(_vInfo select 2),(_vInfo select 8),(_vInfo select 15),_sp,_dir,(_vInfo select 11),_trunk,_gear,(_vInfo select 7),(_vInfo select 16),(_vInfo select 12),(_vInfo select 14)] remoteExecCall ["UnionClient_garage_SpawnVehicle",_unit];

serv_sv_use deleteAt _servIndex;

} else {
	serv_sv_use deleteAt _servIndex;
	[_price,_unit_return] remoteExecCall ["UnionClient_garage_Refund",_unit];
    ["Эта техника в другом гараже","warning"] remoteExecCall ["UnionClient_system_hint",_unit];
};