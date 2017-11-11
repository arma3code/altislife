/*

	Filename: 	UnionClient_garage_Menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_vehicles","_control"];
disableSerialization;
_vehicles = [_this,0,[],[[]]] call BIS_fnc_param;

waitUntil {!isNull (findDisplay 2800)};

if(count _vehicles == 0) exitWith {
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

_control = ((findDisplay 2800) displayCtrl 2802);
lbClear _control;
//0
//id, side, classname, type, pid, alive, active, plate, color, material, trunk, fuel, inventory, sp, config, insurance, price, servermap, parking

//id, classname, color, spname, tuning_data, insure, baseprice ,material, inventory, fuel, gear, servermap, parking
// 0	1			2		3		4			5		6			7		8		   9    10     11		   12
{
	_vehicleInfo = [_x select 1] call UnionClient_system_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 1,_x select 2,_x select 7,_x select 3,_x select 4,_x select 5,_x select 6,_x select 11,_x select 12];
	_tmp = str(_tmp);	diag_log _tmp;
	_control lbSetData [(lbSize _control)-1,_tmp];
	//_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;


ctrlShow[2810,false];
ctrlShow[2811,false];