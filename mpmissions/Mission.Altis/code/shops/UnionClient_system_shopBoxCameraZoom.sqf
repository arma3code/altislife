/*

	Filename: 	UnionClient_system_shopBoxCameraZoom.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_display","_scroll"];

if (isNull ShopBoxVehicle) exitWith {};

if (life_rbm) then {
	if (_scroll > 0) then {
		ShopBoxRadius = ShopBoxRadius - ShopBoxRadStep;
		if (ShopBoxRadius < 1) then {ShopBoxRadius = 1};
		ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
	if (_scroll < 0) then {
		ShopBoxRadius = ShopBoxRadius + ShopBoxRadStep;
		if (ShopBoxRadius > ShopBoxRadiusMax) then {ShopBoxRadius = ShopBoxRadiusMax};
		ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
};