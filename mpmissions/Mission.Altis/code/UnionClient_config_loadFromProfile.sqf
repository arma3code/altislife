/*

	Filename: 	UnionClient_config_loadFromProfile.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"

if (GVAR_PRNS ["PRNS_ServerSession",""] isEqualTo server_timeText) then {
	life_arc_currentZones = GVAR_PRNS ["PRNS_arc_currentZones",[]];
} else {
	SVAR_PRNS ["PRNS_ServerSession",server_timeText];
	
	life_arc_currentZones = [];
	SVAR_PRNS ["PRNS_arc_currentZones",life_arc_currentZones];
};