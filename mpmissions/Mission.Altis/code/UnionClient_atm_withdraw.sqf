/*

	Filename: 	UnionClient_atm_withdraw.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _val = parseNumber(ctrlText 2702);
if (_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_val <= 0) exitwith {hint "Укажите положительное значение"};
if !([str(_val)] call UnionClient_system_isnumeric) exitWith {hint localize "STR_ATM_notnumeric"};
if (_val > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if (_val < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.
if (time - life_atm_timer < 3) exitWith {hint "Снимать и класть деньги на счет можно не чаще одного раза в 3 секунды"};

["atm","swap",_val,"BankWithdraw"] call UnionClient_system_myCash;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call UnionClient_system_numberText];

[] call UnionClient_atm_updateMenu;
life_atm_timer = time;