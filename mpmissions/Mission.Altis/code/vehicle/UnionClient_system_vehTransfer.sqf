/*

	Filename: 	UnionClient_system_vehTransfer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
[[steamid,playerSide,"Transfer",player/*,"transfer"*/],"getVehicles","TON",false] call UnionClient_system_hcExec;
createDialog "UnionDialogVehTransfer";
disableSerialization;
waitUntil {!isNull (findDisplay 5100)};
ctrlSetText[5102,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[5103,false];
ctrlShow[5104,false];