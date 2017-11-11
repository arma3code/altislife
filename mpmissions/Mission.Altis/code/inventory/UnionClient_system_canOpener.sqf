/*
	
	Filename: 	UnionClient_system_canOpener.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_oldItem","_newItem","_progressName","_progressDone","_sleep","_sound","_doAction","_progress_rscLayer"];
_oldItem = [_this,0,"",[""]] call BIS_fnc_param;

if (life_action_inUse OR (call UnionClient_system_isInterrupted)) exitWith {};
if !(EQUAL(CURWEAPON,"")) exitWith {hint "Освободите свои руки, уберите оружие за спину"};
call UnionClient_actions_inUse;

_doAction = false;

switch(true) do {
	case (_oldItem == "extItem_TacticalBacon"): {			
		_progressName = "Открываем консерву бекона";
		_progressDone = "Вы открыли консерву.";
		_sleep = 0.05;		
		_newItem = "extItem_TacticalBacon_100";
		_doAction = true;
		_sound = "action_can_opener";
	};

	case (_oldItem == "extItem_BakedBeans"): {			
		_progressName = "Открываем тушенную фасоль";
		_progressDone = "Вы открыли тушенную фасоль.";
		_sleep = 0.05;		
		_newItem = "extItem_BakedBeans_100";
		_doAction = true;
		_sound = "action_can_opener";
	};
};

if (!_doAction) exitWith {life_action_inUse = false;life_interrupted = false;};
if (!(player canAdd _newItem)) exitWith {life_interrupted = false;life_action_inUse = false; hint "Инвентарь переполнен"};

disableSerialization;
_cP = 0;

player say3D _sound;
titleText[_progressName,"PLAIN"];

while {true} do {	
	_cP = _cP + 0.01;
	[_cP] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
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

if !([_oldItem] call UnionClient_system_removeItem) exitWith {hint "Не удалось удалить предмет"};
if !([_newItem] call UnionClient_system_addItem) exitWith {hint "Не удалось добавить предмет"};

titleText[_progressDone,"PLAIN"];