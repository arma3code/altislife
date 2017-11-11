/*
	
	Filename: 	UnionClient_dmg_Vehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_source",Objnull,[Objnull]]
];

if (isNull _unit OR isNull _source) exitWith {};
if (_unit GVAR ["dmgVehicle",false]) exitWith {};

if (!isNull life_DraggedBody) then {[] call UnionClient_system_dropDeadBody};

private _driverName = getPlayerUID (driver _source);
private _message = format ["%1 пытался вас задавить! Сделайте скриншот, если считаете это намеренным наездом!",_driverName];

_unit SVAR ["dmgVehicle",true];
life_hit_by_car = true;
titleText [_message,"PLAIN"];
systemchat _message;
uiSleep 3;
_unit SVAR ["dmgVehicle",false];