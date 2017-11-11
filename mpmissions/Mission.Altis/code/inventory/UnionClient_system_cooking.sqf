/*
	
	Filename: 	UnionClient_system_cooking.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];
if !(NOTINVEH(player)) exitWith {};
if (life_action_inUse) exitWith {};

call UnionClient_actions_inUse;
private _error = false;

private ["_newItem","_progressName","_progressDone","_sleep","_sound"];
switch(true) do {
	case (_oldItem in ["extItem_canteen_salt","extItem_bottle_salt"]): {
		_progressName = "Кипятим морскую воду на костре";
		_progressDone = "Вы прокипятили морскую воду.";	
		_sleep = 0.15;			
		_newItem = switch (_oldItem) do {
			case "extItem_canteen_salt": {"extItem_canteen_clean_3"};
			case "extItem_bottle_salt": {"extItem_bottleclean_100"};
		};		
		_sound = "action_cooking_fire_0";
	};

	case (_oldItem == "extItem_Meat"): {
		_progressName = "Жарим мясо на костре";
		_progressDone = "Вы приготовили мясо на костре.";
		_sleep = 0.15;		
		_newItem = "extItem_MeatC";
		_sound = "action_cooking_fire_0";
	};
};

disableSerialization;
private _cP = 0;

player say3D _sound;
titleText[_progressName,"PLAIN"];

while {true} do {		
	_cP = _cP + 0.01;
	[_cP,"cooking"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
	player playActionNow "FT_Act_Craft_Thing";
	uiSleep _sleep;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

player PlayActionNow "FT_Act_Gesture_Reset";

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

if !([_oldItem] call UnionClient_system_removeItem) exitWith {hint "Не удалось удалить предмет"};
if !([_newItem] call UnionClient_system_addItem) exitWith {hint "Не удалось добавить предмет"};

titleText[_progressDone,"PLAIN"];