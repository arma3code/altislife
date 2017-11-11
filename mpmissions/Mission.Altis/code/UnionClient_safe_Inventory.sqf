/*

	Filename: 	UnionClient_safe_Inventory.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _safe = param [0,ObjNull,[ObjNull]];
if (isNull _safe) exitWith {closeDialog 0;};

private _safeInfo = _safe GVAR ["safe",-1];
if (_safeInfo < 1) exitWith {closeDialog 0; hint localize "STR_Civ_VaultEmpty";};

disableSerialization;
private _tInv = CONTROL(3500,3502);
lbClear _tInv;

private _goldbar = "goldbar";
private _icon = ITEM_ICON(_goldbar);

_tInv lbAdd format["%1 x %2",_safeInfo,ITEM_NAME(_goldbar)];
_tInv lbSetData [(lbSize _tInv)-1,_goldbar];
_tInv lbSetPicture [(lbSize _tInv)-1,_icon];