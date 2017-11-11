/*
	
	Filename: 	UnionClient_system_dropRadio.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_item","_unit","_box"];
_unit = param [0,ObjNull,[ObjNull]];
_item = "";
{
	if (["tf_", _x] call UnionClient_system_xString && !(EQUAL(_x,"tf_microdagr"))) exitWith {_item = _x};
} forEach (assignedItems _unit);
if (EQUAL(_item,"")) exitWith {hint localize "STR_NOTF_TargetDontHaveRadio"};

_box = createVehicle ["groundWeaponHolder", player modelToWorld [0,0.8,0], [], 0.5, "CAN_COLLIDE"];
_box setDir floor (random 360);
_box addItemCargoGlobal [_item, 1];
_unit unlinkItem _item;

hint localize "STR_NOTF_RadioDropped";