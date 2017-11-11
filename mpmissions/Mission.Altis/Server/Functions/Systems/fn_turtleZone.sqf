/*
    File: fn_turtleZone.sqf
    Author: Merrick

    Description:
    Spawns animals around the marker when a player
    is near.

*/
private ["_animalList","_dist","_radius","_zoneName","_unitsNear","_animalsActive"];
params [
        ["_zoneName",[],[[]]],
        ["_maxAnimals",10,[0]]
];

if (_zoneName isEqualTo []) exitWith {};

for "_i" from 0 to count(_zoneName) step 1 do {
_radius = (getMarkerSize (_zoneName select _i)) select 0;
_dist = _radius + 100;
_zone = getMarkerPos (_zoneName select _i);

if (!isNil "animals" && {count animals != 0}) then {
    _maxAnimals = _maxAnimals - count(animals);
} else {
    animals = [];
};

_unitsNear = false;
_animalsActive = false;
for "_i" from 0 to 1 step 0 do {
    {if ((_x distance _zone) < _dist) exitWith {_unitsNear = true;};} forEach playableUnits;
    if (_unitsNear && !_animalsActive) then {
        _animalsActive = true;
        for "_i" from 1 to _maxAnimals do {
            _position = [((_zone select 0) - _radius + random (_radius * 2)), ((_zone select 1) - _radius + random (_radius * 2)),0];
            _animal = createAgent ["turtle_f",_position,[],0,"FORM"];
            _animal setDir (random 360);
            animals pushBack _animal;
        };
    } else {
        if (!_unitsNear && _animalsActive) then {
            {deleteVehicle _x;} forEach animals;
            animals = [];
            _animalsActive = false;
        };
    };
    uiSleep (3 + random 2);
    _maxAnimals = param [1,10,[0]];
};
};