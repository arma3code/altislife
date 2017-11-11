/*

	Filename: 	UnionClient_system_getBuildID.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private ["_build","_sn","_sf","_ef","_na","_id","_i","_item"];
_build = param [0,ObjNull,[ObjNull]];
if (isNull _build) exitWith {0};

_sn = toArray (str (_build));
_sf = false;
_ef = false;
_na = [];
_id = "";

for "_i" from 0 to (count _sn)-1  do {
	_item = _sn select _i;
	if (_sf and (not (_ef))) then {_na set [count _na,_item]};
	if (EQUAL(_item,35)) then {_sf = true};
	if (EQUAL(_item,58)) then {_ef = true};
};

if ((count _na) >= 3) then {
	_na set [((count _na)-1) ,"delete"];
	_na = _na - ["delete"];
	_na set [0 ,"delete"];
	_na = _na - ["delete"];
	_id = toString (_na);
};

_id