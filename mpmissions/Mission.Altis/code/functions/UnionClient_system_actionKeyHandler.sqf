/*

	Filename: 	UnionClient_system_actionKeyHandler.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _curTarget = param [0,objNull,[objNull]];
if (life_action_inUse) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false};
if (dialog) exitWith {};
if !(NOTINVEH(player)) exitWith {};
if (isNull _curTarget) exitWith {};
if (EQUAL(_curTarget,player)) exitWith {};

switch (true) do {
	case (["atm_",([_curTarget] call UnionClient_system_getModelName)] call UnionClient_system_xString && {_curTarget distance player < 3}) : {
		if (DCASH > 0) then {
			[] call UnionClient_atm_legalization;
		} else {
			[] spawn UnionClient_atm_openMenu;
		};
	}; 
	case (_curTarget isKindOf "House_F") : {
		[_curTarget] call UnionClient_system_initHouseMenu;
	};
	case (_curTarget isKindOf "CAManBase" && {player distance _curTarget < 5} && {isPlayer _curTarget} && {LSINCAP(_curTarget)}): {
		[_curTarget] spawn UnionClient_system_agonyInteractionMenu;
	};
	case (_curTarget isKindOf "CAManBase" && {player distance _curTarget < 5} && {isPlayer _curTarget} && {alive _curTarget}): {
		if (GVAR_RESTRAINED(_curTarget)) then {
			switch (playerSide) do {
				case west: {[_curTarget] spawn UnionClient_system_copInteractionMenu};
				case east: {[_curTarget] spawn UnionClient_system_medInteractionMenu};
				case civilian: {[_curTarget] spawn UnionClient_system_civInteractionMenu};
				case independent: {[_curTarget] spawn UnionClient_system_civInteractionMenu};
			};
		} else {		
			if (ISPSIDE(east) OR life_canBill OR license_civ_taxi) then {
				[_curTarget] spawn UnionClient_system_freeInteractionMenu;
			};
		};
	};
	case (!alive _curTarget && {_curTarget isKindOf "Animal"} && {(typeOf _curTarget) in ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Turtle_F"]}): {
		[_curTarget] spawn UnionClient_system_gutAnimal;
	};
	case ([_curTarget] call UnionClient_system_isVehicleKind && {player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2}): {
		if (EQUAL((typeOf _curTarget),"ExtremoHospitalBedFix")) then {
			//управление больничной койкой
			[_curTarget] spawn UnionClient_system_hbInteractionMenu;
		} else {
			[_curTarget] spawn UnionClient_system_vInteractionMenu;
		};
	};
	default {}; 
};