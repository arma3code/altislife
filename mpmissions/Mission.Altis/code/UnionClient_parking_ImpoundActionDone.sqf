/*
	
	Filename: 	UnionClient_parking_ImpoundActionDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
life_impound_inuse = false;
private _price = LIFE_SETTINGS(getNumber,"life_impound_car");
["atm","add",_price,"vehParking"] call UnionClient_system_myCash;
hint format["Техника отправлена на штрафстоянку! Вы получили $%1 за очистку улиц!",[_price] call UnionClient_system_numberText];