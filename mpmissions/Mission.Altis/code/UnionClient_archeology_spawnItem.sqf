/*

	Filename: 	UnionClient_archeology_spawnItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _index = [life_arc_currentZone,life_arc_currentZones] call UnionClient_system_index;
format["Archeology - SpawnItem - Index of current Zone in Zones: %1",_index] call UnionClient_system_log;
if (EQUAL(_index,-1)) exitWith {"Archeology - SpawnItem - Bad index" call UnionClient_system_log};
private _itemModel = selectRandom (ARC_SETTINGS(getArray,"spawnItem"));
format["Archeology - SpawnItem - Model: %1",_itemModel] call UnionClient_system_log;

private _item = _itemModel createVehicleLocal life_arc_currentPoint;
waitUntil {!isNull _item};
[_item] call UnionClient_archeology_addItems;
_item addAction ["<img image='\union_pack\icons\ui\s_icon_box.paa' /> Содержимое находки",UnionClient_system_openInventory,"",0,true,true,"",'',2];

player reveal _item;
titleText ["Вы что-то нашли!","PLAIN"];

private _tmpCurZoneCfg = life_arc_currentZones select _index;
private _tmpCurZone = _tmpCurZoneCfg select 0;
private _tmpCurCount = _tmpCurZoneCfg select 1;

SUB(_tmpCurCount,1);

if (_tmpCurCount <= 0) then {
	deleteMarkerLocal _tmpCurZone;	
	deleteMarkerLocal format["%1_text",_tmpCurZone];	
	life_arc_currentZones deleteAt _index;
	call UnionClient_archeology_clearZone;
	"Archeology - SpawnItem - Marker & Point deleted" call UnionClient_system_log;
} else {
	life_arc_currentZones set [_index,[_tmpCurZone,_tmpCurCount]];
	life_arc_currentPoint = [_tmpCurZone] call CBA_fnc_randPosArea;
	format["Archeology - SpawnItem - New Point: %1",life_arc_currentPoint] call UnionClient_system_log; //точка где и лежит сам КЛАД	
};

SVAR_PRNS ["PRNS_arc_currentZones",life_arc_currentZones];