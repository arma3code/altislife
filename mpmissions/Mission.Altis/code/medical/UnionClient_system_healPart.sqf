/*

	Filename: 	UnionClient_system_healPart.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_part","_hitHead","_hitBody","_hitHands","_hitLegs","_partTitle","_ui","_progressBar","_titleText","_cP","_title","_progress_rscLayer"];
_part = param [0,"",[""]];

if (life_action_inUse) exitWith {};
if (EQUAL(_part,"")) exitWith {};
if (damage player > 0.25) exitWith {hint "Вам необдходимо поднять уровень здоровья до 75%!"};
if (EQUAL(damage player,0)) exitWith {hint "У вас нет повреждений, которые необходимо лечить!"};
if (!("extItem_bandage" in (magazines player))) exitWith {hint "Вам необходимо приобрести бинт"};

call UnionClient_actions_inUse;
closeDialog 0;

titleText["Вы начали лечение...","PLAIN"];

_partTitle = switch (_part) do {
	case "head": {"голове"};
	case "body": {"теле"};
	case "hands": {"руках"};
	case "legs": {"ногах"};
};

_title = format ["Лечим раны на %1",_partTitle];
player say3D "action_bandage_0";
disableSerialization;
_cP = 0;
titleText[_title,"PLAIN"];
while {true} do {
	_cP = _cP + 0.01;
	[_cP,"medic"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	if (NOTINVEH(player)) then {call UnionClient_animation_kneelWork};
	uiSleep 0.1;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};
if (NOTINVEH(player)) then {
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;
};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; };

if !(["extItem_bandage"] call UnionClient_system_removeItem) exitWith {hint "Вам необходимо приобрести Хирургический набор"};

switch (_part) do {
	case "head": {player setHitPointDamage ["hitHead", 0];};
	case "body": {player setHitPointDamage ["hitBody", 0];};
	case "hands": {player setHitPointDamage ["hitHands", 0];};
	case "legs": {player setHitPointDamage ["hitLegs", 0];};
};

_hitHead = player getHitPointDamage "hitHead";
_hitBody = player getHitPointDamage "hitBody";
_hitHands = player getHitPointDamage "hitHands";
_hitLegs = player getHitPointDamage "hitLegs";

if (_hitHead < 0.25 && _hitBody < 0.25 && _hitHands < 0.25 && _hitLegs < 0.25) then {player setDamage 0};

titleText["Лечение закончено!","PLAIN"];

[] call UnionClient_system_healMenu;