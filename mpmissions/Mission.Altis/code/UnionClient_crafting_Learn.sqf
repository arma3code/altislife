/*
	
	Filename: 	UnionClient_crafting_Learn.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _recipe = param [0,"",[""]];
if (RECIPE_VALUE(_recipe)) exitWith {};

SVAR_MNS [RECIPE_VARNAME(_recipe),true];
[10] call UnionClient_session_updatePartial;

[format["Поздравляем! Вы научились создавать %1", localize (M_CONFIG(getText,"LifeCfgRecipes",_recipe,"displayName"))],"info"] call UnionClient_system_hint;