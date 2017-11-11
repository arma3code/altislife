/*

	Filename: 	UnionClient_evh_inventoryClosed.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params ["_unit","_container"];
if (isNull _container) exitWith {}; //MEH

if (typeOf _container == "Box_Wps_F") then {
	if ((count (magazineCargo _container) == 0) && (count (WeaponCargo _container) == 0) &&	(count (itemCargo _container) == 0)) then {
		private _data = _container GVAR ["Trunk",[[],0]];
		_data = _data select 0;
		if (count _data == 0) then {
			deleteVehicle _container;
		};		
	};
};

[life_currentContainer,"openedByUnit"] call UnionClient_system_clearGlobalVar;
life_currentContainer = objNull;
life_ContainerOpened = false;

[] call UnionClient_system_saveGear;