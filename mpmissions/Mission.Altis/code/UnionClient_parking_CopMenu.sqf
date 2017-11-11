/*

	Filename: 	UnionClient_parking_CopMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _veh = param [0,ObjNull,[ObjNull]];
if (isNull _veh) exitWith {};
if !([_veh] call UnionClient_system_isVehicleKind) exitWith {};
if (!alive _veh) exitWith {};

disableSerialization;
if (!isNull (findDisplay 37400)) then {closeDialog 0};
createDialog "UnionDialogParkingCop";
waitUntil {!isNull (findDisplay 5500)};

private _title = CONTROL(5500,5501);
_title ctrlSetText format[localize "STR_PARKING_Title",(getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName"))];

life_vInact_curTarget = _veh;