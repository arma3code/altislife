/*
	
	Filename: 	UnionClient_gangs_Created.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
life_action_gangInUse = false;
private _gangPrice = LIFE_SETTINGS(getNumber,"life_gangPrice");
["atm","take",_gangPrice] call UnionClient_system_myCash;
hint format[localize "STR_GNOTF_CreateSuccess",GANG_NAME,[_gangPrice] call UnionClient_system_numberText];