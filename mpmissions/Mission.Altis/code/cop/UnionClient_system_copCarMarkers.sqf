/*

	Filename: 	UnionClient_system_copCarMarkers.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _markers = [];
private _copCars = [];

openMap true;

uiSleep 0.5;

private["_veh","_vehData","_vehSide","_ownerName","_displayName"];
if (visibleMap) then {	
	{
		_veh = _x;
		_vehSide = _veh GVAR ["tf_side",sideUnknown];		
		if (EQUAL(_vehSide,west)) then {			
			_vehData = _veh GVAR ["vehicle_info_owners",[]];						
			if (count _vehData > 0) then {
				_ownerName = (_vehData select 0) select 1;
				_displayName = getText(configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
				_copCars pushBack [_veh,_displayName,_ownerName];				
			};
	
		};		
	} foreach vehicles;
	
	private["_marker","_unit"];
	{		
		_marker = createMarkerLocal [format["%1_marker",(_x select 0)],visiblePosition (_x select 0)];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "c_car";
		_marker setMarkerTextLocal format["%1 (%2)", _x select 1, _x select 2];
	
		_markers pushBack [_marker,_x select 0];
	} foreach _copCars;
		
	while {visibleMap} do {
		{			
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		uiSleep 1;
	};

	{deleteMarkerLocal (_x select 0)} foreach _markers;
	_markers = [];
	_copCars = [];
};