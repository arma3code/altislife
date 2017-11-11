/*

	Filename: 	UnionClient_system_resHBClient.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];

private _cP = 0;
private _error = false;
private _title = format["%1 реанимирует вас",GVAR_RNAME(_unit)];
player say3D "defib";
titleText[_title,"PLAIN"];
while {true} do {
	uiSleep 0.15;
	_cP = _cP + 0.01;
	[_cP,"medic"] call UnionClient_system_progressBar;
	if (_cP >= 1) exitWith {};
	if (GVAR_RESTRAINED(_unit) OR player distance _unit > 4 OR !alive _unit OR (_unit GVAR ["tazed",false])) exitWith {_error = true};
	if !(LSINCAP(player)) exitWith {_error = true};
	if (player GVAR ["reviving",ObjNull] != _unit) exitWith {_error = true};
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
[player,"reviving"] call UnionClient_system_clearGlobalVar;

if (_error) exitWith {titleText["Реанимация прервана!","PLAIN"];};

[player,"medicStatus"] call UnionClient_system_clearGlobalVar;
player SVAR ["tf_unable_to_use_radio", false];
player setUnconscious false;

["Death_Screen_V2"] call UnionClient_gui_DestroyRscLayer;
player setDamage 0;

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

2 fadeSound 1;
cutText ["Вы приходите в себя...", "BLACK IN", 5];
uiSleep 4;


if (isNull LIFE_HANDLE_HUD) then {LIFE_HANDLE_HUD = [] spawn UnionClient_hud_init};
if (isNull LIFE_HANDLE_EFFECTS) then {LIFE_HANDLE_EFFECTS = [] spawn UnionClient_effects_Init};