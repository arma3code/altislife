/*

	Filename: 	UnionClient_system_goMedicAsCadet.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_action","_price"];
if(true)exitWith {hint "Временно отключено"};
_price = 30000;
_action = [
	format["Вы собираетесь вступить в ряди МЧС в качестве кадета. Вступительный взнос составляет $%1 и даст вам возможность спасать жизни и помогать гражданам в трудный момент. Не забудьте изучить правила сотрудников МЧС! Вы согласны?",[_price] call UnionClient_system_numberText],"Вступление в МЧС","Да","Отказаться"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _price) exitWith {hint "У вас недостаточно денег на счету"};
	["atm","take",_price,"goMedicAsCadet"] call UnionClient_system_myCash;
	hint "Отправка запроса на сервер...";
	[player,steamid] remoteExecCall ["TON_fnc_goMedic",RSERV];
};