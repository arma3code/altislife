/*
	
	Filename: 	UnionClient_system_insurancePay.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_vehicle","_vid","_price","_displayName"];

disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = (call compile format["%1",CONTROL_DATA(2802)]) select 0;
_vid = CONTROL_VALUE(2802);

if (life_action_inUse) exitWith {};
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

closeDialog 0;

call UnionClient_actions_inUse;
hint "Отправка запроса в страховую...";
[_vid,steamid,player,life_garage_type,_vehicle] remoteExecCall ["TON_fnc_insurancePayRequest",RSERV];