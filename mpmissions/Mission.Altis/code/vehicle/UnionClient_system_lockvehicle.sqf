/*
	File: fn_lockVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks the vehicle (used through the network when the person calling it isn't local).
*/
private["_vehicle","_state","_astate"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_state = [_this,1,2,[0,false]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_astate = switch (_state) do {
	case 0: {1};
	case 2: {0};
};

_vehicle lock _state;

switch (typeof _vehicle) do {
	case "O_MRAP_02_F": {		
		_vehicle animateDoor ["Door_LF", _astate];  
		_vehicle animateDoor ["Door_RF", _astate];
		_vehicle animateDoor ["Door_LM", _astate];
		_vehicle animateDoor ["Door_RM", _astate];
		_vehicle animateDoor 
		["Door_rear", _astate]; 
	};
	
	case "B_MRAP_01_F": {
		_vehicle animateDoor ["Door_LF", _astate];
		_vehicle animateDoor ["Door_RF", _astate];
		_vehicle animateDoor ["Door_LB", _astate];
		_vehicle animateDoor ["Door_RB", _astate];
	};
	
	case "I_MRAP_03_F": {
		_vehicle animateDoor ["Door_LF", _astate];
		_vehicle animateDoor ["Door_RF", _astate];
	};
	
	case "I_Heli_Transport_02_F": {
		_vehicle animateDoor ["Door_Back_L", _astate];
		_vehicle animateDoor ["Door_Back_R", _astate];
	};
	
	case "B_Heli_Light_01_F": {
		_vehicle animateDoor ["DoorL_Front_Open", _astate];
		_vehicle animateDoor ["DoorR_Front_Open", _astate];
		_vehicle animateDoor ["DoorL_Back_Open", _astate];
		_vehicle animateDoor ["DoorR_Back_Open", _astate];
	};
};