/*

	Filename: 	UnionClient_effects_Drugs.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_dynamicBlurMax","_chromAberrationMax","_time", "_sleep","_shake"];
while {life_drug_light OR life_drug_hard} do {
	switch (true) do {
		case life_drug_light: {_time = 10; _sleep = 1200 + random(600); _dynamicBlurMax = 0.2; _chromAberrationMax = 0.15; _shake=5};		
		case life_drug_hard: {_time = 30; _sleep = 600 + random(600); _dynamicBlurMax = 0.4; _chromAberrationMax = 0.25; _shake=10};
	};
	uiSleep _sleep;
	if !(life_drug_light OR life_drug_hard) exitWith {};
	if (life_speed_buff OR life_turbo_used OR !(isNull (findDisplay 7300))) exitWith {};
	LIFE_PPE_DRUGS_DB = ppEffectCreate ["dynamicBlur", 2005];
	LIFE_PPE_DRUGS_DB ppEffectEnable true;
	LIFE_PPE_DRUGS_CA = ppEffectCreate ["chromAberration", 2006];  
	LIFE_PPE_DRUGS_CA ppEffectEnable true;
	player say3D "cough";
	for "_i" from 0 to _time do {
		if (life_speed_buff OR life_turbo_used OR !(isNull (findDisplay 7300))) exitWith {};
		LIFE_PPE_DRUGS_DB ppEffectAdjust[random _dynamicBlurMax];
		LIFE_PPE_DRUGS_DB ppEffectCommit 1;
		LIFE_PPE_DRUGS_CA ppEffectAdjust[random _chromAberrationMax,random _chromAberrationMax,false];
		LIFE_PPE_DRUGS_CA ppEffectCommit 1;
		addcamShake[random _shake, 1, random _shake];
		uiSleep 1;
	};
	player say3D "cough";
	LIFE_PPE_DRUGS_DB ppEffectAdjust[0];
	LIFE_PPE_DRUGS_DB ppEffectCommit 5;
	LIFE_PPE_DRUGS_CA ppEffectAdjust[0,0,false];  
	LIFE_PPE_DRUGS_CA ppEffectCommit 5;
	uiSleep 5;
	ppEffectDestroy [LIFE_PPE_DRUGS_DB,LIFE_PPE_DRUGS_CA];
	enableCamShake false;
};