/*
	
	Filename: 	UnionClient_system_vehTransferMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _vehicles = param [0,[],[[]]];
waitUntil {!isNull (findDisplay 5100)};

if (EQUAL(_vehicles,[])) exitWith {
	ctrlSetText[5102,localize "STR_Garage_NoVehicles"];
};

private _control = ((findDisplay 5100) displayCtrl 5102);
lbClear _control;

//id, side, classname, pid, alive, active, plate, color, material, sp, config, price, servermap

private ["_vehicleInfo","_tmp","_retrievePrice","_basePrice"];
{
	_vehicleInfo = [_x select 2] call UnionClient_system_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);

	_basePrice = _x select 11;
	_retrievePrice = if (EQUAL(_basePrice,0)) then {500} else {round (_basePrice * 0.1)};	
	if (playerSide in [west,east]) then {_retrievePrice = 500};
	if (_retrievePrice <= 0) then {_retrievePrice=500};

	_tmp = [_x select 2,_x select 7,_x select 8,_x select 9,_x select 10,_retrievePrice,_x select 12,_x select 6];	
	_control lbSetData [(lbSize _control)-1,str(_tmp)];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;

ctrlShow[5103,false];
ctrlShow[5104,false];