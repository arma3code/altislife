/*

	Filename: 	UnionClient_system_medicMarkers.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _markers_dead = [];
private _dead = [];
private _markers_medic = [];
private _medics = [];

uiSleep 0.5;

if (visibleMap) then {
	if (life_mapFirstTimeOpen) then {
		mapAnimAdd [0, 0.2, player];
		mapAnimCommit;
		life_mapFirstTimeOpen = false;
	};
	{
        if ((GVAR_RNAME(_x) != "") && (alive _x) && (LSINCAP(_x)) && (_x GVAR ["medicStatus",-1] >= 0)) then {
			_dead pushBack _x;
		};
	} foreach playableUnits;
	
	{
		if (EQUAL((side _x),east)) then {
			_medics pushBack _x;
		};
	} foreach playableUnits;
	
	private["_marker","_unit"];
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",GVAR_RNAME(_x)];
		_markers_dead pushBack [_marker,_x];
	} foreach _dead;
		
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
		_markers_medic pushBack [_marker,_x];
	} foreach _medics;
	
	while {visibleMap} do {
		{			
			_marker = _x select 0;
			_unit = _x select 1;
			if (!isNil "_unit") then {
				if (!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers_medic;
		if (!visibleMap) exitWith {};
		uiSleep 1;
	};
	
	{deleteMarkerLocal (_x select 0)} foreach _markers_dead;
	{deleteMarkerLocal (_x select 0)} foreach _markers_medic;	
	_markers_dead = [];
	_dead = [];
	_markers_medic = [];
	_medics = [];
};