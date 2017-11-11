/*

    Filename:   UnionClient_admin_teleport.sqf
    Project:    Union Altis Life RPG
    Author:     Merrick & Affect
    Steam:      76561198006439083 & 76561198053094990
    Web:        http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

[] spawn {
while {dialog} do {
closeDialog 0;
uiSleep 0.01;
};
};

tele={
    _pos = [_this select 0, _this select 1, _this select 2];
    (vehicle player) setpos [_pos select 0, _pos select 1, 0];
    onMapSingleClick "";
    openMap [false, false];
    hint "Вы телепортировались в указанную точку";
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";