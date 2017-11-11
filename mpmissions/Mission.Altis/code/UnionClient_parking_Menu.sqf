/*

	Filename: 	UnionClient_parking_Menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
[[steamid,playerSide,"Parking",player],"getVehicles","TON",false] call UnionClient_system_hcExec;
disableSerialization;
createDialog "UnionDialogParkingCiv";
waitUntil {!isNull (findDisplay 5700)};
ctrlSetText[5702,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[5703,false];
ctrlShow[5704,false];