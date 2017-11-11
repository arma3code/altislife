/*

	Filename: 	UnionClient_system_passportConfig.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _side = [playerSide] call UnionClient_system_convertSide;

if (!isClass (missionConfigFile >> "LifeCfgPassports" >> life_myPassportID)) exitWith {
	life_myPassportID = format ["%1default",_side];
};

private _passportSide = M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"side");
if !(EQUAL(_passportSide,_side)) exitWith {
	life_myPassportID = format ["%1default",_side];
};

private _conditions = M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {
	life_myPassportID = format ["%1default",_side];	
};