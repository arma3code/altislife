/*

	Filename: 	UnionClient_system_itemUse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _idc = _this select 0;
private _selectedIndex = _this select 1;
private _item = CONTROL_DATAI(_idc,_selectedIndex);
private _itemDisplayName = CONTROL_TEXTI(_idc,_selectedIndex);
private _target = cursorObject;

if (life_action_inUse OR (call UnionClient_system_isInterrupted)) exitWith {};

switch (true) do {
	case (_item isEqualTo ARC_SETTINGS(getText,"initItem")): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		[] spawn UnionClient_archeology_init;
		closeDialog 0;
	};
	case (EQUAL(_item,"extItem_grinder")): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		if ((typeOf _target) isEqualTo WZ_SETTINGS(getText,"vehClass")) then {
			[_target] spawn UnionClient_warzones_openVehicle;
		} else {
			[_target] spawn UnionClient_system_boltcutter;
		};
		closeDialog 0;
	};

	case (EQUAL(_item,"MineDetector")): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		[_target] spawn UnionClient_system_defuseKit;
		closeDialog 0;
	};

	case (EQUAL(_item,"extItem_MetalWire") && isNull life_spikestrip): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		[] spawn UnionClient_system_spikeStrip;
		closeDialog 0;
	};

	case (EQUAL(_item,"extItem_blastingcharge")): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		if ((typeOf _target) isEqualTo WZ_SETTINGS(getText,"boxClass")) then {
			[_target] spawn UnionClient_warzones_blastingCharge;
		} else {
			player reveal fed_bank;
			(group player) reveal fed_bank; 
			[_target] spawn UnionClient_system_blastingCharge;
		};
		closeDialog 0;
	};

	case (_item in ["extItem_canteen_empty","extItem_bottle_empty"]): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		[_item] spawn UnionClient_system_refuelWater;
		closeDialog 0;
	};

	case (_item in ["extItem_canteen_clean_3","extItem_canteen_clean_2","extItem_canteen_clean_1","extItem_bottleclean_100","extItem_bottleclean_50","extItem_Spirit","extItem_franta","extItem_canteen_dirty","extItem_bottle_dirty","extItem_CarltonDraught","extItem_Coopers","extItem_Corona","extItem_Jimbeam","extItem_cereal","extItem_cereal_50","extItem_TacticalBacon_100","extItem_TacticalBacon_75","extItem_TacticalBacon_50","extItem_TacticalBacon_25","extItem_BakedBeans_100","extItem_BakedBeans_75","extItem_BakedBeans_50","extItem_BakedBeans_25","extItem_SmithsChips","extItem_Steak","extItem_MeatC","extItem_FishC","extItem_Juice","extItem_Apple","extItem_Peach","extItem_Banana","extItem_PineApple","extItem_Coconut"]): {
		[_item] spawn UnionClient_system_food;
		closeDialog 0;
	};

	case (_item in ["extItem_canteen_salt","extItem_bottle_salt"]): {
		if ([getPosATL player, 10] call UnionClient_system_isFireNear) then {
			if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
			[_item] spawn UnionClient_system_cooking;
			closeDialog 0;
		} else {
			[_item] spawn UnionClient_system_food;
			closeDialog 0;
		};
	};

	case (EQUAL(_item,"extItem_Waterpure")): {
		if ("extItem_canteen_dirty" in (magazines player) OR "extItem_bottle_dirty" in (magazines player)) then {
			[_item] spawn UnionClient_system_clearWater;
			closeDialog 0;
		} else {hint "У вас нет грязной воды для очистки"};
	};

	case (EQUAL(_item,"extItem_campFire")): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		[_item] spawn UnionClient_system_campFire;
		closeDialog 0;
	};

	case (EQUAL(_item,"extItem_Fuelcan_empty")): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		[_item] spawn UnionClient_system_refuelJerrycan;
		closeDialog 0;
	};

	case (EQUAL(_item,"extItem_Fuelcan")): {
		if !(NOTINVEH(player)) exitWith {hint "Нельзя использовать предметы в технике."};
		[_item,_target] spawn UnionClient_system_jerryRefuel;
		closeDialog 0;
	};

	case (_item in ["extItem_redgull","extItem_Buffout","extItem_ItemJet","extItem_ItemPsycho","extItem_ItemRadX","extItem_ItemTurbo"]): {
		[_item] spawn UnionClient_system_buffMe;
		closeDialog 0;
	};

	case (_item in ["extItem_ItemDetoxin","extItem_vitaminbottle","extItem_bandage","extItem_antibiotic","extItem_painkillers","extItem_ItemMorphine"]): {
		[_item] spawn UnionClient_system_healMe;
		closeDialog 0;
	};

	case (_item in ["extItem_TacticalBacon","extItem_BakedBeans"]): {
		if ("extItem_canopener" in (magazines player)) then {
			[_item] spawn UnionClient_system_canOpener;
			closeDialog 0;
		} else {
			hint "Консерва закрыта. Нужна открывашка.";
		};
	};

	default {hint "Этот предмет нельзя использовать"};
};