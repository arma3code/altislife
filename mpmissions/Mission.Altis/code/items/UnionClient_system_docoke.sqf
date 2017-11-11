/*
	@
	Filename: fn_DoCoke.sqf
	@Author: Kuchiha (Modified by Hoe.GMG.Crew)
	@Edited: 24.03.2014
*/
private["_force"];
player setFatigue 0;
for "_i" from 0 to 500 do
{
	_force = random 15;	
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [_force / 50, _force / 50, false];
	"chromAberration" ppEffectCommit (0.3 + random 0.1);
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [1]; // intensity of blur
	"dynamicBlur" ppEffectCommit 15; // time till vision is fully blurred
	waituntil {uiSleep 0.03; ppEffectCommitted "chromAberration"};
	uiSleep 0.02;
};
player setFatigue 0;
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
"chromAberration" ppEffectEnable false;