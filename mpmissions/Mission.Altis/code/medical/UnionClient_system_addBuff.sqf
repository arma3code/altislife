/*

	Filename: 	UnionClient_system_addBuff.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_type","",[""]],	
	["_section","",[""]],
	["_time",0,[0]]
];

if (LSNOTALIVE(player)) exitWith {"AddBuff - Not Alive" call UnionClient_system_log};
if ((EQUAL(_type,"")) OR (EQUAL(_section,""))) exitWith {};
if (GVAR_MNS _type) exitWith {};

disableSerialization;
private _ui = GVAR_UINS ["ExtremoBuffs",displayNull];
if (isNull _ui) then {	
	["ExtremoBuffs","PLAIN",1,false] call UnionClient_gui_CreateRscLayer;
	_ui = GVAR_UINS ["ExtremoBuffs",displayNull];
};

private ["_buffID","_var","_ctrID"];

switch (_section) do {
	case "buff" : {
		_buffID = switch (true) do {
			case (!life_buff1): {1};
			case (!life_buff2): {2};
			case (!life_buff3): {3};
			case (!life_buff4): {4};
			case (!life_buff5): {5};
			default {0}; 
		};

		_ctrID = 24700;		
		_var = format["life_buff%1",_buffID];
	}; 
	case "debuff" : {
		_buffID = switch (true) do {
			case (!life_debuff1): {1};
			case (!life_debuff2): {2};
			case (!life_debuff3): {3};
			case (!life_debuff4): {4};
			case (!life_debuff5): {5};
			default {0}; 
		};

		_ctrID = 24600;		
		_var = format["life_debuff%1",_buffID];
	};	
};

if (EQUAL(_buffID,0)) exitWith {"addBuff - buffID empty" call UnionClient_system_log};

private _img = "";
private _imgR = "";
private _message = "";

switch (_type) do {
	case "life_speed_buff": {_img = "\union_gui\data\" + life_gui_folder + "\gui_speed.paa"; _message = "+ заряд бодрости"; _imgR = "\union_gui\data\gui_r_green.paa"};
	case "life_radx_used": {_img = "\union_gui\data\" + life_gui_folder + "\gui_radiation.paa"; _message = "+ защита от радиации"; _imgR = "\union_gui\data\gui_r_green.paa"};
	case "life_turbo_used": {_img = "\union_gui\data\" + life_gui_folder + "\gui_turbo.paa"; _message = "+ ускоренная добыча ресурсов"; _imgR = "\union_gui\data\gui_r_green.paa"};
	case "life_critHit": {_img = "\union_gui\data\" + life_gui_folder + "\gui_crit.paa"; _message = "+ критическое ранение"; _imgR = "\union_gui\data\gui_r_red.paa"};
	case "life_pain_shock": {_img = "\union_gui\data\" + life_gui_folder + "\gui_pain.paa"; _message = "+ болевой шок"; _imgR = "\union_gui\data\gui_r_red.paa"};
	case "life_bleeding": {_img = "\union_gui\data\" + life_gui_folder + "\gui_blood.paa"; _message = "+ кровотечение"; _imgR = "\union_gui\data\gui_r_red.paa"};
	default {};
};

if (EQUAL(_img,"")) exitWith {"addBuff - img empty" call UnionClient_system_log};

private _buffIconR = _ui displayCtrl (_ctrID + _buffID);
private _buffIcon = _ui displayCtrl (_ctrID + 10 + _buffID);
private _buffTimer = _ui displayCtrl (_ctrID + 20 + _buffID);

SVAR_MNS [_var,true];
SVAR_MNS [_type,true];

[_message] spawn UnionClient_gui_Notification;
_buffIconR ctrlSetText _imgR;
_buffIcon ctrlSetText _img;

[_type,_var,_buffIconR,_buffIcon,_buffTimer,_time] spawn {
	disableSerialization;
	params ["_type","_var","_buffIconR","_buffIcon","_buffTimer","_time","_buffEnd"];
	_buffEnd = time + _time;
	while {true} do {
		if ((_time > 0 && time >= _buffEnd) OR !(GVAR_MNS _type) OR LSNOTALIVE(player)) exitWith {
			_buffIconR ctrlSetText "";
			_buffIcon ctrlSetText "";
			_buffTimer ctrlSetText "";
			SVAR_MNS [_var,false];
			SVAR_MNS [_type,false];
			if (EQUAL(_type,"life_speed_buff")) then {player enableStamina true};
		};
		if (_time > 0) then {
			_buffTimer ctrlSetText format ["%1",[(_buffEnd - time),"MM:SS"] call BIS_fnc_secondsToString];			
			if (EQUAL(_type,"life_speed_buff")) then {player enableStamina false};
		};
		uiSleep 1;
	};
};

//дополнительная анимация
switch (true) do {
	case (life_bleeding) : {
		[] spawn {
			while {life_bleeding && LSALIVE(player)} do {
				if (damage player < 0.89) then {
					player setDamage (damage player + 0.05);
				} else {
					//отправляем в агонию
					[player,player] call UnionClient_dmg_Agony;
				};
				player setBleedingRemaining 10;
				addcamShake[1, 2, 10];
				titleText["Вы истекаете кровью...","PLAIN"];
				[5000] call BIS_fnc_bloodEffect;				
				uiSleep 60;
			};
		};
	};
	case (life_pain_shock) : {
		[] spawn {
			while {life_pain_shock && LSALIVE(player)} do {
				uiSleep 60;
				if (life_pain_shock && LSALIVE(player)) then {
					player setFatigue (getFatigue player + 0.1);
					addcamShake[3, 2, 10];
					systemChat "У вас болевой шок...";
				};
			};
		};
	};
	case (life_critHit) : {[] spawn UnionClient_effects_CritHit};
	default {  /*...code...*/ }; 
};