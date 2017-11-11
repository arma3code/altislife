/*
	
	Filename: 	UnionClient_system_medicInfo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _wantedText = CONTROL(39001,39011);
_wantedText ctrlSetStructuredText parseText "";

private _unit = CONTROL_DATA(39002);
_unit = call compile format["%1", _unit];

if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

private _index = [getPlayerUID _unit,life_medic_wantedList] call UnionClient_system_index;

if !(EQUAL(_index,-1)) then {
	private _crimes = (life_medic_wantedList select _index) select 2;

	private _crimesList = "";
	private _mylist = [];
	private "_crime";
	{
		_crime = _x;
		if !(_crime in _mylist) then {
			_mylist pushBack _crime;
			_crimesList = _crimesList + format ["%2 x %1<br/>",{_x == _crime} count _crimes,M_CONFIG(getText,"LifeCfgCrimes",_crime,"displayName")];
		};
	} foreach _crimes;
	_wantedText ctrlSetStructuredText parseText _crimesList;
};