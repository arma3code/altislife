/*
	
	Filename: 	UnionClient_system_repairTruck.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _veh = cursorObject;
if (isNull _veh) exitwith {};
private _parts = [];
private _hitpoints = [];
private _hitpointsText = [];
private _partsText = "";
private _critical = 0;

private _sleep = if (playerSide in [civilian,independent]) then {0.25} else {0.1};

if ([_veh] call UnionClient_system_isVehicleKind && ("extItem_ItemRepairKit" in (items player))) then {
	switch (true) do {
		case (_veh isKindOf "Air"): {
			_hitpoints = ["HitEngine","HitHRotor","HitFuel","HitHull","HitVRotor","HitTransmission"];
			_hitpointsText = [localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartRotor",localize "STR_NOTF_VehPartFuel",localize "STR_NOTF_VehPartHull",localize "STR_NOTF_VehPartRearRotor",localize "STR_NOTF_VehPartTransmission"];			
			_critical = 3;
		};
		
		case (_veh isKindOf "LandVehicle"): {			
			if ((typeof _veh) in ["I_Truck_02_transport_F","I_Truck_02_covered_F","I_Truck_02_covered_CIV_F","O_Truck_02_fuel_F","B_Truck_01_mover_F","B_Truck_01_transport_F","B_Truck_01_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","B_Truck_01_box_F","B_Truck_01_box_CIV_F","B_Truck_01_fuel_F","B_Truck_01_fuel_CIV_F","O_Truck_03_device_F"]) then {
				_hitpoints = ["HitLFWheel","HitLF2Wheel","HitRF2Wheel","HitLBWheel","HitRFWheel","HitRBWheel","HitLMWheel","HitRMWheel","HitFuel","HitEngine","HitBody"];
				_hitpointsText = [localize "STR_NOTF_VehPartLFWheel",localize "STR_NOTF_VehPartLF2Wheel",localize "STR_NOTF_VehPartRF2Wheel",localize "STR_NOTF_VehPartLBWheel",localize "STR_NOTF_VehPartRFWheel",localize "STR_NOTF_VehPartRBWheel",localize "STR_NOTF_VehPartLMWheel",localize "STR_NOTF_VehPartRMWheel",localize "STR_NOTF_VehPartFuel",localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartHull"];
				_critical = 4;
			} else {
				_hitpoints = ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitFuel","HitEngine","HitBody"];
				_hitpointsText = [localize "STR_NOTF_VehPartLFWheel",localize "STR_NOTF_VehPartLBWheel",localize "STR_NOTF_VehPartRFWheel",localize "STR_NOTF_VehPartRBWheel",localize "STR_NOTF_VehPartFuel",localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartHull"];
				_critical = 3;
			};
		};
		
		case (_veh isKindOf "Ship"): {
			_hitpoints = ["HitEngine","HitBody"];
			_hitpointsText = [localize "STR_NOTF_VehPartEngine",localize "STR_NOTF_VehPartHull"];
			_critical = 2;
		};

	};
	
	if (EQUAL(_hitpoints,[])) exitWith {hint localize "STR_NOTF_VehUnknow"};
	
	{
		if (_veh getHitPointDamage _x > 0.65) then {
			_parts pushBack (_hitpointsText select _forEachIndex);
			_partsText = _partsText + format["- %1<br />",_hitpointsText select _forEachIndex];
		};
	} forEach _hitpoints;
	
	private _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");	
	
	if ((playerSide in [civilian,independent]) && {(east countSide playableUnits) > LIFE_SETTINGS(getNumber,"life_med_min")} && {(count _parts) >= _critical} && {"Двигатель" in _parts}) exitWith {	
		hint parseText format["<t size='1.3' color='#ff0000' align='center'>"+ localize "STR_NOTF_VehDamage" +"<br/>%1</t><br /><br /><t align='left'>%2</t><br /><t align='left'>"+ localize "STR_NOTF_VehRepairNeedHelp" +"</t>",_displayName,_partsText];				
	};
	
	if !(EQUAL(_parts,[])) then {_sleep = _sleep * (count _parts)};
	
	hint parseText format["<t size='1.3' color='#ff0000' align='center'>"+ localize "STR_NOTF_VehDamage" +"<br/>%1</t><br /><br /><t align='left'>%2</t>",_displayName,_partsText];
	
	call UnionClient_actions_inUse;
	
	disableSerialization;
	private _upp = format[localize "STR_NOTF_Repairing",_displayName];		
	private _cP = 0;
		
	player say3D "repairme";
	titleText [_upp,"PLAIN"];
	while {true} do {
		_cP = _cP + 0.01;
		[_cP,"repair"] call UnionClient_system_progressBar;		
		if (_cP >= 1 OR !(NOTINVEH(player)) OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};	
		if !(EQUAL(ANIMSTATE,"acts_carfixingwheel")) then {			
			["Acts_carFixingWheel"] call UnionClient_system_animDo;
		};
		uiSleep _sleep;		
	};

	life_action_inUse = false;
	["life_progress"] call UnionClient_gui_DestroyRscLayer;
	
	if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

	["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;
	
	if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};	
	if !(NOTINVEH(player)) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"]};

	if (playerSide in [civilian,independent]) then {player removeItem "extItem_ItemRepairKit"};		
	_veh setDamage 0;
	titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
};