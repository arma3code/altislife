/*
	
	Filename: 	UnionClient_gangs_LicenseToPlayer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_unit","_license"];
disableSerialization;
_license = [_this,0,"",[""]] call BIS_fnc_param;
if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format["%1",CONTROL_DATA(2621)];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

[player,_license] remoteExecCall ["UnionClient_system_setPlayerLicense",_unit];