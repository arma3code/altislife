/*

	Filename: 	UnionClient_dhl_boxStoreInVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNull life_dhl_box OR isNull life_dhl_car) exitWith {};

detach life_dhl_box;
deleteVehicle life_dhl_box;

AID_TFW = life_dhl_car addAction ["<img image='\union_dhl\data\dhl_logo.paa' /> Достать коробку из фургона",UnionClient_dhl_boxTakeFromVeh,"",0,false,false,"",' life_dhl_orderInProgress && isNull objectParent player && isNull life_dhl_box', 5];