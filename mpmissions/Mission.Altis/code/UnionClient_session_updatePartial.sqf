/*

	Filename: 	UnionClient_session_updatePartial.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNil "life_loading_completed") exitWith {};
if !(life_loading_completed) exitWith {};

private _mode = param [0,0,[0]];
private _packet = [steamid,playerSide,nil,_mode];
private _array = [];
private _flag = [playerSide] call UnionClient_system_convertSide;

if (call UnionClient_system_myCashCheck) exitWith {
	[steamid,0,"Money Hack At Update",format["Money Hack Detect At Update CASH %1 - BANK %2",CASH,BANK]] remoteExecCall ["TON_fnc_rcon",RSERV];
	["DUPE",[format["Money Hack Detect At Update CASH %1 - BANK %2 - %3 (%4)",CASH,BANK,GVAR_RNAME(player),steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV];
};

switch(_mode) do {
	case 0: {
		_packet set[2,CASH];
	};

	case 1: {
		_packet set[2,BANK];
	};

	case 2: {
		{
			_array pushBack [LICENSE_VARNAME(configName _x,_flag),LICENSE_VALUE(configName _x,_flag)];
		} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "LifeCfgLicenses"));

		_packet set[2,_array];
	};

	case 3: {
		_packet set[2,DCASH];
	};

	case 4: {
		_packet set[2,life_connected];
        _packet set[4,getPosATL player];
	};

	case 5: {
		_packet set[2,life_is_arrested];
		_packet set[4,life_jail_time];
	};

	case 6: {
		_packet set[2,CASH];
		_packet set[4,BANK];
	};

	case 8: {
		_packet set[2,life_slave];
	};
	case 9: {
		//_packet set[2,FETCH_CONST(life_donator)]; Не используется
	};
	case 10: {
		{
			_array pushBack [RECIPE_VARNAME(configName _x),RECIPE_VALUE(configName _x)];
		} forEach ("true" configClasses (missionConfigFile >> "LifeCfgRecipes"));
		_packet set[2,_array];
	};
	case 11: {

	};
	case 12: {

	};
	case 13: {
		_packet set[2,life_civlevel];
	};
	case 14: {
		_packet set[2,life_reblevel];
	};
	case 15: {
		_packet set[2,life_firstTime];
	};
	case 16: {
		_packet set[2,life_myserver];
	};
	case 17: {
		_packet set[2,life_coplevel];
	};
	case 18: {
		_packet set[2,life_karma];
	};
	case 19: {
		_packet set[2,life_mediclevel];
	};
	case 20: {
		_packet set[2,life_gear];
	};
	case 21: {
		_packet set[2,life_connected];
	};
	case 22: {
		{
			_array pushBack [_x,(GVAR_MNS _x)];
		} foreach life_indicators_array;
		_packet set[2,_array];
		_array = [];
		{
			_array pushBack [_x,(GVAR_MNS _x)];
		} foreach life_config_array;
		_packet set[4,_array];
	};
};

[_packet,"updatePartial","DB",false] call UnionClient_system_hcExec;