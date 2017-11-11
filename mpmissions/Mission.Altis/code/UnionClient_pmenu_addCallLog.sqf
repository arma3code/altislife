/*

	Filename: 	UnionClient_pmenu_addCallLog.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_name","",[""]],
	["_msg","",[""]],
	["_pos",[],[[]]]
];

if !(player diarySubjectExists "911cals") then {player createDiarySubject ["911cals","Вызовы"]};

player createDiaryRecord ["911cals",
	[
		_name,
		format["<font color='#e20000'>Сообщение: </font>%1<br/><br/><execute expression=""((findDisplay 12) displayCtrl 51) ctrlMapAnimAdd[1,0.05,%2]; ctrlMapAnimCommit ((findDisplay 12) displayCtrl 51);"">[Запеленговать]</execute>",_msg,_pos]
	]
];