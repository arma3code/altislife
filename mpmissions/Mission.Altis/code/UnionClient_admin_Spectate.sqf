/*
	
	Filename: 	UnionClient_admin_Spectate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

/*
private _unit = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};
*/

while {dialog} do {
	closeDialog 0;
	uiSleep 0.01;
};

["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
waitUntil {!isNull (findDisplay 60492)};
AM_Exit = (findDisplay 60492) displayAddEventHandler ["KeyDown","if ((_this select 1) == 68) then {(findDisplay 60492) displayRemoveEventHandler ['KeyDown',AM_Exit];hint 'Слежение остановлено';[""Terminate""] call BIS_fnc_EGSpectator;};false"];

hint "Вы перешли в режим наблюдателя.\n\n Нажмите F10 чтобы прекратить.";