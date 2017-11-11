/*

	Filename: 	UnionClient_gangs_Deposit.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};

private _ownerID = grpPlayer GVAR ["gang_owner",""];
if !(EQUAL(_ownerID,steamid)) exitWith {hint "Вносить деньги на счет банды может только лидер"};

private _value = parseNumber(ctrlText 2702);
if (_value < 5000) exitWith {hint "Минимальная сумма для вноса на счет банды: $5,000"};
if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if !([str(_value)] call UnionClient_system_isnumeric) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

private _sum = round (_value * 1.05);
if (_sum > BANK) exitWith {hint "У вас недостаточно денег на счету для оплаты налога в 5%"};

private _gFund = grpPlayer GVAR ["gang_bank",-1];
if (EQUAL(_gFund,-1)) exitWith {hint "Не удалось определить баланс банды"};

call UnionClient_actions_inUse;
(CONTROL(2700,2705)) ctrlEnable false;
hint "Кладем деньги на счет...";
//["atm","take",_sum,"gangDeposit"] call UnionClient_system_myCash;
[grpPlayer,playerSide,(_gFund+_value),"add",_value,steamid,GVAR_RNAME(player),player] remoteExecCall ["TON_fnc_updateGangBank",RSERV];

uiSleep 3;

hint format [localize "STR_ATM_DepositGang",[_value] call UnionClient_system_numberText];
(CONTROL(2700,2705)) ctrlEnable true;
[] call UnionClient_atm_updateMenu;
life_action_inUse = false;