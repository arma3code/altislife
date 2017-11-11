/*

	Filename: 	UnionClient_gui_DestroyRscLayer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _resource = param [0,"",[""]];

(_resource call BIS_fnc_rscLayer) cutText ["","PLAIN"];