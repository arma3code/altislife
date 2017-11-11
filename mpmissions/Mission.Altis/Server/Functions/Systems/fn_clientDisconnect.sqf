/*
	Filename: 	fn_clientDisconnect.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    When a client disconnects this will remove their corpse and
    clean up their storage boxes in their house. Also, saves _unit infos & position.
*/

#include "\UnionServer\script_macros.hpp"

private ["_unit","_id","_uid","_name","_position","_side","_alive"];
_unit = _this select 0;
if (isNull _unit) exitWith {};
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
_side = side _unit;
_position = getPosATL _unit;

if (
	(_unit getVariable ["lifeState",""] == "RESPAWN") OR
	(_unit getVariable ["lifeState",""] == "INCAPACITATED") OR
	(_unit getVariable ["lifeState",""] == "DEAD") OR
	(_unit getVariable ["restrained",false])
) then {
	if (server_restartSoon) exitWith {};
	//[_uid,60,"Union BAN/Relog/1h","Union Quick Ban"] spawn TON_fnc_rcon;
	_query = format ["UPDATE players SET gear='""[]""', arrested = '1', jail_time = '90', cash = '0', karma = '1' WHERE playerid='%1'",_uid];
	if (_side isEqualTo west) then {_query = format ["UPDATE players SET gear='""[]""', cash = '0', bankacc = bankacc/2 WHERE playerid='%1'",_uid];};
	["PUNISH",format ["%1 was punished for RELOG IN AGONY",_uid]] call TON_fnc_customLog;
	[0,format ["BattleEye Client: (Global) Admin: %1 был наказан за релог в агонии или в наручниках. И был помещен в тюрьму на 90 минут без возможности выкупа!",_uid]] remoteExecCall ["UnionClient_system_broadcast",-2];
	[_query,1] call DB_fnc_asyncCall;
};

if ((getMarkerPos "respawn_civilian" distance _position) > 700) then {
    [] remoteExecCall ["UnionClient_session_updateRequest",_unit];
    [_uid,_side,alive _unit,4,_position] spawn DB_fnc_updatePartial;
};

deleteVehicle _unit;

_uid spawn TON_fnc_houseCleanup;
