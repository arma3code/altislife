/*
	
	Filename: 	UnionClient_gangs_InfoAdd.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _mW = ctrlText (CONTROL(4200,4201)); //средние
private _lW = ctrlText (CONTROL(4200,4202)); //длинные

if (EQUAL(_mW,"") OR (EQUAL(_lW,""))) exitWith {hint "Должны быть заполнены оба поля"};
if (!([_mW] call UnionClient_system_isFlatnumber) OR !([_lW] call UnionClient_system_isFlatnumber)) exitWith {hint "Значения должны быть цифровыми"};

private _gangInfo = [_mW,_lW];
grpPlayer SVAR ["gang_info",_gangInfo,true];

[[7,grpPlayer,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;

[format["<t size='1.8' color='#ffa200'>Внимание! Были изменены частоты рации!</t><br/><br/>Средние волны: <t color='#fff000'>%1</t><br/>Длинные волны: <t color='#fff000'>%2</t>",_mW,_lW],"done"] remoteExecCall ["UnionClient_system_hint",grpPlayer];

closeDialog 0;