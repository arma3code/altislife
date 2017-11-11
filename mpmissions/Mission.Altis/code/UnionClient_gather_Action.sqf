/*

	Filename: 	UnionClient_gather_Action.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _gather = [] call UnionClient_gather_checkZone;
if (EQUAL(_gather,"")) exitWith {[] spawn UnionClient_archeology_checkDistance};

private _side = M_CONFIG(getArray,"LifeCfgGather",_gather,"sides");
private _exit = false;
if !(EQUAL(_side,[])) then {
	private _playerSide = [playerSide] call UnionClient_system_convertSide;
	if !(_playerSide in _side) then {
		_exit = true;
	};
};
if (_exit) exitWith {hint "Для вашей фракции недоступна добыча этого ресурса"};

private _weaponNeed = M_CONFIG(getText,"LifeCfgGather",_gather,"tool");
if !(EQUAL(CURWEAPON,_weaponNeed)) exitWith {hint "Для добычи этого ресурса нужен специальный инструмент"};

private _val = M_CONFIG(getNumber,"LifeCfgGather",_gather,"amount");
private _itemModel = M_CONFIG(getText,"LifeCfgGather",_gather,"model");

private _conditions = M_CONFIG(getText,"LifeCfgGather",_gather,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgGather",_gather,"conditionsMessage")];
};

private _animationSleep = switch (_weaponNeed) do {
	case ("Extremo_Tool_PickAxe") : {6.7};
	case ("Extremo_Tool_Hoe") : {6.7};
	case ("Extremo_Tool_Shovel") : {8};
	default {0};
};

life_action_gathering = true;
uiSleep _animationSleep;
life_action_gathering = false;

if ((call UnionClient_system_isInterrupted) OR !(NOTINVEH(player))) exitWith {titleText["Добыча прервана","PLAIN"]};

if (FETCH_CONST(life_donator) > 0) then {ADD(_val,1)};
[_gather,_itemModel,_val] spawn UnionClient_gather_Spawn;