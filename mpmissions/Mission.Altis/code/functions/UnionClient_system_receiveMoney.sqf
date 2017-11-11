/*
	
	Filename: 	UnionClient_system_receiveMoney.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_val","",[""]],
	["_from",Objnull,[Objnull]]
];

if (isNull _unit OR isNull _from OR _val == "") exitWith {};
if (player != _unit) exitWith {};
if !([_val] call UnionClient_system_isnumber) exitWith {};
if (_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format[localize "STR_NOTF_GivenMoney",GVAR_RNAME(_from),[(parseNumber _val)] call UnionClient_system_numberText];
["cash","add",(parseNumber _val),"MS",format["Cash Transfer from %1 (%2)",GVAR_RNAME(_from),getPlayerUID _from]] call UnionClient_system_myCash;