/*

	Filename: 	UnionClient_system_vehdatabaseSearch.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) exitWith {};
private _plate = ctrlText 5602;
if (EQUAL(_plate,"")) exitWith {hint "Введите регистрационный номер"};
(CONTROL(5600,5603)) ctrlEnable false;
hint localize "STR_NOTF_SendingData";

[_plate,player] remoteExecCall ["TON_fnc_vehSearch",RSERV];