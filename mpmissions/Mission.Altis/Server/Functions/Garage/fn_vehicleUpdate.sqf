/*
    File: fn_vehicleUpdate.sqf

    Description:
    Tells the database that this vehicle need update inventory.
*/
#include "\UnionServer\script_macros.hpp"
private ["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread","_cargo","_trunk","_resourceItems","_fuel","_damage","_itemList","_totalweight","_weight","_unit"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_mode = [_this,2,2,[0]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;
switch (_mode) do {
    case 1: {
        _vehItems = getItemCargo _vehicle;
        _vehMags = getMagazineCargo _vehicle;
        _vehWeapons = getWeaponCargo _vehicle;
        _vehBackpacks = getBackpackCargo _vehicle;
        _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
		if (((_vehItems select 0) isEqualTo []) && ((_vehMags select 0) isEqualTo []) && ((_vehWeapons select 0) isEqualTo []) && ((_vehBackpacks select 0) isEqualTo [])) then {_cargo = [];};

        _cargo = [_cargo] call DB_fnc_mresArray;

        _query = format ["UPDATE vehicles SET gear='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_cargo];
        [_query,1] call DB_fnc_asyncCall;
    };

    case 2: {
        _trunk = _vehicle getVariable ["Trunk",[[],0]];
        _trunk = [_trunk] call DB_fnc_mresArray;
        _query = format ["UPDATE vehicles SET inventory='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk];
        [_query,1] call DB_fnc_asyncCall;
		[0,"Содержимое багажника сохранено..."] remoteExecCall ["UnionClient_system_broadcast",(owner _unit)];
    };
};