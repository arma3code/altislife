/*
	Description:
	tear gas
*/
private["_pos","_gasEffectBlur","_shell"];
_shell = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
_pos = [_this,1,[],[[]]] call BIS_fnc_param;

if(count _pos == 0) exitWith {};
if(isNull _shell) exitWith {};
if(playerSide == west) exitWith {};
if(player distance _pos > 500) exitWith {};

while {!isNull _shell} do
{
	if(player distance _pos < 10 && {!life_teargas} && {goggles player != "Mask_M40_OD"}) then
	{
		life_teargas = true;
		
		_gasEffectBlur = ppEffectCreate ["dynamicBlur", 2007];	
		_gasEffectBlur ppEffectEnable true;
		enableCamShake true;
		
		player say3D "cough";
		
		_gasEffectBlur ppEffectAdjust [0.5];
		_gasEffectBlur ppEffectCommit 5;

		player setFatigue 1;
		addCamShake [10, 30, 10];

		waitUntil {uiSleep 1; player distance _pos > 10 OR goggles player == "Mask_M40_OD" OR isNull _shell};	
		
		player say3D "cough";
		
		_gasEffectBlur ppEffectAdjust [0];
		_gasEffectBlur ppEffectCommit 5;
		uiSleep 5;
		
		resetCamShake;
		ppEffectDestroy [_gasEffectBlur];
		
		life_teargas = false;		
	};
	
	uiSleep 1;
};