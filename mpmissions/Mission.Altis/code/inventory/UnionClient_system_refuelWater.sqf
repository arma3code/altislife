/*
	
	Filename: 	UnionClient_system_refuelWater.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];
if (life_action_inUse) exitWith {};
if !(NOTINVEH(player)) exitWith {};

call UnionClient_actions_inUse;

private ["_newItem","_progressName","_progressDone","_doAction"];
//соленая вода из морей и т.п.
switch (true) do { 
	case (([cursorObject] call UnionClient_system_getModelName) in ["water_source_f","watertank_01_f","watertank_02_f"]) : {
		_progressName = "Набираем чистую воду";
		_progressDone = "Вы набрали чистой воды.";
		_newItem = switch (_oldItem) do {
			case "extItem_canteen_empty": {"extItem_canteen_clean_3"};
			case "extItem_bottle_empty": {"extItem_bottleclean_100"};
		};
		_doAction = true;
	}; 
	case (([cursorObject] call UnionClient_system_getModelName) in ["barrelwater_f","barrelwater_grey_f","waterbarrel_f","watertank_f","stallwater_f","waterpump_01_f"]) : {
		_progressName = "Набираем грязную воду";
		_progressDone = "Вы набрали грязной воды.";			
		_newItem = switch (_oldItem) do {
			case "extItem_canteen_empty": {"extItem_canteen_dirty"};
			case "extItem_bottle_empty": {"extItem_bottle_dirty"};
		};
		_doAction = true;
	};
	case (surfaceIsWater (getPosATL player)): {
		_progressName = "Набираем морскую воду";
		_progressDone = "Вы набрали морской воды.";	
		_newItem = switch (_oldItem) do {
			case "extItem_canteen_empty": {"extItem_canteen_salt"};
			case "extItem_bottle_empty": {"extItem_bottle_salt"};
		};
		_doAction = true;
	};
	default {_doAction = false}; 
};

if (!_doAction) exitWith {hint "Рядом нет источников воды";life_action_inUse = false;life_interrupted = false;};

//Setup the progress bar
disableSerialization;
private _sleep = 0.1;	
private _sound = "action_fillwater";
private _cP = 0;

player say3D _sound;
titleText[_progressName,"PLAIN"];

while {true} do {
	uiSleep _sleep;	
	_cP = _cP + 0.01;
	[_cP] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
	player playActionNow "FT_Act_Craft_Thing";	
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

player PlayActionNow "FT_Act_Gesture_Reset";

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

if !([_oldItem] call UnionClient_system_removeItem) exitWith {hint "Не удалось удалить предмет"};
if !([_newItem] call UnionClient_system_addItem) exitWith {hint "Не удалось добавить предмет"};

titleText[_progressDone,"PLAIN"];