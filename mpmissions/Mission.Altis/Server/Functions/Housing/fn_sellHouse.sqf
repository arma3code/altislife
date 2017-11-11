/*
	Filename: 	fn_sellHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Used in selling the house, sets the owned to 0 and will cleanup with a
    stored procedure on restart.
*/
private "_query";
params [
    ["_house",objNull,[objNull]],
	["_price",0,[0]],
	["_player",objNull,[objNull]],
	["_uid","",[""]]
];

if (isNull _house OR isNull _player OR _uid isEqualTo "") exitWith {systemChat ":SERVER:sellHouse: House is null";};

private _id = owner _player;

_house setVariable ["house_sold",true,true];
private _houseID = _house getVariable ["house_id",-1];
_query = format ["UPDATE houses SET owned='0', pos='[]' WHERE id='%1' AND servermap='%2'",_houseID,WorldName];

[_query,1] call DB_fnc_asyncCall;

[_house,_price] remoteExecCall ["UnionClient_system_sellHouseDone",_id];
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;
["HOUSESELL",format ["HouseSell UID:%1 || PRICE:%2 мин",_uid, _price]] call TON_fnc_customLog;