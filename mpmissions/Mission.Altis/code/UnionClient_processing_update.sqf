/*

	Filename: 	UnionClient_processing_update.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (isNull (findDisplay 5000)) exitWith {};
if (life_is_processing) exitWith{};
disableSerialization;
private _editBox = parseNumber(ctrlText 5004);

if !([str(_editBox)] call UnionClient_system_isnumeric) exitWith {hint "Это не число"};
if (_editBox > 999999) exitWith {hint "Слишком много"};
if (_editBox <= 0) exitWith {hint "Укажите положительное значение"};

private _matsText = "";
private _cantProcess = false;
{			
	private _color = "#188a1d";
	if (ITEM_VALUE(_x select 0) < ((_x select 1) * _editBox)) then {
		 _color = "#a21e1e"; _cantProcess = true;
	};
	_matsText = _matsText + format["   %1  x  <t color='%2'>%3</t><br/>",(_x select 1) * _editBox,_color,ITEM_NAME(_x select 0)];

} forEach (life_process_info select 0);

private _recipeInfo = CONTROL(5000,5002);
private _recipeInfoText = format["<t color='%2'><t size='1.2'>Необходимые компоненты</t><br/><br/>%1</t>",_matsText,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
_recipeInfo ctrlSetStructuredText parseText _recipeInfoText;

private _processButton = CONTROL(5000,5005);
if (_cantProcess) then {_processButton ctrlEnable false} else {_processButton ctrlEnable true};

private _invItems = CONTROL(5000,5003);
lbClear _invItems;
[_invItems] call UnionClient_gui_ListVirtualItems;

private _invTitle = CONTROL(5000,5008);
_invTitle ctrlSetText format[localize "STR_PM_CurWeight", life_carryWeight, life_maxWeight];