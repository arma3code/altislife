params [
    ["_uid","",[""]],
    ["_newMap","",[""]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit || _newMap isEqualTo "" || _uid isEqualTo "") exitWith {
	life_playerTrasnferDone = false;
    owner _unit publicVariableClient "life_playerTrasnferDone";
};

[format ["UPDATE players SET servermap='%2' WHERE playerid='%1'",_uid,_newMap],2] call DB_fnc_asyncCall;
//uiSleep 0.5;
//private _worldOk = (([format["SELECT worldname FROM players WHERE playerid='%1'",_uid],2] call DB_fnc_asyncCall) select 0) select 0;

//if (_newMap isEqualTo _worldOk) exitWith {
	life_playerTrasnferDone = true;
    owner _unit publicVariableClient "life_playerTrasnferDone";
//};