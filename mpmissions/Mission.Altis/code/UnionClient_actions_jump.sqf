/*

	Filename: 	UnionClient_actions_jump.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"

private ["_handled", "_move", "_moveM", "_moveP", "_vel", "_ppos", "_jh"];
_handled = false;

	if (vehicle player == player) then
	{
		_move = animationState player;
		_moveM = toLower (_move select [8,4]);
		_moveP = toLower (_move select [4,4]);

		if (_moveM in ["mrun","meva"] && _moveP in ["perc","pknl"] && getFatigue player < 0.6 && isTouchingGround player) then
		{
			player playActionNow "AovrPercMrunSrasWrflDf";
			_vel = velocity player;
			_ppos = getposASL player;
			player setposASL [_ppos select 0, _ppos select 1, (_ppos select 2)+0.1];
			_jh = (3-(loadabs player)*0.001) max 0;
			player setvelocity [(_vel select 0), (_vel select 1), _jh];
			player setStamina (getstamina player)-8;
			_handled = true;
		};
	};

_handled