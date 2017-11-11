/*
	
	Filename: 	UnionClient_system_drinkbeer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
hintSilent parseText format["Уровень алкоголя в крови<br/> <t size='1.4'><t color='#FF0000'>%1</t></t>",[life_drink] call UnionClient_system_numberText];
uiSleep 4;
private _radialBlur = ppEffectCreate ["radialBlur", 2010];
_radialBlur ppEffectEnable true;
private _chromAberration = ppEffectCreate ["chromAberration", 2011];  
_chromAberration ppEffectEnable true;
enableCamShake true;
player SVAR ["inDrink",true,true];

for "_i" from 0 to 59 do {
    if(life_drink > 0.12) then {
		_chromAberration ppEffectAdjust [0.16,random 0.16, true];
		_chromAberration ppEffectCommit 1;   
		_radialBlur ppEffectAdjust  [random 0.05,random 0.05,0.3,0.3];
		_radialBlur ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		uiSleep 1;
	} else {
		_chromAberration ppEffectAdjust [random 0.05,random 0.05,true];
		_chromAberration ppEffectCommit 1;   
		_radialBlur ppEffectAdjust  [random 0.03,random 0.03,0.4,0.4];
		_radialBlur ppEffectCommit 1;
		addcamShake[random 3, 1, random 3];
		uiSleep 1;
	};
};

if (life_drink > 0.22) then {
	titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
	player playMoveNow "Incapacitated";
	//titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
	uiSleep 15;
	removeUniform player;
	removeVest player;
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
titleText["Пиво усвоилось и теперь можно повторить!","PLAIN"];
_chromAberration ppEffectAdjust [0,0,true];
_chromAberration ppEffectCommit 5;
_radialBlur ppEffectAdjust  [0,0,0,0];
_radialBlur ppEffectCommit 5;
uiSleep 6;
ppEffectDestroy [_radialBlur,_chromAberration];
resetCamShake;