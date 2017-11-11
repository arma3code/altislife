/*

	Filename: 	UnionClient_dhl_menuUpdate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;

private _startPoint = CONTROL_DATA(5802);
private _finishPoint = CONTROL_DATA(5803);

if (EQUAL(_startPoint,"") OR EQUAL(_finishPoint,"")) exitWith {};

private _total = 0;
if !(EQUAL(_startPoint,_finishPoint)) then {
	_startPoint = call compile format["%1",_startPoint];
	_finishPoint = call compile format["%1",_finishPoint];
	if (isNil "_startPoint" OR isNil "_finishPoint") exitWith {};
	_total = round((_startPoint distance2D _finishPoint) * LIFE_SETTINGS(getNumber,"life_dhl_price"));
};

private _price = CONTROL(5800,5804);
_price ctrlSetStructuredText parseText format ["<t size='1.1' valign='middle' align='right' color='#3f6b00'>$%1</t>",[_total] call UnionClient_system_numberText];