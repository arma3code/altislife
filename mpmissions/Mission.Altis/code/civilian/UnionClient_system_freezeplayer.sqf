/*

    Filename:   UnionClient_system_freezePlayer.sqf
    Project:    Union Altis Life RPG
    Author:     Merrick & Affect
    Steam:      76561198006439083 & 76561198053094990
    Web:        http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_admin"];
_admin = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(life_frozen) then {
    hint localize "STR_NOTF_Unfrozen";
    [1,format[localize "STR_ANOTF_Unfrozen",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",_admin];
    disableUserInput false;
    life_frozen = false;
} else {
    hint localize "STR_NOTF_Frozen";
    [1,format[localize "STR_ANOTF_Frozen",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",_admin];
    disableUserInput true;
    life_frozen = true;
};