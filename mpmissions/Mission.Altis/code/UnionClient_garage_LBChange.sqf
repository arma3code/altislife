/*

	Filename: 	UnionClient_garage_LBChange.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _control = _this select 0;
private _index = _this select 1;
private _dataArr = _control lbData _index;
_dataArr = call compile format["%1",_dataArr];

_dataArr params ["_className","_vehicleColorId","_vehicleMaterialId","_spName","_config","_insurance","_basePrice","_serverMap","_parking"];
_arr = [_className,_vehicleColorId,_vehicleMaterialId,_spName,_config,_insurance,_basePrice,_serverMap,_parking];
_spName = LIFE_GTITLE(worldName,_spName);
private _vehicleColor = if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _vehicleColorId)) then {M_CONFIG(getText,"LifeCfgVehTextures",_vehicleColorId,"displayName")} else {"Стандарт"};
private _vehicleMaterial = if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _vehicleMaterialId)) then {M_CONFIG(getText,"LifeCfgVehMaterials",_vehicleMaterialId,"displayName")} else {"Стандарт"};
private _vehicleInfo = [_className] call UnionClient_system_fetchVehInfo;
private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

private ["_sellPrice","_retrievePrice"];
if (EQUAL(_basePrice,0)) then {
	_sellPrice = 0;
	_retrievePrice = 0;
} else {
	_sellPrice = round (_basePrice - (_basePrice*0.3));
	_retrievePrice = round (_basePrice * 0.02);
};

if (playerSide in [west,east] OR (_retrievePrice <= 0)) then {_retrievePrice = 500};
if (_sellPrice <= 0) then {ctrlEnable[2813,false]} else {ctrlEnable[2813,true]};

if (EQUAL(_parking,[])) then {
	(CONTROL(2800,2803)) ctrlSetStructuredText parseText format["<t size='0.95' color='%14'>" +
		(localize "STR_Shop_Veh_UI_RetrievalP") + " <t color='#3b7200'>$%1</t><br/>" +
		(localize "STR_Shop_Veh_UI_SellP") + " <t color='#3b7200'>$%2</t><br/><br/>" +
		(localize "STR_Shop_Veh_UI_MaxSpeed") + " %3 km/h<br/>" +
		(localize "STR_Shop_Veh_UI_HPower") + " %4<br/>" +
		(localize "STR_Shop_Veh_UI_PSeats") + " %5<br/>" +
		(localize "STR_Shop_Veh_UI_Trunk") + " %6<br/>" +
		(localize "STR_Shop_Veh_UI_Fuel") + " %7<br/>" +
		(localize "STR_Shop_Veh_UI_Color") + " %8<br/>" +
		("Материал:") + " %9<br/>" +
		"Гараж:" + " %10<br/>" +
		"Остров:" + " %11<br/>" +
		"Апгрейд:" + " %12<br/>",
		[_retrievePrice] call UnionClient_system_numberText,
		[_sellPrice] call UnionClient_system_numberText,
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
		GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
	];
	if (_insurance == 1) then {
		ctrlShow[2812,false];
		ctrlShow[2813,false];
		ctrlShow[2814,true];
	} else {
		ctrlShow[2812,true];
		ctrlShow[2813,true];
		ctrlShow[2814,false];

		if !(EQUAL(_serverMap,worldName)) then {
			ctrlEnable[2812,false];
		} else {
			ctrlEnable[2812,true];
		};
	};
} else {
	(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
		"<t size='0.95' color='%3'>Техника на штрафстоянке!<br/><br/>Сумма штрафа: $%1</t><br/>Примечание: %2</t></t>",
		[_parking select 0] call UnionClient_system_numberText,
		_parking select 1,
		GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
	];
	ctrlShow[2812,false];
	ctrlShow[2813,false];
	ctrlShow[2814,false];
};

ctrlShow [2803,true];