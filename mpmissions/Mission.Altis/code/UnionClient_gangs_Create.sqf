/*
	
	Filename: 	UnionClient_gangs_Create.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _gangName = ctrlText (CONTROL(2520,2522));
private _length = count (toArray(_gangName));
private _chrByte = toArray (_gangName);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
private _badChar = false;
{
	if !(_x in _allowed) exitWith {_badChar = true;};
} foreach _chrByte;
if (_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
private _gangPrice = LIFE_SETTINGS(getNumber,"life_gangPrice");
if (BANK < _gangPrice) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney",[_gangPrice - BANK] call UnionClient_system_numberText]};

[[player,steamid,_gangName,playerSide,GVAR_RNAME(player)],"insertGang","TON",false] call UnionClient_system_hcExec;

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;