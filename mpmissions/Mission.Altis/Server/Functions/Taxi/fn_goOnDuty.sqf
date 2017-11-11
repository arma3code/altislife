#include "\UnionServer\script_macros.hpp"
/*
	File: fn_goOnDuty.sqf
	Author: © Cal Park
*/

_driver = _this select 0;

if (isNil "TaxiDriversOnDuty") then { TaxiDriversOnDuty = []; };
if (isNil "TaxiCalls") then { TaxiCalls = []; };
if !(_driver in TaxiDriversOnDuty) then {TaxiDriversOnDuty = TaxiDriversOnDuty + [_driver];};
[1,TaxiCalls] remoteExec ["life_fnc_taxi_respond",_driver];
