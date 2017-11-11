/*

	Filename: 	UnionClient_loadout_cop.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
[] call UnionClient_system_stripDownPlayer;

player forceAddUniform "ExtremoPolice_cadet";
player addVest "ExtremoPolice_vest_kadet";
player addBackpack "ExtremoPolice_cadet";
player addHeadgear "ExtremoPolice_Bl_Cap";

player addItem "NVGoggles_mas_h";
player assignItem "NVGoggles_mas_h";
player AddWeapon "Binocular";

/* ПРЕДМЕТЫ */
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "tf_anprc152";
player assignItem "tf_anprc152";
player addItem "Medikit";
player addItem "extItem_ItemRepairKit";

/* ОРУЖИЕ */
player addMagazine "DDOPP_6Rnd_X26";
player addMagazine "DDOPP_6Rnd_X26";
player addWeapon "DDOPP_X26_b";

/* ОРУЖИЕ ПО РАНГАМ*/

if (EQUAL(life_coplevel,1)) then {
	player addMagazine "30Rnd_mas_9x21_Stanag";
	player addMagazine "30Rnd_mas_9x21_Stanag";
	player addMagazine "30Rnd_mas_9x21_Stanag";
	player addMagazine "30Rnd_mas_9x21_Stanag";
	player addMagazine "30Rnd_mas_9x21_Stanag";
	player addMagazine "30Rnd_mas_9x21_Stanag";
	player addWeapon "arifle_mas_mp5";
};

[] call UnionClient_system_saveGear;