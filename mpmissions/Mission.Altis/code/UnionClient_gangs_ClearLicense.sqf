/*

	Filename: 	UnionClient_gangs_ClearLicense.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_save",true,[false]]
];

if (playerSide in [west,east]) exitWith {};

switch (playerSide) do {
	case civilian: {
		if (life_civlevel > 1) then {life_civlevel = 1};
		player SVAR ["lvl",life_civlevel,true];

		{
			if (LICENSE_VALUE(configName _x,"civ")) then {
				_varName = getText(_x >> "variable");
				_sideFlag = getText(_x >> "side");
				SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
			};
		} foreach ("(getText(_x >> 'side') isEqualTo 'civ') && (getNumber(_x >> 'gang') isEqualTo 1)" configClasses (missionConfigFile >> "LifeCfgLicenses"));

		[] call UnionClient_system_setTag;
	};

	case independent: {
		if (life_reblevel > 1) then {life_reblevel = 1};
		player SVAR ["lvl",life_reblevel,true];

		{
			if (LICENSE_VALUE(configName _x,"reb")) then {
				_varName = getText(_x >> "variable");
				_sideFlag = getText(_x >> "side");
				SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
			};
		} foreach ("(getText(_x >> 'side') isEqualTo 'reb') && (getNumber(_x >> 'gang') isEqualTo 1)" configClasses (missionConfigFile >> "LifeCfgLicenses"));

		[] call UnionClient_system_setTag;
	};
};

if (_save) then {[19] call UnionClient_session_updatePartial};