/*

	Filename: 	UnionClient_system_punishment.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
private _type = param [1,0,[0]];
if (isNull _unit) exitWith {};

switch (_type) do {
    case 1: {//килл в зеленой зоне
        life_karma = 0;
        life_jail_time = 180;
    	[player,true,life_jail_time] call UnionClient_system_jail;
        [parseText "<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Вы были наказаны!<br/><br/></t>Вы были наказаны за убийство в зеленой зоне.<br/>Вы были помещены в тюрьму на 180 минут без возможности выкупа.<br/><br/> <t color='#9cff00'>Соблюдайте правила!</t></t>",[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
    	systemChat "Вы были наказаны за убийство в зеленой зоне. Вы были помещены в тюрьму на 180 минут без возможности выкупа.";
        _logText = format["%1 %2 was punished for SAFEZONE KILL",GVAR_RNAME(player),steamid];
        ["PUNISH",_logText] remoteExecCall ["TON_fnc_customLog",RSERV];
        ["up",1] call UnionClient_system_updateKarma;
    };
    case 2: {//заход в круг смерти
        life_karma = 0;
        life_jail_time = 45;
        [player,true,life_jail_time] call UnionClient_system_jail;
        [parseText "<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Вы были наказаны!<br/><br/></t>Вы были наказаны за нарушение правила новой жизни.<br/>Вы были помещены в тюрьму на 45 минут без возможности выкупа.<br/><br/> <t color='#9cff00'>Соблюдайте правила!</t></t>",[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
        systemChat "Вы были наказаны за нарушение правила новой жизни. Вы были помещены в тюрьму на 45 минут без возможности выкупа.";
        _logText = format["%1 %2 was punished for NEW LIFE ZONE",GVAR_RNAME(player),steamid];
        ["PUNISH",_logText] remoteExecCall ["TON_fnc_customLog",RSERV];
        ["up",1] call UnionClient_system_updateKarma;
    };
};
