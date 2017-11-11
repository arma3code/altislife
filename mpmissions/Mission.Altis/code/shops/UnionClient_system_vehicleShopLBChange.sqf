/*
	
	Filename: 	UnionClient_system_vehicleShopLBChange.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]	
];
if (isNull _control OR EQUAL(_index,-1)) exitWith {closeDialog 0;}; //Bad data
private _className = CONTROL_DATAI(_control,_index);

private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price") * M_CONFIG(getNumber,"LifeCfgVehShops",(life_veh_shop select 0),"multiplier");
if (FETCH_CONST(life_donator) > 0) then {_basePrice = [_basePrice] call UnionClient_system_discount};

private _vehicleInfo = [_className] call UnionClient_system_fetchVehInfo;
private _trunkSpace = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"vItemSpace");

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format["<t size='0.9' color='%9'>" + 
	(localize "STR_Shop_Veh_UI_Rental") + " <t color='#3f6b00'>$%1</t><br/>" +
	(localize "STR_Shop_Veh_UI_Ownership") + " <t color='#3f6b00'>$%2</t><br/>" +
	(localize "STR_Shop_Veh_UI_MaxSpeed") + " %3 km/h<br/>" +
	(localize "STR_Shop_Veh_UI_HPower") + " %4<br/>" +
	(localize "STR_Shop_Veh_UI_PSeats") + " %5<br/>" +
	(localize "STR_Shop_Veh_UI_Trunk") + " %6<br/>" +
	(localize "STR_Shop_Veh_UI_Fuel") + " %7<br/>" +
	(localize "STR_Shop_Veh_UI_Armor") + " %8</t>",
	[_basePrice] call UnionClient_system_numberText,
	[round(_basePrice * 1.5)] call UnionClient_system_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	_trunkSpace,
	_vehicleInfo select 12,
	_vehicleInfo select 9,
	GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
];

private _colorCtrl = CONTROL(2300,2304);
lbClear _colorCtrl;
{
	if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _x select 0)) then {
		if ((life_veh_shop select 2) in (_x select 1)) then {
			_colorCtrl lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehTextures",_x select 0,"displayName")];
			_colorCtrl lbSetData [(lbSize _colorCtrl)-1,_x select 0];
			_colorCtrl lbSetPicture [(lbSize _colorCtrl)-1,(M_CONFIG(getArray,"LifeCfgVehTextures",_x select 0,"texture")) select 0];
			if !([_x select 2] call UnionClient_system_conditionsCheck) then {
				_colorCtrl lbSetPictureRight [(lbSize _colorCtrl)-1, "\union_pack\icons\messages\error.paa"];
				_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,0];
			} else {
				_colorCtrl lbSetValue [(lbSize _colorCtrl)-1,1];
			};
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehicles",_className,"textures"));

private _materialCtrl = CONTROL(2300,2305);
lbClear _materialCtrl;
{
	if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _x)) then {
		_materialCtrl lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehMaterials",_x,"displayName")];
		_materialCtrl lbSetData [(lbSize _materialCtrl)-1,_x];
		if !([M_CONFIG(getText,"LifeCfgVehMaterials",_x,"conditions")] call UnionClient_system_conditionsCheck) then {
			_materialCtrl lbSetPictureRight [(lbSize _materialCtrl)-1, "\union_pack\icons\messages\error.paa"];
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,0];
		} else {
			_materialCtrl lbSetValue [(lbSize _materialCtrl)-1,1];
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehicles",_className,"materials"));

lbSetCurSel[2304,0];
lbSetCurSel[2305,0];

if !(EQUAL((lbSize _colorCtrl),0)) then {
	ctrlEnable [2304,true];   
} else {
	ctrlEnable [2304,false];
};

if !(EQUAL((lbSize _materialCtrl),0)) then {
	ctrlEnable [2305,true];
} else {
	ctrlEnable [2305,false];
};

[_className,CONTROL_DATA(2304),CONTROL_DATA(2305)] call UnionClient_system_shopBoxUpdate;

if(_className in (LIFE_SETTINGS(getArray,"life_vShop_rentalOnly"))) then {
	private _conditions = LIFE_SETTINGS(getText,"life_vShop_rentalCondition");
	if !([_conditions] call UnionClient_system_conditionsCheck) then {
		ctrlEnable [2309,false];
	};
} else {
	if !(life_veh_shop select 3) then {
		ctrlEnable [2309,true];
	};
};

true;