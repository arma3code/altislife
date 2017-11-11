/*
	
	Filename: 	UnionClient_system_postBail.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [1,ObjNull,[ObjNull]];
if (life_bail_paid) exitWith {};
if (isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if (!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if (BANK < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

["atm","take",life_bail_amount] call UnionClient_system_myCash;
life_bail_paid = true;
[0,"STR_NOTF_Bail_Bailed",true,[GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];