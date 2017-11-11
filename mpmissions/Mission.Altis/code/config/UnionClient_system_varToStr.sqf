/*

	Filename: 	UnionClient_system_varToStr.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _var = param [0,"",[""]];
if (EQUAL(_var,"")) exitWith {""};

switch (_var) do {
	case "depo_kavala": {"Кавала"};
	case "depo_molos": {"Молос"};
	case "depo_mazi": {"Мази"};
	case "depo_tonos": {"Тонос"};
};