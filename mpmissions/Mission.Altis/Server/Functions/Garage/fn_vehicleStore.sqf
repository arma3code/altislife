#include "\UnionServer\script_macros.hpp"
/*
    File: fn_vehicleStore.sqf
    Description:
    Stores the vehicle in the 'Garage'
*/
private ["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo","_saveItems","_storetext","_resourceItems","_fuel","_damage","_itemList","_totalweight","_weight","_thread","_save_vehicle_inventory"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,objNull,[objNull]] call BIS_fnc_param;
_sp = [_this,3,"",[""]] call BIS_fnc_param;

if (isNull _vehicle || isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.
_vInfo = _vehicle getVariable ["dbInfo",[]];

if !(_vInfo isEqualTo []) then {
    _plate = _vInfo select 1;
    _uid = _vInfo select 0;
};

// because fuel price!
 _fuel = (fuel _vehicle);
_save_vehicle_inventory = 0;
if (_save_vehicle_inventory isEqualTo 1) then {
    _vehItems = getItemCargo _vehicle;
    _vehMags = getMagazineCargo _vehicle;
    _vehWeapons = getWeaponCargo _vehicle;
    _vehBackpacks = getBackpackCargo _vehicle;
    _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
    // no items? clean the array so the database looks pretty
    if ((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {_cargo = [];};
} else {
    _cargo = [];
};

_trunk = _vehicle getVariable ["Trunk", [[],0]];
_trunk = [_trunk] call DB_fnc_mresArray;
_cargo = [_cargo] call DB_fnc_mresArray;

if (_impound) exitWith {
    if (_vInfo isEqualTo []) then  {
        life_impound_inuse = false;
        (owner _unit) publicVariableClient "life_impound_inuse";

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };
    } else {    // no free repairs!
		_query = format ["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5' WHERE pid='%1' AND plate='%2'", _uid, _plate, _trunk, _cargo, _fuel];
        diag_log _query;

        _thread = [_query,1] call DB_fnc_asyncCall;

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };

        life_impound_inuse = false;
        (owner _unit) publicVariableClient "life_impound_inuse";
    };
};

// not persistent so just do this!
if (_vInfo isEqualTo []) exitWith {
    [1,"STR_Garage_Store_NotPersistent",true] remoteExecCall ["UnionClient_system_broadcast",(owner _unit)];
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};

if !(_uid isEqualTo getPlayerUID _unit) exitWith {
    [1,"STR_Garage_Store_NoOwnership",true] remoteExecCall ["UnionClient_system_broadcast",(owner _unit)];
    life_garage_store = false;
    (owner _unit) publicVariableClient "life_garage_store";
};
private _countAR = _vehicle getVariable ["Trunk", [[],0]];
if (_countAR isEqualTo [[],0]) then {
     _query = format ["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5', spname='none', insure='0' WHERE pid='%1' AND plate='%2'", _uid, _plate, _trunk, _cargo, _fuel];
} else {
    _query = format ["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5', spname='%6', insure='0' WHERE pid='%1' AND plate='%2'", _uid, _plate, _trunk, _cargo, _fuel, _sp];
};


[_query,1] call DB_fnc_asyncCall;

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

life_garage_store = false;
(owner _unit) publicVariableClient "life_garage_store";
[(localize "STR_Garage_Store_Success"),"done"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];