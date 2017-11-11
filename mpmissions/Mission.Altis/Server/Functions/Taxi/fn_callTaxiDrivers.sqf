#include "\UnionServer\script_macros.hpp"
/*
	File: fn_callTaxiDrivers.sqf
	Author: © Cal Park
*/

// Get Parameters

_player = [_this, 0, objNull] call BIS_fnc_param;

// Exceptions
if (_player isEqualTo objNull) exitWith {};
if (isNil "TaxiDriversOnDuty") then { TaxiDriversOnDuty = []; };
if (isNil "TaxiCalls") then { TaxiCalls = []; };

//diag_log format ["((1)) Водителей на службе: %1 || Активные вызовы: %2",TaxiDriversOnDuty,TaxiCalls];

// Code
[8] remoteExec ["life_fnc_taxi_respond",_player];
sleep 10;
if (isNil "TaxiDriversOnDuty") exitWith { [4] remoteExec ["life_fnc_taxi_respond",_player]; };

TaxiCalls = TaxiCalls + [_player];

{ [9,TaxiCalls] remoteExec ["life_fnc_taxi_respond",_x]; } forEach TaxiDriversOnDuty; // call Taxidrivers

//diag_log format ["((2)) Водителей на службе: %1 || Активные вызовы: %2",TaxiDriversOnDuty,TaxiCalls];

[_player] spawn {
	_player = _this select 0;
	sleep 90;
	if (_player in TaxiCalls) then {
		TaxiCalls = TaxiCalls - [_player];
		[3] remoteExec ["life_fnc_taxi_respond",_player];
		{ [1,TaxiCalls] remoteExec ["life_fnc_taxi_respond",_x]; } forEach TaxiDriversOnDuty;
	};
};
