/*
	
	Filename: 	UnionClient_martiallaw_removeWarPointFromServer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 4502),-1)) exitWith {hint "Не выбрана точка для удаления"};
private _pointName = CONTROL_DATA(4502);
private _pointID = CONTROL_VALUE(4502);

[player,_pointName,_pointID,GVAR_RNAME(player)] remoteExecCall ["TON_fnc_removeWarPoint",RSERV];
hint "Отправка запроса на сервер...";
closeDialog 0;