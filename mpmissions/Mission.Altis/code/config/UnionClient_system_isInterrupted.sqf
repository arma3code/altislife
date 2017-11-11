/*
	
	Filename: 	UnionClient_system_isInterrupted.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
GVAR_RESTRAINED(player) OR player GVAR ["knoked",false] OR player GVAR ["tazed",false] OR LSNOTALIVE(player) OR player GVAR ["surrender", false]