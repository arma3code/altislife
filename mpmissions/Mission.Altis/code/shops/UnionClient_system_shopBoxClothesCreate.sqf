/*

	Filename: 	UnionClient_system_shopBoxClothesCreate.sqf
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
ShopBoxLightSource setLightAttenuation [1,0,0,0];
ShopBoxLightSource setLightIntensity 50;
ShopBoxLightSource setLightUseFlare true;
ShopBoxLightSource setLightFlareSize 0.2;
ShopBoxLightSource setLightFlareMaxDistance 50;

ShopBoxVehicle = "b_survivor_F" createVehicleLocal ShopBoxVehiclePosition;
ShopBoxVehicle setPosASL ShopBoxVehiclePosition;
ShopBoxVehicle setDir (getDir player);
ShopBoxVehicle enableSimulation false;
ShopBoxVehicle switchMove "amovpercmstpsnonwnondnon";

removeUniform ShopBoxVehicle;
removeVest ShopBoxVehicle;
removeBackpack ShopBoxVehicle;
removeGoggles ShopBoxVehicle;
removeHeadGear ShopBoxVehicle;

ShopBoxVehicle forceAddUniform life_oldClothes;
ShopBoxVehicle addBackpack life_oldBackpack;
ShopBoxVehicle addVest life_oldVest;
ShopBoxVehicle addGoggles life_oldGlasses;
ShopBoxVehicle addHeadgear life_oldHat;

ShopBoxRadius = 3;
ShopBoxRadiusMax = 12;
ShopBoxAngle = 0;
ShopBoxAltitude = 302;
ShopBoxSpeed = 0.2; 
ShopBoxAngleStep = 1.5;
ShopBoxRadStep = 0.5;
ShopBoxAltitudeStep = 0.03;

ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
ShopBoxCameraCord set [2, ShopBoxAltitude];

ShopBoxCamera = "camera" camCreate ShopBoxCameraCord;
ShopBoxCamera cameraEffect ["INTERNAL","BACK"];
ShopBoxCamera camPrepareFOV 0.700;
ShopBoxCamera camPrepareTarget ShopBoxVehicle;

ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
ShopBoxCameraCord set [2, ShopBoxAltitude];
ShopBoxCamera camPreparePos ShopBoxCameraCord;
ShopBoxCamera camCommitPrepared ShopBoxSpeed;

showCinemaBorder false;
showChat false;