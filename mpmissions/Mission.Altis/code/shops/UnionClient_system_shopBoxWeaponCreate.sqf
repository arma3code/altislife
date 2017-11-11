/*

	Filename: 	UnionClient_system_shopBoxWeaponCreate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
ShopBoxPosition = [0,0,300];
ShopBoxWeapHolder = objNull;
ShopBoxWeapTurnItem = objNull;

ShopBoxBackgroundObject = "Land_i_Shop_02_V1_F" createVehicleLocal ShopBoxPosition;
ShopBoxBackgroundObject enableSimulation false;
ShopBoxBackgroundObject allowDamage false;
ShopBoxBackgroundObject setPosASL ShopBoxPosition;
ShopBoxBackgroundObject setDir (getDir player);

ShopBoxTable = "Land_TableDesk_F" createVehicleLocal ShopBoxPosition;
ShopBoxTable enableSimulation false;
ShopBoxTable allowDamage false;
ShopBoxTable attachTo [ShopBoxBackgroundObject, [-1, -2, -2.25] ];
detach ShopBoxTable;
ShopBoxTable setDir ((getDir ShopBoxBackgroundObject) - 90);

ShopBoxLightSource = "#lightpoint" createVehicleLocal [0,0,0];
ShopBoxLightSource lightAttachObject [ShopBoxTable,[0,-1,1]];
ShopBoxLightSource setLightColor [255,255,255];
ShopBoxLightSource setLightAmbient [1,1,0.2];
ShopBoxLightSource setLightAttenuation [0,0,5,0];
ShopBoxLightSource setLightIntensity 20;
ShopBoxLightSource setLightUseFlare true;
ShopBoxLightSource setLightFlareSize 0;
ShopBoxLightSource setLightFlareMaxDistance 50;

ShopBoxCameraCord = ShopBoxTable modelToWorld [-0.3,-1.5,0.8];
ShopBoxTableCord = ShopBoxTable modelToWorld [-0.3,0,0.8];

ShopBoxCamera = "camera" camCreate ShopBoxCameraCord;
ShopBoxCamera cameraEffect ["External","BACK"];
ShopBoxCamera camSetPos ShopBoxCameraCord;
ShopBoxCamera camSetDir (ShopBoxCameraCord vectorFromTo ShopBoxTableCord);
ShopBoxCamera camSetFov 0.7;
ShopBoxCamera camCommit 0;

showCinemaBorder false;
showChat false;