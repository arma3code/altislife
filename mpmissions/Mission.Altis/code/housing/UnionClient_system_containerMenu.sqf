/*
	
	Filename: 	UnionClient_system_containerMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (dialog) exitWith {};
life_house_box = cursorObject;
if (isNull life_house_box OR (typeOf life_house_box != "Land_LuggageHeap_03_F")) exitWith {}; //Either a null or invalid vehicle type.
if (life_action_inUse OR life_is_processing) exitWith {hint "Вы чем-то заняты..."};
if ([life_house_box] call UnionClient_system_isTrunkInUse) exitWith {hint localize "STR_MISC_VehInvUse"};

private _house = life_house_box GVAR ["house_box_inHouse",objNull];
if (isNull _house OR isNil {(_house GVAR "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

private _uid = (_house GVAR "house_owner") select 0;
if !([_uid] call UnionClient_system_isUIDActive) exitWith {hint localize "STR_House_OwnerOffline"};

private _house_box_slots = life_house_box GVAR ["house_box_slots",0];
if (EQUAL(_house_box_slots,0)) exitWith {hint "У вас не добавлены слоты для хранения вещей"};

if !(createDialog "UnionDialogContainer") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?

[life_house_box,"trunk_inUseBy",steamid] call CBA_fnc_setVarNet;
player say3D "house_cont";

private _title = CONTROL(4100,4101);
private _houseEdit = CONTROL(4100,4105);
private _playerEdit = CONTROL(4100,4106);
private _filters = CONTROL(4100,4107);

private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");
private _houseName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _house,"displayName");

_title ctrlSetText format[(localize "STR_MISC_HouseStorage")+ " - %1 - Слоты: %2/%3",_houseName,_house_box_slots,_numberCrates];

_filters lbAdd "Все снаряжение";
_filters lbAdd "Амуниция";
_filters lbAdd "Оружие";
_filters lbAdd "Боеприпасы";
_filters lbAdd "Обвес";
_filters lbAdd "Предметы";

_filters lbSetCurSel 0;

life_veh_trunk_sync = +((life_house_box GVAR ["house_box_inventory",[[],0]]) select 0);

life_house_box spawn {
	while {true} do {
		if(_this GVAR ["trunk_inUseBy",""] != steamid) exitWith {
			[_this,"trunk_inUseBy"] call UnionClient_system_clearGlobalVar;
			hint "Инвентарь уже используется другим игроком.";
			closeDialog 0;
		};
		if(isNull (findDisplay 4100)) exitWith {
			[_this,"trunk_inUseBy"] call UnionClient_system_clearGlobalVar;
			private _data = (_this GVAR ["house_box_inventory",[[],0]]) select 0;
			if !(EQUAL(life_veh_trunk_sync,_data)) then {
				life_veh_trunk_sync = [];

				[[_this,player],"updateHouseContainers"] call UnionClient_system_hcExec;

				[] call UnionClient_system_saveGear;
			};
		};
		uiSleep 0.03;
	};
};