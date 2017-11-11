/*
    File : fn_updateGangWarPoints.sqf

    Description:
    Ставим ящику pricetaked, обновляем ВарПоинты в бд
[_box,player,grpPlayer] remoteExecCall ["TON_fnc_updateGangWarPoints",RSERV];

*/
private _crate = param [0];
private _player = param [1];
private _group = param [2];
diag_log [_crate,_player,_group];
[_crate,"priceTaked",true] call CBA_fnc_setVarNet;
_groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {diag_log "groupID = -1 fn_updateGangWarPoints"};

_groupNAME = _group getVariable ["gang_name",""];
["priceTaked",_groupNAME] remoteExecCall ["UnionClient_warzones_message",-2];

_query = format ["UPDATE gangs SET warpoints=warpoints + 1 WHERE id='%1'",_groupID];

[_query,1] call DB_fnc_asyncCall;
