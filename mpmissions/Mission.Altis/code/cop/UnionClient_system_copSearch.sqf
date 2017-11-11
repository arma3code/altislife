/*
	
	Filename: 	UnionClient_system_copSearch.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
life_action_inUse = false;
params [
	["_civ",Objnull,[Objnull]],
	["_invs",[],[[]]],
	["_dcash",0,[0]]
];

if(isNull _civ) exitWith {};

private _illegal = 0;
private _inv = "";

if (count _invs > 0) then {
	private "_index";
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,ITEM_NAME(_x select 0)];
		_index = [_x select 0,life_illegal_items] call UnionClient_system_index;
		if !(EQUAL(_index,-1)) then {
			_illegal = _illegal + ((_x select 1) * ((life_illegal_items select _index) select 1));
		};
	} foreach _invs;
	
	if (_dcash > 0) then {
		[[getPlayerUID _civ,GVAR_RNAME(_civ),"482"],"wantedAdd"] call UnionClient_system_hcExec;
		_illegal = _illegal + _dcash;
	};

	[[getPlayerUID _civ,GVAR_RNAME(_civ),"481"],"wantedAdd"] call UnionClient_system_hcExec;
	
	[0,"STR_Cop_Contraband",true,[(GVAR_RNAME(_civ)),[_illegal] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",west];
} else {
	_inv = localize "STR_Cop_NoIllegal";
};

if (!alive _civ || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",GVAR_RNAME(_civ)]};
hint parseText format["<t size='2' color='#FF0000'>%1</t><br/><t size='1.5' color='#FFD700'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t><br/><br/>%2<br/><br/>Грязные деньги: <t color='#FF0000'>$%3</t>",(GVAR_RNAME(_civ)),_inv,[_dcash] call UnionClient_system_numberText];

if (_illegal > 0) then {
	["atm","add",_illegal,"copSearch"] call UnionClient_system_myCash;
};