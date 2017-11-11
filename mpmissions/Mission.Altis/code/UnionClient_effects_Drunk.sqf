/*

	Filename: 	UnionClient_effects_Drunk.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
LIFE_PPE_DRUNK = ppEffectCreate ["radialBlur", 2012];
LIFE_PPE_DRUNK ppEffectEnable true;
while {life_drink > 0} do {
	if (life_drink > 0.08) then {		
		LIFE_PPE_DRUNK ppEffectAdjust[0.08, 0,0.35,0.37];
		LIFE_PPE_DRUNK ppEffectCommit 3;
		uiSleep 240;
		life_drink = life_drink - 0.02;
	} else {			
		LIFE_PPE_DRUNK ppEffectAdjust[0.05, 0,0.36,0.38];
		LIFE_PPE_DRUNK ppEffectCommit 1;
		uiSleep 180;
		life_drink = life_drink - 0.02;
	};	
};		
LIFE_PPE_DRUNK ppEffectAdjust  [0,0,0,0];
LIFE_PPE_DRUNK ppEffectCommit 5;
LIFE_PPE_DRUNK = -1;
life_drink = 0;