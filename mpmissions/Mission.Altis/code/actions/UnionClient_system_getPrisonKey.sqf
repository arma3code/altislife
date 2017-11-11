/*

	Filename: 	UnionClient_system_getPrisonKey.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
if ((west countSide playableUnits) < (LIFE_SETTINGS(getNumber,"life_cop_min"))) exitWith {
	hint format[localize "STR_NOTF_PrisonKeyCops",(LIFE_SETTINGS(getNumber,"life_cop_min"))];
};

if (!life_prisonkey) then {
	life_prisonkey = true;
	titleText[localize "STR_NOTF_PrisonKeyGet","PLAIN"];
};