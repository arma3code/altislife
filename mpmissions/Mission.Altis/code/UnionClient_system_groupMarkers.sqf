/*
	
	Filename: 	UnionClient_system_groupMarkers.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _markers = [];
private _units = [];

private _color = switch (playerSide) do {
	case civilian: {"ColorCivilian"};
	case independent: {"ColorIndependent"};
	case west: {"ColorBLUFOR"};
	case east: {"ColorOPFOR"};
};

uiSleep 0.5;
if (visibleMap) then {
	if (life_mapFirstTimeOpen) then {
		mapAnimAdd [0, 0.2, player];
		mapAnimCommit;
		life_mapFirstTimeOpen = false;
	};
	_units = units(grpPlayer);
	
	private ["_marker","_unit"];
	{
        if (!(_x GVAR ["isBlind",false]) && (GVAR_RNAME(_x) != "")) then {
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal _color;
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", GVAR_RNAME(_x)];
		
			_markers pushBack [_marker,_x];
		};
	} foreach _units;
		
	while {visibleMap} do {
		{		
			_marker = _x select 0;
			_unit = _x select 1;
			if (!isNil "_unit") then {
				if (!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if (!visibleMap) exitWith {};
		uiSleep 1;
	};

	{deleteMarkerLocal (_x select 0)} foreach _markers;
	_markers = [];
	_units = [];
};