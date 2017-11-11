/*

	Filename: 	UnionClient_garage_HouseMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_house",ObjNull,[ObjNull]],
	["_type","",[""]]
];

if (isNull _house) exitWith {};

private _garageSpawnPos = M_CONFIG2(getArray,"LifeCfgHousing",worldName,typeOf _house,"garageSpawnPos");
private _garageSpawnDir = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"garageSpawnDir");

if (EQUAL(_garageSpawnPos,[])) exitWith {};

life_garage_sp_name = "none";
life_garage_type = _type;
life_garage_sp = [(_house modelToWorld _garageSpawnPos),(getDir _house)-_garageSpawnDir];
life_garage_isHouse = true;

[[steamid,playerSide,_type,player],"getVehicles","TON",false] call UnionClient_system_hcExec;

disableSerialization;
createDialog "UnionDialogImpound";
waitUntil {!isNull (findDisplay 2800)};
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[2803,false];
ctrlShow[2812,false];
ctrlShow[2813,false];
ctrlShow[2814,false];