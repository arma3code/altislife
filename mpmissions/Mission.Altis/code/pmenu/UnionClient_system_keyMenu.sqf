/*
	
	Filename: 	UnionClient_system_keyMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index","_indexInIds"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;

ctrlSetText [2704, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];

{ if(player distance _x < 20) then {_near_units pushBack _x};} foreach playableUnits;

for "_i" from 0 to (count life_vehicles)-1 do {
	_veh = life_vehicles select _i;
	if(!isNull _veh && alive _veh) then {
		_text = "";
		if (!isNil {_veh GVAR "Life_VEH_color"}) then {
			_color = _veh GVAR ["Life_VEH_color",""];
			if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) then {
				_text = format[" (%1)",M_CONFIG(getText,"LifeCfgVehTextures",_color,"displayName")];
			};			
		};
				
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_vehicles lbAdd format["%1%3 - [Расстояние: %2m]",_name,round(player distance _veh),_text];
		if(_pic != "pictureStaticObject") then {
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
		_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
	};
};

for "_i" from 0 to (count life_tempHouses)-1 do {
	_veh = life_tempHouses select _i;
	if(!isNull _veh && alive _veh) then {	
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_vehicles lbAdd format["%1 - [ВЗЛОМАН] - [Расстояние: %2m]",_name,round(player distance _veh)];
		if(_pic != "pictureStaticObject") then {
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
		_vehicles lbSetData [(lbSize _vehicles)-1,""];
	};
};

{
	_indexInIds = [(getPlayerUID _x),life_ids] call UnionClient_system_index;
	if(!isNull _x && alive _x && player distance _x < 20 && _x != player && (GVAR_RNAME(_x) != "") && (_indexInIds != -1 OR _x in (units grpPlayer))) then
	{
		_plist lbAdd format["%1 - %2",GVAR_RNAME(_x), side _x];
		_plist lbSetData [(lbSize _plist)-1,str(_x)];
	};
} foreach _near_units;

if(((lbSize _vehicles)-1) == -1) then
{
	_vehicles lbAdd "У вас нет ключей";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
};