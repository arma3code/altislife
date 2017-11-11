/*

	Filename: 	UnionClient_system_setPlate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

if (local _vehicle) then {
	if (isNil {_vehicle GVAR "Life_VEH_Plate"}) then {
		private _dbInfo = _vehicle GVAR ["dbInfo",[]];
		private _plate = if (count _dbInfo > 0) then {(_dbInfo select 1) splitString ""} else {"RENTING" splitString ""};
		_vehicle SVAR ["Life_VEH_Plate",_plate,true];
	};
};

private _vehPlate = _vehicle GVAR ["Life_VEH_Plate",[]];
if (EQUAL(_vehPlate,[])) exitWith {};

private ["_platePath","_plateIndexArray"];
switch (true) do {
	case (["ext_Jonzie", (typeOf _vehicle)] call UnionClient_system_xString): {
		_platePath = "\Jonzie_Carpack\Universal_Cars\Number_Plates";
		_plateIndexArray = [1,2,3,4,5,6,7];
	}; 
	case (["ext_ivory", (typeOf _vehicle)] call UnionClient_system_xString): {
		_platePath = "\ivory_data\license";
		_plateIndexArray = [4,5,6,7,8,9,10];
	}; 
	default {_platePath = "";_plateIndexArray = []}; 
};

if (EQUAL(_platePath,"") OR EQUAL(_plateIndexArray,[])) exitWith {};

{
	_vehicle setObjectTextureGlobal [_x, format ["%1\%2.paa",_platePath,_vehPlate select _forEachIndex]];
} forEach _plateIndexArray;