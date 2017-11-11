#include "\UnionServer\script_macros.hpp"
/*
    File: fn_vehicleParkingPay.sqf
    Description:Платим за оштрафованную технику
    Ставит на технике spname штрафстоянки, снимает с игрока деньги
*/
params [
	["_vid","",[0]],
	["_price",0,[0]],
	["_plate",0,[0]],
	["_pid","",[""]],
	["_unit",ObjNull,[ObjNull]]
];

["atm","take",_price] remoteExecCall ["UnionClient_system_myCash",(owner _unit)];

_query = format ["UPDATE vehicles SET parking='[]', spname = 'car_g_penalty' WHERE pid='%1' AND plate='%2' AND id='%3'",_pid,_plate,_vid];
[_query,1] call DB_fnc_asyncCall;


["Вы заплатили за эвакуацию техники, заберите ее на штрафстоянке","done"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];
