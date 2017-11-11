/*
	
	Filename: 	UnionClient_admin_TpTo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_unit"];
_unit = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

player setPosATL (getPosATL _unit);
player reveal _unit;
 
hint format["Вы телепортировались к %1",GVAR_RNAME(_unit)];