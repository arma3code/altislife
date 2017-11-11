/*
	
	Filename: 	UnionClient_crafting_Update.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 669),-1)) exitWith {};
if (life_is_processing) exitWith{};

private _recipe = CONTROL_DATA(669);
if (!isClass (missionConfigFile >> "LifeCfgRecipes" >> _recipe)) exitWith {hint "Нет инормации о рецепте"};

private _editBox = parseNumber(ctrlText 678);
if !([str(_editBox)] call UnionClient_system_isnumeric) exitWith {hint "Это не число"};
if (_editBox > 999999) exitWith {hint "Слишком много"};
if (_editBox <= 0) exitWith {hint "Укажите положительное значение"};

private _recipeMaterialsY = M_CONFIG(getArray,"LifeCfgRecipes",_recipe,"virtualMats");
private _recipeMaterialsI = M_CONFIG(getArray,"LifeCfgRecipes",_recipe,"inventoryMats");

private _canProcess = true;
private _matsText = "";

private _itemFinal = M_CONFIG(getText,"LifeCfgRecipes",_recipe,"finalItem");

if (isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemFinal)) then {	
	(CONTROL(666,675)) ctrlSetStructuredText parseText "<t size='0.8'>Нет дополнительной информации</t>";
} else {
	private _tmp = [_itemFinal] call UnionClient_system_itemDetails;	
	(CONTROL(666,675)) ctrlSetStructuredText parseText format ["<t align='center'><img size='3' shadow='0' image='%1'/></t><br/><t size='0.8'>%2</t>",_tmp select 2,_tmp select 3];
};

private "_color";
{
	if (ITEM_VALUE(_x select 0) < ((_x select 1) * _editBox)) then { 
		 _color = "#ff0000"; _canProcess = false;
	} else {
		_color = "#5ede00";
	};
	_matsText = _matsText + format["<t color='%1' size='0.8'>%2  x  %3</t><br/>",_color,(_x select 1) * _editBox,ITEM_NAME(_x select 0)];
} forEach _recipeMaterialsY;
{
	if (([_x select 0] call UnionClient_system_itemCount) < ((_x select 1)*_editBox)) then {
		 _color = "#ff0000"; _canProcess = false;
	} else {
		_color = "#5ede00";
	};

	_matsText = _matsText + format["<t color='%1' size='0.8'>%2  x  %3</t><br/>",_color,(_x select 1) * _editBox,([_x select 0] call UnionClient_system_itemDetails) select 1];

} forEach _recipeMaterialsI;

private _recipeInfoText = format["%1",_matsText];
(CONTROL(666,672)) ctrlSetStructuredText parseText _recipeInfoText;

if (_canProcess) then {(CONTROL(666,674)) ctrlEnable true} else {(CONTROL(666,674)) ctrlEnable false};