/*

	Filename: 	UnionClient_vehicles_destroyAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\script_macros.hpp"
private _veh = param [0,ObjNull,[ObjNull]];
if (isNull _veh OR !(ISPSIDE(west))) exitWith {};
if (player distance _veh > ((boundingBox _veh select 1) select 0) + 2) exitWith {hint localize "STR_NOTF_TooFarFromTarget"};

for "_i" from 1 to 10 do {
	titleText[format[localize "STR_NOTF_VehDestroyIn", (11 - _i)],"PLAIN"];
	uiSleep 1;
	if !(alive _veh) exitWith {};	
};

titleText["","PLAIN"];

if (alive _veh) then {	
	[_veh,"isInsured"] call UnionClient_system_clearGlobalVar;
	_veh setDamage 1;
};