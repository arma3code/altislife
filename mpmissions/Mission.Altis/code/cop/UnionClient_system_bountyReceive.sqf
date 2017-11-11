/*

	Filename: 	UnionClient_system_bountyReceive.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_val","",["",0]],
	["_total","",["",0]]
];

private _tax = 0;
private _money = _val;
private _txt = "";

if (_val > 50000) then {
	_tax = round(_money * (server_tax/100));		
	ADD(life_tmp_tax,_money);
	SUB(_money,_tax);	
	_txt = format [". Налог составил: $%1",[_tax] call UnionClient_system_numberText];
};

if (ISPSIDE(west)) then {
	_money = [_money,1] call UnionClient_system_discount;
};

if (EQUAL(_val,_total)) then {
	titleText[format[localize "STR_Cop_BountyRecieve",[_money] call UnionClient_system_numberText,_txt],"PLAIN"];
} else {
	//titleText[format[localize "STR_Cop_BountyKill",[_money] call UnionClient_system_numberText,[_total] call UnionClient_system_numberText,_txt],"PLAIN"];
};

["atm","add",_money,"bountyReceive"] call UnionClient_system_myCash;