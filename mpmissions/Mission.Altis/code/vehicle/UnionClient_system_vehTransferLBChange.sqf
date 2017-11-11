/*

	Filename: 	UnionClient_system_vehTransferLBChange.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
params ["_control","_index"];

private _dataArr = _control lbData _index;
_dataArr = call compile format["%1",_dataArr];
_dataArr params ["_className","_vehicleColorId","_vehicleMaterialId","_spName","_config","_retrievePrice","_serverMap","_plate"];
_spName = LIFE_GTITLE(worldName,_spName);
private _vehicleColor = if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _vehicleColorId)) then {M_CONFIG(getText,"LifeCfgVehTextures",_vehicleColorId,"displayName")} else {"Стандарт"};
private _vehicleMaterial = if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _vehicleMaterialId)) then {M_CONFIG(getText,"LifeCfgVehMaterials",_vehicleMaterialId,"displayName")} else {"Стандарт"};


private _vehicleInfo = [_className] call UnionClient_system_fetchVehInfo;
private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

ctrlShow[5103,true];
ctrlShow[5104,true];

(CONTROL(5100,5103)) ctrlSetStructuredText parseText format["<t size='0.95' color='%13'>" +
	"Цена доставки:" + " <t color='#3b7200'>$%1</t><br/><br/>" +
	(localize "STR_Shop_Veh_UI_MaxSpeed") + " %2 km/h<br/>" +
	(localize "STR_Shop_Veh_UI_HPower") + " %3<br/>" +
	(localize "STR_Shop_Veh_UI_PSeats") + " %4<br/>" +
	(localize "STR_Shop_Veh_UI_Trunk") + " %5<br/>" +
	(localize "STR_Shop_Veh_UI_Fuel") + " %6<br/>" +
	(localize "STR_Shop_Veh_UI_Color") + " %7<br/>" +
	("Материал:") + " %8<br/>" +
	"Гараж:" + " %9<br/>" +
	"Остров:" + " %10<br/>" +
	"Апгрейд:" + " %11<br/>" +
	"Номер:" + " %12<br/>" + "</t>",
	[_retrievePrice] call UnionClient_system_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	_trunkSpace,
	_vehicleInfo select 12,
	_vehicleColor,
	_vehicleMaterial,
	_spName,
	_serverMap,
	if (EQUAL(_config,[])) then {"Отсутствуeт"} else {"Есть"},
	_plate,
	GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
];

if !(EQUAL(_serverMap,worldName))  then {
	ctrlEnable[5104,true];
} else {
	ctrlEnable[5104,false];
};