/*

	Filename: 	UnionClient_markers_menuShow.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
waitUntil {visibleMap};
showChat false;
private ["_title","_checkbox","_state","_markersArray"];
{
	_title = CONTROL(12,getNumber(_x >> "titleID"));
	_checkbox = CONTROL(12,getNumber(_x >> "checkboxID"));

	_markersArray = getText(_x >> "markersArray");
	if (LIFE_MARKERWORLD(getArray,worldName,_markersArray) isEqualTo []) then {
		_title ctrlShow false;
		_checkbox ctrlShow false;
	} else {
		_title ctrlSetText (getText(_x >> "titleTXT"));
		_checkbox cbSetChecked (GVAR_PRNS [format["%1",configName _x],true]);
		if (life_mapFirstTimeOpen) then {
			_state = if (cbChecked _checkbox) then {1} else {0};
			[_checkbox,_state] call UnionClient_markers_changeAlpha;
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgMapCheckBoxes"));

waitUntil {uiSleep 0.3; !visibleMap};
showChat true;