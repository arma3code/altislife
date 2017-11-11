/*
	
	Filename: 	UnionClient_admin_TpHere.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

private _unit = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

_unit setPosATL (getPosATL player);
player reveal _unit;
 
hint format["You have teleported %1 to your location",GVAR_RNAME(_unit)];