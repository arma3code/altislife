/*
	
	Filename: 	UnionClient_crafting_UpdateFilter.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _index = param [1,-1,[0]];
SVAR_UINS["Crafting_Menu_Filter",_index];

private _inv = CONTROL(666,669);
lbClear _inv;

private _itemFilter = CONTROL_DATA(673);

private "_recipeIcon";
{
	if (RECIPE_VALUE(configName _x)) then {
		_itemFinal = getText(_x >> 'finalItem');
		if (isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemFinal)) then {
			_recipeIcon = ITEM_ICON(_itemFinal);
		} else {
			_recipeIcon = ([_itemFinal] call UnionClient_system_itemDetails) select 2;
		};
		_inv lbAdd format["%1",localize (getText(_x >> 'displayName'))];
		_inv lbSetData[(lbSize _inv)-1,configName _x];
		_inv lbSetPicture[(lbSize _inv)-1,_recipeIcon];
	};
} foreach (format ["getText(_x >> 'category') isEqualTo '%1'",_itemFilter] configClasses (missionConfigFile >> "LifeCfgRecipes"));

private _invItems = CONTROL(666,677);
lbClear _invItems;
[_invItems] call UnionClient_gui_ListVirtualItems;

_inv lbSetCurSel 0;