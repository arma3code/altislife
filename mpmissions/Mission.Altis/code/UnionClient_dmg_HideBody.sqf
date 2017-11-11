/*

	Filename: 	UnionClient_dmg_HideBody.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private ["_unit"];
_unit = cursorObject;
if !(EQUAL(CURWEAPON,"Extremo_Tool_Shovel")) exitWith {hint "У вас должна быть лопата в руках!"};
if (isNull _unit) exitWith {};
call UnionClient_actions_inUse;
disableSerialization;
private _cP = 0;
titleText["Закапываем грешника","PLAIN"];
while {true} do {
	_cP = _cP + 0.05;
	[_cP,"gather"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	player forceWeaponFire ["Extremo_Tool_Shovel", "Hack"];
	uiSleep 0.5;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;


if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

if (life_interrupted) exitWith {life_interrupted = false; titleText["Вы прервали действие","PLAIN"];};

titleText["Захоронение прошло успешно!","PLAIN"];

deleteVehicle _unit;