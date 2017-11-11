/*

	Filename: 	UnionClient_gui_Tiles.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
with uinamespace do {
	_display = _this param [0,displaynull,[displaynull]];
	_classname = _this param [1,"",[""]];
	_ctrlTileGroup = _display displayctrl 115099;

	if !(isnull _ctrlTileGroup) then {
		_ctrlTileGroup ctrlenable false;

		//--- Set animation coeficient (creates sliding animation when opening/closing a display)
		BIS_fnc_guiEffectTiles_coef = if (isnull player) then {1} else {0};

		//--- Create PP effect
		_ppChromAberration = GVAR_MNS "UnionClient_gui_Tiles_ppChromAberration";
		if (isnil "_ppChromAberration") then {
			_ppChromAberration = ppeffectcreate ["chromAberration",212];
			SVAR_MNS ["UnionClient_gui_Tiles_ppChromAberration",_ppChromAberration];
		};

		_ppDynamicBlur = GVAR_MNS "UnionClient_gui_Tiles_ppDynamicBlur";
		if (isnil "_ppDynamicBlur") then {
			_ppDynamicBlur = ppeffectcreate ["DynamicBlur",213];
			SVAR_MNS ["UnionClient_gui_Tiles_ppDynamicBlur",_ppDynamicBlur];
		};

		BIS_fnc_guiEffectTiles_alpha = getnumber (configfile >> _classname >> "effectTilesAlpha");
		if (BIS_fnc_guiEffectTiles_alpha <= 0) then {BIS_fnc_guiEffectTiles_alpha = 0.05};

		_fnc_animate = {
			with uinamespace do {
				disableserialization;
				_display = _this select 0;

				//--- More visible tiles in death screen
				_alpha = if (_display == finddisplay 58) then {0.15} else {0.05};

				//--- Stronger chromatic aberation in pause menu
				_ppStrengthBase = 0;
				if ("RscDisplayInterrupt" in (GVAR_UINS ['GUI_classes',[]])) then {
					_ppStrengthBase = 0.024 + 0.01 * (sin (diag_ticktime * 100));

					//--- Random defects in pause menu main screen (would be distracting in submenus)
					if (_display == finddisplay 49 && isnil {GVAR_UINS "RscDebugConsole_execute"}) then {
						if (random 1 > (1 - 0.24 / diag_fps)) then {_ppStrengthBase = _ppStrengthBase * (5 + random 5)};
					};
				};

				//--- Animate tiles
				for "_ix" from 0 to 5 do {
					_animation = 1 + 0.8 * round (1 - abs sin ((BIS_fnc_guiEffectTiles_coef -8/12 + _ix/12) * 180));
					for "_iy" from 0 to 5 do {
						_coef = abs sin ((diag_ticktime + (_ix + _iy)^2 + (_ix - _iy)^2) * 24);
						_control = _display displayctrl (115000 + (10 * _ix) + _iy);
						_control ctrlsetbackgroundcolor [
							_coef,
							_coef,
							_coef,
							BIS_fnc_guiEffectTiles_alpha * _animation
						];
						_control ctrlcommit 0;
					};
				};

				//--- Transition animation
				BIS_fnc_guiEffectTiles_coef = if (BIS_fnc_guiEffectTiles_coef > 0) then {
					(BIS_fnc_guiEffectTiles_coef - ((1 / diag_fps) * 3)) max 0;
				} else {
					(BIS_fnc_guiEffectTiles_coef + ((1 / diag_fps) * 3)) min 0;
				};
				_ppStrength = _ppStrengthBase + 0.02 * sin (BIS_fnc_guiEffectTiles_coef * 180);
				
				_ppChromAberration ppEffectEnable true;
				_ppChromAberration ppEffectAdjust [_ppStrength,0,true];
				_ppChromAberration ppEffectCommit 0;

				_ppDynamicBlur ppEffectEnable true;
				_ppDynamicBlur ppEffectAdjust [1.5];
				_ppDynamicBlur ppEffectCommit 0;
			};
		};

		//--- Add event handlers
		[_display] call _fnc_animate;
		{
			_display displayaddeventhandler [_x,_fnc_animate];
		} foreach ["mousemoving","mouseholding"];
		_display displayaddeventhandler ["unload","[] call UnionClient_gui_Tiles; false"];

		//--- PP effects
		_ppChromAberration ppEffectEnable true;
		_ppChromAberration ppEffectCommit 0;

		_ppDynamicBlur ppEffectEnable true;
		_ppDynamicBlur ppEffectCommit 0;
	} else {
		_ppChromAberration = GVAR_MNS "UnionClient_gui_Tiles_ppChromAberration";
		if !(isnil "_ppChromAberration") then {
			BIS_fnc_guiEffectTiles_coef = -1;
			_ppChromAberration ppeffectenable false;
		};
		_ppDynamicBlur = GVAR_MNS "UnionClient_gui_Tiles_ppDynamicBlur";
		if !(isnil "_ppDynamicBlur") then {
			_ppDynamicBlur ppeffectenable false;
		};
	};
};
true