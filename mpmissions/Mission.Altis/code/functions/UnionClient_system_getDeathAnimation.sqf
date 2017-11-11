/*

	Filename: 	UnionClient_system_getDeathAnimation.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
private _animationState = animationState _unit;

if (EQUAL(_animationState,"ainjpfalmstpsnonwnondf_carried_dead")) exitWith {"Unconscious"};
if (EQUAL(_animationState,"actspknlmstpsnonwnondnon_treatinginjured_nikitindead")) exitWith {"Unconscious"};
if (EQUAL(typeof (vehicle _unit),"ExtremoHospitalBedFix")) exitWith {"hospitalbed_anim"};

_unit call CBA_fnc_getUnitDeathAnim