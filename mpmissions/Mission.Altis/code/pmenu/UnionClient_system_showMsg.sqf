/*
	
	Filename: 	UnionClient_system_showMsg.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_index","_data","_status"];
_index = [_this,0,0] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;
_cMessageHeader = _display displayCtrl 88890;

_data = call compile (_cMessageList lnbData[_index,0]);

_status = "[ОФФЛАЙН]";
{
    if(getPlayerUID _x == _data select 0) then
    {
        _status = "[В СЕТИ]";
        life_smartphoneTarget = _x;
        ctrlEnable[887892,true];
    };
}forEach playableUnits;

_cMessageHeader ctrlSetText format["%1 %2 написал:",_data select 3,_status];
_cMessageShow ctrlSetText format["%1",_data select 2];