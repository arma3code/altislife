/*

	Filename: 	UnionClient_system_arrestAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
private _jailtime = ctrlText 37408;
if !([_jailtime] call UnionClient_system_isnumber) exitWith {hint localize "STR_Cop_TicketNum"};
_jailtime = parseNumber _jailtime;
if (_jailtime > 120 OR _jailtime < 5) exitWith {hint "Срок заключения должен быть от 5 до 120 минут"};
if (_jailtime > 30 && ([player,"jail_marker"] call CBA_fnc_getDistance > 100)) exitWith {hint "Чтобы посадить в тюрьму более чем на 30 минут, Вы должны конвоировать преступника в федеральную тюрьму"};

if (isNull _unit OR isNil "_unit") exitWith {}; //Not valid
if (!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if (!isPlayer _unit) exitWith {}; //Not a human
if !(GVAR_RESTRAINED(_unit)) exitWith {}; //He's not restrained.
if (!((side _unit) in [civilian,independent])) exitWith {};
if (isNull _unit) exitWith {};
if (_unit GVAR ["isArrested",false]) exitWith {
	hint "Человек уже в тюрьме";
};

[[_unit,player,false],"wantedBounty"] call UnionClient_system_hcExec;

if (isNull _unit) exitWith {};

[0,"STR_NOTF_Arrested_1",true, [GVAR_RNAME(_unit), GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
[_unit,false,_jailtime] remoteExecCall ["UnionClient_system_jail",_unit];

["JAIL",[format["%4 (%5) Jailed %1 (%2) for %3 min",GVAR_RNAME(_unit),getPlayerUID _unit,_jailtime,GVAR_RNAME(player),steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV];