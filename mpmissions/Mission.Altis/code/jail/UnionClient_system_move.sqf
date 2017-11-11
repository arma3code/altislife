/*

	Filename: 	UnionClient_system_move.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	_this addAction["<t color='#07C945'>Переместиться в столовую",{[player,'stolovaya'] call UnionClient_system_move}];
	_this addAction["<t color='#07C945'>Переместиться на переработку",{[player,'pererabotka'] call UnionClient_system_move}];
	_this addAction["<t color='#07C945'>Переместиться во двор",{[player,'dvor'] call UnionClient_system_move}];
	_this addAction["<t color='#07C945'>Переместиться на баскетбольную площадку",{[player,'playground'] call UnionClient_system_move}];
	_this addAction["<t color='#07C945'>Переместиться на добычу",{[player,'dobicha'] call UnionClient_system_move}];
	_this addAction["<t color='#07C945'>Переместиться в главный корпус",{[player,'turma'] call UnionClient_system_move}];
*/
#include "..\..\script_macros.hpp"
if (!alive player) exitWith {};
if (vehicle player != player) exitWith {hint "Пожалуйста, выйдите из машины";};
if (!life_is_arrested) exitWith {hint "Вы должны быть в тюрьме."};
private _unit = param [0,objNull,[objNull]];
private _target = param [1,"",[""]];

_guardtime = random [5,10,15];
_action = [
			"Готовы отправиться?",
			"Тюрьма",
			"Да",
			"Нет"
		] call BIS_fnc_guiMessage;

if (_action) then {
		hint "Ожидайте прибытия охранника...";
		sleep _guardtime;
		switch (_target) do
		{
			case "stolovaya":
			{
					titleText ["Вас переводят в другой участок","BLACK",1];
					uisleep 2;
					player setPos (getMarkerPos "stolovaya");
					titleText ["","BLACK IN"];
					hint "";
			};
			case "pererabotka":
			{
					titleText ["Вас переводят в другой участок","BLACK",1];
					uisleep 2;
					player setPos (getMarkerPos "pererabotka");
					titleText ["","BLACK IN"];
					hint "";
			};
			case "dvor":
			{
					titleText ["Вас переводят в другой участок","BLACK",1];
					uisleep 2;
					player setPos (getMarkerPos "dvor");
					titleText ["","BLACK IN"];
					hint "";
			};
			case "playground":
			{
					titleText ["Вас переводят в другой участок","BLACK",1];
					uisleep 2;
					player setPos (getMarkerPos "playground");
					titleText ["","BLACK IN"];
					hint "";
			};
			case "dobicha":
			{
					titleText ["Вас переводят в другой участок","BLACK",1];
					uisleep 2;
					player setPos (getMarkerPos "dobicha");
					titleText ["","BLACK IN"];
					hint "";
			};
			case "turma":
			{
					titleText ["Вас переводят в другой участок","BLACK",1];
					uisleep 2;
					player setPos (getMarkerPos "turma");
					titleText ["","BLACK IN"];
					hint "";
			};
		};
} else {};
