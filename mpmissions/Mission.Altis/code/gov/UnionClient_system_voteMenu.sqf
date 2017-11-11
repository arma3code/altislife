/*
	
	Filename: 	UnionClient_system_voteMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_display","_list"];
disableSerialization;

if(count server_candidates == 0) exitWith {hint "Выборы проводятся по воскресеньям";};

if(isNull (findDisplay 3300)) then {
	if !(createDialog "UnionDialogVote") exitWith {};
};

_display = findDisplay 3300;
_list = _display displayCtrl 3301;

lbClear _list;

{	
	_list lbAdd format["%1 [%2]", _x select 1,_x select 2];
	_list lbSetdata [(lbSize _list)-1,_x select 0];
} foreach (server_candidates);