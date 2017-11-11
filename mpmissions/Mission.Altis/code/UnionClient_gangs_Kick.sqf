/*
	
	Filename: 	UnionClient_gangs_Kick.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_unit","_unitID","_members","_handle"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",CONTROL_DATA(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_unitID = getPlayerUID _unit;
_ownerID = grpPlayer GVAR ["gang_owner",""];

if (_unitID == _ownerID) exitWith {hint "Нельзя исключить лидера"};

[player,grpPlayer] remoteExecCall ["UnionClient_gangs_ClientKick",_unit];