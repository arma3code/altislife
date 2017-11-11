/*

	Filename: 	UnionClient_system_onGetInMan.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_position","",[""]],
	["_vehicle",objNull,[objNull]],
	["_turret",[],[[]]]
];

if (life_is_arrested) exitWith {
	unassignVehicle _unit;
	player action ["getout",_vehicle];
};

if ((!(EQUAL(life_inv_uraniumu,0)) OR !(EQUAL(life_inv_uraniump,0)) OR !(EQUAL(life_inv_uraniumc,0))) && {_vehicle isKindOf "Air"}) exitWith {
	unassignVehicle _unit;
	_unit action ["getout",_vehicle];
	hint "Крайне опасно летать с ураном в рюкзаке...";
};

if ((typeOf _vehicle) in server_donat_vehicles && !(_vehicle GVAR ["FiredEVH",false])) then {
	_vehicle addEventHandler ["Fired",{_this call UnionClient_system_onVehicleFire}];
	_vehicle SVAR ["FiredEVH",true];
};


AID_VEHOUT = _vehicle addAction ["<img image='\union_pack\icons\ui\s_icon_noweapon.paa' /> Выйти с оружием за спиной",UnionClient_system_getOutW,"",0,false,false,"",'(objectParent _this) isEqualTo _target && {(locked _target) != 2} && {!(_this getVariable ["restrained",false])}'];

AID_VEHNITRO = _vehicle addAction ["<t color=""#ffba00"">Включить закись азота!</t>",UnionClient_system_nitroUse,"",0,false,false,"",'(objectParent _this) isEqualTo _target && {driver _target isEqualTo _this} && {_target isKindOf "LandVehicle"} && {speed _target > 3} && {_target getVariable ["adacNitroUsed",-1] != -1}'];

AID_VEHPARA = _vehicle addAction ["<img image='\union_pack\icons\para.paa' /> <t color=""#ff00f6"">Десантирование</t>",UnionClient_system_paraGetOut,"",30,false,false,"",'_target isKindOf "Air" && {((visiblePosition _target) select 2) >= 170} && {!(_this getVariable ["restrained",false])} && {(locked _target) != 2}'];

if (EQUAL(life_dhl_car,_vehicle)) then {
	AID_VEHDHM = _vehicle addAction ["<img image='\union_dhl\data\dhl_logo.paa' /> " + localize "STR_DHL_Menu",UnionClient_dhl_menuOpen,nil,0,true,true,"",' !life_dhl_orderInProgress && {(objectParent _this) isEqualTo _target} '];
};

[] call UnionClient_system_updateViewDistance;