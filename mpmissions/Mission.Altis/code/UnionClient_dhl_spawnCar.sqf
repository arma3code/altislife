/*

	Filename: 	UnionClient_dhl_spawnCar.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(call UnionClient_dhl_check) exitWith {hint localize "STR_DHL_CheckError"};
private _className = LIFE_SETTINGS(getText,"life_dhl_car");
private _spawnPoint = LIFE_SETTINGS(getText,"life_dhl_office");
private _spawnPointPos = getMarkerPos _spawnPoint;

if (EQUAL(_className,"")) exitWith {hint "Не задан класс автомобиля в конфиге"};
if (EQUAL(_spawnPoint,"")) exitWith {hint "Не задана точка спауна в конфиге"};
if !(ISPSIDE(civilian)) exitWith {hint "Работа в DHL доступна только гражданам"};
if (count(nearestObjects[_spawnPointPos,["LandVehicle","Ship","Air"],5]) > 0) exitWith {hint "Точка выдачи занята!"};
if (!isNull life_dhl_car) exitWith {hint "У вас уже есть машина для доставки"};
if (alive life_dhl_car) exitWith {hint "У вас уже есть машина для доставки"};

life_dhl_car = createVehicle [_className,[0,0,999],[],0,"NONE"];
waitUntil {!isNil "life_dhl_car" && {!isNull life_dhl_car}};
life_dhl_car allowDamage false;
life_dhl_car setVectorUp (surfaceNormal _spawnPointPos);
life_dhl_car setDir (markerDir _spawnPoint);
life_dhl_car setPos _spawnPointPos;

player reveal life_dhl_car;
life_vehicles pushBack life_dhl_car;
[steamid,playerSide,life_dhl_car,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

[life_dhl_car,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;
[life_dhl_car,"insPrice"] call UnionClient_system_clearGlobalVar;

[life_dhl_car] call UnionClient_system_vehSetupRadio;
[life_dhl_car] call UnionClient_system_clearVehicleAmmo;

life_dhl_car lock 2;
life_dhl_car disableTIEquipment true;
life_dhl_car enableRopeAttach false;
life_dhl_car allowDamage true;

hint "Автомобиль выдан!";

[] spawn UnionClient_dhl_spawnCarTask;