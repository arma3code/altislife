/*

	Filename: 	UnionClient_surgery_BoxCreate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
ShopBoxPosition = 
[
	(getPosATL player) select 0, 
	(getPosATL player) select 1, 
	((getPosATL player) select 2) + 300
];
ShopBoxBackgroundObject = "ShopBox" createVehicleLocal ShopBoxPosition;
ShopBoxBackgroundObject setPosATL ShopBoxPosition;
ShopBoxBackgroundObject setDir 270;
ShopBoxBackgroundObject setObjectTexture [0, "#(rgb,8,8,3)color(0.5,0.5,0.5,1)"]; 

ShopBoxVehicle = "b_survivor_F" createVehicleLocal ShopBoxPosition;
ShopBoxVehicle setPosATL ShopBoxPosition;
ShopBoxVehicle setDir 0;
ShopBoxVehicle enableSimulation false;
ShopBoxVehicle switchMove "amovpercmstpsnonwnondnon";

removeUniform ShopBoxVehicle;
removeVest ShopBoxVehicle;
removeBackpack ShopBoxVehicle;
removeGoggles ShopBoxVehicle;
removeHeadGear ShopBoxVehicle;

ShopBoxVehicle forceAddUniform PUNIFORM;
ShopBoxVehicle addBackpack PBACKPACK;
ShopBoxVehicle addVest PVEST;
ShopBoxVehicle addHeadgear PHEADGEAR;
ShopBoxVehicle setFace life_myIdentity;

ShopBoxCamera = "camera" camCreate ShopBoxPosition;
ShopBoxCamera cameraEffect ["internal", "back"];
ShopBoxCamera camPrepareFOV 0.7; 
showCinemaBorder false; 
ShopBoxCamera camPrepareTarget ShopBoxVehicle;
ShopBoxCamera setPosATL [getPosATL ShopBoxVehicle select 0, (getPosATL ShopBoxVehicle select 1) + 1, (getPosATL ShopBoxVehicle select 2) + 2];
ShopBoxCamera camCommitPrepared 0;