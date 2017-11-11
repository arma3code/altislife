/*

	Filename: 	UnionClient_system_dropItems.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
uiSleep (random 5);

private _yItems = [];
private ["_value","_item","_itemName"];
{	
	_item = configName _x;
	_value = ITEM_VALUE(_item);
	_itemName = ITEM_VARNAME(_item);
	if (_value > 0) then {
		_yItems pushBack [_item,_value];
		SVAR_MNS [_itemName,0];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));

if (CASH > 0) then {
	_yItems pushBack ["money",CASH];
	["cash","drop",CASH,"dropMoneyDeath"] call UnionClient_system_myCash;
};

if (DCASH > 0) then {
	_yItems pushBack ["dmoney",DCASH];
	["dcash","drop",DCASH,"dropIllegalMoneyDeath"] call UnionClient_system_myCash;
};

private _containers = nearestObjects[getPosATL _unit,["WeaponHolderSimulated"],10];
if ( !(EQUAL(_containers,[])) OR !(EQUAL(_yItems,[])) ) then {
	private _obj = createVehicle ["Box_Wps_F",(getPosATL _unit),[],0,"NONE"];
	waitUntil {!isNull _obj};
	_obj SVAR ["Trunk",[_yItems,0],true];
	
	private "_itemsArray";
	{
		_itemsArray = weaponsItems _x;
		{
			if !(EQUAL((_x select 0),"")) then {_obj addWeaponCargoGlobal [(_x select 0),1]};
			if !(EQUAL((_x select 1),"")) then {_obj addItemCargoGlobal [(_x select 1),1]};
			if !(EQUAL((_x select 2),"")) then {_obj addItemCargoGlobal [(_x select 2),1]};
			if !(EQUAL((_x select 3),"")) then {_obj addItemCargoGlobal [(_x select 3),1]};
			if !(EQUAL((_x select 4),[])) then {_obj addMagazineCargoGlobal [((_x select 4) select 0),1]};
			if !(EQUAL((_x select 5),"")) then {_obj addItemCargoGlobal [(_x select 5),1]};
		} forEach _itemsArray;
		
		deleteVehicle _x;
	} foreach _containers;	
};

[] call UnionClient_system_saveGear;