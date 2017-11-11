/*
	
	Filename: 	UnionClient_gangs_BoxMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _box = param [0,objNull,[objNull]];
if (isNull _box) exitWith {};
if (dialog) exitWith {};
life_gang_box = _box;
if (isNull life_gang_box OR (typeOf life_gang_box != LIFE_SETTINGS(getText,"life_trunkClass"))) exitWith {}; //Either a null or invalid vehicle type.
if (life_action_inUse OR life_is_processing) exitWith {hint "Вы чем-то заняты..."};
if (life_gang_box GVAR ["locked",false]) exitWith {hint "Заперто"};
if ([life_gang_box] call UnionClient_system_isTrunkInUse) exitWith {hint localize "STR_MISC_VehInvUse"};

private _house_box_slots = life_gang_box GVAR ["slots",1];

if !(createDialog "UnionDialogGangContainer") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?

[life_gang_box,"trunk_inUseBy",steamid] call CBA_fnc_setVarNet;
player say3D "house_cont";

private _title = CONTROL(4800,4801);
private _filters = CONTROL(4800,4807);

_title ctrlSetText "Хранилище банды";

_filters lbAdd "Все снаряжение";
_filters lbAdd "Амуниция";
_filters lbAdd "Оружие";
_filters lbAdd "Боеприпасы";
_filters lbAdd "Обвес";
_filters lbAdd "Предметы";

_filters lbSetCurSel 0;

life_veh_trunk_sync = +((life_gang_box GVAR ["inventory",[[],0]]) select 0);

life_gang_box spawn {
	while {true} do {
		if (_this GVAR ["trunk_inUseBy",""] != steamid) exitWith {			
			[_this,"trunk_inUseBy"] call UnionClient_system_clearGlobalVar;
			hint "Инвентарь уже используется другим игроком.";
			closeDialog 0;
		};
		if(isNull (findDisplay 4800)) exitWith {			
			[_this,"trunk_inUseBy"] call UnionClient_system_clearGlobalVar;
			private _data = (_this GVAR ["inventory",[[],0]]) select 0;
			if !(EQUAL(life_veh_trunk_sync,_data)) then {
				life_veh_trunk_sync = [];
				[_this,player] remoteExecCall ["TON_fnc_updateGangTrunks",2];
				[] call UnionClient_system_saveGear;
			};
		};
		uiSleep 0.03;
	};
};