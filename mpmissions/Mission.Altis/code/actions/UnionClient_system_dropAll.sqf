/*
	
	Filename: 	UnionClient_system_dropAll.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _source = param [0,objNull,[objNull]];

private _box = createVehicle ["Box_Wps_F",getPosATL player,[],0,"NONE"];
waitUntil {!isNull _box};

if (!(EQUAL(PUNIFORM,""))) then {
	{
		[_x,_box] call UnionClient_system_addItemToBox;		
	} forEach (uniformItems player);

	[PUNIFORM,_box] call UnionClient_system_addItemToBox;	
};

if (!(EQUAL(PVEST,""))) then {
	{
		[_x,_box] call UnionClient_system_addItemToBox;		
	} forEach (vestItems player);

	[PVEST,_box] call UnionClient_system_addItemToBox;	
};

if (!(EQUAL(PBACKPACK,""))) then {
	{
		[_x,_box] call UnionClient_system_addItemToBox;		
	} forEach (backpackItems player);

	[PBACKPACK,_box] call UnionClient_system_addItemToBox;	
};

[PGOOGLES,_box] call UnionClient_system_addItemToBox;	
[PHEADGEAR,_box] call UnionClient_system_addItemToBox;	

{
	if !(EQUAL(_x,"")) then {
		[_x,_box] call UnionClient_system_addItemToBox;	
	};
} forEach (assigneditems player);

if (!(EQUAL(RIFLE,""))) then {
	if (count (primaryWeaponMagazine player) > 0) then {
		[((primaryWeaponMagazine player) select 0),_box] call UnionClient_system_addItemToBox;
	};
	if (count (RIFLE_ITEMS) > 0) then {
    	{
    	    [_x,_box] call UnionClient_system_addItemToBox;
    	} forEach (RIFLE_ITEMS);
	};
	[RIFLE,_box] call UnionClient_system_addItemToBox;
};

if (!(EQUAL(PISTOL,""))) then {
	if(count (handgunMagazine player) > 0 && LSALIVE(player)) then {		
		[((handgunMagazine player) select 0),_box] call UnionClient_system_addItemToBox;
	};

	if (count (PISTOL_ITEMS) > 0) then {
	    {
	        [_x,_box] call UnionClient_system_addItemToBox;
	    } forEach (PISTOL_ITEMS);	    
	};
	[PISTOL,_box] call UnionClient_system_addItemToBox;
};

if (!(EQUAL(LAUNCHER,""))) then {	
	if (count (secondaryWeaponMagazine player) > 0 && LSALIVE(player)) then {		
		[((secondaryWeaponMagazine player) select 0),_box] call UnionClient_system_addItemToBox;
	};
	[LAUNCHER,_box] call UnionClient_system_addItemToBox;
};

private _virtItems = [];
private ["_value","_item","_itemName"];
{	
	_item = configName _x;
	_value = ITEM_VALUE(_item);
	_itemName = ITEM_VARNAME(_item);
	if (_value > 0) then {
		_virtItems pushBack [_item,_value];
		SVAR_MNS [_itemName,0];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));

life_carryWeight = 0;
[_box,"Trunk",[_virtItems,0]] call CBA_fnc_setVarNet;

[] call UnionClient_system_stripDownPlayer;

if (side _source in [civilian,independent]) then {
	[[getPlayerUID _source,GVAR_RNAME(_source),"480"],"wantedAdd"] call UnionClient_system_hcExec;
};
systemChat format[localize "STR_NOTF_GetNakedBy",getPlayerUID _source];