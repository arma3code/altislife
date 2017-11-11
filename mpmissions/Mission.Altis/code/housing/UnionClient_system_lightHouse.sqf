/*

	Filename: 	UnionClient_system_lightHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_house",ObjNull,[ObjNull]],
	["_mode",false,[true]]
];
if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};
if (_mode) then {	
	private _pos = M_CONFIG2(getArray,"LifeCfgHousing",worldName,typeOf _house,"lightPos");
	if (EQUAL(_pos,[])) exitWith {};

	private _lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	_lightSource lightAttachObject [_house,_pos];
	_lightSource setLightColor [250,150,50];
	_lightSource setLightAmbient [1,1,0.2];
	_lightSource setLightAttenuation [1,0,0,0];
	_lightSource setLightIntensity 10;
	_lightSource setLightUseFlare true;
	_lightSource setLightFlareSize 0.2;
	_lightSource setLightFlareMaxDistance 50;

	_house SVAR ["lightSource",_lightSource];
} else {
	if !(isNull (_house GVAR ["lightSource",ObjNull])) then {
		deleteVehicle (_house GVAR ["lightSource",ObjNull]);
	};
};