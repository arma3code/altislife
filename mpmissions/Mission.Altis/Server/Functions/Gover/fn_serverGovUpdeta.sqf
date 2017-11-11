/*
	Filename: 	fn_serverGovUpdeta.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	_time = _time splitString "'/\`:|;,{}-""<>qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"; 
*/

#include "\UnionServer\script_macros.hpp"
for "_i" from 0 to 1 step 0 do {
    _result = ["SELECT serverbank, servertax, credittax, mar_legal, slavery, server_poor FROM rules",2,true] call DB_fnc_asyncCall;
	{
	    server_bank = _x select 0;
		server_tax = _x select 1;
		server_creditTax = _x select 2;
		server_mar_legal = [_x select 3,1] call DB_fnc_bool;
        server_slavery = [_x select 4,1] call DB_fnc_bool;
		server_poor = _x select 5;
    } forEach _result;
	_time = (call compile format ["%1",(EXTDB "9:LOCAL_TIME")])select 1; 
	server_timeText = format ["Union Altis Life [%1-%2-%3 %4:%5]",_time select 0,_time select 1,_time select 2,_time select 3,_time select 4];
	publicVariable "server_bank";
	publicVariable "server_tax";
	publicVariable "server_creditTax";
	publicVariable "server_mar_legal";
	publicVariable "server_slavery";
	publicVariable "server_poor";
	publicVariable "server_timeText";
	uiSleep (5 * 60);
};