/*
	
	Filename: 	UnionClient_system_licenseCheck.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _cop = param [0,ObjNull,[ObjNull]];
if (isNull _cop) exitWith {};

private _flag = [playerSide] call UnionClient_system_convertSide;
private _licenses = "";

{	
	if (LICENSE_VALUE(configName _x,_flag)) then {
		_licenses = _licenses + (localize (getText(_x >> "displayName"))) + "<br/>";
	};
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "LifeCfgLicenses"));

if (EQUAL(_licenses,"")) then {_licenses = localize "STR_Cop_NoLicensesFound"};

[GVAR_RNAME(player),_licenses] remoteExecCall ["UnionClient_system_licensesRead",_cop];