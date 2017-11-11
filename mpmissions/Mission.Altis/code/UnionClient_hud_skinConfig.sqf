/*

	Filename: 	UnionClient_hud_skinConfig.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgThemes" >> life_myThemeID)) then {
	life_myThemeID = "default";
};