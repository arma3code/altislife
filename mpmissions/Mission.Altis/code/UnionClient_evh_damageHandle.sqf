/*

	Filename: 	UnionClient_evh_damageHandle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_hitPointIndex", "_instigator"];

//баг с определением патрона
if (_projectile isEqualType objNull) then {
	_projectile = typeOf _projectile;
	_this set [4, _projectile];
};

//не важные нам повреждения
if (EQUAL(_selection,"hands")) exitWith {_unit getHit "hands"};
if (EQUAL(_selection,"legs")) exitWith {_unit getHit "legs"};
if (EQUAL(_selection,"arms")) exitWith {_unit getHit "arms"};

//получаем данные о текущем уроне
private _currentDmg = [_unit getHitIndex _hitPointIndex, damage _unit] select (_hitPointIndex < 0);

format["DMG - U: %1 - SEL: %2 - D: %3 - SHO: %4 - P: %5 - I: %6 - TR: %7",_unit, _selection, _damage, _shooter, _projectile, _hitPointIndex,_instigator] call UnionClient_system_log;

if (alive _unit && _damage > 0) then {		
	if (LSINCAP(_unit)) then {
		"DMG - In agony - call _KilledInAgony" call UnionClient_system_log;
		[_unit,_shooter,_instigator,_damage,_projectile,_selection] spawn UnionClient_dmg_KilledInAgony;		
	} else {
		//сразу ловим тейзер и пейнтбол
		if (_projectile in ["DDOPP_B_Taser","Caseless_blau"]) then {			
			_damage = _currentDmg;
			[_unit,_shooter,_projectile] spawn UnionClient_dmg_NotLetal;
		} else {
			//остальные снаряды по человеку, но сперва урон от техники
			if (NOTINVEH(_unit) && {!(vehicle _shooter isEqualTo _shooter)} && {EQUAL((driver (vehicle _shooter)),_shooter)}) then {
				"DMG - VRDM" call UnionClient_system_log;
				_damage = _currentDmg;
				[_unit,_shooter] spawn UnionClient_dmg_Vehicle;
			} else {				
				//Отправляем ли мы в агонию игрока?
				if (_damage >= 0.89) then {
					"DMG - Call Agony!" call UnionClient_system_log;
					[{
						_this call UnionClient_dmg_Agony;
					}, [_unit,_shooter,_instigator,_projectile]] call CBA_fnc_execNextFrame;
				} else {
					private _dmg = _damage - _currentDmg; //сколько в итоге прилетело?		
					//не агония, но урон надо обработать
					if (isNull _shooter && !(NOTINVEH(_unit))) then {
						//может мы ехали в машине и врезались куда-то? здесь будем делать поправку на будущий апгрейд "Ремни безопасности"						
						"DMG - Damage in car?" call UnionClient_system_log;
						if (_dmg > 0) then {
							switch (true) do {
								case (_dmg > 0.3 && _dmg <= 0.45) : {									
									[{_this spawn UnionClient_system_addBuff}, ["life_bleeding","debuff",300], random(2)] call CBA_fnc_waitAndExecute;
								}; 								
								case (_dmg > 0.45 && _dmg <= 0.9) : {
									[{_this spawn UnionClient_system_addBuff}, ["life_critHit","debuff"], random(2)] call CBA_fnc_waitAndExecute;
								}; 
								default {}; 
							};
						};
					} else {
						//оставшийся урон - урон от оружия			
						"DMG - just damage" call UnionClient_system_log;
						if (_dmg > 0) then {
							switch (true) do {
								case (_dmg > 0.1 && _dmg <= 0.3) : {
									[{_this spawn UnionClient_system_addBuff}, ["life_bleeding","debuff",300], random(2)] call CBA_fnc_waitAndExecute;
								}; 
								case (_dmg > 0.3 && _dmg <= 0.45) : {
									[{_this spawn UnionClient_system_addBuff}, ["life_pain_shock","debuff"], random(2)] call CBA_fnc_waitAndExecute;
								}; 
								case (_dmg > 0.45 && _dmg <= 0.9) : {
									[{_this spawn UnionClient_system_addBuff}, ["life_critHit","debuff"], random(2)] call CBA_fnc_waitAndExecute;
								}; 
								default {}; 
							};
						};
					};					
				};
			};
		};
	};
} else {
	_damage = _currentDmg;
	"DMG - Skip" call UnionClient_system_log;
};

_damage = _damage min 0.89;
_damage