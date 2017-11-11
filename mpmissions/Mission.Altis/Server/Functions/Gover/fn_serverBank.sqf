/*
	Filename: 	fn_serverBank.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

private ["_unit","_mode","_amount","_unit","_query"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_mode = [_this,1,"",[""]] call BIS_fnc_param;
_amount = [_this,2,-1,[0]] call BIS_fnc_param;

if (isNull _unit || _amount isEqualTo -1 || _mode isEqualTo "") exitWith {};
_unit = owner _unit;
switch (_mode) do {
	case "add": {
	    _query = format ["UPDATE rules SET serverbank=serverbank+'%1'",_amount];
		server_bank = server_bank + _amount;
	};
	case "take": {
		_query = format ["UPDATE rules SET serverbank=serverbank-'%1'",_amount];
		["atm","add",_amount] remoteExecCall ["UnionClient_system_myCash",_unit];
		server_bank = server_bank - _amount;
	};
};
life_action_inUse = false;
_unit publicVariableClient "life_action_inUse";
publicVariable "server_bank";
[_query,1] call DB_fnc_asyncCall;