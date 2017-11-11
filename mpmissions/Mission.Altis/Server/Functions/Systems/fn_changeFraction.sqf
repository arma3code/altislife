params [
    ["_unit",objNull,[objNull]],
    ["_uid","",[""]],
	["_side",sideUnknown,[civilian]],
    ["_price",0,[0]]
];
if (isNull _unit || _uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {
	life_fractionInUse = false;
    owner _unit publicVariableClient "life_action_inUse";
};

_query = switch(_side) do {
	case civilian: {format ["UPDATE players SET civlevel='0', coplevel='0', reblevel='1', mediclevel='0' WHERE playerid='%1'",_uid]};
	case independent: {format ["UPDATE players SET civlevel='1', coplevel='0', reblevel='0', mediclevel='0' WHERE playerid='%1'",_uid]};
};
switch(_side) do {
	case civilian: {
		_arr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
        missionNamespace setVariable [format ["%1_KEYS_%2",_uid,"GUER"],_arr];
	};
	case independent: {
		_arr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
        missionNamespace setVariable [format ["%1_KEYS_%2",_uid,"CIV"],_arr];
	};
};
[_query,1] call DB_fnc_asyncCall;

[_side,_price] remoteExecCall ["UnionClient_system_changeFractionDone",(owner _unit)];


