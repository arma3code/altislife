/*
	
	Filename: 	UnionClient_system_wantedInfo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _list = CONTROL(2400,2402);
lbClear _list;

private _data = CONTROL_DATA(2401);
_data = call compile format["%1", _data];

private _bountyTotal = CONTROL(2400,2403);
_bountyTotal ctrlSetStructuredText parseText "";

if (isNil "_data") exitWith {};
if (typeName _data != "ARRAY") exitWith {};
if (EQUAL(_data,[])) exitWith {};

private _crimes = _data select 2;
private _bounty = _data select 3;

private _mylist = [];
private "_crime";
{
	_crime = _x;
	if !(_crime in _mylist) then {
		_mylist pushBack _crime;
		_list lbAdd format ["%2 x %1",{_x == _crime} count _crimes,M_CONFIG(getText,"LifeCfgCrimes",_crime,"displayName")];
	};
} foreach _crimes;

if (_bounty > 0) then {
	_bountyTotal ctrlSetStructuredText parseText format["Награда за поимку: <t size = '1.2' color='#53b21a'>$%1</t>",[_bounty] call UnionClient_system_numberText];
};