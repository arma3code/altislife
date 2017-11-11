/*

	Filename: 	UnionClient_system_healHospital.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
if(CASH < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
uiSleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setDamage 0;
["cash","take",100] call UnionClient_system_myCash;