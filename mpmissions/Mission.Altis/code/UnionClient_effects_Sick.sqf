/*

	Filename: 	UnionClient_effects_Sick.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
while {life_sickness} do {
	uiSleep (5*60);
	if (life_sickness) then {
		_sound = ["sick_cough_0", "sick_cough_1", "sick_cough_2"] call BIS_fnc_selectRandom;
		player say3D _sound;
		player setFatigue 1;
		addcamShake[2, 5, 5];
		systemChat "Вы болеете и чувствуете слабость во всем теле...";
	};
};