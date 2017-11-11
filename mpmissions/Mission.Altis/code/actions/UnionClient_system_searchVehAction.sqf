/*
	
	Filename: 	UnionClient_system_searchVehAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (player distance _vehicle > 10 OR !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail"};
if !([_vehicle] call UnionClient_system_isVehicleKind) exitWith {hint "Это не техника"};

call UnionClient_actions_inUse;
private _ret = "";
hint localize "STR_NOTF_Searching";
uiSleep 1;
life_action_inUse = false;

private _dbInfo = _vehicle GVAR ["dbInfo",[]];

if (playerSide in [west,east]) then {
	private _owners = _vehicle GVAR ["vehicle_info_owners",[]];
	if (EQUAL(_owners,[])) exitWith {hint localize "STR_NOTF_VehCheat"; deleteVehicle _vehicle;};
	
	_owners = [_owners] call UnionClient_system_vehicleOwners;
	if (EQUAL(_owners,"any<br/>")) then {
		_owners = "Нет владельцев. Конфискуйте<br/>";
	};

	private _plate = if (count _dbInfo > 0) then {[_dbInfo select 1] call UnionClient_system_plateColor} else {"Прокат"};
	hint parseText format ["<t color='#5ad400' size='1.7'>" + localize "STR_NOTF_SearchVeh_Title" + "</t><br/><br/>
	<t color='#ffffff' size='1.5'>" + localize "STR_NOTF_SearchVeh_Owners" + "</t><br/><br/>%1<br/><br/><t size='1.3'><t color='#ffffff'>" + localize "STR_NOTF_SearchVeh_Plate" + ":</t> %2</t>",_owners,_plate];
} else {
	private _plate = if (count _dbInfo > 0) then {[_dbInfo select 1] call UnionClient_system_plateColor} else {"Прокат"};	
	hint parseText format ["<t color='#5ad400' size='1.7'>" + localize "STR_NOTF_SearchVeh_Title" + "</t><br/><br/>
	<t size='1.3'><t color='#ffffff'>" + localize "STR_NOTF_SearchVeh_Plate" + ":</t> %1</t>",_plate];	
};