/*

	Filename: 	UnionClient_system_keyRecive.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_vehicle","_unit","_giver"];
_vehicle = _this select 0;
_unit = _this select 1;
_giver = _this select 2;
if(isNil "_unit" OR isNil "_giver") exitWith {};
if(player == _unit && !(_vehicle in life_vehicles)) then {
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	hint format["%1 передал вам ключи от %2",_giver,_name];
	life_vehicles pushBack _vehicle;		
	[steamid,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
};