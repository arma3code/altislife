/*

	Filename: 	UnionClient_system_setTag.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
[] call UnionClient_system_tagConfig;

private _side = [playerSide] call UnionClient_system_convertSide;
{
	if ([getText(_x >> "conditions")] call UnionClient_system_conditionsCheck) exitWith {life_myTagID = configName _x};
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "LifeCfgTags"));

if (EQUAL(life_myTagID,"")) then {	
	[player,"realname",profileName] call CBA_fnc_setVarNet;
} else {
	[player,"realname",format["[%1] %2",M_CONFIG(getText,"LifeCfgTags",life_myTagID,"title"),profileName]] call CBA_fnc_setVarNet;
};