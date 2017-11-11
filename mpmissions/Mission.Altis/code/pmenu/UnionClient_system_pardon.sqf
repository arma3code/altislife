/*

	Filename: 	UnionClient_system_pardon.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _list = CONTROL(2400,2402);
private _data = call compile format["%1", CONTROL_DATA(2401)];

if (isNil "_data") exitWith {};
if (typeName _data != "ARRAY") exitWith {};
if (EQUAL(_data,[])) exitWith {};

private _uid = _data select 0;
hint "Помилование... Подождите...";

[[_uid],"wantedRemove"] call UnionClient_system_hcExec;

uiSleep 2;
hint "Готово!";
[] spawn UnionClient_system_wantedMenu;