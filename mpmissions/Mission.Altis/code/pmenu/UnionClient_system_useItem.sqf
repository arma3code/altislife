/*
	
	Filename: 	UnionClient_system_useItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_item"];
disableSerialization;
if((lbCurSel 7212) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(7212);

switch (true) do
{	
	case (_item == "methp"): {
		if (life_turbo_used) exitWith {hint "Вы уже использовали препарат для увеличения скорости добычи"};
		if ([false,_item,1] call UnionClient_system_handleInv) then {
			if (random(100) < 10) then {
				life_drug_hard = true;
				hint "У вас появилась зависимость от тяжелых наркотиков";
			};
			titleText["Вы использовали Мет и скорость добычи ресурсов увеличена в два раза! Эффект продлится 15 минут!","PLAIN"];
			["life_turbo_used","buff",900] spawn UnionClient_system_addBuff;
		};
	};
	
	case (_item =="bottledwhiskey"):
	{
		if (playerSide in [west,east]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if (player GVAR ["inDrink",FALSE]) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if ([false,_item,1] call UnionClient_system_handleInv) then {
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn UnionClient_system_drinkwhiskey;
		};
	};
	
	case (_item =="bottledshine"):
	{
		if (playerSide in [west,east]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if (player GVAR ["inDrink",FALSE]) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if ([false,_item,1] call UnionClient_system_handleInv) then {
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn UnionClient_system_drinkmoonshine;
		};
	};
	
	case (_item =="bottledbeer"):
	{
		
		if (playerSide in [west,east]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if (player GVAR ["inDrink",FALSE]) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if ([false,_item,1] call UnionClient_system_handleInv) then {
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn UnionClient_system_drinkbeer;
		};
	};	
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call UnionClient_system_handleInv)) then
		{
			if (random(100) < 10) then {
					life_drug_light = true;
					hint "У вас появилась зависимость от легких наркотиков";
			};
			[] spawn UnionClient_system_smokeweed;
		};
	};
	
	case (_item == "cocainep"):
	{
		if(([false,_item,1] call UnionClient_system_handleInv)) then
		{			
			life_thirst = 20;					
			titleText["Беги Форест! Беги!","PLAIN"];
			if (random(100) < 10) then {
					life_drug_hard = true;
					hint "У вас появилась зависимость от тяжелых наркотиков";
			};
			[] spawn UnionClient_system_docoke;			
		};
	};
		
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] spawn UnionClient_pad_openStatus;