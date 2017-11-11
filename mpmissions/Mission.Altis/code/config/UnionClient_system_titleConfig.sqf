/*

	Filename: 	UnionClient_system_titleConfig.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgTitles" >> life_myTitleID)) exitWith {
	life_myTitleID = "default";
};

if !([M_CONFIG(getText,"LifeCfgTitles",life_myTitleID,"conditions")] call UnionClient_system_conditionsCheck) exitWith {
	life_myTitleID = "default";
};