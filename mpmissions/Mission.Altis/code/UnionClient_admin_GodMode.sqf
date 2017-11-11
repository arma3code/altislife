/*

	Filename: 	UnionClient_admin_GodMode.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

[] spawn {
	while {dialog} do {
	closeDialog 0;
	uiSleep 0.01;
	};
};

if(life_god) then {
    life_god = false;
    titleText ["Режим бога выключен","PLAIN"]; titleFadeOut 2;
    player allowDamage true;
} else {
    life_god = true;
    titleText ["Режим бога включен","PLAIN"]; titleFadeOut 2;
    player allowDamage false;
};