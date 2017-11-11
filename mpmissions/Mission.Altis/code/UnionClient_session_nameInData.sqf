/*

	Filename: 	UnionClient_session_nameInData.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_session_completed) exitWith {};

cutText["На острове уже есть житель с таким же именем. Измените его в своем профиле на уникальный","BLACK FADED"];
0 cutFadeOut 999999999;

["NameAlreadyInBasa",false,false] call BIS_fnc_endMission;