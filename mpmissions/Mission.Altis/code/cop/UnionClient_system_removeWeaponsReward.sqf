/*
	
	Filename: 	UnionClient_system_removeWeaponsReward.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_value",0,[0]]
];

if (isNull _unit OR EQUAL(_value,0)) exitWith {};

if (ISPSIDE(west)) then {
	_value = [_value,1] call UnionClient_system_discount;
};

["atm","add",_value,"removeWeaponsReward"] call UnionClient_system_myCash;
hint format["Вы конфисковали у %1 нелегальных предметов на сумму в $%2",GVAR_RNAME(_unit),[_value] call UnionClient_system_numberText];