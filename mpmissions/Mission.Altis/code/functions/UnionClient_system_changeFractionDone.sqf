/*

	Filename: 	UnionClient_system_changeFractionDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _side = param [0,sideUnknown,[civilian]];
private _money = param [1,0,[0]];

if (_side == sideUnknown OR _side != playerSide) exitWith {life_fractionInUse = false;};

switch(_side) do {
	case civilian: {		
		["atm","take",_money,"changeFractionDone"] call UnionClient_system_myCash;		
		hint format["Вы заплатили $%1 и вступили в сопротивление! Теперь вы можете зайти за повстанческий слот!",[_money] call UnionClient_system_numberText];				
	};
	case independent: {	
		["atm","take",_money,"changeFractionDone"] call UnionClient_system_myCash;
		life_tmp_tax = life_tmp_tax + _money;
		hint format["Вы заплатили $%1 и получили гражданство! Теперь вы можете зайти за гражданский слот!",[_money] call UnionClient_system_numberText];				
	};
};

life_fractionInUse = false;

[] spawn UnionClient_system_logout;