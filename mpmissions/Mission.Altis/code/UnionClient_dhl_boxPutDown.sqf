/*

	Filename: 	UnionClient_dhl_boxPutDown.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
detach life_dhl_box;
private _pos = (vehicle player) modelToWorld [0,1.5,0];
life_dhl_box setPosATL [_pos select 0, _pos select 1, 0];

//проверка а не в конечной ли мы точке!
if (life_dhl_box distance2D life_dhl_finishPoint < 10 && life_dhl_orderInProgress) then {
	[] call UnionClient_dhl_orderDone;
};