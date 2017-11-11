/*

	Filename: 	fn_kickOffline.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
private ["_membersCount","_membersNew"];
params [
    ["_unit",objNull,[objNull]],
	["_group",grpNull,[grpNull]],
	["_side",sideUnknown,[civilian]],
	["_uid","",[""]],
	["_updateGang",false,[false]]
];

if (isNull _unit || isNull _group || _side isEqualTo sideUnknown || _uid isEqualTo "") exitWith {}; //FAIL


_membersCount = _group getVariable ["gang_members",[[]]];
_membersNew = [];
{
    if ((_x select 0) != _uid) then {
	    _membersNew pushBack _x
	};
} forEach _membersCount;
_group setVariable ["gang_members",_membersNew,true];

if (_updateGang) then {
	[4,_group,_side] remoteExecCall ["TON_fnc_updateGang",2];
};

[5,_group,_side] remoteExecCall ["TON_fnc_updateGang",2];