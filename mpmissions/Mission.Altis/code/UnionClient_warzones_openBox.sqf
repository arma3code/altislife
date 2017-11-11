/*

	Filename: 	UnionClient_warzones_openBox.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"]};

private _box = param [0,objNull,[objNull]];
if (!isNil {_box GVAR "takedBy"}) exitWith {titleText["Уже кем-то открывается","PLAIN"]};
[_box,"takedBy",player] call CBA_fnc_setVarNet;

titleText["Открываем... Ждите...","PLAIN"];
uiSleep (random 3);

if !((_box GVAR ["takedBy",objNull]) isEqualTo player) exitWith {"WarZoneOpenBox - dupe?" call UnionClient_system_log};
if (_box GVAR ["priceTaked",false]) exitWith {"WarZoneOpenBox - Price Already Taked" call UnionClient_system_log};

private _gangPoints = grpPlayer GVAR ["gang_warpoints",0];
[grpPlayer,"gang_warpoints",(_gangPoints + 1)] call CBA_fnc_setVarNet;

["priceTaked",grpPlayer GVAR "gang_name"] remoteExecCall ["UnionClient_warzones_message",-2];

[_box,player,grpPlayer] remoteExecCall ["TON_fnc_updateGangWarPoints",RSERV];