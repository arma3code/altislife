/*

	Filename: 	UnionClient_hud_skinSet.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _skinCfg = param [0,"",[""]];

if (!isClass (missionConfigFile >> "LifeCfgThemes" >> _skinCfg)) exitWith {};

private _colorText = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"colorText");
private _colorTextHTML = M_CONFIG(getText,"LifeCfgThemes",_skinCfg,"colorTextHTML");
private _titleBackground = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"titleBackground");
private _windowBackground = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"windowBackground");
private _buttonBackground = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"buttonBackground");
private _buttonBackgroundFocused = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"buttonBackgroundFocused");
private _elementBackground = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"elementBackground");
private _elementBackgroundSelected = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"elementBackgroundSelected");
private _progressBackground = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"progressBackground");
private _progressText = M_CONFIG(getArray,"LifeCfgThemes",_skinCfg,"progressText");

SVAR_PRNS ['GUI_V3_TXT_R',_colorText select 0];
SVAR_PRNS ['GUI_V3_TXT_G',_colorText select 1];
SVAR_PRNS ['GUI_V3_TXT_B',_colorText select 2];
SVAR_PRNS ['GUI_V3_TXT_A',_colorText select 3];

SVAR_PRNS ['GUI_V3_TXT_HTML',_colorTextHTML];

SVAR_PRNS ['GUI_V3_TITLE_R',_titleBackground select 0];
SVAR_PRNS ['GUI_V3_TITLE_G',_titleBackground select 1];
SVAR_PRNS ['GUI_V3_TITLE_B',_titleBackground select 2];
SVAR_PRNS ['GUI_V3_TITLE_A',_titleBackground select 3];

SVAR_PRNS ['GUI_V3_BG_R',_windowBackground select 0];
SVAR_PRNS ['GUI_V3_BG_G',_windowBackground select 1];
SVAR_PRNS ['GUI_V3_BG_B',_windowBackground select 2];
SVAR_PRNS ['GUI_V3_BG_A',_windowBackground select 3];

SVAR_PRNS ['GUI_V3_BTBG_R',_buttonBackground select 0];
SVAR_PRNS ['GUI_V3_BTBG_G',_buttonBackground select 1];
SVAR_PRNS ['GUI_V3_BTBG_B',_buttonBackground select 2];
SVAR_PRNS ['GUI_V3_BTBG_A',_buttonBackground select 3];

SVAR_PRNS ['GUI_V3_BTBGF_R',_buttonBackgroundFocused select 0];
SVAR_PRNS ['GUI_V3_BTBGF_G',_buttonBackgroundFocused select 1];
SVAR_PRNS ['GUI_V3_BTBGF_B',_buttonBackgroundFocused select 2];
SVAR_PRNS ['GUI_V3_BTBGF_A',_buttonBackgroundFocused select 3];

SVAR_PRNS ['GUI_V3_ELBG_R',_elementBackground select 0];
SVAR_PRNS ['GUI_V3_ELBG_G',_elementBackground select 1];
SVAR_PRNS ['GUI_V3_ELBG_B',_elementBackground select 2];
SVAR_PRNS ['GUI_V3_ELBG_A',_elementBackground select 3];

SVAR_PRNS ['GUI_V3_ELBGS_R',_elementBackgroundSelected select 0];
SVAR_PRNS ['GUI_V3_ELBGS_G',_elementBackgroundSelected select 1];
SVAR_PRNS ['GUI_V3_ELBGS_B',_elementBackgroundSelected select 2];
SVAR_PRNS ['GUI_V3_ELBGS_A',_elementBackgroundSelected select 3];

SVAR_PRNS ['GUI_V3_PGB_R',_progressBackground select 0];
SVAR_PRNS ['GUI_V3_PGB_G',_progressBackground select 1];
SVAR_PRNS ['GUI_V3_PGB_B',_progressBackground select 2];
SVAR_PRNS ['GUI_V3_PGB_A',_progressBackground select 3];

SVAR_PRNS ['GUI_V3_PGT_R',_progressText select 0];
SVAR_PRNS ['GUI_V3_PGT_G',_progressText select 1];
SVAR_PRNS ['GUI_V3_PGT_B',_progressText select 2];
SVAR_PRNS ['GUI_V3_PGT_A',_progressText select 3];

life_myThemeID = _skinCfg;
SVAR_PRNS ['life_myThemeID',_skinCfg];