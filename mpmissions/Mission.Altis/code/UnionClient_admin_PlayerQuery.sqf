/*

	Filename: 	UnionClient_admin_PlayerQuery.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _ret = param [0,objNull,[objNull]];
if (isNil "_ret") exitWith {};
if (isNull _ret) exitWith {};

private _side = [playerSide] call UnionClient_system_convertSide;
private _licenses = [];
{
	if (LICENSE_VALUE(configName _x,_side)) then {
		_licenses pushBack (configName _x);		
	};
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "LifeCfgLicenses"));
	
[BANK,CASH,FETCH_CONST(life_donator),_licenses,player] remoteExecCall ["UnionClient_admin_info",_ret];