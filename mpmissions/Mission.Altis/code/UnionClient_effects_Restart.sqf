/*

	Filename: 	UnionClient_effects_Restart.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
//params["_isEvent"];
if(!hasInterface && !isServer) exitWith{};
restart_effect = true;
3 fadeSound 1;
playSound "alarm";
[parseText "<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Внимание!<br/><br/></t>На остров надвигается буря силой 12 баллов по шкале Бофорта.<br/>Найдите укрытие под крышей!<br/><br/> <t color='#9cff00'>Цените свою жизнь!</t></t>",[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
uiSleep 2.5;
playSound "alarm";
uiSleep 2.5;
if(!isServer) then {playSound "storm"};
{_x allowDamage false;} forEach nearestObjects [player,[],500];
[] spawn {
    "dynamicblur" ppEffectEnable true;
    "dynamicblur" ppEffectAdjust [1];
    "dynamicblur" ppEffectCommit 1;
    "colorcorrections" ppEffectEnable true;
    "colorcorrections" ppEffectAdjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];
    "colorcorrections" ppEffectCommit 0.4;
    "dynamicblur" ppEffectAdjust [0.5];
    "dynamicblur" ppEffectCommit 3;
    0 setOvercast 0;
    uiSleep 0.2;
    [] spawn {
        uiSleep 1;
        "colorcorrections" ppEffectAdjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
        "colorcorrections" ppEffectCommit 2;
    };
    "dynamicblur" ppEffectAdjust [2];
    "dynamicblur" ppEffectCommit 1;
    "dynamicblur" ppEffectAdjust [0.5];
    "dynamicblur" ppEffectCommit 4;
    uiSleep 4.4;
    "colorcorrections" ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
    "colorcorrections" ppEffectCommit 1;
    "colorcorrections" ppEffectEnable false;
    "dynamicblur" ppEffectAdjust [0];
    "dynamicblur" ppEffectCommit 1;
    "dynamicblur" ppEffectEnable false;
};
if(isServer) exitWith {
    setDate [2017,9,27,23,00];
    15 setWaves 1;
    15 setFog 0.00;
    15 setRain 1;
    15 setOvercast 0;
    15 setRainbow 1;
    15 setWaves 1;
    15 setLightnings 1;
    forceWeatherChange;
};
[] spawn {
    while {restart_effect} do {
        _currentTarget = (nearestObjects [player, [], 250]) call BIS_fnc_selectRandom;
        _currentTarget allowDamage false;
        _strikeCenter = [(getPosATL _currentTarget select 0), (getPosATL _currentTarget select 1), (getPosATL _currentTarget select 2) + abs((((boundingBoxReal _currentTarget) select 1) select 2) - (((boundingBoxReal _currentTarget) select 0) select 2))];

        _bolt = createVehicle ["LightningBolt",_strikeCenter,[],0,"can collide"];
        _bolt setPosATL _strikeCenter;
        _bolt setDamage 1;

        _light = "#lightpoint" createVehicleLocal _strikeCenter;
        _light setPosATL [_strikeCenter select 0,_strikeCenter select 1,(_strikeCenter select 2) + 10];
        _light setLightDayLight true;
        _light setLightBrightness 300;
        _light setLightAmbient [0.05, 0.05, 0.1];
        _light setLightColor [1, 1, 2];
        uiSleep 0.1;
        _light setLightBrightness 0;
        uiSleep 0.1;

        _class = ["lightning1_F","lightning2_F"] call BIS_fnc_selectRandom;
        _lightning = _class createVehicleLocal [100,100,100];
        _lightning setDir (random 256);
        _lightning setPos _strikeCenter;
        _duration = random 15;
        for "_i" from 0 to _duration do {
            _light setLightBrightness (100 + random 100);
            uiSleep 0.15;
        };
        deleteVehicle _lightning;
        deleteVehicle _light;
        uiSleep random 10;
    };
};
uiSleep 13.37;
[] spawn {
    uiSleep 2.5;
    cutText ["","Black in"];

    for "_i" from 1 to 5 do {
        if(!restart_effect) exitWith {};
        uiSleep 3;
        playSound "earthquake_04";
        [] spawn BIS_fnc_earthquake;
        enableCamShake true;
        addCamShake [10, 70, 25];
    };
    uiSleep 15;
    enableCamShake false;
};
uiSleep 13.37;
[] spawn {
    "dynamicblur" ppEffectAdjust [1];
    "dynamicblur" ppEffectCommit 1;
    "colorcorrections" ppEffectAdjust [0.8, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];
    "colorcorrections" ppEffectCommit 0.4;
    "dynamicblur" ppEffectAdjust [0.5];
    "dynamicblur" ppEffectCommit 3;
    0 setOvercast 0;
    uiSleep 0.2;
    [] spawn {
        uiSleep 1;
        "colorcorrections" ppEffectAdjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
        "colorcorrections" ppEffectCommit 2;
    };
    "dynamicblur" ppEffectAdjust [2];
    "dynamicblur" ppEffectCommit 1;
    "dynamicblur" ppEffectAdjust [0.5];
    "dynamicblur" ppEffectCommit 4;

    "colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
    "colorCorrections" ppEffectCommit 0;
    "colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
    "colorCorrections" ppEffectCommit 3;
    "filmGrain" ppEffectEnable true;
    "filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
    "filmGrain" ppEffectCommit 5;
};

_part1 = "land_sack_f" createVehicleLocal [((getPos player) select 0) + 455,(getPos player) select 1,(getPos player) select 2];
_part2 = "#particlesource" createVehicleLocal getPos _part1;
_part2 setParticleParams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48], "", "billboard", 1, 10, [0, 0, 0], [0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", _part1];
_part2 setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
_part2 setParticleCircle [10, [-10, -10, 20]];
_part2 setDropInterval 0.005;
_part3 = "#particlesource" createVehicleLocal getPos _part1;
_part3 setParticleParams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 3, 48, 0], "", "billboard", 1, 20, [0, 0, 0], [0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", _part1];
_part3 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_part3 setDropInterval 0.002;
_part4 = "#particlesource" createVehicleLocal getPos _part1;
_part4 setParticleParams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 3, 112, 0], "", "billboard", 1, 20, [0, 0, 0], [0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", _part1];
_part4 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_part4 setDropInterval 0.002;
_part5 = "#particlesource" createVehicleLocal getPos _part1;
_part5 setParticleParams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48, 1], "", "billboard", 1, 25, [0, 0, 0], [0, 0, 60], 0, 1.7, 1, 0, [40,15,120], [[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]] , [0.5, 0.1], 1, 1, "", "", _part1];
_part5 setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_part5 setDropInterval 0.002;
[] spawn {for "_i" from 1 to 2 do {uiSleep 5;playSound "earthquake_04";};};
_part6 = "#particlesource" createVehicleLocal getPos _part1;
_part6 setParticleParams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48], "", "billboard", 1, 20, [0, 0, 0], [0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", _part1];
_part6 setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_part6 setParticleCircle [50, [-80, -80, 2.5]]; _part6 setDropInterval 0.0002;
_part7 = "#lightpoint" createVehicleLocal [((getPos _part1 select 0)),(getPos _part1 select 1),((getPos _part1 select 2)+500)];
_part7 setLightAmbient[1500, 1200, 1000];
_part7 setLightColor[1500, 1200, 1000];
_part7 setLightBrightness 100000.0;
_part8 = 0;
while {_part8 < 87} do {
    if(!restart_effect) exitWith {};
    _part7 setLightBrightness 100.0 - _part8;
    _part8 = _part8 + 1;
    uiSleep 0.1;
};

uiSleep 5;
enableCamShake true;
addCamShake [10, 90, 25];
_part9 = "#particlesource" createVehicleLocal (position player);
_part9 setParticleParams [["a3\data_f\particleeffects\universal\universal",16,12,8,1],"","billboard",1,4,[0,0,0],[0,0,0],1,0.000001,0,1.4,[0.05,0.05],[[0.1,0.1,0.1,1]],[0,1],0.2,1.2,"","",vehicle player];
_part9 setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
_part9 setParticleCircle [0.0, [0, 0, 0]];
_part9 setDropInterval 0.01;
_part6 setDropInterval 0.001;
deleteVehicle _part3;
deleteVehicle _part4;
uiSleep 4.5;
_part5 setParticleParams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48, 1], "", "billboard", 1, 25, [0, 0, 0], [0, 0, 45], 0, 1.7, 1, 0, [40,25,80], [[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]] , [0.5, 0.1], 1, 1, "", "", _part1];
_part2 setDropInterval 0.01;
_part5 setDropInterval 0.006;
_part6 setDropInterval 0.001;
uiSleep 2;
_part5 setParticleParams [["a3\data_f\particleeffects\universal\universal.p3d", 16, 7, 48, 1], "", "billboard", 1, 25, [0, 0, 0], [0, 0, 30], 0, 1.7, 1, 0, [40,25,80], [[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]] , [0.5, 0.1], 1, 1, "", "", _part1];

uiSleep 25;
cutText ["","Black OUT"];
uiSleep 1.5;
cutText ["","Black IN"];
uiSleep 1;
cutText ["","Black OUT"];
uiSleep 0.5;
cutText ["","Black IN"];
uiSleep 1;

/*if(_isEvent isEqualTo 0) then {
    cutText ["","Black OUT"];[] call BIS_fnc_endMission;
} else {
    "filmGrain" ppEffectEnable false;
    "dynamicblur" ppEffectEnable false;
    "colorcorrections" ppEffectEnable false;
    enableCamShake false;
    restart_effect = false;
    {deleteVehicle _x;} forEach [_part1,_part2,_part3,_part4,_part5,_part6,_part7,_part9];
};
*/