/*

	Filename: 	UnionClient_system_jailMe.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_ret",[],[[]]],
	["_bad",false,[false]]
];

if (_bad) then {waitUntil {uiSleep 0.03; LSALIVE(player)}};
if (_bad && life_karma > 0) then {
	[parseText "<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Вы были наказаны!<br/><br/></t>Вы были наказаны за релог в агонии или в наручниках.<br/>Вы были помещены в тюрьму на 90 минут без возможности выкупа.<br/><br/> <t color='#9cff00'>Соблюдайте правила!</t></t>",[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
        systemChat "Вы были наказаны за релог в агонии или в наручниках. Вы были помещены в тюрьму на 90 минут без возможности выкупа.";
};
detach player;
[player,"restrained"] call UnionClient_system_clearGlobalVar;

[] call UnionClient_system_inJail;
[0] call UnionClient_system_removeLicenses;
["all"] call UnionClient_system_removeBuff;
private _postBailAction = player addAction["<t color='#07C945'>Выйти под залог",UnionClient_system_postBail,"[player]",0,false,false,"",'isNil "life_canpay_bail" && life_is_arrested  && life_jail_time > 0'];
life_is_arrested = true;
[player,"isArrested",true] call CBA_fnc_setVarNet;
[5] call UnionClient_session_updatePartial;

if (!(EQUAL(PUNIFORM,"mgsr_robe"))) then {
	[] call UnionClient_system_saveGear;
	prison_gear = life_gear;

	[] call UnionClient_system_stripDownPlayer;

	{
		SVAR_MNS [ITEM_VARNAME(configName _x),0];
	} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));
	life_carryWeight = 0;

	player forceAddUniform "mgsr_robe";
};

private _time = time + (life_jail_time * 60);
private _mylistText = "";

if (!(EQUAL(_ret,[]))) then {
	life_bail_amount = _ret select 3;
	life_bail_amount = life_bail_amount * 3;
	private _crimes = _ret select 2;
	private _mylist = [];
	{
		_crime = _x;
		if (!(_crime in _mylist)) then
		{
			_mylist pushBack _crime;
			_mylistText = _mylistText + format["%2 x %1<br/>",{_x == _crime} count _crimes,M_CONFIG(getText,"LifeCfgCrimes",_crime,"displayName")];
		};
	} foreach _crimes;
} else {
	life_bail_amount = 200000;
};

private _esc = false;
private _bail = false;
private _updateTime = time;
private _jailTime = life_jail_time;

private _bail_amount = if (_bad) then {life_bail_amount*3} else {life_bail_amount};

[_bad] spawn {
	life_canpay_bail = false;
	if (_this select 0) then {
		life_bail_amount = life_bail_amount * 3;
		uiSleep ((life_jail_time - 5) * 60);
	} else {
		uiSleep (round((life_jail_time - (life_jail_time / 3))*60));
	};
	life_canpay_bail = nil;
};

if (!(EQUAL(_mylistText,""))) then {
	[format["Вы отбываете тюремный срок за следующие правонарушения: <br/><br/><t color='#ffc900'>%1</t><br/>Срок заключения: <t color='#ffc900'>%2 минут</t><br/><br/>Сумма залога для досрочного освобождения после отсидки трети срока: <t color='#90ff00'>$%3</t> (временно недоступно)<br/><br/>Вы можете оспорить срок заключения подав жалобу в соответствующие органы.",_mylistText,life_jail_time,[_bail_amount] call UnionClient_system_numberText],"police"] call UnionClient_system_hint;
};

disableSerialization;
private _uiDisp = GVAR_UINS ["jail_timer",displayNull];
if (isNull _uiDisp) then {
	["jail_timer","PLAIN"] call UnionClient_gui_CreateRscLayer;
	_uiDisp = GVAR_UINS ["jail_timer",displayNull];
};
private _timer = _uiDisp displayCtrl 38305;

while {true} do {
	if ((round(_time - time)) > 0) then {
		_timer ctrlSetStructuredText parseText format ["Срок заключения: %1<br/>%2",
			[(_time - time),"MM:SS"] call BIS_fnc_secondsToString,
			if(isNil "life_canpay_bail") then {format["Выход под залог: $%1",[life_bail_amount] call UnionClient_system_numberText]} else {""}
		];
	};

	if ((time - _updateTime) > (5 * 60)) then {
		_updateTime = time;
		life_hunger = 100;
		life_thirst = 100;
		_jailTime = _jailTime - 5;
		if (_jailTime > 0) then {
			[[steamid,_jailTime],"wantedUpdateJailTime"] call UnionClient_system_hcExec;
			systemChat "Отсиженное время учтено...";
		};
	};

	if (player distance (getMarkerPos "jail_marker") > 150 && life_jail_time > 15) then {[] call UnionClient_system_inJail};
	if (life_bail_paid) exitWith {_bail = true};
	if (!(player GVAR ["isArrested",false])) exitWith {_esc = true};
	if ((round(_time - time)) < 1) exitWith {hint ""};
	if (LSNOTALIVE(player) && ((round(_time - time)) > 0)) exitWith {};

	life_hunger = 100;
	life_thirst = 100;

	uiSleep 1;
};

["jail_timer"] call UnionClient_gui_DestroyRscLayer;

switch (true) do {
	case (_bail): {
		life_jail_time = 0;
		life_is_arrested = false;
		[player,"isArrested"] call UnionClient_system_clearGlobalVar;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		if (ISPSIDE(civilian)) then {player setPos (getMarkerPos "jail_release_civ");} else {player setPos (getMarkerPos "jail_release_reb");};

		if (!(EQUAL(prison_gear,[]))) then {
			life_gear = prison_gear;
			[] call UnionClient_system_loadGear;
			prison_gear = [];
		};

		[[steamid],"wantedRemove"] call UnionClient_system_hcExec;

		[5] call UnionClient_session_updatePartial;
		player removeAction _postBailAction;
		["down",10] call UnionClient_system_updateKarma;
	};

	case (_esc): {
		life_jail_time = 0;
		life_is_arrested = false;
		[player,"isArrested"] call UnionClient_system_clearGlobalVar;
		hint localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];

		[[steamid,GVAR_RNAME(player),"901"],"wantedAdd"] call UnionClient_system_hcExec;

		[5] call UnionClient_session_updatePartial;
		player removeAction _postBailAction;
	};

	case (LSALIVE(player) && !_esc && !_bail): {
		life_jail_time = 0;
		life_is_arrested = false;
		[player,"isArrested"] call UnionClient_system_clearGlobalVar;
		hint localize "STR_Jail_Released";
		if (ISPSIDE(civilian)) then {player setPos (getMarkerPos "jail_release_civ");} else {player setPos (getMarkerPos "jail_release_reb");};
		if (!(EQUAL(prison_gear,[]))) then {
			life_gear = prison_gear;
			[] call UnionClient_system_loadGear;
			prison_gear = [];
		};
		[[steamid],"wantedRemove"] call UnionClient_system_hcExec;
		[5] call UnionClient_session_updatePartial;
		player removeAction _postBailAction;
		["down",10] call UnionClient_system_updateKarma;
	};
};

if (EQUAL(PUNIFORM,"mgsr_robe")) then {removeUniform player};