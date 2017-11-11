/*
	
	Filename: 	UnionClient_gather_Tree.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNull cursorObject) exitWith {};
if (player distance2d cursorObject > 3) exitWith {};
private _tree = if (["t_",([cursorObject] call UnionClient_system_getModelName)] call UnionClient_system_xString OR ["bo_t_",([cursorObject] call UnionClient_system_getModelName)] call UnionClient_system_xString) then {cursorObject} else {objNull};
if (isNull _tree) exitWith {};

if (alive _tree) then {	
	private _gather = [] call UnionClient_gather_checkZone;
	private _value = if (EQUAL(_gather,"")) then {0.05} else {0.2};	
	
	if (EQUAL(_tree,(life_tree_chop select 0))) then {
		private _newDamage = (life_tree_chop select 1) + _value;
		life_tree_chop set [1,_newDamage];
	} else {
		life_tree_chop set [0,_tree];
		life_tree_chop set [1,_value];
	};

	private _curDamage = life_tree_chop select 1;

	if (_curDamage >= 1) then {
		life_tree_chop = [objNull,0];
		_tree setDamage 1;
		if (EQUAL(_gather,"")) then {
			private _holder = createVehicle ["WeaponHolderSimulated",getPosATL _tree,[],0,"CAN_COLLIDE"];			
			_holder addMagazineCargoGlobal ["extItem_woodenLog", 3];
		} else {			
			private _itemModel = M_CONFIG(getText,"LifeCfgGather",_gather,"model");
			private _val = M_CONFIG(getNumber,"LifeCfgGather",_gather,"amount");
			[_gather,_itemModel,_val] spawn UnionClient_gather_Spawn;
		};
	};
};
