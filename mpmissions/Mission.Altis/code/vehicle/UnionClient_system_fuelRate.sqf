/*
	
	Filename: 	UnionClient_system_fuelRate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
private["_vehicle","_engineState","_fuelConsumption","_velocityOfVehicle","_newFuel"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_engineState = [_this,1,false,[true]] call BIS_fnc_param;

if (isNull _vehicle OR !_engineState) exitWith {};

while{isEngineOn _vehicle} do {
	_velocityOfVehicle = sqrt(((velocity _vehicle select 0)^2)+((velocity _vehicle select 1)^2))*3.6;

	_fuelConsumption = _velocityOfVehicle/500000 + 0.0001;
	if(_fuelConsumption > 0.002) then {
		_fuelConsumption = 0.002;
	};
	_newFuel = (fuel _vehicle)-_fuelConsumption;
	
	if(local (_vehicle)) then {
		_vehicle setFuel _newFuel;
	} else {		
		[_vehicle,_newFuel] remoteExecCall ["UnionClient_system_setFuel",_vehicle];
	};	
    
	if(fuel _vehicle < 0.2 && fuel _vehicle > 0.18) then {
		hint "У вас заканчивается бензин. Заправьтесь";
	} else {
		if(fuel _vehicle < 0.03) then {
			hint "У вас закончился бензин. Дальше пешком.";
		};
	};
	uiSleep 1;
};