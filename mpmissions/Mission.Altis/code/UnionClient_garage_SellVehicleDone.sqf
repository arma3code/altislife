/*
	
	Filename: 	UnionClient_garage_SellVehicleDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_vehicle","_price","_displayName"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_price = [_this,1,0,[0]] call BIS_fnc_param;

_displayName = getText(configFile >> "CfgVehicles" >> (_vehicle) >> "displayName");
hint format["Вы успешно продали %1 за $%2",_displayName,[_price] call UnionClient_system_numberText];

["atm","add",_price,"sellVehicleFromGarage"] call UnionClient_system_myCash;
life_action_inUse = false;