/*
	
	Filename: 	UnionClient_system_voteMenyLB.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_display","_text","_infoID","_tmp","_index","_info","_legal","_slavery"];
disableSerialization;
_display = findDisplay 3300;
_infoID = CONTROL_DATA(3301);
_index = [_infoID,server_candidates] call UnionClient_system_index;
if (_index == -1) exitWith{};
_info = (server_candidates select _index) select 3;
_text = _display displayCtrl 3302;

if ((_info select 1) == 1) then {_legal = "<t color='#72ff00'>Легальна</t>"} else {_legal = "<t color='#ff3600'>Нелегальна</t>"};
if ((_info select 2) == 1) then {_slavery = "<t color='#72ff00'>Легальна</t>"} else {_slavery = "<t color='#ff3600'>Нелегальна</t>"};

_tmp = format["<t size='1.2'>Предвыборная программа</t><br/><br/>Налог: %1%2<br/>Статус марихуаны: %3<br/>Работорговля: %4<br/>Порог бедности: $%5<br/>Кредитная ставка: %6%7",_info select 0,"%",_legal, _slavery,[_info select 3] call UnionClient_system_numberText,_info select 4,"%"];
_text ctrlSetStructuredText parseText _tmp;

//налог %,марихуана легальна ли,рабство легально ли,бедность порог,нал на кредит
/*
//id, имя, от кого, [нал,мариху,рабство,бедность,нал кредит]
[
["76561198012859301","Artos","Самовыдвиженец",[5,1,0,500000,5]],
["76561198075657852","Rus-DRON","Самовыдвиженец",[5,1,0,400000,5]],
["76561198068563619","Cosmo","Самовыдвиженец",[10,1,1,200000,5]]
]
*/