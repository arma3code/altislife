#include "\UnionServer\script_macros.hpp"
/*
    File: fn_vehicleParkingStore.sqf
    Description:Отправляем технику на штрафстоянку
    Ставит на технике spname штрафстоянки, снимает с игрока деньги
*/
params [
	["_vehicle",ObjNull,[ObjNull]],
	["_parkingCost",0,[0]],
	["_parkingMessage","",[""]],
	["_unit",ObjNull,[ObjNull]]
];
["atm","take",_price] remoteExecCall ["UnionClient_system_myCash",(owner _unit)];
private _dbInfo = _vehicle getvariable ["dbInfo",[]];
private _pid = _dbInfo select 0;
private _plate = _dbInfo select 1;
//удалить

private _query = format ["UPDATE vehicles SET active = '0', parking='[%1,""%2""]' WHERE pid='%3' AND plate='%4'",_parkingCost,_parkingMessage,_pid,_plate];
[_query,1] call DB_fnc_asyncCall;

life_impound_inuse = false;
(owner _unit) publicVariableClient "life_impound_inuse";
if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

[] remoteExecCall ["UnionClient_parking_ImpoundActionDone",(owner _unit)];
