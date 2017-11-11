/*

	Filename: 	UnionClient_system_removeLicenses.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _state = param [0,-1,[0]];
if (EQUAL(_state,-1)) exitWith {};

private _side = [playerSide] call UnionClient_system_convertSide;

switch (_state) do {
	//Death while being wanted
	case 0: {
		if (LIFE_SETTINGS(getNumber,"life_removeLicByJail") == 1) then {
			{
				if (_side == M_CONFIG(getText,"LifeCfgLicenses",_x,"side")) then {
					SVAR_MNS [LICENSE_VARNAME(_x,_side),false];
				};
			} forEach (LIFE_SETTINGS(getArray,"life_removeLicByJailList"));
		};
	};

	//Remove motor vehicle licenses
	case 1: {
		if (LIFE_SETTINGS(getNumber,"life_removeLicByVeh") == 1) then {
			{
				if (_side == M_CONFIG(getText,"LifeCfgLicenses",_x,"side")) then {
					SVAR_MNS [LICENSE_VARNAME(_x,_side),false];
				};
			} forEach (LIFE_SETTINGS(getArray,"life_removeLicByVehList"));
		};
	};
};