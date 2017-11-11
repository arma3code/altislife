/*
	
	Filename: 	UnionClient_system_clearWater.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_clearComponent","_itemsOld","_newItem","_progressName","_progressDone","_sleep","_sourcesArray","_source","_error","_sound","_doAction","_progress_rscLayer"];
_clearComponent = [_this,0,"",[""]] call BIS_fnc_param;

if (life_action_inUse OR (call UnionClient_system_isInterrupted)) exitWith {};
call UnionClient_actions_inUse;

_error = false;
_doAction = false;

switch(true) do {
	case (_clearComponent == "extItem_Waterpure"): {
		switch(true) do {
			case ("extItem_canteen_dirty" in (magazines player)): {				
				_progressName = "Очищаем фляжку с грязной водой";
				_progressDone = "Вы очистили воду во фляжке.";
				_sleep = 0.05;
				_itemsOld = [_clearComponent,"extItem_canteen_dirty"];
				_newItem = "extItem_canteen_clean_3";
				_doAction = true;
				_sound = "action_painkiller_0";
			};
			case ("extItem_bottle_dirty" in (magazines player)): {
				["extItem_Waterpure","extItem_bottle_dirty"] spawn UnionClient_system_clearWater;
				_progressName = "Очищаем бутылку с грязной водой";
				_progressDone = "Вы очистили воду в бутылке.";
				_sleep = 0.05;
				_itemsOld = [_clearComponent,"extItem_bottle_dirty"];
				_newItem = "extItem_bottleclean_100";
				_doAction = true;
				_sound = "action_painkiller_0";
			};
			default {hint "У вас нет грязной воды для очистки"};
		}; 
	};
};

if (!_doAction) exitWith {life_action_inUse = false;life_interrupted = false;};
if (!(player canAdd _newItem)) exitWith {life_interrupted = false;life_action_inUse = false; hint "Инвентарь переполнен"};

player say3D _sound;
disableSerialization;
_cP = 0;
titleText[_progressName,"PLAIN"];
while {true} do {	
	_cP = _cP + 0.01;	
	[_cP] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted))  exitWith {};	
	if (NOTINVEH(player)) then {
		player playActionNow "FT_Act_Craft_Thing";
	};
	uiSleep _sleep;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

if (NOTINVEH(player)) then {
	player PlayActionNow "FT_Act_Gesture_Reset";
};

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

{	
	if !([_x] call UnionClient_system_removeItem) exitWith {_error = true};
} forEach _itemsOld;

if (_error) exitWith {titleText["В инвентаре нет необходимых предметов","PLAIN"];};
[_newItem] call UnionClient_system_addItem;
titleText[_progressDone,"PLAIN"];