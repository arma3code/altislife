/*

	Filename: 	UnionClient_effects_FoodWater.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _fnc_food = {	
	if (life_hunger < 5) then {
		[player,player] call UnionClient_dmg_Agony; hint localize "STR_NOTF_EatMSG_Death";
	} else {			
		SUB(life_hunger,1);		
		switch (true) do {
			case (life_hunger < 30 && life_hunger > 20): {systemChat localize "STR_NOTF_EatMSG_1"};
			case (life_hunger < 20 && life_hunger > 10): {systemChat localize "STR_NOTF_EatMSG_2";player setFatigue 1;};
			case (life_hunger < 10 && life_hunger > 5): {systemChat localize "STR_NOTF_EatMSG_3"};
		};
		if (life_hunger < 20) then {player say3D "hunger"};
	};
};

private _fnc_water = {	
	if (life_thirst < 5) then {
		[player,player] call UnionClient_dmg_Agony; hint localize "STR_NOTF_DrinkMSG_Death";
	} else {			
		SUB(life_thirst,1);		
		switch (true) do {
			case (life_thirst < 30 && life_thirst > 20): {systemChat localize "STR_NOTF_DrinkMSG_1"};
			case (life_thirst < 20 && life_thirst > 10): {systemChat localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1};
			case (life_thirst < 10 && life_thirst > 5): {systemChat localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1};
		};
		if (life_thirst < 20) then {player say3D "thirst"};
	};
};

while {true} do {
	uiSleep 60;
	[] call _fnc_water;
	uiSleep 60;
	[] call _fnc_food;
};