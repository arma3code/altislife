/*

	Filename: 	UnionClient_system_vehicleAnimate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]]	
];

if (isNull _vehicle) exitwith {};

private _className = typeOf _vehicle;

private "_animate";
switch (playerSide) do {
	case west: {
		if (EQUAL(_className,"C_Hatchback_01_sport_F")) then {_animate = "cop_sporthb"};
		if (EQUAL(_className,"EXT_W_Offroad_01_F")) then {_animate = "cop_offroad"};
		if (EQUAL(_className,"O_Heli_Transport_04_bench_F")) then {_animate = "cop_taru"};
		if (_className in ["B_UAV_02_F","B_UGV_01_F"]) then {createVehicleCrew _vehicle};
		if (_className in ["ext_ivory_rs4_police","ext_ivory_m3_police","ext_ivory_isf_police","ext_ivory_evox_police","ext_ivory_wrx_police"]) then {_animate = "cop_ivory"};
	};
	case civilian: {
		if (EQUAL(_className,"B_Heli_Light_01_F") && !([LIFE_SETTINGS(getText,"life_benchesForCivHumm")] call UnionClient_system_conditionsCheck)) then {_animate = "civ_littlebird"};
		if (EQUAL(_className,"C_Heli_Light_01_civil_F") && (license_civ_taxi)) then {_animate = "taxi_heli"};
	};
	case independent: {
		if (_className in ["I_UGV_01_F"]) then {createVehicleCrew _vehicle};
	};
	case east: {
		if (EQUAL(_className,"C_Offroad_01_F")) then {_animate = "med_offroad"};		
	};
};

if (EQUAL(_className,"extremo_lcm")) then {
	_vehicle enableVehicleCargo false;
};

if (isNil "_animate") exitWith {};

if (_animate isEqualType []) then {
	{
		_vehicle animate [_x select 0,_x select 1];
	} foreach _animate;
} else {
	switch (_animate) do {
		case "civ_littlebird": {			
			_vehicle animate ["addDoors",1];
			_vehicle animate ["addBenches",0];
			_vehicle animate ["addTread",0];
			_vehicle animate ["AddCivilian_hide",1];
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};

		case "taxi_heli": {			
			_vehicle animate ["AddDoors",1];
			_vehicle animate ["AddBackseats",1];
		};
		
		case "service_truck": {
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideDoor3", 1];
		};
		
		case "med_offroad": {
			_vehicle animate ["HidePolice", 0];			
		};
		
		case "cop_offroad": {
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1", 0];
			_vehicle animate ["HideDoor3", 0];
		};
		
		case "cop_sporthb": {
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1", 0];
		};
		
		case "cop_taru": {
			_vehicle animate ["Bench_default_hide", 1];
			_vehicle animate ["Bench_black_hide", 0];
		};
		
		case "cop_heli": {
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1", 0];			
		};

		case "cop_ivory": {			
			_vehicle animate["lbSystem_top",1]; 
			_vehicle animate["lbSystem_front",1]; 
			_vehicle animate["lbSystem_back",1]; 
			_vehicle animate["lbSystem_cage",1]; 
			_vehicle animate["lbSystem_rambar",1]; 
			_vehicle animate["lbSystem_radar",1]; 
			_vehicle animate["lbSystem_num",0];
		};
		default {};
	};
};