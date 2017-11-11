/*
	
	Filename: 	UnionClient_system_vehicleShopMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (server_restartSoon) exitWith {hint "Надвигается буря. Все магазины закрыты."};
(_this select 3) params [
	["_shop","",[""]],	
	["_spawnPoints","",["",[]]],
	["_shopFlag","",[""]],
	["_shopTitle","",[""]],
	["_disableBuy",false,[true]]
];

if !(isClass(missionConfigFile >> "LifeCfgVehShops" >> _shop)) exitWith {};

private _exit = false;
private _shopSide = M_CONFIG(getText,"LifeCfgVehShops",_shop,"side");
if !(EQUAL(_shopSide,"")) then {
	private _side = [playerSide] call UnionClient_system_convertSide;
	if !(EQUAL(_shopSide,_side)) then {
		_exit = true;
	};
};

if (_exit) exitWith {titleText ["Магазин недоступен для вашей фракции","PLAIN"]};

private _conditions = M_CONFIG(getText,"LifeCfgVehShops",_shop,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgVehShops",_shop,"conditionsMessage")];
};

disableSerialization;
createDialog "UnionDialogVehicleShopV2";
waitUntil {!isNull (findDisplay 2300)};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy];

ctrlSetText [2301,_shopTitle];
ctrlSetText [601,format["Наличность: $%1       ",[CASH] call UnionClient_system_numberText]];

if (_disableBuy) then {ctrlEnable [2309,false]};
if (ISPSIDE(west)) then {ctrlEnable [2310,false]};

private _control = CONTROL(2300,2302);
lbClear _control;

ctrlShow [2330,false];
ctrlEnable [2304,false];
ctrlEnable [2305,false];

private _multiplier = M_CONFIG(getNumber,"LifeCfgVehShops",_shop,"multiplier");
private ["_vehicleInfo","_basePrice"];
{	
	if (isClass (missionConfigFile >> "LifeCfgVehicles" >> _x select 0)) then {
		_basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_x select 0,"price");
		if (_basePrice > 0) then {
			_vehicleInfo = [_x select 0] call UnionClient_system_fetchVehInfo;
			_control lbAdd format["%1",(_vehicleInfo select 3)];
			_control lbSetData [(lbSize _control)-1,_x select 0];
			_basePrice = _basePrice * _multiplier;
			if (FETCH_CONST(life_donator) > 0) then {_basePrice = [_basePrice] call UnionClient_system_discount};
			_control lbSetTextRight [(lbSize _control)-1, format["  $%1",[round(_basePrice * 1.5)] call UnionClient_system_numberText]];
			if ([_x select 1] call UnionClient_system_conditionsCheck) then {								
				_control lbSetValue [(lbSize _control)-1,1];
			} else {
				_control lbSetPictureRight [(lbSize _control)-1, "\union_pack\icons\messages\error.paa"];
				_control lbSetValue [(lbSize _control)-1,0];
			};
		};
	};
} foreach (M_CONFIG(getArray,"LifeCfgVehShops",_shop,"vehicles"));

call UnionClient_system_shopBoxCreate;

(findDisplay 2300) displayAddEventHandler ["MouseButtonDown","if ((_this select 1) == 1) then {life_rbm = true}"];
(findDisplay 2300) displayAddEventHandler ["MouseButtonUp","if ((_this select 1) == 1) then {life_rbm = false}"];
(findDisplay 2300) displayAddEventHandler ["MouseMoving", "_this call UnionClient_system_shopBoxCameraRotate"];
(findDisplay 2300) displayAddEventHandler ["MouseZChanged", "_this call UnionClient_system_shopBoxCameraZoom"];

_control lbSetCurSel 0;

[] spawn {
	while {true} do {
		if (isNull (findDisplay 2300)) exitWith {
			call UnionClient_system_shopBoxDestroy;
		};
		uiSleep 0.1;
	};
};