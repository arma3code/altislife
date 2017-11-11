/*

	Filename: 	UnionClient_system_copLights.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
Private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed"];
_vehicle = _this select 0;

if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle GVAR ["lights",false])) exitWith {};
_lightRed = [20, 0.1, 0.1];
_lightBlue = [0.1, 0.1, 20];

_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
uiSleep 0.2;
_lightleft setLightColor _lightRed; 
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do {
	case "EXT_W_Offroad_01_F":			{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];};
	case "O_MRAP_02_F":					{_lightleft lightAttachObject [_vehicle, [-1.175, -1.5, 0.365]];};
	case "C_SUV_01_F":					{_lightleft lightAttachObject [_vehicle, [-0.37,-1.2,0.42]];};
	case "B_MRAP_01_F": 				{_lightleft lightAttachObject [_vehicle, [-1, -2.8, 0.55]];};
	case "C_Hatchback_01_sport_F":		{_lightleft lightAttachObject [_vehicle, [-0.6, 2, -0.95]];};
	case "B_Heli_Light_01_F": 			{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];};
	case "B_Heli_Transport_01_F": 		{_lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.96]];};
	case "I_Heli_light_03_unarmed_F":	{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, -0.95]];};
	case "I_MRAP_03_hmg_F": 			{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];};
	case "I_MRAP_03_F":					{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];};
	case "B_APC_Wheeled_01_cannon_F": 	{_lightleft lightAttachObject [_vehicle, [-1, -2.8, 0.55]];};
	case "B_MRAP_01_hmg_F": 			{_lightleft lightAttachObject [_vehicle, [-1, -2.8, 0.55]];};
	case "O_mas_BTR60": 				{_lightleft lightAttachObject [_vehicle, [0, -2, 0]];};

	case "Mrshounka_ducati_police_p":			{_lightleft lightAttachObject [_vehicle, [0, -1.05, 1.15]];};
	case "Mrshounka_308pol":					{_lightleft lightAttachObject [_vehicle, [-0.3, -0.45, 1.5]];};
	case "Mrshounka_a3_308_gend":				{_lightleft lightAttachObject [_vehicle, [-0.3, -0.45, 1.5]];};
	case "shounka_a3_508gend":					{_lightleft lightAttachObject [_vehicle, [-0.3, -0.25, 1.05]];};
	case "Jeffery_a3_508gend":					{_lightleft lightAttachObject [_vehicle, [-0.3, -0.25, 1.05]];};
	case "Mrshounka_rs_2015_g":					{_lightleft lightAttachObject [_vehicle, [-0.3, -1.1, 0.8]];};
	case "shounka_a3_audiq7_v2_gendarmerie":	{_lightleft lightAttachObject [_vehicle, [-0.25, 0, 0.45]];};
	case "jeffery_a3_audiq7_v2_gendarmerie":	{_lightleft lightAttachObject [_vehicle, [-0.25, 0, 0.45]];};
	case "Mrshounka_rs4_gend_p_blanc":			{_lightleft lightAttachObject [_vehicle, [0.5, 1, 0.9]];};
	case "Mrshounka_bmw_gend":					{_lightleft lightAttachObject [_vehicle, [-0.3, -0.05, 1.5]];};
	case "Mrjeffery_bmw_gend":					{_lightleft lightAttachObject [_vehicle, [-0.3, -0.05, 1.5]];};
	case "Mrshounka_a3_rs_gend":				{_lightleft lightAttachObject [_vehicle, [0, 0, 1.2]];};
	case "shounka_a3_suburbangign":				{_lightleft lightAttachObject [_vehicle, [-0.65, 2.5, 0.4]];};
	case "Mrshounka_evox_gend":					{_lightleft lightAttachObject [_vehicle, [-0.42, -0.25, 1.5]];};

	case "shounka_a3_gendsprinter":				{_lightleft lightAttachObject [_vehicle, [-0.3, 0.3, 2]];};
	case "shounka_a3_brinks_bleufonce":			{_lightleft lightAttachObject [_vehicle, [-0.4, 1.4, 0.5]];};
	case "shounka_a3_brinks_noir":				{_lightleft lightAttachObject [_vehicle, [-0.4, 1.4, 0.5]];};

	case "EC635_Unarmed":						{_lightleft lightAttachObject [_vehicle, [-0.3, -1, 0.7]];};
	case "O_Heli_Light_02_unarmed_F":			{_lightleft lightAttachObject [_vehicle, [-0.45, 0.7, 0.9]];};
	case "B_Heli_Transport_03_unarmed_F":		{_lightleft lightAttachObject [_vehicle, [0, -1, 0.9]];};
	case "B_mas_UH60M_SF":						{_lightleft lightAttachObject [_vehicle, [-1.2, -1, 0.2]];};
	case "B_mas_UH1Y_UNA_F":					{_lightleft lightAttachObject [_vehicle, [-0.7, -7.5, 0.4]];};

	case "ext_ivory_rs4_police":				{_lightleft lightAttachObject [_vehicle, [-.2,-.35,0.33]];};
	case "ext_ivory_m3_police":					{_lightleft lightAttachObject [_vehicle, [-.25,-.45,0.33]];};
	case "ext_ivory_evox_police":				{_lightleft lightAttachObject [_vehicle, [-.25,-.45,0.4]];};
	case "ext_ivory_isf_police":				{_lightleft lightAttachObject [_vehicle, [-.15,-.65,0.33]];};
	case "ext_ivory_wrx_police":				{_lightleft lightAttachObject [_vehicle, [-.25,-.37,0.35]];};
};

_lightleft setLightAttenuation [0.181, 0, 1000, 130]; 
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getpos _vehicle;   
uiSleep 0.2;
_lightright setLightColor _lightBlue; 
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [0.1,0.1,1]; 

switch (typeOf _vehicle) do {
	case "EXT_W_Offroad_01_F":			{_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];	};
	case "O_MRAP_02_F":					{_lightright lightAttachObject [_vehicle, [1.175, -1.5, 0.365]];};
	case "C_SUV_01_F":					{_lightright lightAttachObject [_vehicle, [0.37,-1.2,0.42]];		};
	case "B_MRAP_01_F": 				{_lightright lightAttachObject [_vehicle, [1, -2.8, 0.55]]; 		};
	case "C_Hatchback_01_sport_F":		{_lightright lightAttachObject [_vehicle, [0.6, 2, -0.95]]; 		};
	case "B_Heli_Light_01_F": 			{_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];	};
	case "B_Heli_Transport_01_F": 		{_lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.96]]; 	};
	case "I_Heli_light_03_unarmed_F":	{_lightright lightAttachObject [_vehicle, [0.37, 0.0,-0.95]]; 	};
	case "I_MRAP_03_hmg_F": 			{_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]]; 	};
	case "I_MRAP_03_F":					{_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]]; 	};
	case "B_APC_Wheeled_01_cannon_F": 	{_lightright lightAttachObject [_vehicle, [1, -2.8, 0.55]]; 		};
	case "B_MRAP_01_hmg_F": 			{_lightright lightAttachObject [_vehicle, [1, -2.8, 0.55]]; 		};
	case "O_mas_BTR60": 				{_lightright lightAttachObject [_vehicle, [0, -2, 0]];};

	case "Mrshounka_ducati_police_p":			{_lightright lightAttachObject [_vehicle, [0, -1.05, 1.15]];};
	case "Mrshounka_308pol":					{_lightright lightAttachObject [_vehicle, [0.3, -0.45, 1.5]];};
	case "Mrshounka_a3_308_gend":				{_lightright lightAttachObject [_vehicle, [0.3, -0.45, 1.5]];};
	case "shounka_a3_508gend":					{_lightright lightAttachObject [_vehicle, [0.3, -0.25, 1.05]];};
	case "Jeffery_a3_508gend":					{_lightright lightAttachObject [_vehicle, [0.3, -0.25, 1.05]];};
	case "Mrshounka_rs_2015_g":					{_lightright lightAttachObject [_vehicle, [0.3, -1.1, 0.8]];};
	case "shounka_a3_audiq7_v2_gendarmerie":	{_lightright lightAttachObject [_vehicle, [0.25, 0, 0.45]];};
	case "jeffery_a3_audiq7_v2_gendarmerie":	{_lightright lightAttachObject [_vehicle, [0.25, 0, 0.45]];};
	case "Mrshounka_rs4_gend_p_blanc":			{_lightright lightAttachObject [_vehicle, [0.5, 1, 0.9]];};
	case "Mrshounka_bmw_gend":					{_lightright lightAttachObject [_vehicle, [0.3, -0.05, 1.5]];};
	case "Mrjeffery_bmw_gend":					{_lightright lightAttachObject [_vehicle, [0.3, -0.05, 1.5]];};
	case "Mrshounka_a3_rs_gend":				{_lightright lightAttachObject [_vehicle, [0, 0, 1.2]];};
	case "shounka_a3_suburbangign":				{_lightright lightAttachObject [_vehicle, [0.85, 2.5, 0.4]];};
	case "Mrshounka_evox_gend":					{_lightright lightAttachObject [_vehicle, [0.42, -0.25, 1.5]];};

	case "shounka_a3_gendsprinter":				{_lightright lightAttachObject [_vehicle, [0.3, 0.3, 2]];};
	case "shounka_a3_brinks_bleufonce":			{_lightright lightAttachObject [_vehicle, [0.4, 1.4, 0.5]];};
	case "shounka_a3_brinks_noir":				{_lightright lightAttachObject [_vehicle, [0.4, 1.4, 0.5]];};

	case "EC635_Unarmed":						{_lightright lightAttachObject [_vehicle, [0.4, -1, 0.7]];};
	case "O_Heli_Light_02_unarmed_F":			{_lightright lightAttachObject [_vehicle, [0.45, 0.7, 0.9]];};
	case "B_Heli_Transport_03_unarmed_F":		{_lightright lightAttachObject [_vehicle, [0, 5, 0.9]];};
	case "B_mas_UH60M_SF":						{_lightright lightAttachObject [_vehicle, [1.2, -1, 0.2]];};
	case "B_mas_UH1Y_UNA_F":					{_lightright lightAttachObject [_vehicle, [0.7, -7.5, 0.4]];};

	case "ext_ivory_rs4_police":				{_lightright lightAttachObject [_vehicle, [.6,-.35,0.33]];};
	case "ext_ivory_m3_police":					{_lightright lightAttachObject [_vehicle, [.55,-.45,0.33]];};
	case "ext_ivory_evox_police":				{_lightright lightAttachObject [_vehicle, [.55,-.45,0.4]];};
	case "ext_ivory_isf_police":				{_lightright lightAttachObject [_vehicle, [.65,-.65,0.33]];};
	case "ext_ivory_wrx_police":				{_lightright lightAttachObject [_vehicle, [.55,-.37,0.35]];};
};
  
_lightright setLightAttenuation [0.181, 0, 1000, 130]; 
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;  
while{ (alive _vehicle)} do  
{  
	if !(_vehicle GVAR ["lights",false]) exitWith {};
	if(_leftRed) then  
	{  
		_leftRed = false;  
		_lightright setLightBrightness 0.0;  
		uiSleep 0.05;
		_lightleft setLightBrightness 6;  
	}  
		else  
	{  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		uiSleep 0.05;
		_lightright setLightBrightness 6;  
	};  
	uiSleep (_this select 1);  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;