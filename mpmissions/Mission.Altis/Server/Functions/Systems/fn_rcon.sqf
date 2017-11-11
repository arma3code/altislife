/*
	Filename: 	fn_rcon.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	Description:
	Авто бан.
*/
#include "\UnionServer\script_macros.hpp"
params ["_uid","_time","_reason","_log"];
//'epochserver' callExtension format['921|%1|%2|%3', _uid, _reason, _time];
FETCH_CONFIG2(getText,"CfgPatches","UnionServer","pass") serverCommand format ['#exec ban "%1"',_uid];
["PERMBAN",format ["BAN UID:%1 || REASON:%2 || LOG:%3",_uid, _reason, _log]] call TON_fnc_customLog;
