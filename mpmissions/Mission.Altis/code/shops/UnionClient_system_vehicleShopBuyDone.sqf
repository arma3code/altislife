/*

	Filename: 	UnionClient_system_vehicleShopBuyDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [	
	["_done",false,[true]],
	["_vehicle",objNull,[objNull]],
	["_plate","",[""]],
	["_price",0,[0]],
	["_color","",[""]],
	["_material","",[""]]
];

if (_done) then {
	private _logText = format["Приобрел технику %1 за $%2",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call UnionClient_system_numberText];	
	["cash","take",_price,"VB",_logText] call UnionClient_system_myCash;
	titleText[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),[_price] call UnionClient_system_numberText,_plate],"PLAIN"];

	if !(EQUAL(_color,"")) then {[_vehicle,_color] call UnionClient_system_colorVehicle};
	if !(EQUAL(_material,"")) then {[_vehicle,_material] call UnionClient_system_materialVehicle};
	//if ([typeof _vehicle] call UnionClient_system_havePlate) then {[_vehicle] call UnionClient_system_setPlate};
} else {
	titleText["Не удалось оформить сделку по покупке техники. Попробуйте еще раз!","PLAIN"];
};