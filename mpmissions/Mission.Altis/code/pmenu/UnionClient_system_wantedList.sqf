/*

	Filename: 	UnionClient_system_wantedList.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_wantedUnits",[],[[]]],
	["_jailedUnits",[],[[]]]
];

private _list = CONTROL(2400,2401);
lbClear _list;

private _listcall = "";
{
	_list lbAdd format ["%1", _x select 1];
	_list lbSetData [(lbSize _list)-1,str(_x)];
	_listcall = _listcall + format ["%1", _x select 1]  + "\n";
} foreach _wantedUnits;

if (EQUAL(_listcall,"")) then {_listcall = "Список пуст"};

ctrlSetText [2404,format ["Заключенных в тюрьме: %1",count _jailedUnits]];

["CrimeStatusBar","PLAIN"] call UnionClient_gui_CreateRscLayer;
((GVAR_UINS "CrimeStatusBar") displayCtrl 10000) ctrlSetText format ["Розыск\n\n%1", _listcall];

if (EQUAL((lbSize _list),0)) then {
	_list lbAdd "Список пуст";
};

_list lbSetCurSel 0;