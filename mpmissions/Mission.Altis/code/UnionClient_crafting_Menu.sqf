/*

	Filename: 	UnionClient_crafting_Menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 666)) then {
	if !(createDialog "UnionDialogCraft") exitWith {};
};

if (life_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};

ctrlSetText [676, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

private _filter = CONTROL(666,673);

{
	_filter lbAdd localize (getText(_x >> "displayName"));
	_filter lbSetData[(lbSize _filter)-1,configName _x];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgRecipesCategories"));

_filter lbSetCurSel 0;