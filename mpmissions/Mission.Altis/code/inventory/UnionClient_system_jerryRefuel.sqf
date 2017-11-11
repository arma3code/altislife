/*
	
	Filename: 	UnionClient_system_jerryRefuel.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_oldItem","_vehicle","_amount","_progressName","_progressDone","_sleep","_newItem","_sound","_error","_ui","_progressBar","_titleText","_cP","_progress_rscLayer"];
_oldItem = [_this,0,"",[""]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if (isNull _vehicle OR _oldItem == "") exitWith {};
if (life_action_inUse OR (call UnionClient_system_isInterrupted)) exitWith {};
if !([_vehicle] call UnionClient_system_isVehicleKind) exitWith {hint "Данный вид техники нельзя заправить"};
if (player distance _vehicle > 7.5) exitWith {hint "Вы слишком далеко от техники"};

call UnionClient_actions_inUse;

switch(true) do {
	case (_oldItem == "extItem_Fuelcan"): {
		_progressName = "Заправляем технику";
		_progressDone = "Вы заправили технику.";
		_sleep = 0.25;		
		_newItem = "extItem_Fuelcan_empty";
		_sound = "action_refuel";
	};
};

if (!(player canAdd _newItem)) exitWith {life_interrupted = false;life_action_inUse = false; hint "Инвентарь переполнен"};

disableSerialization;
_cP = 0;

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

if (life_interrupted) exitWith {life_interrupted = false; hint "Действие было прервано"};

if !([_oldItem] call UnionClient_system_removeItem) exitWith {hint "Не удалось удалить предмет"};
if !([_newItem] call UnionClient_system_addItem) exitWith {hint "Не удалось добавить предмет"};

switch (true) do {
	case (_vehicle isKindOF "LandVehicle"): {_amount = 0.5};	
	case (_vehicle isKindOf "Air"): {_amount = 0.2};	
	case (_vehicle isKindOf "Ship"): {_amount = 0.35};
	default {_amount = 0.5};
};

if(!local _vehicle) then {
	[_vehicle,(Fuel _vehicle) + _amount] remoteExecCall ["UnionClient_system_setFuel",_vehicle];
} else {
	_vehicle setFuel ((Fuel _vehicle) + _amount);
};

titleText[_progressDone,"PLAIN"];