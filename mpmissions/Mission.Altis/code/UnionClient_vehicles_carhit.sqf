/*
	
	Filename: 	UnionClient_vehicles_carhit.sqf
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
if (life_hit_by_car) exitWith {};

if (!isNull life_DraggedBody) then {[] call UnionClient_system_dropDeadBody};

private _driverName = getPlayerUID (driver _source);
private _message = format [localize "STR_NOTF_CarHit",_driverName];

if (!life_hit_by_car && LSALIVE(player)) then {
	life_hit_by_car = true;
	titleText [_message,"PLAIN"];
	systemchat _message;	
	uiSleep 3;
	life_hit_by_car = false;
};