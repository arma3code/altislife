/*

	Filename: 	UnionClient_effects_Dmg.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _heartbeatTime = 0;
while {damage player > 0.25 && LSALIVE(player)} do {
	if ((time - _heartbeatTime) > 60) then {
		player say3D "heartbeat";
		_heartbeatTime = time;
	};
	if (damage player > 0.5) then {	
		if (EQUAL(LIFE_PPE_DAMAGE05,-1)) then {
			LIFE_PPE_DAMAGE05 = ppEffectCreate ["colorCorrections", 2009];
			LIFE_PPE_DAMAGE05 ppEffectEnable true;
			LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1.04, -0.004, [0.5, 0.5, 0.5, 0.0], [0.5, 0.5, 0.5, 0.0],  [0.5, 0.5, 0.5, 0.0]]; 
			LIFE_PPE_DAMAGE05 ppEffectCommit 5;
		};
	} else {
		if !(EQUAL(LIFE_PPE_DAMAGE05,-1)) then {
			LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
			LIFE_PPE_DAMAGE05 ppEffectCommit 5;
			LIFE_PPE_DAMAGE05 = -1;
		};
	};
	uiSleep 5;
};

if !(EQUAL(LIFE_PPE_DAMAGE05,-1)) then {
	LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
	LIFE_PPE_DAMAGE05 ppEffectCommit 5;
	LIFE_PPE_DAMAGE05 = -1;
};