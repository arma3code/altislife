/*

	Filename: 	UnionClient_system_onVehicleFire.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = _this select 0;
private _curTime = _vehicle GVAR ["donatVehLastFire",0];
if (time - _curTime > 60) then {
	_vehicle SVAR ["donatVehLastFire",time,true];	
};