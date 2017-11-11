/*

    Filename:   UnionClient_martiallaw_listWarPoints.sqf
    Project:    Union Altis Life RPG
    Author:     Merrick & Affect
    Steam:      76561198006439083 & 76561198053094990
    Web:        http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
createDialog "UnionDialogManageWarPoint";
waitUntil {!isNull (findDisplay 4500)};

private _list = CONTROL(4500,4502);
private _BtnRemove = CONTROL(4500,4503);
lbClear _list;

if (EQUAL(server_warzones,[])) exitWith {
	_list lbAdd "Пусто";
	_BtnRemove ctrlEnable false;
};

{
	if !(EQUAL((_x select 4),"BattleGround")) then {
		_list lbAdd format["Зона: %1 [X: %2 - Y: %3] от %4",_x select 1,_x select 2,_x select 3,_x select 4];
		_list lbSetValue [(lbSize _list)-1,_x select 0];
		_list lbSetData [(lbSize _list)-1,_x select 1];
	};
} forEach server_warzones;