/*

	Filename: 	UnionClient_loadout_medic.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
[] call UnionClient_system_stripDownPlayer;

player forceAddUniform "U_Extremo_Medic";
player addBackpack "B_Extremo_Medic_BackPack";
player addHeadgear "H_Cap_marshal";
player addVest "V_Rangemaster_belt";

player addItem "Medikit";
player addItem "extItem_ItemRepairKit";
player addItem "extItem_defibrillator";

player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "tf_fadak";
player assignItem "tf_fadak";

[] call UnionClient_system_saveGear;