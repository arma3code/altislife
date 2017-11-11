/*

	Filename: 	UnionClient_system_revived.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _medic = param [0,objNull,[objNull]];
private _reviveFee = LIFE_SETTINGS(getNumber,"life_revive_fee");

if (EQUAL(side _medic,east) && (BANK > _reviveFee)) then {
	hint format[localize "STR_Medic_RevivePay",GVAR_RNAME(_medic),[_reviveFee] call UnionClient_system_numberText];
	["atm","take",_reviveFee] call UnionClient_system_myCash;
};

player setUnconscious false;
player playMoveNow "amovpercmstpsnonwnondnon";

[player,"medicStatus"] call UnionClient_system_clearGlobalVar;



player SVAR ["tf_unable_to_use_radio", false];

["all"] call UnionClient_system_removeBuff;

["Death_Screen_V2"] call UnionClient_gui_DestroyRscLayer;
player setDamage 0;

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

2 fadeSound 1;
cutText ["Вы приходите в себя...", "BLACK IN", 5];
uiSleep 4;

if (isNull LIFE_HANDLE_HUD) then {LIFE_HANDLE_HUD = [] spawn UnionClient_hud_init};
if (isNull LIFE_HANDLE_EFFECTS) then {LIFE_HANDLE_EFFECTS = [] spawn UnionClient_effects_Init};