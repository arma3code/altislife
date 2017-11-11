/*

	Filename: 	UnionClient_system_shopBoxCreate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"

ShopBoxPosition = [0,0,300];
ShopBoxVehiclePosition = [0,0,300.1];

ShopBoxBackgroundObject = "Land_Hangar_F" createVehicleLocal ShopBoxPosition;
ShopBoxBackgroundObject enableSimulation false;
ShopBoxBackgroundObject allowDamage false;
ShopBoxBackgroundObject setPosASL ShopBoxPosition;
ShopBoxBackgroundObject setDir (getDir player);

ShopBoxLightSource = "#lightpoint" createVehicleLocal [0,0,0];
ShopBoxLightSource lightAttachObject [ShopBoxBackgroundObject,[0,1.1,1.1]];
ShopBoxLightSource setLightColor [255,255,255];
ShopBoxLightSource setLightAmbient [1,1,0.2];
ShopBoxLightSource setLightAttenuation [0,0,5,0];
ShopBoxLightSource setLightIntensity 20;
ShopBoxLightSource setLightUseFlare true;
ShopBoxLightSource setLightFlareSize 0;
ShopBoxLightSource setLightFlareMaxDistance 50;

ShopBoxVehicle = objNull;

ShopBoxRadius = 10;
ShopBoxRadiusMax = 12;
ShopBoxAngle = 0;
ShopBoxAltitude = 305;
ShopBoxSpeed = 0.1;
ShopBoxAngleStep = 1.5;
ShopBoxRadStep = 0.5;
ShopBoxAltitudeStep = 0.06;

ShopBoxCameraCord = [ShopBoxBackgroundObject,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
ShopBoxCameraCord set [2, ShopBoxAltitude];

ShopBoxCamera = "camera" camCreate ShopBoxCameraCord;
ShopBoxCamera cameraEffect ["INTERNAL","BACK"];
ShopBoxCamera camPrepareFOV 0.700;
ShopBoxCamera camPrepareTarget ShopBoxBackgroundObject;

ShopBoxCameraCord = [ShopBoxBackgroundObject,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
ShopBoxCameraCord set [2, ShopBoxAltitude];
ShopBoxCamera camPreparePos ShopBoxCameraCord;
ShopBoxCamera camCommitPrepared ShopBoxSpeed;

showCinemaBorder false;
showChat false;