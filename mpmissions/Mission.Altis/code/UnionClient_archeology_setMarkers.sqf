/*

	Filename: 	UnionClient_archeology_setMarkers.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private ["_zonePos","_zoneRadius","_marker"];
{
	if ((getMarkerPos (_x select 0)) isEqualTo [0,0,0]) then {
		_zonePos = getArray (missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyZones" >> worldName >> _x select 0 >> "position");
		_zoneRadius = getNumber (missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyZones" >> worldName >> _x select 0 >> "radius");
	
		_marker = createMarkerLocal [_x select 0,_zonePos];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerSizeLocal [_zoneRadius,_zoneRadius];
		_marker setMarkerBrushLocal "Solid";
		_marker setMarkerColorLocal "ColorUNKNOWN";
	
		_marker = createMarkerLocal [format["%1_text",_x select 0],_zonePos];
		_marker setMarkerShapeLocal "ICON";		
		_marker setMarkerTypeLocal "plp_mark_as_maptools";	
		_marker setMarkerColorLocal "ColorUNKNOWN";
		_marker setMarkerTextLocal "Место раскопок";
	};
} forEach life_arc_currentZones;