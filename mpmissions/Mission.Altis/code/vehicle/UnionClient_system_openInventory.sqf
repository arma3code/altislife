/*

	Filename: 	UnionClient_system_openInventory.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_vehicle","_veh_data","_waitingtime","_house_box_slots","_house","_trunk"];
if(dialog) exitWith {};
if(life_action_inUse OR life_is_processing) exitWith {hint "Вы чем-то заняты..."};

_vehicle = objNull;
switch(true) do {
	case (!(NOTINVEH(player)) && {alive (objectParent player)} && {(objectParent player) in life_vehicles} && {locked (objectParent player) == 0}): {
		_vehicle = objectParent player;
	};
	case (NOTINVEH(player) && {alive cursorObject} && {player distance cursorObject < 7}): {
		switch(true) do {
			case ([cursorObject] call UnionClient_system_isVehicleKind): {
				if (cursorObject in life_vehicles OR {EQUAL(locked cursorObject,0)}) then {
					_vehicle = cursorObject;
				};
			};
			case (EQUAL((typeOf cursorObject),"Land_LuggageHeap_03_F")): {
				_house = cursorObject GVAR ["house_box_inHouse",objNull];
				if (!isNull _house && {!isNil {_house GVAR "house_owner"} && !(_house GVAR ["locked",false])}) then {
					_vehicle = cursorObject;
				};
			};
			case (EQUAL((typeOf cursorObject),"Box_Wps_F")): {
				_vehicle = cursorObject;
			};
			case ((typeOf cursorObject) == LIFE_SETTINGS(getText,"life_trunkClass")): {
				if !(cursorObject GVAR ["locked",false]) then {
					_vehicle = cursorObject;
				};
			};
			case ((typeOf cursorObject) in ARC_SETTINGS(getArray,"spawnItem")): {
				_vehicle = cursorObject;
			};
		};
	};
};

if (isNull _vehicle) exitWith {};
if (EQUAL((typeOf _vehicle),"O_Truck_03_device_F") && (!isNil {_vehicle GVAR "mining"})) exitWith {hint "Дождитесь пока устройство закончит работу...";};
if ([_vehicle] call UnionClient_system_isTrunkInUse) exitWith {hint localize "STR_MISC_VehInvUse"};

disableSerialization;
if !(createDialog "UnionDialogTrunk") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
waitUntil {!isnull (findDisplay 3500)};

_trunk = _vehicle GVAR ["Trunk",[[],0]];

switch (true) do {
	case (EQUAL((typeOf _vehicle),"Land_LuggageHeap_03_F")): {
		_house_box_slots = _vehicle GVAR ["house_box_slots",0];
		private _mWeight = (LIFE_SETTINGS(getNumber,"life_virtualMax")) * _house_box_slots;
		_veh_data = [_mWeight,_trunk select 1];
		ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName")]];
	};

	case ((typeOf _vehicle) isEqualTo LIFE_SETTINGS(getText,"life_trunkClass")): {
		private _trunk_slots = _vehicle GVAR ["slots",1];
		private _mWeight = (LIFE_SETTINGS(getNumber,"life_trunkVirtualWeight")) * _trunk_slots;
		_veh_data = [_mWeight,_trunk select 1];
		ctrlSetText[3501,"Хранилище банды"];
	};

	case ((typeOf _vehicle) isEqualTo LIFE_SETTINGS(getText,"life_vaultBoxClass")): {
		private _mWeight = LIFE_SETTINGS(getNumber,"life_vaultBoxVirtualWeight");
		_veh_data = [_mWeight,_trunk select 1];
		ctrlSetText[3501,"Федеральный Резерв"];
	};

	case ((typeOf _vehicle) in ARC_SETTINGS(getArray,"spawnItem")): {
		_veh_data = [120,120];
		ctrlSetText[3501,format["%1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};

	case (EQUAL((typeOf _vehicle),"Box_Wps_F")): {
		_veh_data = [120,120];
		ctrlSetText[3501,format["%1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};

	default {
		_veh_data = [_vehicle] call UnionClient_system_vehicleWeight;
		ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
	};
};

if (EQUAL((typeOf _vehicle),"Land_LuggageHeap_03_F") && {EQUAL(_house_box_slots,0)}) exitWith {hint "У вас не добавлены слоты для хранения вещей"; closeDialog 0;};
if (EQUAL((_veh_data select 0),-1)) exitWith {hint localize "STR_MISC_NoStorageVeh"; closeDialog 0;};

player say3D "open_trunk";
[_vehicle,"trunk_inUseBy",steamid] call CBA_fnc_setVarNet;

life_veh_trunk_sync = +(_trunk select 0);
life_trunk_vehicle = _vehicle;

[_vehicle] call UnionClient_system_vehInventory;

_vehicle spawn {
	while {true} do {
		if(_this GVAR ["trunk_inUseBy",""] != steamid) exitWith {
			[_this,"trunk_inUseBy"] call UnionClient_system_clearGlobalVar;
			hint "Инвентарь уже используется другим игроком.";
			closeDialog 0;
		};

		if(isNull (findDisplay 3500)) exitWith {
			[_this,"trunk_inUseBy"] call UnionClient_system_clearGlobalVar;
			private _data = (_this GVAR ["Trunk",[[],0]]) select 0;

			switch (true) do {
				case (EQUAL((typeOf _this),"Land_LuggageHeap_03_F")): {
					if !(EQUAL(life_veh_trunk_sync,_data)) then {
						life_veh_trunk_sync = [];
						[[_this,player],"updateHouseContainers"] call UnionClient_system_hcExec;
					};
				};
				case ((typeOf _this) isEqualTo LIFE_SETTINGS(getText,"life_trunkClass")): {
					if !(EQUAL(life_veh_trunk_sync,_data)) then {
						life_veh_trunk_sync = [];
						[_this,player] remoteExecCall ["TON_fnc_updateGangTrunks",RSERV];
					};
				};
				case ((typeOf _this) in ARC_SETTINGS(getArray,"spawnItem") OR EQUAL((typeOf _this),"Box_Wps_F")): {
					if (EQUAL(_data,[])) then {
						if ((EQUAL((magazineCargo _this),[])) && (EQUAL((WeaponCargo _this),[])) && (EQUAL((itemCargo _this),[]))) then {
							deleteVehicle _this;
						};
					};
				};
				default {
					if !(EQUAL(life_veh_trunk_sync,_data)) then {
						life_veh_trunk_sync = [];

						///[[_this,player],"updateVehTrunk"] call UnionClient_system_hcExec;
						[[_this,player],"vehicleUpdate"] call UnionClient_system_hcExec;
					};
				};
			};
		};

		uiSleep 0.03;
	};
};