/*
	
	Filename: 	UnionClient_atm_transfer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _val = parseNumber(ctrlText 2704);
private _unit = call compile format["%1",(CONTROL_DATA(2703))];

if (isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if (isNull _unit) exitWith {hint localize "STR_ATM_DoesntExist"};
if (EQUAL((lbCurSel 2703),-1)) exitWith {hint localize "STR_ATM_NoneSelected"};
if (_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if (_val <= 100) exitwith {hint "Минимальная сумма для перевода состовляет $100"};
if !([str(_val)] call UnionClient_system_isnumeric) exitWith {hint localize "STR_ATM_notnumeric"};
if (_val > BANK) exitWith {hint localize "STR_ATM_NotEnough"};
if (GVAR_RNAME(_unit) == "") exitWith {hint "Не удается определить имя получателя."};
if (time - life_atm_timer < 3) exitWith {hint "Переводить деньги можно не чаще одного раза в 3 секунды"};

private _tax = round(_val / 15);
private _sum = _val + _tax;

if (_sum > BANK) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

["atm","take",_sum,"MS",format["Bank Transfer to %1 (%2)",GVAR_RNAME(_unit),getPlayerUID _unit]] call UnionClient_system_myCash;
["atm","add",_val,"MS",format["Bank Transfer from %1 (%2)",GVAR_RNAME(player),steamid]] remoteExecCall ["UnionClient_system_myCash",_unit];

[format["%1 перевел вам $%2 на банковский счет",GVAR_RNAME(player),[_val] call UnionClient_system_numberText],"money"] remoteExecCall ["UnionClient_system_hint",_unit];
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call UnionClient_system_numberText,GVAR_RNAME(_unit),[_tax] call UnionClient_system_numberText];

[] call UnionClient_atm_updateMenu;
life_atm_timer = time;