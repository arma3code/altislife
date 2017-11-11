/*
	Filename: 	fn_ServerCommand.sqf

	Description:
	serverCommand
*/
#include "\UnionServer\script_macros.hpp"
params ["_command","_param1","_reason","_log"];
private _password = FETCH_CONFIG2(getText,"CfgPatches","UnionServer","pass");
switch (_command) do {
	case "shutdown": { _password serverCommand "#shutdown" };
	//case "message": { [0,"BattleEye Client: (Global) Admin: asdasdasd"] remoteExecCall ["UnionClient_system_broadcast",-2]; };
	case "lock": { _password serverCommand "#lock" };
	case "unlock": { _password serverCommand "#unlock" };
	case "kick": {
		if (_param1 isEqualType objNull) then{
			_param1 = getPlayerUID _param1;
		};
		if !(_param1 isEqualTo "") then{
			_password serverCommand format ["#kick %1",_param1];
			["KICKLOG",format ["KICK UID:%1 || LOG:%2",_param1, _log]] call TON_fnc_customLog;
		};
	};
	case "ban": {
		if (_param1 isEqualType objNull) then{
			_param1 = getPlayerUID _param1;
		};
		if !(_param1 isEqualTo "") then{
			_password serverCommand format ['#exec ban "%1"',_param1];
			["PERMBAN",format ["BAN UID:%1 || REASON:%2 || LOG:%3",_param1, _reason, _log]] call TON_fnc_customLog;
		};
	};
	case "ddosts": {
		if (server_ddos_ts) then {
		server_ddos_ts = false;
		publicVariable "server_ddos_ts";
		[0,"Внимание! На TS3 сервере завершились магнитные бури."] remoteExecCall ["UnionClient_system_broadcast",-2];
		} else {
		server_ddos_ts = true;
		publicVariable "server_ddos_ts";
		[0,"Внимание! На TS3 сервере наблюдаются магнитные бури. Возможны перебои со связью."] remoteExecCall ["UnionClient_system_broadcast",-2];
		};
	};
	case "ddosserver": {
		if (server_ddos_air) then {
		server_ddos_air = false;
		publicVariable "server_ddos_air";
		[0,"Внимание! На острове окончились магнитные бури. Воздушная техника доступна."] remoteExecCall ["UnionClient_system_broadcast",-2];
		} else {
		server_ddos_air = true;
		publicVariable "server_ddos_air";
		[0,"Внимание! На острове наблюдаются магнитные бури. Воздушная техника временно недоступна."] remoteExecCall ["UnionClient_system_broadcast",-2];
		};
	};
};
