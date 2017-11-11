/*

	Filename: 	UnionClient_actions_catchTurtle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_obj"];
_obj = cursorObject;
if(isNull _obj OR alive _obj) exitWith {}; //Not valid

if(([true,"turtle",1] call UnionClient_system_handleInv)) then {
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
};