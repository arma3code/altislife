/*

	Filename: 	UnionClient_system_shopBoxCameraRotate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_display","_xCoord","_yCoord"];

if (isNull ShopBoxVehicle) exitWith {};

if (life_rbm) then {
	if (_xCoord > 0.25) then {
		if (ShopBoxAngle < 360) then {
			ShopBoxAngle = ShopBoxAngle + ShopBoxAngleStep;
		} else {ShopBoxAngle = 0};
		ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
	if (_xCoord < -0.25) then {
		if (ShopBoxAngle > 0) then {
			ShopBoxAngle = ShopBoxAngle - ShopBoxAngleStep;
		} else {ShopBoxAngle = 360};
		ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
		ShopBoxCameraCord set [2, ShopBoxAltitude];
		ShopBoxCamera camPreparePos ShopBoxCameraCord;
		ShopBoxCamera camCommitPrepared ShopBoxSpeed;
	};
	if (_yCoord > 0.3) then {
		if (ShopBoxAltitude < 307) then {
			ShopBoxAltitude = ShopBoxAltitude + ShopBoxAltitudeStep;
			ShopBoxCameraCord set [2, ShopBoxAltitude];
			ShopBoxCamera camPreparePos ShopBoxCameraCord;
			ShopBoxCamera camCommitPrepared ShopBoxSpeed;
		};
	};
	if (_yCoord < -0.3) then {
		if (ShopBoxAltitude > 301) then {
			ShopBoxAltitude = ShopBoxAltitude - ShopBoxAltitudeStep;
			ShopBoxCameraCord set [2, ShopBoxAltitude];
			ShopBoxCamera camPreparePos ShopBoxCameraCord;
			ShopBoxCamera camCommitPrepared ShopBoxSpeed;
		};
	};
};