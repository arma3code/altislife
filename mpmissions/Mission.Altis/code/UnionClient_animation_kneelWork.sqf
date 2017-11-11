/*

	Filename: 	UnionClient_animation_kneelWork.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (!(ISANIMSTATE("ainvpknlmstpsnonwnondnon_medic_1")) && NOTINVEH(player)) then {
	["ainvpknlmstpsnonwnondnon_medic_1"] call UnionClient_system_animDo;
};