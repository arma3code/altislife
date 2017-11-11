/*

	Filename: 	UnionClient_effects_Marj.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _duration = param[0,10,[0]];
private _shell = "SmokeShellGreen" createVehicleLocal position player;
_shell attachTo [(vehicle player),[0,0,0]];
private _effect1 = ppEffectCreate ["colorCorrections",1501];
_effect1 ppEffectEnable true;
private _effect2 = ppEffectCreate ["chromAberration",200];
_effect2 ppEffectEnable true;
private _ps1 = "#particlesource" createVehicleLocal getPos player;
_ps1 setParticleCircle [0,[0,0,0]];
_ps1 setParticleRandom [0,[2,2,2],[0.2,0.2,3],1, 3,[0,0,0,0],0.01,0.03];
_ps1 setParticleParams ["\a3\animals_f\butterfly","","SpaceObject",1,5,[0,0,-0.5],[0,0,0],0,1.275,1,0,[1,1],[[0,1,0 ,1],[0,1,0 ,1],[0,1,0 ,1]],[0,0],0,0,"","",player];
_ps1 setDropInterval 0.35;

playMusic ["defcon", 0];
enableEnvironment false;
player enableFatigue true;
private _timeout = time + _duration;

waitUntil {
	_effect1 ppEffectAdjust [1,1,0,[0,0,0,0.5],[0.9 + (random 10)/100, 0.60 + (random 20)/100, 0.15 + (random 10)/100, random 1], [0.5 +(random 40)/100, 0.75 + (random 10)/100, 0.01 + (random	 10)/100, random 1]];
	_effect1 ppEffectCommit 1;
	
	_effect2 ppEffectAdjust [0.01,0.01,true];
	_effect2 ppEffectCommit 1;
	player setFatigue 1;
	
	(random 3) fadeMusic (random 1);
	uiSleep 3;
	(time > _timeout)
};

player setFatigue 0;
player enableFatigue false;
enableEnvironment true;
playMusic "";
deleteVehicle _shell;
ppEffectDestroy _effect1;
ppEffectDestroy _effect2;
deleteVehicle _ps1;