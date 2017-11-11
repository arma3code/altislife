/*

	Filename: 	UnionClient_system_containerActions.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _box = param [0,objNull,[objNull]];
if (isNull _box) exitWith {};

_box addAction ["<img image='\union_pack\icons\ui\s_icon_box.paa' /> Хранилище снаряжения",UnionClient_system_containerMenu,"",0,false,false,"",'isNull objectParent _this', 4];
_box addAction ["<img image='\union_pack\icons\ui\s_icon_box.paa' /> Хранилище ресурсов",UnionClient_system_openInventory,"",0,false,false,"",'isNull objectParent _this', 4];