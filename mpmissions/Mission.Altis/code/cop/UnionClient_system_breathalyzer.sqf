/*
	
	Filename: 	UnionClient_system_breathalyzer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
private["_cop","_drinky"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_drinky = life_drink;
if(_drinky > 0.07) then {
	[1,format["Анализ %1 \n\n Уровень алкоголя в крови: %2 \n\n Уровень алкоголия превышает норму",name player,[_drinky] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",_cop];
} else {
	[1,format["Анализ %1 \n\n Уровень алкоголя в крови: %2 \n\n Уровень алкоголя не превышает норму",name player,[_drinky] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",_cop];
};