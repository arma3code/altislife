/*
	
	Filename: 	UnionClient_delivery_getMission.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_nearVehicles","_vehicle","_to","_fromTitle","_toTitle","_box","_cargoDeliver","_price","_bigcargo","_box","_depoName"];
disableSerialization;
_control = CONTROL(4300,4302);
_to = _control lbData (lbCurSel _control);

closeDialog 0;

if (_to == "") exitWith {};

_nearVehicles = nearestObjects[getPosATL player,["LandVehicle"],25];
if(count _nearVehicles > 0) then {
	{
		if(!isNil "_vehicle") exitWith {}; //Kill the loop.
		_vehData = _x GVAR ["vehicle_info_owners",[]];		
		if(count _vehData  > 0 && (typeOf _x) in ["B_Truck_01_mover_F","C_Offroad_01_F","C_Van_01_transport_F"]) then {
			_vehOwner = (_vehData select 0) select 0;
			if((steamid) == _vehOwner) exitWith {
				_vehicle = _x;
			};
		};
	} foreach _nearVehicles;
};

if(isNil "_vehicle") exitWith {hint "Проверьте, чтобы ваш грузовик был рядом и повторите попытку"};
if(isNull _vehicle) exitWith {};
if(!(_vehicle in life_vehicles)) exitWith {hint "У вас нет ключей от это техники"};

_cargoDeliver = _vehicle GVAR ["cargoDeliver",[]];
if (count _cargoDeliver > 0) exitWith {hint "Вы уже взяли заказ на доставку"};
if (count (attachedObjects _vehicle) > 0) exitWith {hint "На вашей технике нет места для контейнера из-за модификация или другого контейнера..."};

_price = [str(life_depo),_to,typeOf _vehicle] call UnionClient_delivery_price;

switch (typeOf _vehicle) do
{
	case "B_Truck_01_mover_F": {
		_bigcargo = ["Land_Cargo10_blue_F","Land_Cargo10_cyan_F","Land_Cargo10_red_F","Land_Cargo10_sand_F","Land_Cargo10_white_F","Land_Cargo10_yellow_F","Land_Cargo10_orange_F"];
		_box = createVehicle [(_bigcargo select (floor(random (count _bigcargo)))), getMarkerPos "cargo_spawn", [], 0, "NONE"];	
		_box attachTo [_vehicle, [0, -3, 1]];	
		_box setVectorDirAndUp [[-1,0,0],[0,0,1]];
	};
	case "C_Offroad_01_F": {
		_box = createVehicle ["CargoNet_01_barrels_F", getMarkerPos "cargo_spawn", [], 0, "NONE"];
		_box attachTo [_vehicle, [-0.05, -2.1, -0.04]];
		_vehicle lockCargo true;
		_vehicle lockCargo [0, false];
	};
	case "C_Van_01_transport_F": {
		_box = createVehicle ["CargoNet_01_barrels_F", getMarkerPos "cargo_spawn", [], 0, "NONE"];
		_box attachTo [_vehicle, [0, -1.1, -0.04]]; 
		_box = createVehicle ["CargoNet_01_barrels_F", getMarkerPos "cargo_spawn", [], 0, "NONE"];		
		_box attachTo [_vehicle, [0, -2.6, -0.04]];
		_vehicle lockCargo true;
		_vehicle lockCargo [0, false];
		_vehicle lockCargo [1, false];
	};
};

_fromTitle = [str(life_depo)] call UnionClient_system_varToStr;
_toTitle = [_to] call UnionClient_system_varToStr;
_vehicle SVAR ["cargoDeliver",[str(life_depo),_to,_price],true];
hint format ["Вы взяли заказ на доставку груза из %1 в %2. Удачи на дороге!",_fromTitle,_toTitle];
