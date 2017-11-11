/*

	Filename: 	UnionClient_ltd_regAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/

#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 7100)) exitWith {};
if !(isNull (findDisplay 7100)) exitWith {hint "В разработке."; closedialog 0;};
if (life_action_inUse) exitWith {};
private _ltdName = ctrlText (CONTROL(7100,7102));
if (EQUAL(_ltdName,"")) exitWith {hint "Имя не задано"};
private _length = count (toArray(_ltdName));
private _ltdNameArray = toArray (_ltdName);
private _allowedArray = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ ");
private _space = (toArray " ") select 0;

if (BANK < 100000) exitWith {hint "У вас недостаточно денег на счету. Должно быть больше $100,000"};
if (_length < 5) exitWith {hint "Название должно содержать как минимум 5 символов"};
if (_length > 30) exitWith {hint "Название должно содержать не более 30 символов"};
if (EQUAL(_ltdNameArray select 0,_space)) exitWith {hint "Пробел в начале названия недопустим"};
if (EQUAL(_ltdNameArray select (_length-1),_space)) exitWith {hint "Пробел в конце названия недопустим"};

private _badChar = false;
{
	if !(_x in _allowedArray) exitWith {_badChar = true};
} foreach _ltdNameArray;
if (_badChar) exitWith {hint "Все сиволы в названии должны быть в верхнем регистре и содержать только латинские символы от A до Z"};

{
	if (EQUAL(_x,_space) && (EQUAL((_ltdNameArray select (_forEachIndex + 1)),_space))) exitWith {_badChar = true};
} foreach _ltdNameArray;
if (_badChar) exitWith {hint "Два пробела подряд запрещены"};

life_action_inUse = true;
(CONTROL(7100,7103)) ctrlEnable false;
[steamid,_ltdName,player] remoteExec ["TON_fnc_regAction",RSERV];
hint "Отправка запроса на сервер...";

true