/*

	Filename: 	UnionClient_system_padSkinConfig.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgPadSkins" >> life_myPadSkinID)) exitWith {
	life_myPadSkinID = "default";
};

private _conditions = M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {
	life_myPadSkinID = "default";
};