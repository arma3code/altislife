/*

	Filename: 	UnionClient_system_vehInventory.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _veh = param [0,ObjNull,[ObjNull]];
if (isNull _veh OR !alive _veh) exitWith {closeDialog 0;}; //If null / dead exit menu

disableSerialization;
private _tInv = CONTROL(3500,3502);
private _pInv = CONTROL(3500,3503);
lbClear _tInv;
lbClear _pInv;

private ["_veh_data","_trunk_slots"];
switch (true) do {
	case (EQUAL((typeOf _veh),"Land_LuggageHeap_03_F")): {
		private _house_box_slots = _veh GVAR ["house_box_slots",0];
		private _mWeight = (LIFE_SETTINGS(getNumber,"life_virtualMax")) * _house_box_slots;
		_veh_data = [_mWeight,(_veh GVAR["Trunk",[[],0]]) select 1];
		ctrlSetText[3504,format["Заполненность: %1/%2",_veh_data select 1,_veh_data select 0]];
	};

	case ((typeOf _veh) isEqualTo LIFE_SETTINGS(getText,"life_trunkClass")): {
		_trunk_slots = _veh GVAR ["slots",1];
		private _mWeight = (LIFE_SETTINGS(getNumber,"life_trunkVirtualWeight")) * _trunk_slots;
		_veh_data = [_mWeight,(_veh GVAR["Trunk",[[],0]]) select 1];
		ctrlSetText[3504,format["Заполненность: %1/%2 (Слотов: %3)",_veh_data select 1,_veh_data select 0,_trunk_slots]];
	};

	case ((typeOf _veh) isEqualTo LIFE_SETTINGS(getText,"life_vaultBoxClass")): {
		private _mWeight = LIFE_SETTINGS(getNumber,"life_vaultBoxVirtualWeight");
		_veh_data = [_mWeight,(_veh GVAR["Trunk",[[],0]]) select 1];
	};

	case ((typeOf _veh) in ARC_SETTINGS(getArray,"spawnItem")): {
		_veh_data = [200,200];
		ctrlSetText[3504,""];
	};

	case (EQUAL((typeOf _veh),"Box_Wps_F")): {
		_veh_data = [120,120];
		ctrlSetText[3504,""];
	};

	default {
		_veh_data = [_veh] call UnionClient_system_vehicleWeight;
		ctrlSetText[3504,format["Заполненность: %1/%2 (Коробок: %3)",_veh_data select 1,_veh_data select 0,_veh GVAR ["adacBoxes",0]]];
	};
};

if (EQUAL((_veh_data select 0),-1)) exitWith {closeDialog 0};

private _data = _veh GVAR ["Trunk",[[],0]];
_data = _data select 0;

[_pInv] call UnionClient_gui_ListVirtualItems;

private "_icon";
{
	if !((_x select 0) in ["money","dmoney"]) then {
		if (_x select 1 > 0) then {
			_tInv lbAdd format["[%1] - %2",_x select 1,ITEM_NAME(_x select 0)];
			_tInv lbSetData [(lbSize _tInv)-1,(_x select 0)];
			_tInv lbSetPicture [(lbSize _tInv)-1,ITEM_ICON(_x select 0)];
		};
	} else {
		_icon = switch (_x select 0) do {
			case "money" : {"\union_pack\icons\items\money.paa"};
			case "dmoney" : {"\union_pack\icons\items\dmoney.paa"};
		};
		if ((_x select 1) > 0) then {
			_tInv lbAdd format["$%1",[_x select 1] call UnionClient_system_numberText];
			_tInv lbSetPicture [(lbSize _tInv)-1,_icon];
			_tInv lbSetData [(lbSize _tInv)-1,(_x select 0)];
		};
	};
} foreach _data;