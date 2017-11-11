/*

	Filename: 	UnionClient_archeology_checkDistance.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(CURWEAPON isEqualTo ARC_SETTINGS(getText,"workItem")) exitWith {};
"Archeology - In zone?" call UnionClient_system_log; //Тут мы запускаем на клиенте сам процесс поиска и добычи археологических предметов
call UnionClient_archeology_nearestPoint;
if (EQUAL(life_arc_currentPoint,[])) exitWith {"Archeology - CheckDistance - No Point!" call UnionClient_system_log};

format ["Archeology - CheckDistance - Distance: %1",[player,life_arc_currentPoint] call CBA_fnc_getDistance] call UnionClient_system_log;

uiSleep 8;

if ([player,life_arc_currentPoint] call CBA_fnc_getDistance <= 2) exitWith {[] spawn UnionClient_archeology_spawnItem}; //пора спаунить предмет!

private _arrowClass = switch (true) do {
	case ([player,life_arc_currentPoint] call CBA_fnc_getDistance < 10) : {"Sign_Arrow_Direction_Green_F"}; 
	case ([player,life_arc_currentPoint] call CBA_fnc_getDistance <= 40) : {"Sign_Arrow_Direction_Yellow_F"}; 	
	case ([player,life_arc_currentPoint] call CBA_fnc_getDistance > 40) : {"Sign_Arrow_Direction_F"};
};

private _pos = player modelToWorld [0,1,1];
private _arrow = _arrowClass createVehicleLocal _pos;
_arrow setpos _pos;
_arrow setDir ([_arrow,life_arc_currentPoint] call BIS_fnc_relativeDirTo);

uiSleep 15;

deleteVehicle _arrow;