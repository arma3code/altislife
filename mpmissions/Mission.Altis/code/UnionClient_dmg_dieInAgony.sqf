/*

	Filename: 	UnionClient_dmg_dieInAgony.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];

["all"] call UnionClient_system_removeBuff;
_unit setDamage 1;