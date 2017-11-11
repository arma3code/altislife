#include "\UnionServer\script_macros.hpp"
/*
	File: fn_acceptedTaxiCall.sqf
	Author: © Cal Park
*/

_taxiDriver = _this select 0;
_target = _this select 1;

TaxiCalls = TaxiCalls - [_target];
{ [1,TaxiCalls] remoteExec ["life_fnc_taxi_respond",_x]; } forEach TaxiDriversOnDuty; // call Taxidrivers
TaxiDriversOnDuty = TaxiDriversOnDuty - [_taxiDriver];
