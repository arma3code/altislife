/*

	Filename: 	UnionClient_effects_Terminate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"

{
	if (!isNull _x) then {
		terminate _x;
	};
} forEach [LIFE_HANDLE_EFFECTS,LIFE_HANDLE_DRUGS,LIFE_HANDLE_DMG,LIFE_HANDLE_SICK,LIFE_HANDLE_DRUNK,LIFE_HANDLE_FOODWATER,LIFE_HANDLE_WEIGHT,LIFE_HANDLE_PVP,LIFE_HANDLE_WARZONES,LIFE_HANDLE_POSITION,LIFE_HANDLE_TEAMSPEAK,LIFE_HANDLE_URAN,LIFE_HANDLE_TEMPVARS];

{
	if !(EQUAL(_x,-1)) then {
		ppEffectDestroy [_x];
	};
} forEach [LIFE_PPE_DAMAGE05,LIFE_PPE_DRUNK,LIFE_PPE_DRUGS_DB,LIFE_PPE_DRUGS_CA];