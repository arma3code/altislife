/*

	Filename: 	UnionClient_markers_changeAlpha.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params ["_checkBox","_state"];

private _checkBoxName = ctrlClassName _checkBox;
if (!isClass (missionConfigFile >> "LifeCfgMapCheckBoxes" >> _checkBoxName)) exitWith {};

private _markersClass = M_CONFIG(getText,"LifeCfgMapCheckBoxes",_checkBoxName,"markersArray");
{
	_x setMarkerAlphaLocal _state;
} forEach LIFE_MARKERWORLD(getArray,worldName,_markersClass);


SVAR_PRNS [format["%1",_checkBoxName],(cbChecked _checkBox)];