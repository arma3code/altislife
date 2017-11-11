/*

	Filename: 	UnionClient_system_questionDealer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _sellers = (_this select 0) GVAR ["sellers",[]];
if (EQUAL(_sellers,[])) exitWith {hint localize "STR_Cop_DealerQuestion"}; //No data.
call UnionClient_actions_inUse;
private _names = "";
private "_val";
{	
	_val = _x select 2;

	if (_val > 15000) then {
		_val = round(_val / 16);
	};

	[[_x select 0,_x select 1,"483",_val],"wantedAdd"] call UnionClient_system_hcExec;

	_names = _names + format["%1<br/>",_x select 1];
} foreach _sellers;

hint parseText format[(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
(_this select 0) SVAR ["sellers",[],true];
life_action_inUse = false;