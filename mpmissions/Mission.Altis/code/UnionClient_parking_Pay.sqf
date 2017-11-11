/*
	
	Filename: 	UnionClient_parking_Pay.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 5702),-1)) exitWith {hint localize "STR_Global_NoSelection"};
private _vid = CONTROL_VALUE(5702);

private _dataArr = call compile format["%1",CONTROL_DATA(5702)];
_dataArr params ["_plate","_parking"];

if (EQUAL(_plate,"")) exitWith {hint "Номер не указан"};
if (EQUAL(_parking,[])) exitWith {hint "Информация о штрафе не указана"};

private _price = _parking select 0;
if (BANK < _price) exitWith {hint "Недостаточно денег на банковском счете"};

closeDialog 0;

hint localize "STR_NOTF_SendingData";
[_vid,_price,_plate,steamid,player] remoteExecCall ["TON_fnc_vehicleParkingPay",RSERV];