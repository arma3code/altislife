/*

	Filename: 	UnionClient_effects_Lsd.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _duration = param[0,10,[0]];
private _effect1 = ppEffectCreate ["WetDistortion",300];
_effect1 ppEffectEnable true;
_effect1 ppEffectAdjust [0.5,1,1,4.1,3.7,2.5,1.85,0.0051,0.0051,0.0051,0.0051,0.5,0.3,10,6.0];
_effect1 ppEffectCommit 5;

private _effect2 = ppEffectCreate ["chromAberration",200];
_effect2 ppEffectEnable true;
_effect2 ppEffectAdjust [0.2,0.2,true];
_effect2 ppEffectCommit 1;

private _ps1 = "#particlesource" createVehicleLocal getPos player;
_ps1 setParticleCircle [0,[0,0,0]];

_ps1 setParticleRandom [0,[2,2,2],[0.2,0.2,3],1, 3,[0,0,0,0],0.01,0.03];
_ps1 setParticleParams ["\a3\animals_f\butterfly","","SpaceObject",1,5,[0,0,-0.5],[0,0,0],0,1.275,1,0,[1,1],[[0,1,0 ,1],[0,1,0 ,1],[0,1,0 ,1]],[0,0],0,0,"","",player];

_ps1 setDropInterval 0.35;
  
playMusic ["LeadTrack03_F_Bootcamp", 0];

_duration = _duration/2;
private _timeout = time + _duration;

private["_position","_weite","_x","_y","_z","_w1","_w2","_w3","_f1","_f2","_f3","_g1","_g2","_g3","_v1","_v2","_v3","_index"];
waitUntil {
	_position = getPos player;
	_weite = 100;	
	_x = _position select 0;
	_y = _position select 1;
	_z = _position select 2;
	_w1 = (random _weite) - (random _weite);
	_w2 = (random _weite) - (random _weite);
	_w3 = random 7;
	_f1 = random 1;
	_f2 = random 1;
	_f3 = random 1;
	_g1 = random 5;
	_g2 = random 10;
	_g3 = random 5;
	_v1 = random 0.05;
	_v2 = random 0.05;
	_v3 = 0.1 - random 0.075;
	_index = [1,6,7,8,13] select floor(random 5);
	drop [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,_index,0], "","Billboard",1,_duration,[_x + _w1,_y + _w2,_z + _w3],[_v1,_v2,_v3],1,1.275,1,0,[_g1,_g2,_g3],[ [_f1,_f2,_f3,1	],[_f2,_f1,_f3,1],[_f3,_f2,_f1,1] ],[1000],3,0.2,"","",""];
	
	uiSleep 0.05;
	(time > _timeout)
};

uiSleep _duration;
playMusic "";
ppEffectDestroy _effect1;
ppEffectDestroy _effect2;
deleteVehicle _ps1;