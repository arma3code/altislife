/*
	
	Filename: 	UnionClient_system_medicMenuRequest.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
closeDialog 0;
hint "Отправка запроса на сервер...";
[player] remoteExecCall ["TON_fnc_wantedFetchMedic",RSERV];