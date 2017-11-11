/*
	
	Filename: 	UnionClient_system_getPayCheck.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
private["_amount"];
_amount = [_this,0,0,[0]] call BIS_fnc_param;

if (_amount == 0) exitWith {systemChat "Вам пришел пустой платеж...Какая досада"};

systemChat format[localize "STR_FSM_ReceivedPay",[_amount] call UnionClient_system_numberText];
["atm","add",_amount] call UnionClient_system_myCash;