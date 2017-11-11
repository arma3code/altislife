/*

	Filename: 	UnionClient_martiallaw_addWarPointToServer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _pointName = ctrlText (CONTROL(4400,4403));
private _pointX = ctrlText (CONTROL(4400,4404));
private _pointY = ctrlText (CONTROL(4400,4405));

if (EQUAL(_pointName,"")) exitWith {hint "Укажите название точки военного положения"};
if (EQUAL(_pointX,"")) exitWith {hint "Не указана Х-координата"};
if (EQUAL(_pointY,"")) exitWith {hint "Не указана Y-координата"};

if !([_pointX] call UnionClient_system_isnumber) exitWith {hint localize "STR_Cop_TicketNum"};
if !([_pointY] call UnionClient_system_isnumber) exitWith {hint localize "STR_Cop_TicketNum"};

_pointX = parseNumber _pointX;
_pointY = parseNumber _pointY;

[player,_pointName,_pointX,_pointY,GVAR_RNAME(player)] remoteExecCall ["TON_fnc_addWarPoint",RSERV];
hint "Отправка запроса на сервер...";
closeDialog 0;