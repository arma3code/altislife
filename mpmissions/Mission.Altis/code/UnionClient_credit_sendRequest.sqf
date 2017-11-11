/*
	
	Filename: 	UnionClient_credit_sendRequest.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(ISPSIDE(civilian)) exitWith {hint "Только граждане Алтиса могут работать с кредитами"};
private _mode = param [0,0,[0]];

switch (_mode) do {
	case 1: {		
		if !(EQUAL(life_haveCredit,[])) exitWith {hint "У вас есть непогашенный кредит."};		
		if (EQUAL(life_houses,[])) exitWith {hint "У вас в собственности нет домов, чтобы получить кредит"};
		
		life_creditInUse = true;		
		[player,steamid,playerSide,life_houses_count,(life_houses_count * LIFE_SETTINGS(getNumber,"life_houseCreditPrice"))] remoteExec ["TON_fnc_reqCredit",RSERV];
		hint "Вы отправили запрос на получение кредита...";
		closeDialog 0;
	};	
	case 0: {
		if (EQUAL(life_haveCredit,[])) exitWith {hint "У вас нет активных кредитов"};		
		if (BANK < (life_haveCredit select 3)) exitWith {hint "У вас недостаточно средств на банковском счете для погашения кредита"};
		
		life_creditInUse = true;		
		[player,steamid,playerSide,life_haveCredit select 0] remoteExec ["TON_fnc_repayCredit",RSERV];
		hint "Вы отправили запрос на погашение кредита...";
		closeDialog 0;	
	};
};