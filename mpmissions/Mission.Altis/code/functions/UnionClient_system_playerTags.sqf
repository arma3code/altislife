/*

	Filename: 	UnionClient_system_playerTags.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
#define iconID 78000

if (visibleMap OR {LSNOTALIVE(player)} OR {dialog} OR {player GVAR ["isBlind",false]}) exitWith {
	500 cutText["","PLAIN"];
};

private _ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
if (isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
};

private _units = nearestObjects[(visiblePosition player),["Man"],50] - [player];
private _index = -1;
private ["_idc","_sPos","_indexInIds","_text_size","_pos"];
{
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {GVAR_RNAME(_x) != ""}) then {
		if (NOTINVEH(_x)) then {
			_pos = [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2) + 0.8];
			_sPos = worldToScreen _pos;
			if ((_x distance player) < 15 && {count _sPos > 0}) then {
				_indexInIds = [(getPlayerUID _x),life_ids] call UnionClient_system_index;
				if (_x in (units grpPlayer) OR !(EQUAL(_indexInIds,-1))) then {
					_text_size = ((0.8 / (_x distance player) * 10) max 0.7) min 1;
					if (!isNil {(group _x) GVAR "gang_name"}) then {
						_idc ctrlSetStructuredText parseText format["<t align='center' font='RobotoCondensed'><t color='#ffffff' size='%4'>%1</t><t color='#ffd100' size='%5'><br/>%2</t><t color='#e9e9e9' size='%6'><br/>%3</t></t>",GVAR_RTITLE(_x),GVAR_RNAME(_x),(group _x) GVAR ["gang_name",""],(_text_size - (_text_size*0.25)),_text_size, (_text_size - (_text_size*0.3))];
					} else {
						_idc ctrlSetStructuredText parseText format["<t align='center' font='RobotoCondensed'><t color='#00fffc' size='%3'>%1<br/></t><t color='#ffd100' size='%4'>%2</t></t>",GVAR_RTITLE(_x),GVAR_RNAME(_x),(_text_size - (_text_size*0.25)),_text_size];
					};
					_idc ctrlSetPosition [(_sPos select 0) - 0.2, _sPos select 1];
					_idc ctrlSetScale 1;
					_idc ctrlSetFade 0;
					_idc ctrlCommit 0;
					_idc ctrlShow true;
				} else {_idc ctrlShow false};
			} else {_idc ctrlShow false};
		} else {_idc ctrlShow false};
	} else {_idc ctrlShow false};
	_index = _forEachIndex;
} foreach _units;
(_ui displayCtrl (iconID + _index + 1)) ctrlSetStructuredText parseText "";