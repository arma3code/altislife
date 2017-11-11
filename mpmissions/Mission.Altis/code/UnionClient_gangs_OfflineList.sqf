/*

	Filename: 	UnionClient_gangs_OfflineList.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_members","_ret","_uid","_name"];
disableSerialization;

if(isNull (findDisplay 3800)) then {
	if !(createDialog "UnionDialogGangOffline") exitWith {};
};

_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_members = CONTROL(3800,3802);
lbClear _members;

if (count _ret == 0) exitWith {_members lbAdd "Список пуст"};

{
	_uid = _x select 0;
	_name = _x select 1;
	if (!([_uid] call UnionClient_system_isUIDActive)) then {
		_members lbAdd format["%1",_name];
		_members lbSetData [(lbSize _members)-1,_uid];
	};
} foreach _ret;