/*

	Filename: 	UnionClient_system_vehicleShopBuy.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _mode = param [0,true,[true]];
if (EQUAL((lbCurSel 2302),-1)) exitWith {titleText[localize "STR_Shop_Veh_DidntPick","PLAIN"];};

private _conditions = M_CONFIG(getText,"LifeCfgVehShops",life_veh_shop select 0,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {titleText[(M_CONFIG(getText,"LifeCfgVehShops",life_veh_shop select 0,"conditionsMessage")),"PLAIN"]};

private _classValue = CONTROL_VALUE(2302);
if (EQUAL(_classValue,0)) exitWith {titleText["Этот транспорт вам недоступен","PLAIN"]};

private _colorValue = CONTROL_VALUE(2304);
if (!(EQUAL((lbCurSel 2304),-1)) && {EQUAL(_colorValue,0)}) exitWith {titleText["Этот цвет вам недоступен","PLAIN"]};

private _materialValue = CONTROL_VALUE(2305);
if (!(EQUAL((lbCurSel 2305),-1)) && {EQUAL(_materialValue,0)}) exitWith {titleText["Этот материал вам недоступен","PLAIN"]};

private _className = CONTROL_DATA(2302);

private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price") * M_CONFIG(getNumber,"LifeCfgVehShops",(life_veh_shop select 0),"multiplier");
if (FETCH_CONST(life_donator) > 0) then {_basePrice = [_basePrice] call UnionClient_system_discount};

if (_mode) then {_basePrice = round(_basePrice * 1.5)};
private _color = CONTROL_DATA(2304);
private _material = CONTROL_DATA(2305);

private _classParents = [(configfile >> "CfgVehicles" >> _className),true] call BIS_fnc_returnParents;
if (server_ddos_air && {"Air" in _classParents}) exitWith {titleText["На острове наблюдаются магнитные бури. Воздушная техника временно недоступна","PLAIN"]};

if (CASH < _basePrice) exitWith {titleText[format[localize "STR_Shop_Veh_NotEnough",[_basePrice - CASH] call UnionClient_system_numberText],"PLAIN"]};

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

if (_spawnPoints isEqualType []) then {
	{
		if (count(nearestObjects[(getMarkerPos _x),["LandVehicle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};
	} foreach _spawnPoints;
} else {
	if (count(nearestObjects[(getMarkerPos _spawnPoints),["LandVehicle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
};

if (EQUAL(_spawnPoint,"")) exitWith {titleText[localize "STR_Shop_Veh_Block","PLAIN"];};

private _sp = getMarkerPos _spawnPoint;
private _vehicle = createVehicle [_className,[0,0,999], [], 0, "NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos _sp;

player reveal _vehicle;

life_vehicles pushBack _vehicle;
[steamid,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

_vehicle SVAR ["vehicle_info_owners",[[steamid,GVAR_RNAME(player)]],true];
_vehicle SVAR ["insPrice",_basePrice,true];

[_vehicle] call UnionClient_system_vehSetupRadio;
[_vehicle] call UnionClient_system_clearVehicleAmmo;
[_vehicle] call UnionClient_system_clearVehicleSensors;
[_vehicle] remoteExec ["UnionClient_system_vehicleActions",[west,east],_vehicle];

if (_mode) then {
	["cash","take",_basePrice,"VehicleBuy"] call UnionClient_system_myCash;
	//[steamid,playerSide,_vehicle,_color,_material,_basePrice,player] remoteExec ["TON_fnc_vehicleCreate",RSERV];
	[steamid,playerSide,_vehicle,_color,_material,_basePrice] remoteExec ["TON_fnc_vehicleCreate",RSERV];
	//titleText[localize "STR_NOTF_SendingData","PLAIN"];
	if !(EQUAL(_color,"")) then {[_vehicle,_color] call UnionClient_system_colorVehicle};
	if !(EQUAL(_material,"")) then {[_vehicle,_material] call UnionClient_system_materialVehicle};
	titleText[format["Вы купили %1 за $%2",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call UnionClient_system_numberText],"PLAIN"];
} else {
	["cash","take",_basePrice,"VehicleRent"] call UnionClient_system_myCash;
	titleText[format["Вы взяли в аренду %1 за $%2",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call UnionClient_system_numberText],"PLAIN"];

	if !(EQUAL(_color,"")) then {[_vehicle,_color] call UnionClient_system_colorVehicle};
	if !(EQUAL(_material,"")) then {[_vehicle,_material] call UnionClient_system_materialVehicle};
	//if ([typeof _vehicle] call UnionClient_system_havePlate) then {[_vehicle] call UnionClient_system_setPlate};
};

[_vehicle] spawn UnionClient_system_vehicleAnimate;
[_vehicle,[]] call UnionClient_adac_InitUpgrades;

_vehicle lock 2;
_vehicle disableTIEquipment true;
_vehicle enableRopeAttach false;
_vehicle allowDamage true;

closeDialog 0;