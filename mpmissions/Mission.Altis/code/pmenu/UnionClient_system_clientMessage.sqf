/*

	Filename: 	UnionClient_system_clientMessage.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_msg","",[""]],
	["_from","",[""]],
	["_type",0,[0]],
	["_pos",[],[[]]]
];

if (EQUAL(_from,"")) exitWith {};

switch (_type) do {
	case 0 : {
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Новое сообщение<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>You<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from,_msg];

		["TextMessage",[format["Вы получили сообщение от %1",_from]]] call bis_fnc_showNotification;
		player say3D "sms";
		systemChat format[">>>Сообщение от %1: %2",_from,_msg];;
	};

	case 1 : {
		if !(ISPSIDE(west)) exitWith {};
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Новый вызов<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем полицейским<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from,_msg];

		["PoliceDispatch",[format["Запрос в полицию от: %1",_from]]] call bis_fnc_showNotification;

		[_from,_msg,_pos] call UnionClient_pmenu_addCallLog;

		player say3D "sms";
		systemChat format["---ВЫЗОВ ПОЛИЦИИ ОТ %1: %2",_from,_msg];
	};

	case 2 : {
		if (FETCH_CONST(life_adminlevel) < 1) exitWith {};
		hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Admins<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from,_msg];

		["AdminDispatch",[format["%1 сделал запрос админу!",_from]]] call bis_fnc_showNotification;
		player say3D "sms";
		[_from,_msg,_pos] call UnionClient_pmenu_addCallLog;
		systemChat format["???СООБЩЕНИЕ АДМИНУ ОТ %1: %2",_from,_msg];
	};

	case 3 : {
		hint parseText format ["<t color='#8a00ff'><t size='2'><t align='center'>Сообщение от админа<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>Админ<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["AdminMessage",["Вы получили сообщение от админа!"]] call bis_fnc_showNotification;
		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ОТ АДМИНА %1: %2",_from,_msg];
	};

	case 4 : {
		hint parseText format ["<t color='#8a00ff'><t size='2'><t align='center'>Сообщение от админа<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>Админ<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["AdminMessage",["Вы получили сообщение от админа!"]] call bis_fnc_showNotification;
		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ОТ АДМИНА %1: %2",_from,_msg];
	};

	case 5: {
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>ВЫЗОВ МЧС<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from,_msg];

		["TextMessage",[format["Вызов МЧС от %1",_from]]] call bis_fnc_showNotification;
		player say3D "sms";
		[_from,_msg,_pos] call UnionClient_pmenu_addCallLog;
		systemChat format["!!!ВЫЗОВ МЧС: %1",_msg];
	};

	case 6 : {
		hint parseText format ["<t color='#0e83e6'><t size='2'><t align='center'>Полицейское сообщение<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>Полиция<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["PoliceDispatch",["Вы получили сообщение от полиции!"]] call bis_fnc_showNotification;
		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ОТ ПОЛИЦИИ: %1",_msg];
		if (life_coplevel > 0) then {systemChat format["Отправлено полицейским: %1", _from]};
	};

	case 7 : {
		hint parseText format ["<t color='#ff0000'><t size='2'><t align='center'>Сообщение от МЧС<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>МЧС<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		["MedicMessage",["Вы получили сообщение от МЧС!"]] call bis_fnc_showNotification;
		player say3D "sms";
		systemChat format["!!!СООБЩЕНИЕ ОТ МЧС: %1",_msg];
		if (life_coplevel > 0) then {systemChat format["Отправлено сотрудником МЧС: %1", _from]};
	};

	case 8 : {
		if !(license_civ_taxi) exitWith {};
		hint parseText format ["<t color='#d6aa07'><t size='2'><t align='center'>Вызов такси<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Такси Алтиса<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from,_msg];

		["TaxiMessage",[format["%1 сделал запрос такси!",_from]]] call bis_fnc_showNotification;
		player say3D "sms";
		[_from,_msg,_pos] call UnionClient_pmenu_addCallLog;
		systemChat format["ВЫЗОВ ТАКСИ ОТ %1: %2",_from,_msg];
	};
	case 9: {
		hint parseText format ["<t color='#ff0000'><t size='2'><t align='center'>Сообщение от 7NEWS<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>7NEWS<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		player say3D "sms";
		systemChat format["СООБЩЕНИЕ ОТ 7NEWS: %1",_msg];
		if (life_coplevel > 0) then {systemChat format["Отправлено сотрудником 7NEWS: %1", _from]};
	};
};