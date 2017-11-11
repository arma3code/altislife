/*

	Filename: 	UnionClient_atm_deposit.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _value = parseNumber(ctrlText 2702);

if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value <= 0) exitWith {hint "Укажите положительное значение"};
if !([str(_value)] call UnionClient_system_isnumeric) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};
if (time - life_atm_timer < 3) exitWith {hint "Снимать и класть деньги на счет можно не чаще одного раза в 3 секунды"};

["cash","swap",_value,"BankDeposit"] call UnionClient_system_myCash;
hint format[localize "STR_ATM_DepositMSG",[_value] call UnionClient_system_numberText];

[] call UnionClient_atm_updateMenu;
life_atm_timer = time;