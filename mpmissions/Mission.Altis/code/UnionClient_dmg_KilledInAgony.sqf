/*

	Filename: 	UnionClient_dmg_KilledInAgony.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_source",ObjNull,[ObjNull]],
	["_instigator",ObjNull,[ObjNull]],
	["_damage",0,[0]],
	["_projectile","",[""]],
	["_selection","",[""]]
];

if (isNull _source && isNull _instigator) exitWith {"DMG - Kill In Agony - Source and Instigator is NULL" call UnionClient_system_log};

private _killer = switch (true) do {
	case (_instigator isKindOf "CAManBase" && isPlayer _instigator) : {_instigator};
	case (_source isKindOf "CAManBase" && isPlayer _source) : {_source};
	default {objNull};
};

if (isNull _killer) exitWith {"DMG - Kill in Agony - Killer is NULL" call UnionClient_system_log};
if (LSDEAD(_unit)) exitWith {"DMG - Kill in Agony - Already Dead" call UnionClient_system_log};
if !(EQUAL(_selection,"head")) exitWith {"DMG - Kill in Agony - Not in head" call UnionClient_system_log};
if (_damage < 0.89) exitWith {"DMG - Kill in Agony - Need more damage in head" call UnionClient_system_log};
if ((time - life_agonyStartTime) < 5) exitWith {"DMG - Kill in Agony - Too soon" call UnionClient_system_log};
if (EQUAL(_projectile,"")) exitWith {"DMG - Kill in Agony - Bullet is empty" call UnionClient_system_log};
if (_projectile in ["DDOPP_B_Taser","Caseless_blau"]) exitWith {"DMG - Kill in Agony - Taser" call UnionClient_system_log};
if !(NOTINVEH(_killer)) exitWith {"DMG - Kill in Agony - Shooter in Veh" call UnionClient_system_log};
if !(LSINCAP(_unit)) exitWith {"DMG - Kill in Agony - Not in agony" call UnionClient_system_log};
if ([_unit,_killer] call CBA_fnc_getDistance > 5) exitWith {"DMG - Kill in Agony - Distance Must be < 5m" call UnionClient_system_log};

if !(EQUAL(_unit,_killer)) then {
	if !(EQUAL(side _killer,west)) then {
		private _type = switch (playerSide) do {
			case civilian: {"188C"};
			case independent: {"188I"};
			case west: {"188W"};
			case east: {"188E"};
		};
		[[getPlayerUID _killer,GVAR_RNAME(_killer),_type],"wantedAdd"] call UnionClient_system_hcExec;
	};

	titleText [format["Вас добил человек с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _killer],"PLAIN"];
	hint format["Вас добил человек с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _killer];
	["AGONY",format["%1 (%2) was killed finally by PID %3 (%4)",GVAR_RNAME(player),steamid,getPlayerUID _killer,GVAR_RNAME(_killer)]] remoteExecCall ["TON_fnc_customLog",RSERV];
};

["all"] call UnionClient_system_removeBuff;
_unit setDamage 1;