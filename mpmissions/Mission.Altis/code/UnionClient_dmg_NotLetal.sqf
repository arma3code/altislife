/*

	Filename: 	UnionClient_dmg_NotLetal.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params ["_unit","_shooter","_projectile"];
if (!isNull life_DraggedBody) then {[] call UnionClient_system_dropDeadBody};
switch (_projectile) do {
	//тейзер
	case "DDOPP_B_Taser" : {
		if ((_unit distance _shooter) < 35) then {
			if (!(_unit GVAR ["tazed",false]) && !(GVAR_RESTRAINED(_unit))) then {
				if (typeOf (objectParent _unit) in (LIFE_SETTINGS(getArray,"life_med_ejectFrom"))) then {
					_unit action ["Eject",objectParent _unit];
					[_unit,_shooter] spawn UnionClient_system_tazed;
				} else {
					[_unit,_shooter] spawn UnionClient_system_tazed;
				};
			};
		};
	};
	//пейнтбол
	case "Caseless_blau" : {
		if (NOTINVEH(_unit) && (_unit GVAR ["inPBfight",false]) && !(_unit GVAR ["colored",false]) && !(GVAR_RESTRAINED(_unit))) then {
			[_unit,_shooter] spawn UnionClient_paintball_Colored;
		};
	};
	default {};
};