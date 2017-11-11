/*

	Filename: 	UnionClient_session_updateRequest.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNil "life_loading_completed") exitWith {};
if !(life_loading_completed) exitWith {};

if (call UnionClient_system_myCashCheck) exitWith {
	[steamid,0,"Money Hack At Save",format["Money Hack Detect At Save CASH %1 - BANK %2",CASH,BANK]] remoteExecCall ["TON_fnc_rcon",RSERV];
	["DUPE",[format["Money Hack Detect At Save CASH %1 - BANK %2 - %3 (%4)",CASH,BANK,GVAR_RNAME(player),steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV];
};
[4] call UnionClient_session_updatePartial;
private _packet = [steamid,playerSide,CASH,BANK];
private _flag = [playerSide] call UnionClient_system_convertSide;

private _array = [];
{
	_array pushBack [LICENSE_VARNAME(configName _x,_flag),LICENSE_VALUE(configName _x,_flag)];
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "LifeCfgLicenses"));
_packet pushBack _array;

[] call UnionClient_system_saveGear;
_packet pushBack life_gear;

_packet pushBack life_tmp_tax;
_packet pushBack life_tmp_selled;
life_tmp_tax = 0;
life_tmp_selled = [];

_array = [];
{
	_array pushBack [_x,(GVAR_MNS _x)];
} foreach life_config_array;
_packet pushBack _array;

_array = [];
{
	_array pushBack [_x,(GVAR_MNS _x)];
} foreach life_indicators_array;
_packet pushBack _array;

_array = [];
{
	_array pushBack [RECIPE_VARNAME(configName _x),RECIPE_VALUE(configName _x)];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgRecipes"));
_packet pushBack _array;

_packet pushBack DCASH;
_packet pushBack life_deaths;

[_packet,"updateRequest","DB",false] call UnionClient_system_hcExec;