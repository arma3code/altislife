/*

	Filename: 	UnionClient_effects_WarZones.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _inZone = false;
while {true} do {
	if (EQUAL(server_warzones,[])) exitWith {};
	_inZone = false;
	{
		_marker = format["war_zone_%1",_x select 0];
		if (player distance getMarkerPos _marker < 1900) exitWith {_inZone = true;};
	} forEach server_warzones;

	if (_inZone) then {
		life_inwarzone = true;
		if !(cameraView in ["INTERNAL","GUNNER"])  then {
			player switchCamera "INTERNAL";		
		};
	} else {
		life_inwarzone = false;
	};

	uiSleep 10;
};		

life_inwarzone = false;