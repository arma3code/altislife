/*

	Filename: 	UnionClient_system_updateViewDistance.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _viewDistance = switch (true) do {
	case (NOTINVEH(player)): {life_viewDistanceFoot};
	case ((objectParent player) isKindOf "LandVehicle"): {life_viewDistanceCar};
	case ((objectParent player) isKindOf "Ship"): {life_viewDistanceCar};
	case ((objectParent player) isKindOf "Air"): {life_viewDistanceAir};
	default {life_viewDistanceFoot};
};

setViewDistance _viewDistance;