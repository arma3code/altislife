#include "\UnionServer\script_macros.hpp"
/*
	File: fn_goOffDuty.sqf
	Author: © Cal Park
*/

_driver = _this select 0;
if (isNil "TaxiDriversOnDuty") then { TaxiDriversOnDuty = []; };
if (isNil "TaxiCalls") then { TaxiCalls = []; };
if (_driver in TaxiDriversOnDuty) then {TaxiDriversOnDuty = TaxiDriversOnDuty - [_driver];};
[7] remoteExec ["life_fnc_taxi_respond",_driver];
