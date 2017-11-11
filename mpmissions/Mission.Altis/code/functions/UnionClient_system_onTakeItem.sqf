/*

	Filename: 	UnionClient_system_onTakeItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_container",ObjNull,[ObjNull]],
	["_item","",[""]]
];

if (isNull _unit OR EQUAL(_item,"")) exitWith {};

if (EQUAL(_item,"EXT_FakePrimaryWeapon")) then {
	[_item] call UnionClient_system_removeItem;
};

if (_item in LIFE_SETTINGS(getArray,"life_cheatItems")) exitWith {
	[steamid,0,"Cheat Item","CheatItem"] remoteExecCall ["TON_fnc_rcon",RSERV];
};

if !([_item] call UnionClient_system_canUseItem) then {
	[_item] call UnionClient_system_removeItem;
	hint "Вы не можете использовать этот предмет";
};

if (EQUAL(_item,"sab_CUAV_Terminal") && !license_civ_press) then {
	[_item] call UnionClient_system_removeItem;
	hint "Беспилотники доступны только для прессы";
};

if (_item in LIFE_SETTINGS(getArray,"life_gatherTools")) then {
	if (EQUAL((secondaryWeaponMagazine player),[])) then {
		player addSecondaryWeaponItem "Extremo_Magazine_Swing";
	};
};


playSound "click";
[] call UnionClient_system_saveGear;