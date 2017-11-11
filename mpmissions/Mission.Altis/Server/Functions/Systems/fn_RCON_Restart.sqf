/*

	Filename: 	fn_RCON_Restart.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "\UnionServer\script_macros.hpp"
_restarttimes = ["04:00:00","08:00:00","12:00:00","16:00:00","20:00:00","24:00:00"]; //HH:MM:SS
private _password = FETCH_CONFIG2(getText,"CfgPatches","UnionServer","pass");

_checkTimeRange = {
	_gottime = true;
	{
		_hardServerTime = _x splitString ":";
		_hardServerTimeHour = parseNumber (_hardServerTime select 0);
		_hardServerTimeMin  = parseNumber (_hardServerTime select 1);
		_hardServerTimeSec  = parseNumber (_hardServerTime select 2);

		_hardSecondsTime = (_hardServerTimeHour * 3600);
		_hardSecondsTime = (_hardSecondsTime + (_hardServerTimeMin * 60));
		_hardSecondsTime = (_hardSecondsTime + _hardServerTimeSec);

		_currentTimestamp = (call compile ("extDB3" callExtension "9:LOCAL_TIME")) select 1;
		_nowServerTimeHour = _currentTimestamp select 3;
		_nowServerTimeMin  = _currentTimestamp select 4;
		_nowServerTimeSec  = _currentTimestamp select 5;

		_nowSecondsTime = (_nowServerTimeHour * 3600);
		_nowSecondsTime = (_nowSecondsTime + (_nowServerTimeMin * 60));
		_nowSecondsTime = (_nowSecondsTime + _nowServerTimeSec);

		if( _nowSecondsTime < _hardSecondsTime ) then {
			if (_gottime) then{
				RESTART_difftime = _hardSecondsTime - _nowSecondsTime;
				_gottime = false;
			};
		};
	} forEach _restarttimes;
	RESTART_difftime
};

diag_log format ["[SERVER RESTART] -> RESTART TIMES ARE %1 - Next Restart in %2 Secounds", _restarttimes, "" call _checkTimeRange];


_120minCheck = false; _60minCheck = false; _30minCheck = false; _15minCheck = false; _10minCheck = false; _5minCheck = false; _3minCheck = false; _2minCheck = false; _1minCheck = false;

checkServerTime = true;
while {checkServerTime} do
{
	switch true do
	{
		case (( '' call _checkTimeRange <= (120*60) ) && !_120minCheck) :
		{
			_120minCheck = true;
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 2 часа!"] remoteExecCall ["UnionClient_system_broadcast",-2];
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 2 часа!"] remoteExecCall ["UnionClient_system_broadcast",-2];
		};
		case (( '' call _checkTimeRange <= (60*60) ) && !_60minCheck) :
		{
			_60minCheck = true;
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 1 час!"] remoteExecCall ["UnionClient_system_broadcast",-2];
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 1 час!"] remoteExecCall ["UnionClient_system_broadcast",-2];
		};
		case (( '' call _checkTimeRange <= (30*60) ) && !_30minCheck) :
		{
			_30minCheck = true;
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 30 минут!"] remoteExecCall ["UnionClient_system_broadcast",-2];
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 30 минут!"] remoteExecCall ["UnionClient_system_broadcast",-2];
		};
		case (( '' call _checkTimeRange <= (15*60) ) && !_15minCheck) :
		{
			_30minCheck = true; _15minCheck = true;
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 15 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["UnionClient_system_broadcast",-2];
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 15 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["UnionClient_system_broadcast",-2];
		};
		case (( '' call _checkTimeRange <= (10*60) ) && !_10minCheck) :
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true;
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 10 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["UnionClient_system_broadcast",-2];
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 10 минут! Сервер будет закрыт за 5 минут до рестарта.."] remoteExecCall ["UnionClient_system_broadcast",-2];

		};
		case (( '' call _checkTimeRange <= (5*60) ) && !_5minCheck) :
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true; _5minCheck = true;
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 5 минут! Не забудьте синхронизировать данные. Сервер будет закрыт до перезагрузки."] remoteExecCall ["UnionClient_system_broadcast",-2];
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 5 минут! Не забудьте синхронизировать данные. Сервер будет закрыт до перезагрузки."] remoteExecCall ["UnionClient_system_broadcast",-2];
			[format ["<t size='2.5'><t color='#f71414' align='center'>Внимание!</t></t><br/><br/><t size='1.5'align='center'>Надвигается сильная буря. Все магазины закрыты.</t>"],"warning"] remoteExecCall ["UnionClient_system_hint",-2];
			server_restartSoon = true;
			publicVariable "server_restartSoon";
		};
		case (( '' call _checkTimeRange <= (3*60) ) && !_3minCheck) :
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true; _5minCheck = true; _3minCheck = true;
			//[] remoteExec ["UnionClient_effects_Restart",0];
			_password serverCommand "#lock";
		};
		case (( '' call _checkTimeRange <= (2*60) ) && !_2minCheck) :
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true; _5minCheck = true; _3minCheck = true; _2minCheck = true;
		};
		case (( '' call _checkTimeRange  <= (1*60) ) && !_1minCheck) :
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true; _5minCheck = true; _3minCheck = true; _2minCheck = true; _1minCheck = true;
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 1 минуту!"] remoteExecCall ["UnionClient_system_broadcast",-2];
			[0,"BattleEye Client: (Global) Admin: Сервер будет перезагружен через 1 минуту!"] remoteExecCall ["UnionClient_system_broadcast",-2];
			
			{
				remoteExecCall ["UnionClient_session_syncData",_x];
				uiSleep 0.2;
				_password serverCommand format ["#kick %1",getPlayerUID _x];
			} foreach allPlayers;
			uiSleep 30;
			uiSleep 30;
			checkServerTime = false;
			_password serverCommand "#shutdown";
		};
	};
	uiSleep 1;
};