/*

	Filename: 	UnionClient_system_giveMoney.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _amount = ctrlText 7204;
ctrlShow[7206,false];
if (EQUAL((lbCurSel 7205),-1)) exitWith {hint localize "STR_ATM_NoneSelected";ctrlShow[7206,true];};
private _unit = call compile format["%1",CONTROL_DATA(7205)];

if (isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"; ctrlShow[7206,true]};
if (isNull _unit) exitWith {hint localize "STR_ATM_DoesntExist"; ctrlShow[7206,true]};
if (EQUAL(_unit,player)) exitWith {ctrlShow[7206,true]};
if (time - life_atm_timer < 3) exitWith {hint "Переводить деньги можно не чаще одного раза в 3 секунды"; ctrlShow[7206,true]};
if (!life_use_atm) exitWith {hint "Вы недавно кого-то ограбили. Не можете передать деньги другому человеку"; ctrlShow[7206,true]};
if !([_amount] call UnionClient_system_isnumber) exitWith {hint "Введите корректное число!"; ctrlShow[7206,true]};
if ((parseNumber _amount) <= 0) exitWith {hint "Введите значение больше нуля"; ctrlShow[7206,true]};
if ((parseNumber _amount) > CASH) exitWith {hint "У вас нет такого количества денег"; ctrlShow[7206,true]};
if (GVAR_RNAME(_unit) == "") exitWith {hint "Не удается определить имя получателя."; ctrlShow[7206,true]};

hint format["Вы передали $%1 игроку %2",[(parseNumber _amount)] call UnionClient_system_numberText,GVAR_RNAME(_unit)];
["GIVEMONEY",[format["%1 (%2) received money || $%3 || %4 (%5)",GVAR_RNAME(_unit),getPlayerUID _unit,_amount,GVAR_RNAME(player),steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV];
["cash","take",(parseNumber _amount),"MS",format["Cash Transfer to %1 (%2)",GVAR_RNAME(_unit),getPlayerUID _unit]] call UnionClient_system_myCash;
[_unit,_amount,player] remoteExecCall ["UnionClient_system_receiveMoney",_unit];

[] spawn UnionClient_pad_openStatus;
life_atm_timer = time;
ctrlShow[7206,true];