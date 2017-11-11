/*

	Filename: 	UnionClient_system_sellSlave.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (playerSide in [west,east]) exitWith {};
if (!server_slavery && (west countSide playableUnits < LIFE_SETTINGS(getNumber,"life_cop_min_illegal"))) exitWith {hint format[localize "STR_Civ_NotEnoughCops",LIFE_SETTINGS(getNumber,"life_cop_min_illegal")]};
private _rate = if (server_slavery) then {25000} else {50000};

private _units = nearestObjects[getMarkerPos "slavery_market",["Man"],10];
_units = _units - [player];

private "_unit";
if (count _units > 0) then {
	{
		if (!isNil "_unit") exitWith {};
		if (GVAR_RESTRAINED(_x) && (side _x in [civilian,independent]) && (isPlayer _x) && (LSALIVE(_x))) exitWith {_unit = _x};
	} foreach _units;
};

if (isNull _unit OR isNil "_unit") exitWith {}; //Not valid
if (!isPlayer _unit) exitWith {};
if !(GVAR_RESTRAINED(_unit)) exitWith {};
if (GVAR_RNAME(_unit) == "") exitWith {};
if (EQUAL(player,_unit)) exitWith {};
//if !(EQUAL((side _unit),civilian)) exitWith {hint localize "STR_NOTF_OnlyCivSlave"};
if !(side _unit in [civilian,independent]) exitWith {hint localize "STR_NOTF_OnlyCivOrIndepSlave"};
private _check = false;

if (!server_slavery) then {
	{
		if (player distance _x < 200 && (EQUAL((side _x),west))) exitWith {_check = true;};
	} forEach playableUnits;
};
if (_check) exitWith {hint localize "STR_NOTF_CopsAreNear"};

if !(server_slavery) then {
	[[steamid,GVAR_RNAME(player),"236"],"wantedAdd"] call UnionClient_system_hcExec;
};

call UnionClient_actions_inUse;
hint localize "STR_NOTF_SellSlaveInProgress";
[player,_rate] remoteExecCall ["UnionClient_system_sellSlaveAction",_unit];