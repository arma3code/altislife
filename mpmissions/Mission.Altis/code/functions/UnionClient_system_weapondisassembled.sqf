/*

	Filename: 	UnionClient_system_WeaponDisassembled.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
private["_unit","_primaryBag","_secondaryBag","_containers"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_primaryBag = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_secondaryBag = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

/*
systemchat format ["_this: %1", _this];
systemchat format ["_primaryBag: %1", _primaryBag];
systemchat format ["_secondaryBag: %1", _secondaryBag];
*/

systemchat format ["_this: %1", _this];

if (!isNull _secondaryBag) then
{
	_containers = nearestObjects[_unit,["GroundWeaponHolder"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
};



