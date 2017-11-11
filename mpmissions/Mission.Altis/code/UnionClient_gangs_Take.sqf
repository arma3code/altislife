/*

	Filename: 	UnionClient_gangs_Take.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};

private _ownerID = grpPlayer GVAR ["gang_owner",""];
if (_ownerID != steamid) exitWith {hint "Снимать деньги со счета банды может только лидер"};

private _val = ctrlText 2633;
if !([_val] call UnionClient_system_isnumber) exitWith {hint "Сумма должна быть в цифрах"};

_val = parseNumber _val;
if (_val < 5000) exitWith {hint "Минимальная сумма для снятия: $5,000"};
if (_val > 999999) exitWith {hint "Сумма для снятия не должна превышать $999,999 за раз"};

private _gangBank = grpPlayer GVAR ["gang_bank",-1];
if (EQUAL(_gangBank,-1)) exitWith {hint "Не удалось определить общак группы"};
if (_val > _gangBank) exitWith {hint "На счету вашей банды недостаточно средств"};

call UnionClient_actions_inUse;
(CONTROL(2620,2626)) ctrlEnable false;
hint "Снимаем деньги со счета...";
//["atm","add",_val,"TakeMoneyFromGang"] call UnionClient_system_myCash;
[grpPlayer,playerSide,(_gangBank-_val),"remove",_val,steamid,GVAR_RNAME(player),player] remoteExecCall ["TON_fnc_updateGangBank",RSERV];

uiSleep 3;

hint format ["Вы сняли со счета банды $%1",[_val] call UnionClient_system_numberText];
[] spawn UnionClient_gangs_Menu;
life_action_inUse = false;