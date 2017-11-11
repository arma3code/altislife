/*
	
	Filename: 	UnionClient_system_drinkmoonshine.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
closeDialog 0;
hintSilent parseText format["Уровень алкоголя в крови<br/> <t size='1.4'><t color='#FF0000'>%1</t></t>",[life_drink] call UnionClient_system_numberText];
uiSleep 4;
"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
//"wetDistortion" ppEffectEnable true;
enableCamShake true;

player SVAR ["inDrink",true,true];

for "_i" from 0 to 89 do
{
    if(life_drink > 0.15) then {
		
		//"wetDistortion" ppEffectAdjust [random 5];
		"chromAberration" ppEffectAdjust [random 0.07,random 0.07,true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust[0.04, 0.09, 0.25, 0.29];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uiSleep 1;
	} else {
		"chromAberration" ppEffectAdjust [random 0.03,random 0.03,true];
		"chromAberration" ppEffectCommit 1;   
		"radialBlur" ppEffectAdjust  [random 0.03,random 0.03,0.43,0.43];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uiSleep 1;
	};
};
if (life_drink > 0.22) then {
	titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
	player playMoveNow "Incapacitated";
	//titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
	uiSleep 15;
	removeUniform player;removeVest player;
	player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
	uiSleep 10;
	life_drink = 0;
	titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
	player playMoveNow "amovppnemstpsraswrfldnon";			
	[0,format[localize "STR_MISC_StPubIntox",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];			

	[[steamid,GVAR_RNAME(player),"390"],"wantedAdd"] call UnionClient_system_hcExec;
};
//Stop effects
[player,"inDrink"] call UnionClient_system_clearGlobalVar;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;

//Deactivate ppEffects
//"chromAberration" ppEffectEnable false;
//"radialBlur" ppEffectEnable false;
//"wetDistortion" ppEffectEnable false;
resetCamShake;
if(life_drink != 0) then {life_drink = life_drink - 0.02;};