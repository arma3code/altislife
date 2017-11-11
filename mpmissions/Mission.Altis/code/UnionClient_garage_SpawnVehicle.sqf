/*

	Filename: 	UnionClient_garage_SpawnVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_className","",[""]],
	["_color","",[""]],
	["_material","",[""]],
	["_sp",[],[[],""]],
	["_dir",0,[0]],
	["_fuel",0,[0]],
	["_vTrunk",[],[[]]],
	["_vCargo",[],[[]]],
	["_plate","",[0]],//[""] сделать так, когда номера станут не только цифровыми
	["_vside","",[""]],
	["_config",[],[[]]],
	["_insPrice",0,[0]]
];

if (EQUAL(_sp,"")) exitWith {};

private _vehicle = createVehicle [_className,_sp,[],0,"NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setPos _sp;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir _dir;
_vehicle setDamage 0;
_vehicle setFuel _fuel;

if !(EQUAL((_vTrunk select 0),[])) then {[_vehicle,"Trunk",_vTrunk] call CBA_fnc_setVarNet};
[_vehicle,"dbInfo",[steamid,_plate]] call CBA_fnc_setVarNet;
[_vehicle,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;
[_vehicle,"insPrice",_insPrice] call CBA_fnc_setVarNet;

player reveal _vehicle;
life_vehicles pushBack _vehicle;

[steamid,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
if !(EQUAL(_color,"")) then {[_vehicle,_color] call UnionClient_system_colorVehicle};
if !(EQUAL(_material,"")) then {[_vehicle,_material] call UnionClient_system_materialVehicle};
//if ([typeof _vehicle] call UnionClient_system_havePlate) then {[_vehicle] call UnionClient_system_setPlate};

[_vehicle] call UnionClient_system_vehSetupRadio;
[_vehicle] call UnionClient_system_trunkCheck;
[_vehicle] call UnionClient_system_clearVehicleAmmo;
[_vehicle] call UnionClient_system_clearVehicleTrunk;
[_vehicle] call UnionClient_system_clearVehicleSensors;

[_vehicle] remoteExec ["UnionClient_system_vehicleActions",[west,east],_vehicle];

private ["_weaponCount","_magazineCount","_itemCount","_backpackCount","_itemData"];
{
		if (EQUAL(_x,[])) exitWith {};
		_x params ["_weapons","_magazines","_items","_backpacks"];

		clearWeaponCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;

		//Оружие в тачку
		{
			_itemData = [_x] call UnionClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_weaponCount = (_weapons select 1) select _forEachIndex;
				_vehicle addWeaponCargoGlobal [_x,_weaponCount];
			};
		} foreach (_weapons select 0);

		//Магазины в тачку
		{
			_itemData = [_x] call UnionClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_magazineCount = (_magazines select 1) select _forEachIndex;
				_vehicle addMagazineCargoGlobal [_x,_magazineCount];
			};
		} foreach (_magazines select 0);

		//Барахло в тачку
		{
			_itemData = [_x] call UnionClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_itemCount = (_items select 1) select _forEachIndex;
				_vehicle addItemCargoGlobal [_x,_itemCount];
			};
		} foreach (_items select 0);

		//Рюкзаки в тачку
		{
			_itemData = [_x] call UnionClient_system_itemDetails;
			if !(EQUAL(_itemData,[])) then {
				_backpackCount = (_backpacks select 1) select _forEachIndex;
				_vehicle addBackpackCargoGlobal [_x,_backpackCount];
			};
		} foreach (_backpacks select 0);
} foreach _vCargo;

[_vehicle] spawn UnionClient_system_vehicleAnimate;
[_vehicle,_config] call UnionClient_adac_InitUpgrades;

_vehicle lock 2;
_vehicle disableTIEquipment true;
_vehicle enableRopeAttach false;

_vehicle spawn {
	uiSleep 3;
	_this allowDamage true;
};

//hint "Ваша техника готова!";
["Ваша техника готова","done"] call UnionClient_system_hint;