/*
	
	Filename: 	UnionClient_system_refuelJerrycan.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];
if (life_action_inUse OR (call UnionClient_system_isInterrupted)) exitWith {};
call UnionClient_actions_inUse;

private _doAction = false;

private["_newItem","_progressName","_progressDone","_sleep","_sound"];
if (([cursorObject] call UnionClient_system_getModelName) in ["fuelstation_feed_f","metalbarrel_f","flexibletank_01_f","fs_feed_f","fuelstation_01_pump_f","fuelstation_02_pump_f"]) then {
	_progressName = "Пополняем канистру";
	_progressDone = "Вы пополнили канистру.";
	_sleep = 0.15;	
	_newItem = "extItem_Fuelcan";
	_doAction = true;
	_sound = "action_refuel";
} else {
	hint "Вы должны быть рядом с заправкой";
};

if (!_doAction) exitWith {life_action_inUse = false;life_interrupted = false;};

//Setup the progress bar
disableSerialization;
private _cP = 0;
player say3D _sound;
titleText[_progressName,"PLAIN"];
while {true} do {
	_cP = _cP + 0.01;
	[_cP] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
	call UnionClient_animation_kneelWork;
	uiSleep _sleep;	
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

if !([_oldItem] call UnionClient_system_removeItem) exitWith {hint "Не удалось удалить предмет"};
if !([_newItem] call UnionClient_system_addItem) exitWith {hint "Не удалось добавить предмет"};

titleText[_progressDone,"PLAIN"];