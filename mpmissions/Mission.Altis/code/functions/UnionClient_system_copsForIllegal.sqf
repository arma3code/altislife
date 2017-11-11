/*

	Filename: 	UnionClient_system_copsForIllegal.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _ret = round (((civilian countSide playableUnits) * 0.04) + ((independent countSide playableUnits) * 0.09));
if (_ret < LIFE_SETTINGS(getNumber,"life_cop_min_illegal")) then {_ret = LIFE_SETTINGS(getNumber,"life_cop_min_illegal")};
_ret;