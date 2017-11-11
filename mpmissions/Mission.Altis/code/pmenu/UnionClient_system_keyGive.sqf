/*
	
	Filename: 	UnionClient_system_keyGive.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_dialog","_list","_plist","_sel","_vehicle","_vehicleIndex","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
_vehicleIndex = _list lbData _sel;
if (_vehicleIndex == "") exitWith {hint "Невозможно передать эти ключи"};
_vehicle = life_vehicles select parseNumber(_vehicleIndex);

_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format["%1", _unit];
if(isNull _unit OR isNil "_unit") exitWith {}; 

_uid = getPlayerUID _unit;
_owners = _vehicle GVAR "vehicle_info_owners";
_index = [_uid,_owners] call UnionClient_system_index;
if(_index == -1) then {
	_owners pushBack [_uid,GVAR_RNAME(_unit)];
	_vehicle SVAR ["vehicle_info_owners",_owners,true];
};

hint format["Вы передали %1 ключи от %2",GVAR_RNAME(_unit),typeOf _vehicle];
[_vehicle,_unit,GVAR_RNAME(player)] remoteExecCall ["UnionClient_system_keyRecive",_unit];