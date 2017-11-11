/*

	Filename: 	UnionClient_system_newMsg.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;

params [
	["_type",-1,[0]],
	["_playerData",-1,[0]],
	["_msg","",[""]]
];

if (EQUAL(_type,-1)) exitWith {};

private _cPlayerList = CONTROL(88888,88881);
private _cMessageEdit = CONTROL(88888,88884);

private _isPhone = [] call UnionClient_system_canUsePhone;
private _canUse = if (player GVAR ["tf_unable_to_use_radio",false]) then {false} else {true};
switch(_type) do {
	case 0: {
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Сообщение для: %1",GVAR_RNAME(life_smartphoneTarget)]];
		if (FETCH_CONST(life_adminlevel) < 1) then {
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1: {
		if (!(_isPhone)) exitWith {hint localize "STR_SMARTPHONE_NoPhone"};
		if !(_canUse) exitWith {hint "Вы не можете пользоваться телефоном со связанными руками"};
		if !(life_smartphoneTarget isEqualType objNull) exitWith {hint "Абонент недоступен"};
		if (isNull life_smartphoneTarget) exitWith {hint "Абонент недоступен"};
		ctrlShow[88885, false];
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";ctrlShow[88885, true];};

		[[life_smartphoneTarget,_msg,player,0],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Вы отправили для %1 сообщение: %2",GVAR_RNAME(life_smartphoneTarget),_msg];
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2: {
		if (!(_isPhone)) exitWith {hint localize "STR_SMARTPHONE_NoPhone"};
		if !(_canUse) exitWith {hint "Вы не можете пользоваться телефоном со связанными руками"};
		if(west countSide playableUnits == 0) exitWith {hint format["Полиция в данный момент недоступна. Пожалуйста, повторите ваш запрос позже"];};
		ctrlShow[888895,false];
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";ctrlShow[888895,true];};

		[[ObjNull,_msg,player,1],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Вы отправили для %1 сообщение: %2","The Police",_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3: {
		ctrlShow[888896,false];
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";ctrlShow[888896,true];};

		[[ObjNull,_msg,player,2],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Вы отправили для %1 сообщение: %2","The Admins",_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4: {
		if (!(_isPhone)) exitWith {hint localize "STR_SMARTPHONE_NoPhone"};
		if !(_canUse) exitWith {hint "Вы не можете пользоваться телефоном со связанными руками"};
		if (east countSide playableUnits == 0) exitWith {hint format["МЧС в данный момент недоступно. Пожалуйста, повторите ваш запрос позже"];};
		ctrlShow[888899,false];
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";ctrlShow[888899,true];};

		[[ObjNull,_msg,player,3],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Вы отправили сообщение в МЧС",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5: {
		if (FETCH_CONST(life_adminlevel) < 1) exitWith {hint "Вы не админ!";};
		if !(life_smartphoneTarget isEqualType objNull) exitWith {hint "Абонент недоступен"};
		if (isNull life_smartphoneTarget) exitWith {hint "Абонент недоступен"};
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";};

		[[life_smartphoneTarget,_msg,player,4],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Admin Message Sent To: %1 - Message: %2",GVAR_RNAME(life_smartphoneTarget),_msg];
		closeDialog 88883;
	};

	//emergencyloading
	case 6: {
		if (FETCH_CONST(life_adminlevel) < 1) then {
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};

		if (life_coplevel < 1) then {
			ctrlShow[888900,false];
			ctrlShow[888895,true];

			ctrlShow[888901,false];
			ctrlShow[888902,false];
			ctrlShow[888903,false];
			ctrlShow[888904,false];
			ctrlShow[888909,false];
		} else {
			ctrlShow[888900,true];
			ctrlShow[888895,false];
		};

		if (life_medicLevel < 1) then {
			ctrlShow[888899,true];
			ctrlShow[888905,false];
		} else {
			ctrlShow[888899,false];
			ctrlShow[888905,true];
		};

		if !(license_civ_press) then {
			ctrlShow[888908,false];
		};
	};

	//adminMsgAll
	case 7: {
		if (FETCH_CONST(life_adminlevel) < 1) exitWith {hint "Вы не админ!";};
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";};

		[[ObjNull,_msg,player,5],"handleMessages"] call UnionClient_system_hcExec;
		["db_log",[format["Admin message for all -> %1",_msg]],GVAR_RNAME(player),steamid] remoteExecCall ["TON_fnc_LogIt",RSERV];

		hint format["Админское сообщение для всех: %1",_msg];
		closeDialog 887890;
	};
	//PoliceMsgAll
	case 8: {
		if (life_coplevel < 1) exitWith {hint "Вы не полицейский!";};
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";};

		[[ObjNull,_msg,player,6],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Полицейское сообщение для всех: %1",_msg];
		closeDialog 887890;
	};
	//MedicMsgAll
	case 9: {
		if (life_medicLevel < 1) exitWith {hint "Вы не сотрудник МЧС!";};
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";};

		[[ObjNull,_msg,player,7],"handleMessages"] call UnionClient_system_hcExec;

		hint format["МЧС сообщение для всех: %1",_msg];
		closeDialog 887890;
	};
	//В такси
	case 10: {
		if !(_isPhone) exitWith {hint localize "STR_SMARTPHONE_NoPhone"};
		if !(_canUse) exitWith {hint "Вы не можете пользоваться телефоном со связанными руками"};
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";};

		[[ObjNull,_msg,player,8],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Вы отправили запрос в ТАКСИ\n\n%1",_msg];
		closeDialog 887890;
	};
	//7newsMsgAll
	case 11: {
		if !(license_civ_press) exitWith {hint "Вы не сотрудник 7news!"};
		if (life_civlevel < 3) exitWith {hint "У вас не 3-ий уровень"};
		if (EQUAL(_msg,"")) exitWith {hint "Сообщение не может быть пустым!";};

		[[ObjNull,_msg,player,9],"handleMessages"] call UnionClient_system_hcExec;

		hint format["Сообщение от 7NEWS для всех: %1",_msg];
		closeDialog 887890;
	};
};