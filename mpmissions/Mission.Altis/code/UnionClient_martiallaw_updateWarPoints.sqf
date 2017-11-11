/*

	Filename: 	UnionClient_martiallaw_updateWarPoints.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_mode","",[""]],
	["_pointName","",[""]],
	["_unitName","",[""]]
];

switch (_mode) do {
	case "add": {
		if (_unitName == "BattleGround") then
		{[format["Обнаружены останки боевой техники в районе %1",_pointName],"police"] spawn UnionClient_system_hint;}
		else
		{[format["%1 объявил военное положение %2",_unitName,_pointName],"police"] spawn UnionClient_system_hint;};
	};
	case "remove": {
		if (_unitName == "BattleGround") then
		{[format["Место крушения боевой техники в районе %1 зачищено. Военное положение снято!",_pointName],"police"] spawn UnionClient_system_hint;}
		else
		{[format["%1 снял военное положение %2!",_unitName,_pointName],"police"] spawn UnionClient_system_hint;};
	};
};