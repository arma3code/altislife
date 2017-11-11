/*

	Filename: 	UnionClient_system_removeDrugs.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private["_medic"];
_medic = param [0,ObjNull,[ObjNull]];

life_drug_light = false;
life_drug_hard = false;

hint format["Медик %1 снял с вас все наркотические зависимости!",GVAR_RNAME(_medic)];