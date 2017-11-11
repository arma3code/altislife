/*

	Filename: 	UnionClient_archeology_nearestPoint.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _curZone = "";
{	
	if ([player, (_x select 0)] call CBA_fnc_getDistance < ((getMarkerSize (_x select 0)) select 0)) exitWith {_curZone = _x select 0};
} forEach life_arc_currentZones;

if (EQUAL(_curZone,"")) exitWith {call UnionClient_archeology_clearZone};

if !(EQUAL(life_arc_currentZone,_curZone)) then {
	life_arc_currentZone = _curZone;
	life_arc_currentPoint = [_curZone] call CBA_fnc_randPosArea;
	format["Archeology - Current Point: %1",life_arc_currentPoint] call UnionClient_system_log; //точка где и лежит сам КЛАД		
};