/*
	
	Filename: 	UnionClient_session_logoutOnRestrart.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
closeDialog 0;
(findDisplay 46) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

cutText ["","BLACK",6];
_text = "<t size='1.3' color='#ccff00'>До новых встреч,<br/>%1!</t><br/><br/><t size='0.6'>Идет сохранение данных на сервере...</t>";
[format[_text,name player],0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;

[] call UnionClient_session_updateRequest; //call our silent sync.

sleep 3;

["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
["Aborted",true,false] call BIS_fnc_endMission;