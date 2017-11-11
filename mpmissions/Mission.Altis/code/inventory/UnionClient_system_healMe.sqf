/*

	Filename: 	UnionClient_system_healMe.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _item = [_this,0,"",[""]] call BIS_fnc_param;

if (EQUAL(_item,"")) exitWith {};

switch(true) do {
	case (_item == "extItem_ItemDetoxin"): {
		titleText["Применяем детоксин...","PLAIN"];		
		player say3D "action_morphine";
		if (NOTINVEH(player)) then {
			call UnionClient_animation_kneelWork;
			uiSleep 6;		
		} else {uiSleep 5};

		[_item] call UnionClient_system_removeItem;

		if (random(100) < 70) then {
			life_drug_light = false;
			life_drug_hard = false;
			titleText["Вы избавились от наркозависимостей.","PLAIN"];
		} else {titleText["Не удалось избавиться от зависимости. Попробуйте еще.","PLAIN"]};

	};

	case (_item == "extItem_bandage"): {
		titleText["Бинтуемся...","PLAIN"];		
		player say3D "action_bandage_0";
		if (NOTINVEH(player)) then {
			call UnionClient_animation_kneelWork;
			uiSleep 6;		
		} else {uiSleep 5};

		[_item] call UnionClient_system_removeItem;		 
		["life_bleeding"] call UnionClient_system_removeBuff;
		titleText["Вы перебинтовались и остановили кровотечение.","PLAIN"];
	};

	case (_item == "extItem_ItemMorphine"): {
		titleText["Делаем укол Морфина...","PLAIN"];		
		player say3D "action_morphine";
		if (NOTINVEH(player)) then {
			call UnionClient_animation_kneelWork;
			uiSleep 6;		
		} else {uiSleep 5};

		[_item] call UnionClient_system_removeItem;

		if (random(100) < 90) then {			 
			["life_critHit"] call UnionClient_system_removeBuff;
			titleText["Укол снял эффект от критического ранения.","PLAIN"];
		} else {titleText["Не удалось избавиться от критического ранения. Попробуйте еще...","PLAIN"];};
	};

	case (_item == "extItem_vitaminbottle"): {

		titleText["Принимаем витамины...","PLAIN"];		
		player say3D "action_painkiller_3";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call UnionClient_system_removeItem;

		if (random(100) < 50) then {
			life_diarrhea = false;
			titleText["Витамины поправили ваще здоровье и избавили от диареи.","PLAIN"];
		} else {titleText["Не удалось избавиться от диареи. Попробуйте еще...","PLAIN"]};

	};

	case (_item == "extItem_antibiotic"): {

		titleText["Принимаем антибиотики...","PLAIN"];
		player say3D "action_painkiller_3";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call UnionClient_system_removeItem;

		if (random(100) < 50) then {
			life_sickness = false;
			titleText["Курс антибиотиков поправил ваще здоровье и избавил от болезней.","PLAIN"];
		} else {titleText["Не удалось вылечиться от болезней. Попробуйте еще...","PLAIN"]};

	};

	case (_item == "extItem_painkillers"): {

		titleText["Принимаем болеутоляющее...","PLAIN"];
		player say3D "action_painkiller_3";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Eat_Bread";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call UnionClient_system_removeItem;

		if (random(100) < 80) then {			 
			["life_pain_shock"] call UnionClient_system_removeBuff;
			titleText["Эффект от травматического шока нейтрализован.","PLAIN"];
		} else {titleText["Не удалось избавиться от травматического шока. Попробуйте еще...","PLAIN"]};

	};
};