params [
    ["_vid",0,[0]],
    ["_id","",[""]],
	["_unit",objNull,[objNull]]
];
//[_vid,steamid,player] remoteExecCall ["TON_fnc_changeVehicleServerMap",RSERV];

[format ["UPDATE vehicles SET servermap='%2', spname='none' WHERE id='%1'",_vid,worldName],2] call DB_fnc_asyncCall;
["Вы заплатили за транспортировку техники, заберите ее в любом гараже.","done"] remoteExecCall ["UnionClient_system_hint",(owner _unit)];