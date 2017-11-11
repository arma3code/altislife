/*

	Filename: 	UnionClient_effects_TempVars.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
while {true} do {
	uiSleep 10;
	if (count life_ids > 0) then {
		{
			if (time - (_x select 1) > 600) then {				
				life_ids set [_forEachIndex,-1];
			}
		} forEach life_ids;		
		life_ids = life_ids - [-1];
	};

	if (count life_tempHouses > 0) then {
		{
			if (player distance (_x) > 50) then {
				life_tempHouses set [_forEachIndex,-1];
				hint "Вы далеко отошли от взломанного дома и потеряли ключи";
			}
		} forEach life_tempHouses;		
		life_tempHouses = life_tempHouses - [-1];
	};
};