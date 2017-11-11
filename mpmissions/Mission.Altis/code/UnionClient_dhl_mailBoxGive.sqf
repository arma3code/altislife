/*

	Filename: 	UnionClient_dhl_mailBoxGive.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
player playAction "PutDown";
[player] call UnionClient_dhl_boxSpawn;

[format["DHL_TS1_%1",steamid],"SUCCEEDED",true] call BIS_fnc_taskSetState;
[format["DHL_TS1_%1",steamid]] call BIS_fnc_deleteTask;

"DHL - Step 1 completed" call UnionClient_system_log;

"DHL - Step 2 begin" call UnionClient_system_log;

private _dpEnd = [format["%1",life_dhl_finishPoint],"_"," "] call UnionClient_kron_Replace;
[format["DHL_TS2_%1",steamid],player,[format["Доставьте посылку в %1",toUpper(_dpEnd)],format["Доставьте посылку в %1",toUpper(_dpEnd)],""],life_dhl_finishPoint,true,nil,true,false,"map"] call BIS_fnc_setTask;

life_dhl_startPoint removeAction AID_TFMB;