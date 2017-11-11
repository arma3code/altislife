/*

	Filename: 	UnionClient_system_medicLights.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
Private ["_vehicle","_lightRed","_lightYellow","_lightleft","_lightright","_leftRed"];
_vehicle = param [0,ObjNull,[ObjNull]];
	
if (isNil "_vehicle" OR isNull _vehicle OR !(_vehicle GVAR ["lights",false])) exitWith {};
_lightRed = [20, 0.1, 0.1];
_lightYellow = [24, 22, 0.3];

_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
uiSleep 0.2;
_lightleft setLightColor _lightRed; 
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do {
	case "C_Offroad_01_repair_F": 			{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];	};
	case "O_MRAP_02_F":						{_lightleft lightAttachObject [_vehicle, [-1.175, -1.5, 0.365]];};	
	case "B_Heli_Light_01_F": 				{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];};
	case "I_Heli_light_03_unarmed_F":		{_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, -0.95]];};
	
	case "dezkit_b206_rescue":				{_lightleft lightAttachObject [_vehicle, [-0.55, -3.45, 0]];};	
	case "dezkit_b206_ems":					{_lightleft lightAttachObject [_vehicle, [-0.55, -3.45, 0]];};	
	case "shounka_a3_pompier_sprinter":		{_lightleft lightAttachObject [_vehicle, [0, 0.3, 2]];};	
	case "Mrshounka_Volkswagen_Touareg_mcs":{_lightleft lightAttachObject [_vehicle, [-0.75, 2.7, 0.3]];};	
	case "B_Heli_Transport_03_unarmed_F":	{_lightleft lightAttachObject [_vehicle, [0, -1, 0.9]];};
	case "O_Heli_Light_02_unarmed_F":		{_lightleft lightAttachObject [_vehicle, [-0.45, 0.7, 0.9]];};
};

_lightleft setLightAttenuation [0.181, 0, 1000, 130]; 
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getpos _vehicle;
uiSleep 0.2;
_lightright setLightColor _lightYellow; 
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [0.1,0.1,1]; 

switch (typeOf _vehicle) do {
	case "C_Offroad_01_repair_F": 			{_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];};
	case "O_MRAP_02_F":						{_lightright lightAttachObject [_vehicle, [1.175, -1.5, 0.365]];};
	case "B_Heli_Light_01_F": 				{_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];	};
	case "I_Heli_light_03_unarmed_F":		{_lightright lightAttachObject [_vehicle, [0.37, 0.0,-0.95]]; 	};

	case "dezkit_b206_rescue":				{_lightright lightAttachObject [_vehicle, [0.55, -3.45, 0]];};	
	case "dezkit_b206_ems":					{_lightright lightAttachObject [_vehicle, [0.55, -3.45, 0]];};	
	case "shounka_a3_pompier_sprinter":		{_lightright lightAttachObject [_vehicle, [0, -2.85, 2]];};
	case "Mrshounka_Volkswagen_Touareg_mcs":{_lightright lightAttachObject [_vehicle, [0.75, 2.7, 0.3]];};	
	case "B_Heli_Transport_03_unarmed_F":	{_lightright lightAttachObject [_vehicle, [0, 5, 0.9]];};
	case "O_Heli_Light_02_unarmed_F":		{_lightright lightAttachObject [_vehicle, [0.45, 0.7, 0.9]];};
};
  
_lightright setLightAttenuation [0.181, 0, 1000, 130]; 
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;  
while {(alive _vehicle)} do {  
	if !(_vehicle GVAR ["lights",false]) exitWith {};
	if (_leftRed) then {  
		_leftRed = false;  
		_lightright setLightBrightness 0.0;  
		uiSleep 0.05;
		_lightleft setLightBrightness 6;  
	} else {  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		uiSleep 0.05;
		_lightright setLightBrightness 6;  
	};  
	uiSleep (_this select 1);
}; 

deleteVehicle _lightleft;
deleteVehicle _lightright;