/*
	
	Filename: 	UnionClient_admin_UnitLootInfo.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_playerLloot","_loot","_itemInfo"];
disableSerialization;
_loot = [_this,0,[],[[]]] call BIS_fnc_param;
if (count _loot == 0) exitWith {hint "Лут юнита пустой"};

_playerLloot = CONTROL(2900,2905);

lbClear _playerLloot;

{
	_itemInfo = [_x select 0] call UnionClient_system_itemDetails;
	_playerLloot lbAdd format["%1", _itemInfo select 1];
	_playerLloot lbSetData[(lbSize _playerLloot)-1,_itemInfo select 0];
	_playerLloot lbSetPicture[(lbSize _playerLloot)-1,_itemInfo select 2];

	_playerLloot lbSetTextRight [(lbSize _playerLloot)-1, format["[%1]", _x select 1]];
} foreach _loot;