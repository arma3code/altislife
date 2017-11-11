/*
	
	Filename: 	UnionClient_parking_PayDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [	
	["_plate","",[""]],
	["_price",-1,[0]]
];

["atm","take",_price] call UnionClient_system_myCash;
hint format["Оплачен штраф в размере $%1 за технику с номером %2. Вы можете забрать технику со штрафстоянки",[_price] call UnionClient_system_numberText,_plate];