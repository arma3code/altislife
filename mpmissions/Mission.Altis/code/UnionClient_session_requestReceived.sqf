/*

	Filename: 	UnionClient_session_requestReceived.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if (isNil "_this") exitWith {[] call UnionClient_session_insertPlayerInfo;};
if (typeName _this == "STRING") exitWith {[] call UnionClient_session_insertPlayerInfo;};
if (count _this == 0) exitWith {[] call UnionClient_session_insertPlayerInfo;};
if ((_this select 0) == "Error") exitWith {[] call UnionClient_session_insertPlayerInfo;};
if (steamid != _this select 0) exitWith {[] call UnionClient_session_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if (!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator" OR !isNil "life_donator_expired")) exitWith {
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

if ((profileName != _this select 1) && (_this select 4 < 1)) exitWith {
	hint parseText format ["<t size='1.1'><t size='2'><t color='#f5be00'>Внимание!!!</t></t><br /><br />За вашим ID закреплён другой ник, укажите свой старый ник в профиле игры!<br/><br/>Ваш старый ник<br/> <t size='1.7'><t color='#1dae0e'>%1</t></t><br/><br/>Если у вас проблемы с изменением ника - обратитесь на форум <t color='#665bff'>forum.unionrp.ru</t></t>",_this select 1];
	0 cutText ["","BLACK FADED"];
	0 cutFadeOut 9999999;
	uiSleep 10;
	["NameExists",false,false] call BIS_fnc_endMission;
};

/*if (ISPSIDE(civilian) && {_this select 21 != 0} && {_this select 21 != life_server}) exitWith {
	["WrongServer",false,false] call BIS_fnc_endMission;
};
		херня для лока сервера, хорошо бы реализовать. Но сейчас она не нужна
if (ISPSIDE(independent) && {_this select 20 != 0} && {_this select 20 != life_server}) exitWith {
	["WrongServer",false,false] call BIS_fnc_endMission;
};*/
private ["_varName","_sideFlag"];
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");

	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgLicenses"));

diag_log format["requestReceived:_this = %1",_this];
//Parse basic player information.
["cash","set",(parseNumber (_this select 2))] call UnionClient_system_myCash;
["atm","set",(parseNumber (_this select 3))] call UnionClient_system_myCash;

//CONST(life_adminlevel,parseNumber (_this select 4));
CONST(life_adminlevel,(_this select 4));
CONST(life_donator,(_this select 5));
//CONST(life_donator,parseNumber (_this select 5));

//Loop through licenses
if (count (_this select 6) > 0) then {
	{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

private _loadingError = false;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		life_coplevel = _this select 7;
		if (life_coplevel < 1) exitWith {
			_loadingError = true;
			["Notwhitelisted",FALSE,FALSE] call BIS_fnc_endMission;
		};
		life_medicLevel = 0;
		life_reblevel = 0;
		life_civlevel = 0;
		life_expoints = _this select 9;

		if (count (_this select 10) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)]} foreach (_this select 10);
		};

		if (count (_this select 11) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)]} foreach (_this select 11);
		};

		if (count (_this select 12) > 0) then {
			[_this select 12] call UnionClient_system_setIndicators;
		};

		life_logout_position = _this select 13;
		life_karma = (parseNumber (_this select 14));


		life_deaths = (parseNumber (_this select 15));
		life_servermap = _this select 16;
		if (!(EQUAL(worldName,(life_servermap select 0))) && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
			_loadingError = true;
			switch (life_servermap select 0) do {
				case "Altis" : {["NotYouServerMap_Altis",FALSE,FALSE] call BIS_fnc_endMission};
				case "Tanoa" : {["NotYouServerMap_Tanoa",FALSE,FALSE] call BIS_fnc_endMission};
			};
		};

		["dcash","set",(parseNumber (_this select 17))] call UnionClient_system_myCash;

		life_gangData = _this select 18;
		private _handle = [] spawn UnionClient_gangs_Init;
		waitUntil {scriptDone _handle};
	};

	case east: {
		life_medicLevel = _this select 7;
		if (life_medicLevel < 1) exitWith {
			_loadingError = true;
			["Notwhitelisted",FALSE,FALSE] call BIS_fnc_endMission;
		};
		life_coplevel = 0;
		life_reblevel = 0;
		life_civlevel = 0;
		life_expoints = _this select 9;

		if (count (_this select 10) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 10);
		};

		if (count (_this select 11) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 11);
		};

		if (count (_this select 12) > 0) then {
			[_this select 12] call UnionClient_system_setIndicators;
		};

		life_logout_position = _this select 13;
		life_karma = (parseNumber (_this select 14));
		life_deaths = (parseNumber (_this select 15));
		life_servermap = _this select 16;

		["dcash","set",(parseNumber (_this select 17))] call UnionClient_system_myCash;

		if (!(EQUAL(worldName,(life_servermap select 0))) && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
			_loadingError = true;
			switch (life_servermap) do {
				case "Altis" : {["NotYouServerMap_Altis",FALSE,FALSE] call BIS_fnc_endMission};
				case "Tanoa" : {["NotYouServerMap_Tanoa",FALSE,FALSE] call BIS_fnc_endMission};
			};
		};

		life_gangData = _this select 18;
		private _handle = [] spawn UnionClient_gangs_Init;
		waitUntil {scriptDone _handle};
	};

	case independent: {
		life_rebLevel = _this select 7;
		if (life_reblevel < 1) exitWith {
			_loadingError = true;
			["NotWhitelistedReb",FALSE,FALSE] call BIS_fnc_endMission;
		};
		life_copLevel = 0;
		life_medicLevel = 0;
		life_civlevel = 0;
		life_expoints = _this select 9;
		if (count (_this select 10) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 10);
		};

		if (count (_this select 11) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 11);
		};

		if (count (_this select 12) > 0) then {
			[_this select 12] call UnionClient_system_setIndicators;
		};
		life_logout_position = _this select 13;
		life_karma = (parseNumber (_this select 14));
		life_deaths = (parseNumber (_this select 15));
		life_servermap = _this select 16;
		["dcash","set",(parseNumber (_this select 17))] call UnionClient_system_myCash;
		life_is_arrested = _this select 18;
		life_jail_time = (parseNumber (_this select 19));
		life_firstTime = _this select 20;
		life_slave = _this select 21;
		//life_mycrimes = _this select 13;??????????
		//life_myserver = _this select 20; Лочится на номере сервера - Extremo#1 или Extremo#2
		if (!(EQUAL(worldName,(life_servermap select 0))) && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
			_loadingError = true;
			switch (life_servermap) do {
				case "Altis" : {["NotYouServerMap_Altis",FALSE,FALSE] call BIS_fnc_endMission};
				case "Tanoa" : {["NotYouServerMap_Tanoa",FALSE,FALSE] call BIS_fnc_endMission};
			};
		};
		if (count (_this select 22) > 0) then {
			[_this select 22] call UnionClient_system_initHouses;
		};

		life_gangData = _this select 23;
		private _handle = [] spawn UnionClient_gangs_Init;
		waitUntil {scriptDone _handle};
	};

	case civilian: {
		life_civLevel = _this select 7;
		if (life_civlevel < 1) exitWith {
			_loadingError = true;
			["NotWhitelistedciv",FALSE,FALSE] call BIS_fnc_endMission;
		};
		life_copLevel = 0;
		life_medicLevel = 0;
		life_reblevel = 0;
		life_expoints = _this select 9;
		if (count (_this select 10) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 10);
		};

		if (count (_this select 11) > 0) then {
			{SVAR_MNS [(_x select 0),(_x select 1)];} foreach (_this select 11);
		};

		if (count (_this select 12) > 0) then {
			[_this select 12] call UnionClient_system_setIndicators;
		};
		life_logout_position = _this select 13;
		life_karma = (parseNumber (_this select 14));
		life_deaths = (parseNumber (_this select 15));
		life_servermap = _this select 16;
		["dcash","set",(parseNumber (_this select 17))] call UnionClient_system_myCash;
		life_is_arrested = _this select 18;
		life_jail_time = (parseNumber (_this select 19));
		life_firstTime = _this select 20;
		life_slave = _this select 21;
		life_haveCredit = _this select 22;
		//life_mycrimes = _this select 13;????? Возможно, список наказаний за которые посадили - Копируется из таблицы wanted в эту и вроде должна отображаться для того, кто сидит Не используется
		//life_myserver = _this select 20; Лочится на номере сервера - Extremo#1 или Extremo#2
		if (!(EQUAL(worldName,(life_servermap select 0))) && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
			_loadingError = true;
			switch (life_servermap select 0) do {
				case "Altis" : {["NotYouServerMap_Altis",FALSE,FALSE] call BIS_fnc_endMission};
				case "Tanoa" : {["NotYouServerMap_Tanoa",FALSE,FALSE] call BIS_fnc_endMission};
			};
		};
		if (count (_this select 23) > 0) then {
			[_this select 23] call UnionClient_system_initHouses;
		};

		life_gangData = _this select 24;
		private _handle = [] spawn UnionClient_gangs_Init;
		waitUntil {scriptDone _handle};

	};
};
if (_loadingError) exitWith {
	diag_log "RequestReceived error - Loading error - true";
};

life_deaths_max = switch (call life_donator) do {
	case 1: {7};
	case 2: {8};
	case 3: {9};
	case 4: {10};
	case 5: {10};
	default {6};
};

if (life_deaths >= life_deaths_max) exitWith {
	[true] spawn UnionClient_system_logout;
};

/*if (EQUAL((life_logout_position select 0),worldName)) then {
	life_logout_position = life_logout_position select 1;
} else {life_logout_position=[]};*/

life_gear = _this select 8;
[] call UnionClient_system_loadGear;

/*if (count (_this select 33) > 0) then {
	{
		life_vehicles pushBack _x;
		if ((typeOf _x) isEqualTo LIFE_SETTINGS(getText,"life_dhl_car")) then {life_dhl_car = _x};
	} foreach (_this select 33);
};*/

if !((_this select 25) isEqualTo []) then {
    {
    	life_vehicles pushBack _x;
    	if ((typeOf _x) isEqualTo LIFE_SETTINGS(getText,"life_dhl_car")) then {life_dhl_car = _x};
    } forEach (_this select 25);
};

if ((server_govinfo select 0 == steamid) && (ISPSIDE(civilian))) then {life_gov = true};
if ((count life_death_markers > 0) && life_death_endtime > 0) then {[life_death_endtime] spawn UnionClient_system_DeathTimer};

//Static variable representing the players max carrying weight on start.
life_maxWeightT = switch (FETCH_CONST(life_donator)) do {
	case 1: {26};
	case 2: {30};
	case 3: {36};
	case 4: {42};
	case 5: {48};
	default {24};
};

life_session_completed = true;