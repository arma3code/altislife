/*

	Filename: 	UnionClient_system_chopShopMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
private _cop_min_illegal = [] call UnionClient_system_copsForIllegal;
if ((west countSide playableUnits) < _cop_min_illegal) exitWith {hint format[localize "STR_ChopShop_NeedCops",_cop_min_illegal]};

life_chopShop = _this select 3;

private _nearVehicles = if (EQUAL(life_chopShop,"chop_shop_4")) then {
	nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck","Air"],25]
} else {
	nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck"],25]
};

if (EQUAL(_nearVehicles,[])) exitWith {titleText[localize "STR_Shop_NoVehNear","PLAIN"];};
disableSerialization;
if !(createDialog "UnionDialogChopShop") exitWith {hint localize "STR_Shop_ChopShopError"};

private _control = CONTROL(39400,39402);

private["_className","_displayName","_picture"];
{
	if (alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");		
			
		if(EQUAL(crew _x,[]) && (_x in life_vehicles)) then {
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];			
		};
	};
} foreach _nearVehicles;