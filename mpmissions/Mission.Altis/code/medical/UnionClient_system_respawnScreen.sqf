/*

	Filename: 	UnionClient_system_respawnScreen.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
disableSerialization;
createDialog "UnionDialogRespawnScreen";
waitUntil {!isNull (findDisplay 4700)};
(findDisplay 4700) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

private _Timer = CONTROL(4700,4701);
private _RespawnBtn = CONTROL(4700,4702);
private _maxTime = time + (LIFE_SETTINGS(getNumber,"life_respawn_timer") * 60);

_RespawnBtn ctrlEnable false;
waitUntil {
	_Timer ctrlSetStructuredText parseText format["<t size='1.2' align='center'>Воскрешение доступно через %1</t>",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 OR isNull _unit
};

_RespawnBtn ctrlEnable true;
_Timer ctrlSetStructuredText parseText "<t size='1.2' align='center'>Вы можете воскреснуть!</t>";
