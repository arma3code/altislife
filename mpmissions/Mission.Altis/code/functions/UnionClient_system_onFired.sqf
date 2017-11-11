/*
	
	Filename: 	UnionClient_system_onFired.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_unit","_weapon","_muzzle","_mode","_ammoType","_magazine","_projectile","_gunner"];

switch (true) do {
	case (EQUAL(_ammoType,"Extremo_Ammo_Swing")): {
		deleteVehicle _projectile;
		if !(EQUAL((stance _unit),"STAND")) exitWith {hint "Встаньте..."};
		switch (true) do {
			case (_weapon in ["Extremo_Tool_PickAxe","Extremo_Tool_Hoe"]): {player playActionNow "FT_Act_Dig_PickAxe_Loop_Full_3x"; [] spawn UnionClient_gather_Action;};
			case (EQUAL(_weapon,"Extremo_Tool_Shovel")): {player playActionNow "FT_Act_Dig_Shovel_Loop_Full_3x"; [] spawn UnionClient_gather_Action;};			
			case (EQUAL(_weapon,"Extremo_Tool_Axe")): {player playActionNow "FT_Act_Axe_Swing"; [] spawn UnionClient_gather_Tree;};
			default {};
		};		
	}; 
	case (EQUAL(_ammoType,"EXT_GrenadeHand_stone")) : {
		_projectile spawn {
			private "_position";
			while {!isNull _this} do {
				_position = getPosATL _this;
				uiSleep 0.1;
			};		
			[_position] remoteExec ["UnionClient_system_flashbang",RCLIENT];
		};
	};
	case (EQUAL(_ammoType,"Caseless_blau")): {
		if !(player GVAR ["inPBfight",false]) then {
			deleteVehicle _projectile;
			hint "Вы не можете использовать это оружие вне зоны сражения и без регистрации в бою";
		};
	};
	case (EQUAL(_weapon,"arifle_mas_m1014")): {
		deleteVehicle _projectile;
		hint "Дробовики временно отключены!";
	};
	default {
		life_pvp = true;
		life_pvp_start = time;
	}; 
};