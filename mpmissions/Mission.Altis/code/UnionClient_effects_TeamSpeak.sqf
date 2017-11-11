/*

	Filename: 	UnionClient_effects_TeamSpeak.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"

private["_server","_channel","_pluginEnabled","_error","_sleep","_channelError"];
_sleep = 5;
while {true} do {
	uiSleep (_sleep * 60);
	_error = "";
	_channelError = false;
	_server = [] call TFAR_fnc_getTeamSpeakServerName;
	_channel = [] call TFAR_fnc_getTeamSpeakChannelName;
	_pluginEnabled = [] call TFAR_fnc_isTeamSpeakPluginEnabled;

	switch(true) do {
		case (!_pluginEnabled): {_error = "У вас не включен плагин Task Force Arma 3 Radio! Зайдите в плагины TeamSpeak (Ctrl+Shift+P) и проверьте активен ли он. После этого нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>"}; //маловероятная ошибка, но важная
		case (!(EQUAL(_server,tf_radio_server_name))): {_error = format["Вы не подключены к TS-серверу Union! Наш сервер: <t color='#ffcc00'>ts.unionrp.ru</t><br/>Если вас автоматически не перекинет в канал <t color='#ffcc00'>%1</t>, то зайдите в плагины TeamSpeak (Ctrl+Shift+P) и нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>.",tf_radio_channel_name]}; //один идиот на 100 человек
		case (!(EQUAL(_channel,tf_radio_channel_name))): {
			_error = format["Вы должны быть в специальном канале TeamSpeak для игры на сервере! Плагин будет перезагружен и вас перекинет в канал <t color='#ffcc00'>%1</t>. Если это не сработает, то зайдите в плагины (Ctrl+Shift+P) и нажмите кнопку <t color='#ffcc00'>Обновить все/Reload ALL</t>.",tf_radio_channel_name];
			_channelError = true;
		}; //самая частая проблема
	};

	if (!(EQUAL(_error,""))) then {
		ADD(life_tfWarn,1);
		_sleep = 5;
		[format[" <t size='2.2' color='#ff0000' align='center'>Внимание!</t><br /><br />%1<br /><br />Это предупреждение номер %2 из 3.<br /><br />Следующая проверка через %3 минут! Исправьте ошибку или будете исключены из игры!</t>",_error,life_tfWarn,_sleep],"error"] spawn UnionClient_system_hint;
		if (_channelError) then {
			["processPlayerPositionsHandler", "onEachFrame"] call BIS_fnc_removestackedEventHandler;
			uiSleep 5;
			["processPlayerPositionsHandler", "onEachFrame", "TFAR_fnc_processPlayerPositions"] call BIS_fnc_addStackedEventHandler;
		};
	} else {
		life_tfWarn = 0;
		_sleep = 15;
	};
	if (server_ddos_ts) exitWith {};
	if (life_tfWarn > 2) exitWith {
		[0,format["%1 был исключен с сервера из-за нарушения правила нахождения в TeamSpeak",name player]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
		uiSleep 2;
		["TaskForce",false,false] call BIS_fnc_endMission;
	};
};