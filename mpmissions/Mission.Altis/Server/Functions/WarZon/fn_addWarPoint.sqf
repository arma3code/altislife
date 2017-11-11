/*
	Filename: 	fn_addWarPoint.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Создание на серваке (Имяточки,каридантаХ,кардинатаY,ник игрока)
*/
private ["_query","_queryResult","_unit","_pointName","_pointX","_pointY","_unitName","_pointID","_warn","_marker"];
/*
_unit = [_this,0] call BIS_fnc_param;
_pointName = [_this,1] call BIS_fnc_param;
_pointX = [_this,2,0,[0]] call BIS_fnc_param;
_pointY = [_this,3,0,[0]] call BIS_fnc_param;
_unitName = [_this,4,"",[""]] call BIS_fnc_param;*/
_unit = param [0];
_pointName = param [1];
_pointX = param [2];
_pointY = param [3];
_unitName = param [4];


//Stop bad data being passed.
if (_pointName isEqualTo "" || _unitName isEqualTo "")  exitWith {
	diag_log "data stopped fn_addWarPoint";
};

_pointID = round(random(1000));
if (_unit isEqualTo "BattleGround") then {
	_pointID = 1234;
};
server_warzones pushBack [_pointID,_pointName,_pointX,_pointY,_unitName];
publicVariable "server_warzones";


_warn = createMarker [format ["war_zone_%1",_pointID],[_pointX,_pointY]];
_warn setMarkerShape "ELLIPSE";
_warn setMarkerSize [1500,1500];
_warn setMarkerBrush "Solid";
_warn setMarkerColor "ColorRed";



_marker = createMarker [format ["war_marker_%1",_pointID],[_pointX,_pointY]];
_marker setMarkerColor "ColorWhite";
_marker setMarkerTypeLocal "KIA";
_marker setMarkerText "Не входить! Ведётся военное положение!";


["add",_pointName,_unitName] remoteExecCall ["UnionClient_martiallaw_updateWarPoints",0];

if !(_unit isEqualTo "BattleGround") then {
[] remoteExecCall ["UnionClient_martiallaw_listWarPoints",(owner _unit)];
};