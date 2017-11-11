/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Answers the query request to create the vehicle in the database.
*/
private ["_uid","_side","_type","_classname","_color","_plate","_basePrice","_material"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_vehicle = [_this,2,objNull,[objNull]] call BIS_fnc_param;
_color = [_this,3,"",[""]] call BIS_fnc_param;
////
_material = [_this,4,"",[""]] call BIS_fnc_param;
_basePrice = [_this,5,0,[0]] call BIS_fnc_param;

//Error checks
if (_uid isEqualTo "" || _side isEqualTo sideUnknown || isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch (true) do {
    case (_vehicle isKindOf "Car"): {"Car"};
    case (_vehicle isKindOf "Air"): {"Air"};
    case (_vehicle isKindOf "Ship"): {"Ship"};
};

_side = switch (_side) do {
    case west: {"cop"};
    case east: {"med"};
    case civilian: {"civ"};
    case independent: {"reb"};
    default {"Error"};
};

_plate = round(random(1000000));
//из-за того, что я не хочу видеть пустые значения в базе данных - добавляем цвет\материал, если его нет.
if (_color isEqualTo "") then {_color = "default"};
if (_material isEqualTo "") then {_material = "default"};
//////////////////////////////////////////////////////////
[_uid,_side,_type,_classname,_color,_plate,_basePrice,_material] call DB_fnc_insertVehicle;
_vehicle setVariable ["dbInfo",[_uid,_plate],true];
