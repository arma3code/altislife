/*

	Filename: 	UnionClient_system_vehdataSearch.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) exitWith {};
private _plate = ctrlText 5602;
if (EQUAL(_plate,"")) exitWith {hint "Введите регистрационный номер"};
(CONTROL(5600,5603)) ctrlEnable false;
hint localize "STR_NOTF_SendingData";

private _source_symbols = toArray (toUpper _plate);
private _allow_number = toArray "0123456789";

private _error = false;

if ((count _source_symbols) isEqualTo 6) then {
	{
		if !(_x in _allow_number) exitWith {
			_error = true;
		};
	} forEach _source_symbols;
} else {
	_error = true;
};

if (_error) exitWith {
	hint "Вы ввели номер неправильно";
};
[_plate,player] remoteExecCall ["TON_fnc_vehSearch",RSERV];