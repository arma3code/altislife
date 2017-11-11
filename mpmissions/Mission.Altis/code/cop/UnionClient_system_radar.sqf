/*

	Filename: 	UnionClient_system_radar.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if !(ISPSIDE(west)) exitWith {};
private _vehicle = cursorObject;
private _speed = round speed _vehicle;

if ((_vehicle isKindOf "LandVehicle") && EQUAL(CURWEAPON,"Radar_Gun")) then {
	switch (true) do {
		case (_speed > 33 && _speed <= 80):  {
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
		};
		case (_speed > 80): {
			hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#FF0000'><t align='center'><t size='1'>" +(localize "STR_Cop_VehSpeed"),round  _speed];
		};
	};
};
