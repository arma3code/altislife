/*
	
	Filename: 	UnionClient_system_vehTransferGet.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 5102),-1)) exitWith {hint localize "STR_Global_NoSelection"};
private _vid = CONTROL_VALUE(5102);
private _retrievePrice = (call compile format["%1",CONTROL_DATA(5102)]) select 5;
if (BANK < _retrievePrice) exitWith {hint "Недостаточно денег на банковском счете"};

closeDialog 0;

["atm","take",_retrievePrice] call UnionClient_system_myCash;
hint "Отправка запроса на перевозку техники...";
[_vid,steamid,player] remoteExecCall ["TON_fnc_changeVehicleServerMap",RSERV];