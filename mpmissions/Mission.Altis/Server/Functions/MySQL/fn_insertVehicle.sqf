/*
    File: fn_insertVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the vehicle into the database
*/
private ["_query","_sql"];
params [
    "_uid",
    "_side",
    "_type",
    "_className",
    ["_color","default",[""]],
    ["_plate",0,[0]],
	["_basePrice",0,[0]],
    ["_material","default",[""]]
];

//Stop bad data being passed.   
if (_uid isEqualTo "" || _side isEqualTo "" || _type isEqualTo "" || _className isEqualTo "" || _color isEqualTo "" || _plate isEqualTo -1 || _material isEqualTo "") exitWith {
    diag_log "--------------Error in InsertVehicle-----------";
    diag_log [_uid,_side,_type,_className,_material,_plate,_basePrice,_material];
    diag_log "--------------Error in InsertVehicle-----------";
};

_query = format ["INSERT INTO vehicles (side, classname, type, pid, alive, active, inventory, color, plate, gear, damage, baseprice, spname, material, parking, servermap, tuning_data) VALUES ('%1', '%2', '%3', '%4', '1','1','""[[],0]""', '%5', '%6','""[]""','""[]""', '%7', 'none', '%8', '[]', '%9','[]')",_side,_className,_type,_uid,_color,_plate,_basePrice,_material, worldName];

[_query,1] call DB_fnc_asyncCall;
