/*

	Filename: 	UnionClient_system_food.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];

if (life_action_inUse OR (call UnionClient_system_isInterrupted)) exitWith {};
call UnionClient_actions_inUse;

private _newItem = "";
private _sound = "";
private _thirstAmount = 0;
private _hungerAmount = 0;
private _action = "";
private _type = "";

switch (true) do {
	//чистая вода из фляжки или бутылки
	case (_oldItem in ["extItem_canteen_clean_3","extItem_canteen_clean_2","extItem_canteen_clean_1","extItem_bottleclean_100","extItem_bottleclean_50"]): {
		_newItem = switch (_oldItem) do {
			case "extItem_canteen_clean_3": {"extItem_canteen_clean_2"};
			case "extItem_canteen_clean_2": {"extItem_canteen_clean_1"};
			case "extItem_canteen_clean_1": {"extItem_canteen_empty"};
			case "extItem_bottleclean_100": {"extItem_bottleclean_50"};
			case "extItem_bottleclean_50": {"extItem_bottle_empty"};
		};
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 70;
		_type = "drink";
	};

	case (EQUAL(_oldItem,"extItem_Juice")): {
		_newItem = "extItem_bottle_empty";
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 70;
		_type = "drink";
	};

	//спирит и фанта (убраны из магазина)
	case (_oldItem in ["extItem_Spirit","extItem_franta"]): {
		_sound = "action_drink_soda";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 50;
		_type = "drink";
	};

	//грязная вода из бутылки или фляги
	case (_oldItem in ["extItem_canteen_dirty","extItem_bottle_dirty"]): {
		_newItem = switch (_oldItem) do {
			case "extItem_canteen_dirty": {"extItem_canteen_empty"};
			case "extItem_bottle_dirty": {"extItem_bottle_empty"};
		};
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 20;
		_type = "drink";
	};

	//морская вода из фляги или бутылки
	case (_oldItem in ["extItem_canteen_salt","extItem_bottle_salt"]): {
		_newItem = switch (_oldItem) do {
			case "extItem_canteen_salt": {"extItem_canteen_empty"};
			case "extItem_bottle_salt": {"extItem_bottle_empty"};
		};
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 10;
		_type = "drink";
	};

	//алкоголь
	case (_oldItem in ["extItem_CarltonDraught","extItem_Coopers","extItem_Corona","extItem_Jimbeam"]): {
		_newItem = "";
		_sound = "action_drink_bottle";
		_action = "FT_Act_Drink_Water";
		_thirstAmount = 15;
		_type = "drink";
	};


	//бекон (убран из магазина)
	case (_oldItem in ["extItem_TacticalBacon_100","extItem_TacticalBacon_75","extItem_TacticalBacon_50","extItem_TacticalBacon_25"]): {
		_newItem = switch (_oldItem) do {
			case "extItem_TacticalBacon_100": {"extItem_TacticalBacon_75"};
			case "extItem_TacticalBacon_75": {"extItem_TacticalBacon_50"};
			case "extItem_TacticalBacon_50": {"extItem_TacticalBacon_25"};
			case "extItem_TacticalBacon_25": {""};
		};

		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {12} else {25};
	};

	//бобы (убраны из магазина)
	case (_oldItem in ["extItem_BakedBeans_100","extItem_BakedBeans_75","extItem_BakedBeans_50","extItem_BakedBeans_25"]): {
		_newItem = switch (_oldItem) do {
			case "extItem_BakedBeans_100": {"extItem_BakedBeans_75"};
			case "extItem_BakedBeans_75": {"extItem_BakedBeans_50"};
			case "extItem_BakedBeans_50": {"extItem_BakedBeans_25"};
			case "extItem_BakedBeans_25": {""};
		};

		_sound = "action_eat_1";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {10} else {25};
	};

	case (_oldItem in ["extItem_cereal","extItem_cereal_50"]): {
		_newItem = switch (_oldItem) do {
			case "extItem_cereal": {"extItem_cereal_50"};
			case "extItem_cereal_50": {""};
		};

		_sound = "action_eating_cereal";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {20} else {40};
	};

	case (_oldItem in ["extItem_Steak","extItem_SmithsChips"]): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {25} else {50};
	};

	//основная еда (жаренное мясо и рыба)
	case (_oldItem in ["extItem_MeatC","extItem_FishC"]): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {30} else {60};
	};

	//фрукт
	case (_oldItem in ["extItem_Apple","extItem_Peach","extItem_Banana","extItem_PineApple","extItem_Coconut"]): {
		_sound = "action_eat_3";
		_action = "FT_Act_Eat_Bread";
		_type = "eat";

		_hungerAmount = if (life_diarrhea) then {10} else {20};
		_thirstAmount = 10;
	};
};

if (_newItem != "" && {!(player canAdd _newItem)}) exitWith {life_action_inUse = false; hint "Инвентарь переполнен"};

if (NOTINVEH(player)) then {player playAction _action};

switch (_type) do {
	case "eat" : {titleText["Кушаем...","PLAIN"]};
	case "drink" : {titleText["Пьем...","PLAIN"]};
	default {};
};

player say3D _sound;
uiSleep 5;
player say3D _sound;
uiSleep 5;

if (call UnionClient_system_isInterrupted) exitWith {life_action_inUse = false};

if !([_oldItem] call UnionClient_system_removeItem) exitWith {life_action_inUse = false;hint "Не удалось удалить предмет"};
if !(EQUAL(_newItem,"")) then {[_newItem] call UnionClient_system_addItem};

private _life_thirst = life_thirst + _thirstAmount;
if(_life_thirst > 100) then {_life_thirst = 100};
life_thirst = _life_thirst;

private  _life_hunger = life_hunger + _hungerAmount;
if(_life_hunger > 100) then {_life_hunger = 100};
life_hunger = _life_hunger;

if (_hungerAmount > 0) then {[format["- %1%2 голода",_hungerAmount,"%"]] spawn UnionClient_gui_Notification};
if (_thirstAmount > 0) then {[format["- %1%2 жажды",_thirstAmount,"%"]] spawn UnionClient_gui_Notification};

switch (_type) do {
	case "eat" : {
		if (life_diarrhea) then {
			titleText["Вы частисно утолили голод, но эффект ослаблен из-за диареи","PLAIN"];
		} else {
			titleText["Вы утолили голод","PLAIN"];
		};
	};
	case "drink" : {titleText["Вы утолили жажду","PLAIN"];};
	default {};
};

if (_oldItem in ["extItem_canteen_dirty","extItem_bottle_dirty","extItem_Meat"]) then {
	if (random(100) < 30) then {
		life_sickness = true;
	} else {
		life_diarrhea = true;
	};
};

if (_oldItem in ["extItem_canteen_salt","extItem_bottle_salt"] && (random(100) < 30)) then {
	life_sickness = true;
};

if (_oldItem in ["extItem_CarltonDraught","extItem_Coopers","extItem_Corona","extItem_Jimbeam"]) then {
	if(isNil "life_drink") then {life_drink = 0};
	life_drink = life_drink + 0.02;
	if (life_drink >= 0.04) then {
		[] spawn UnionClient_system_drinkbeer;
	};
};

life_action_inUse = false;