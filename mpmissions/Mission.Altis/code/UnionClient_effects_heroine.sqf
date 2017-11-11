/*

    Filename:   UnionClient_effects_Heroine.sqf
    Project:    Union Altis Life RPG
    Author:     Merrick & Affect
    Steam:      76561198006439083 & 76561198053094990
    Web:        http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _duration = param[0,10,[0]];
private _effect1 = ppEffectCreate ["RadialBlur",37];
_effect1 ppEffectEnable true;
private _effect2 = ppEffectCreate ["chromAberration",200];
_effect2 ppEffectEnable true;

playMusic ["LeadTrack03a_F_EPB", 0];
player enableFatigue true;

private _timeout = time + _duration;
waitUntil {
	_effect2 ppEffectAdjust [random 0.1,random 0.1,true];
	_effect2 ppEffectCommit 3;
	player setFatigue 1;

	3 setFog (random 1);
	if ((random 100) < 5) then {
	waituntil {
		addCamShake [random 10,random 1,random 3];
		ppEffectCommitted _effect2
	};
	};
	(time > _timeout)
};

3 setFog 0;
playMusic "";
player setFatigue 0;
player enableFatigue false;
ppEffectDestroy _effect1;
ppEffectDestroy _effect2;