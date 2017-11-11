/*

	Filename: 	UnionClient_atm_legalization.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _value = DCASH;

["dcash","drop",DCASH,"moneyLegal"] call UnionClient_system_myCash;
["cash","add",_value,"moneyLegal"] call UnionClient_system_myCash;
hint format["У вас были нелегальные деньги в размере $%1.\n\nОни были конвертированы в легальную наличность и теперь вы можете положить их на свой банковский счет.",[_value] call UnionClient_system_numberText];