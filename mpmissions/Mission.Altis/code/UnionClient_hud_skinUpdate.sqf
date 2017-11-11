/*

	Filename: 	UnionClient_hud_skinUpdate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (EQUAL((lbCurSel 6005),-1)) exitWith {hint "Вы не выбрали приписку"};
private _skinCfg = CONTROL_DATA(6005);

if (!isClass (missionConfigFile >> "LifeCfgThemes" >> _skinCfg)) exitWith {};

[_skinCfg] call UnionClient_hud_skinSet;