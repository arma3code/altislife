/*

	Filename: 	UnionClient_system_isShopNear.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {false};

private _shop = nearestObjects[getPosATL _unit,["Land_Laptop_device_F","Land_InfoStand_V1_F","Land_InfoStand_V2_F","Land_CashDesk_F","bv_terminal_base"],5];
private _return = if (count _shop > 0) then {true} else {false};

_return;