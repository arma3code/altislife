/*
	
	Filename: 	UnionClient_system_saveTerrainGrid.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if((lbCurSel 2975) == -1) exitWith {hint "Вы не выбрали детализацию"};
private _grassIndex = CONTROL_VALUE(2975);

if (EQUAL(_grassIndex,life_grassIndex)) exitWith {};

life_grassIndex = _grassIndex;
setterrainGrid life_grassIndex;