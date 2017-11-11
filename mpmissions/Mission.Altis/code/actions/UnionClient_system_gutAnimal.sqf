/*
	
	Filename: 	UnionClient_system_gutAnimal.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _animalCorpse = param [0,ObjNull,[ObjNull]];
if (isNull _animalCorpse) exitWith {}; //Object passed is null?
if !((typeOf _animalCorpse) in ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F","Turtle_F"]) exitWith {};
if (player distance _animalCorpse > 3.5) exitWith {};
if ((["extItem_knife"] call UnionClient_system_itemCount) == 0) exitWith {hint localize "STR_NOTF_KnifeNeed"};

call UnionClient_actions_inUse;
private _skin = false;

private ["_item"];
switch (typeOf _animalCorpse) do {
	case "Hen_random_F": {_item = "hen_raw";};
	case "Cock_random_F": {_item = "rooster_raw";};
	case "Goat_random_F": {_item = "goat_raw"; _skin = true;};
	case "Sheep_random_F": {_item = "sheep_raw"; _skin = true;};
		
	case "Turtle_F": {_item = "turtle";};
	case "Salema_F": {_item = "salema"};
	case "Ornate_random_F" : {_item = "ornate"};
	case "Mackerel_F" : {_item = "mackerel"};
	case "Tuna_F" : {_item = "tuna"};
	case "Mullet_F" : {_item = "mullet"};
	case "CatShark_F" : {_item = "catshark"};
	
	default {_item = "";};
};

if (EQUAL(_item,"")) exitWith {life_action_inUse = false;};
if (EQUAL(_item,"turtle") && {player distance getMarkerPos "turtle_1" > 350 && player distance getMarkerPos "turtle_2" > 350 && player distance getMarkerPos "turtle_3" > 350}) exitWith {life_action_inUse = false; hint localize "STR_NOTF_OutOfTurtlePlace"};

disableSerialization;
private _cP = 0;
titleText [localize "STR_NOTF_CutCorpse","PLAIN"];
while {true} do {
	_cP = _cP + 0.01;
	[_cP,"gather"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR isNull _animalCorpse OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	call UnionClient_animation_kneelWork;
	uiSleep 0.15;	
};
		
life_action_inUse = false;
["life_progress"] call UnionClient_gui_DestroyRscLayer;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};
if (isNull _animalCorpse) exitWith {};

private _count = switch (FETCH_CONST(life_donator)) do {
	case 0: {1};
	case 1: {1};
	case 2: {2};
	case 3: {2};
	case 4: {3};
};

if ([true,_item,_count] call UnionClient_system_handleInv) then {
	deleteVehicle _animalCorpse;
	titleText [localize "STR_NOTF_CutCorpseDone","PLAIN"];
} else {
	titleText [localize "STR_NOTF_InvFull","PLAIN"];
};

if (_skin) then {
	if !([true,"leather_r",1] call UnionClient_system_handleInv) then {
		titleText [localize "STR_NOTF_InvFull","PLAIN"];
	};
};
