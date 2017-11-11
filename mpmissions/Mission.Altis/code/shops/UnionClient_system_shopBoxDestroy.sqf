/*

	Filename: 	UnionClient_system_shopBoxDestroy.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
ShopBoxCamera cameraEffect ["terminate", "back"];
camDestroy ShopBoxCamera;

if (!isNil "ShopBoxTable" && {!isNull ShopBoxTable}) then {deleteVehicle ShopBoxTable};
if (!isNil "ShopBoxVehicle" && {!isNull ShopBoxVehicle}) then {deleteVehicle ShopBoxVehicle};
if (!isNil "ShopBoxBackgroundObject" && {!isNull ShopBoxBackgroundObject}) then {deleteVehicle ShopBoxBackgroundObject};
if (!isNil "ShopBoxLightSource" && {!isNull ShopBoxLightSource}) then {deleteVehicle ShopBoxLightSource};
if (!isNil "ShopBoxWeapHolder" && {!isNull ShopBoxWeapHolder}) then {deleteVehicle ShopBoxWeapHolder};
if (!isNil "ShopBoxWeapTurnItem" && {!isNull ShopBoxWeapTurnItem}) then {deleteVehicle ShopBoxWeapTurnItem};

showChat true;