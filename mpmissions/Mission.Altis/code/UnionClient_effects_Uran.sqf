/*

	Filename: 	UnionClient_effects_Uran.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
while {true} do {
	if (!life_radx_used && (LSALIVE(player))) then {
		player say3d "radiation1";
		systemChat "Вы находитесь в радиактивной зоне !!! Без специальной защиты вы погибнете мучительной смертью!!!";				
		if ((damage player) < 0.89) then {
			player setDamage ((damage player) + 0.05);
		} else {
			[player,player] call UnionClient_dmg_Agony;
		};
	};
	uiSleep 10;
};