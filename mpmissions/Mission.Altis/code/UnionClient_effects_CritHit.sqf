/*

	Filename: 	UnionClient_effects_CritHit.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_sound","_critColorEffect"];
while {life_critHit} do {
	uiSleep (15*60);
	if (life_critHit && LSALIVE(player) && !(GVAR_RESTRAINED(player)) && NOTINVEH(player)) then {
		_critColorEffect = ppEffectCreate ["colorCorrections", 2008];
		_critColorEffect ppEffectEnable true;
		_critColorEffect ppEffectAdjust [1, 1.1, -0.05, [0.4, 0.2, 0.3, -0.1], [0.3, 0.05, 0, 0], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]];
		_critColorEffect ppEffectCommit 18;		
		["ActsPknlMstpSnonWnonDnon_TreatingInjured_NikitinDead"] call UnionClient_system_animDo;
		_sound = ["action_cry_0", "action_cry_1"] call BIS_fnc_selectRandom;
		player say3D _sound;
		for "_i" from 1 to 20 do {
			titleText[format["У вас травматической шок, вызванный серьезным ранением! Вы очнетесь через %1 сек.", (21 - _i)],"PLAIN"];
			uiSleep 1;
			if ((GVAR_RESTRAINED(player)) OR LSDEAD(player) OR !(NOTINVEH(player)) OR !life_critHit) exitWith {};
		};
		switch (true) do {
			case (LSDEAD(player)) : {};
			case (GVAR_RESTRAINED(player)) : {player playMove "AmovPercMstpSnonWnonDnon_Ease"};
			default {["amovpercmstpsnonwnondnon"] call UnionClient_system_animDo};
		};
		ppEffectDestroy [_critColorEffect];
		player setFatigue 1;
		titleText["","PLAIN"];
	};
};