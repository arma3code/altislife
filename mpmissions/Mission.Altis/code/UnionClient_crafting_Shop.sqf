/*

	Filename: 	UnionClient_crafting_Shop.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 1401)) then {
	if !(createDialog "UnionDialogCraftShop") exitWith {};
};
 
private _filter = CONTROL(1401,668);

{
	_filter lbAdd localize (getText(_x >> "displayName"));
	_filter lbSetData[(lbSize _filter)-1,configName _x];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgRecipesCategories"));

_filter lbSetCurSel 0;