/*

	Filename: 	UnionClient_session_dataQuery.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_session_completed) exitWith {};

cutText[format[localize "STR_Session_Query",steamid],"BLACK FADED"];
0 cutFadeOut 999999999;

[[steamid,playerSide,player],"queryRequest","DB",false] call UnionClient_system_hcExec;