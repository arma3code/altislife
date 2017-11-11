/*
	
	Filename: 	UnionClient_gangs_Info.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _gangInfo = grpPlayer GVAR ["gang_info",[]];
private _gangInfoText = if (count _gangInfo == 2) then {
	format["Средние волны: %1<br />Длинные волны: %2",_gangInfo select 0,_gangInfo select 1];
} else {
	"Данные не указаны";
};

[format["<t size='1.6' color='#f5be00'>%1</t><br /><br />%2",GANG_NAME,_gangInfoText],"info"] spawn UnionClient_system_hint;