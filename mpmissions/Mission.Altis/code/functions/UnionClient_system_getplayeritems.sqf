/*
	fn_getPlayerItems.sqf
	
	Получаем массив всего лута, что есть у игрока
*/

private["_items","_item","_listed","_itemsFinal"];

_items = [];

if (uniform player != "") then {
	_items pushBack uniform player;
	_items = _items + (uniformItems player);
};

if (vest player != "") then {
	_items pushBack vest player;
	_items = _items + (vestItems player);
};

if (backpack player != "") then {
	_items pushBack backpack player;
	_items = _items + (backPackItems player);
};

_items pushBack goggles player;
_items pushBack headgear player;
_items = _items + assignedITems player;

if(primaryWeapon player != "") then {
	_items pushBack primaryWeapon player;
	_items = _items + primaryWeaponItems player;
	if ((player ammo (primaryWeapon player)) > 0) then {
		_items pushBack ((primaryWeaponMagazine player) select 0);
	};
};

if(secondaryWeapon player != "") then {
	_items pushBack secondaryWeapon player;
	_items = _items + secondaryWeaponItems player;
	if ((player ammo (secondaryWeapon player)) > 0) then {
		_items pushBack ((secondaryWeaponMagazine player) select 0);
	};
};

if(handgunWeapon player != "") then {
	_items pushBack handgunWeapon player;
	_items = _items + handgunItems player;
	if ((player ammo (handgunWeapon player)) > 0) then {
		_items pushBack ((handgunMagazine player) select 0);
	};
};

_itemsFinal = [];
_listed = [];

{
	if (!(_x in _listed) && _x != "") then {
		_item = _x;
		_listed pushBack _item;
		_itemCount = {_x == _item} count _items;
		_itemsFinal pushBack [_item,_itemCount];
	};
} forEach _items;

_itemsFinal;