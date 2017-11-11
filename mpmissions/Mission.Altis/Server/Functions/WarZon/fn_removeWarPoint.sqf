/*
	Filename: 	fn_removeWarPoint.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/
/*+params [
    "_unit",
    ["_pointName","",[""]],
	["_pointID",0,[0]],
	["_unitName","",[""]]
];*/
private _unit = param [0];
private _pointName = param [1];
private _pointID = param [2];
private _unitName = param [3];

//Что бы без ошибок.
if (_pointName isEqualTo "" || _unitName isEqualTo "") exitWith {
    diag_log "data stopped fn_addWarPoint";
};

private _membersNew = [];
{
    if ((_x select 0) != _pointID) then {_membersNew pushBack _x};
} forEach server_warzones;



server_warzones = _membersNew;
publicVariable "server_warzones";


deleteMarker format ["war_marker_%1",_pointID];
deleteMarker format ["war_zone_%1",_pointID];


["remove",_pointName,_unitName] remoteExecCall ["UnionClient_martiallaw_updateWarPoints",0];
if !(_unit isEqualTo "BattleGround") then {
[] remoteExecCall ["UnionClient_martiallaw_listWarPoints",(owner _unit)];
};