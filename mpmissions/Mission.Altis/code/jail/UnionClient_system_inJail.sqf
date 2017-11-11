/*

	Filename: 	UnionClient_system_inJail.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _spawnPoint = [];
private _text = "";
if (life_jail_time <= 15) then {
	{
		if (count(nearestObjects[_x,["CAManBase"],2]) == 0) exitWith {_spawnPoint = _x};
	} foreach life_JailSmallPoints;
	if (EQUAL(_spawnPoint,[])) then {_spawnPoint = life_JailSmallPoints call BIS_fnc_selectRandom};
	_text = "Вы оказались в КПЗ";
} else {
	{
		if (count(nearestObjects[_x,["CAManBase"],2]) == 0) exitWith {_spawnPoint = _x};
	} foreach life_JailBigPoints;
	if (EQUAL(_spawnPoint,[])) then {_spawnPoint = life_JailBigPoints call BIS_fnc_selectRandom};
	_text = "Вы оказались в тюрьме";
};

player setPosATL _spawnPoint;
cutText [_text,"BLACK IN",5];