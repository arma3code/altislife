/*

	Filename: 	UnionClient_dhl_boxSpawn.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _place = param [0,objNull,[objNull]];
life_dhl_box = (LIFE_SETTINGS(getText,"life_dhl_box")) createVehicleLocal getPosATL _place;
life_dhl_box addAction ["<img image='\union_dhl\data\dhl_logo.paa' /> Взять коробку",UnionClient_dhl_boxPickUp,nil,0,true,true,"",' life_dhl_orderInProgress ', 4];