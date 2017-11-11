class RscButton
{
	deletable = 0;
	fade = 0;	
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundActive[] = 
	{
		0,
		0,
		0,
		1
	};
	colorFocused[] = 
	{
		0,
		0,
		0,
		1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	idc = -1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	url = "";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};

class RscButtonUC: RscButton
{
	style = "0xC0 + 0x02";
};

class RscScrollBar
{
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

class RscControlsGroup
{
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
	
	class VScrollBar : RscScrollBar
	{
		width = 0.021;
		autoScrollEnabled = 1;
	};
	
	class HScrollBar : RscScrollBar
	{
		height = 0.028;
	};
	
	class Controls {};
};

class RscControlsGroupNoScrollbars : RscControlsGroup
{
	class VScrollbar : VScrollbar {
		width = 0;
	};
	
	class HScrollbar : HScrollbar {
		height = 0;
	};
};

class RscListNBox
{
	style = 16;
	type = 102;
	shadow = 0;
	font = "RobotoCondensed";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.8,0.8,0.8,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
   	colorPictureDisabled[] = {1,1,1,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	period = 1.2;
	maxHistoryDelay = 0.5;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	rowHeight = 0.04;
	drawSideArrows = 0;
	idcLeft = -1;
	idcRight = -1;
	class ListScrollBar: RscScrollBar{};
	class ScrollBar: RscScrollBar{};
};

class RscText
{
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "RobotoCondensed";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscLine : RscText
{
	idc = -1;
	style = 176;
	x = 0.17;
	y = 0.48;
	w = 0.66;
	h = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1.0};
};

class RscTitle : RscText 
{
	colorText[] = {0.95, 0.95, 0.95, 1};
};

class RscPicture
{
	shadow = 0;
	type = 0;
	style = 48;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 43.4) * 1)";
	font = "RobotoCondensed";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscStructuredText
{
	type = 13;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1, 1, 1, 1.0};
	shadow = 1;
	
	class Attributes {
		font = "RobotoCondensed";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};

class RscActiveText
{
	idc = -1;
    type = 11;
    style = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    font = "RobotoCondensed";
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 0.2, 0.2, 1};
	colorDisabled[] = {1, 0.2, 0.2, 0.4};
    soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
    soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
    action = "";
    text = "";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscShortcutButton
{
	deletable = 0;
	fade = 0;
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	shortcuts[] = 
	{
	};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocused[] = 
	{
		1,
		1,
		1,
		1
	};
	color2[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackgroundFocused[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackground2[] = 
	{
		1,
		1,
		1,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	textSecondary = "";
	colorSecondary[] = 
	{
		1,
		1,
		1,
		1
	};
	colorFocusedSecondary[] = 
	{
		1,
		1,
		1,
		1
	};
	color2Secondary[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabledSecondary[] = 
	{
		1,
		1,
		1,
		0.25
	};
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "RobotoCondensed";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	period = 0.4;
	font = "RobotoCondensed";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	url = "";
	action = "";
	class AttributesImage
	{
		font = "RobotoCondensed";
		color = "#E5E5E5";
		align = "left";
	};
};

class RscButtonMenu : RscShortcutButton
{
	idc=-1;
	type=16;
	style="0x02 + 0xC0";
	default=0;
	shadow=0;
	x=0;
	y=0;
	w=0.095588997;
	h=0.039216001;
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]={0,0,0,0.80000001};
	colorBackgroundFocused[]={1,1,1,1};
	colorBackground2[]={0.75,0.75,0.75,1};
	color[]={1,1,1,1};
	colorFocused[]={0,0,0,1};
	color2[]={0,0,0,1};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	textSecondary="";
	colorSecondary[]={1,1,1,1};
	colorFocusedSecondary[]={0,0,0,1};
	color2Secondary[]={0,0,0,1};
	colorDisabledSecondary[]={1,1,1,0.25};
	sizeExSecondary="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary="RobotoCondensed";
	period=1.2;
	periodFocus=1.2;
	periodOver=1.2;
	size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	class TextPos
	{
		left="0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right=0.0049999999;
		bottom=0;
	};
	class Attributes
	{
		font="RobotoCondensed";
		color="#E5E5E5";
		align="left";
		shadow="false";
	};
	class ShortcutPos
	{
		left="5.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top=0;
		w="1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		h="1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
};

class RscProgress
{
	type = 8;
	style = 0;
	x = 0.334585 * safezoneW + safezoneX;
	y = 0.181 * safezoneH + safezoneY;
	w = 0.330831 * safezoneW;
	h = 0.033 * safezoneH;
	texture = "";
	shadow = 1;
	colorFrame[] = {1,1,1,0};
	colorBackground[] = {1,1,1,0.2};
	colorBar[] = {1,1,1,0.9};
};

class RscListBox
{
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	font = "RobotoCondensed";
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.28,0.28,0.28,0.28};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = {0.7, 0.7, 0.7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class ListScrollBar: RscScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
};

class RscEdit
{
	type = 2;
	style = 0x00 + 0x40;
	font = "RobotoCondensed";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[] = {0, 0, 0, 0.8};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = 0;
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	canModify = 1;
};

class RscXSliderH
{
	style = 1024;
	type = 43;
	shadow = 2;
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.400000;
	color[] = {
			1, 1, 1, 0.7
	};
	colorActive[] = {
			1, 1, 1, 1
	};
	colorDisabled[] = {
			1, 1, 1, 0.500000
	};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 50) * 1)";
	text = "";
};

class RscMapControl
{	
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = {0.969,0.957,0.949,1};
	colorOutside[] = {0,0,0,1};
	colorText[] = {0,0,0,1};
	font = "RobotoCondensedBold";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorRocks[] = {0,0,0,0.3};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorForestBorder[] = {0,0,0,0};
	colorRocksBorder[] = {0,0,0,0};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	colorRoadsFill[] = {1,1,1,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	stickX[] = {0.2,{"Gamma",1,1.5}};
	stickY[] = {0.2,{"Gamma",1,1.5}};

	class LineMarker {
		lineDistanceMin = 3e-005;
		lineLengthMin = 5;
		lineWidthThick = 0.014;
		lineWidthThin = 0.008;
		textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	};

	class Legend
	{
		colorBackground[] = {1,1,1,0.5};
		color[] = {0,0,0,1};
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "RobotoCondensed";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	};
	class ActiveMarker
	{
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};
	class Command
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task
	{
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bush
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Church
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Chapel
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Cross
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Rock
	{
		color[] = {0.1,0.1,0.1,0.8};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bunker
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fountain
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class ViewTower
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Lighthouse
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Quay
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Fuelstation
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Hospital
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class BusStop
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Transmitter
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Stack
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Ruin
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};
	class Tourism
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
	};
	class Watertower
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Waypoint
	{
		color[] = {0,0,0,1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
	};
	class WaypointCompleted
	{
		color[] = {0,0,0,1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	moveOnEdges = 0;//1;
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "SafeZoneWAbs";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 0.35;
	alphaFadeEndScale = 0.4;
	fontLabel = "RobotoCondensed";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "RobotoCondensedBold";
	sizeExGrid = 0.02;
	fontUnits = "RobotoCondensedBold";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "RobotoCondensed";
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "RobotoCondensed";
	sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "RobotoCondensedBold";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	//text = "\a3\ui_f\data\map_background2_co.paa";
	class power
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powersolar
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwave
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwind
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class shipwreck
	{
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
};

class RscCombo
{
	style = 16;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0, 0, 0, 1};
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	colorBackground[] = {0,0,0,0.8};
	colorSelectBackground[] = {1, 1, 1, 0.7};
	colow_Rscrollbar[] = {1, 0, 0, 1};
	soundSelect[] = {
			"", 0.000000, 1
	};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";	
	class ComboScrollBar : RscScrollBar {};
};

class RscPictureButtonMenu : RscButtonMenu
{
	colorBackground[] = {1,1,1,0.004};
	colorBackgroundFocused[] = {1,1,1,0.008};
	colorBackground2[] = {0.75,0.75,0.75,0.004};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0,0,0,0.4};
};

class RscCheckBox
{
	idc = -1;
	type = 77;
	style = 0;
	checked = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	color[] = 
	{
		1,
		1,
		1,
		0.7
	};
	colorFocused[] = 
	{
		1,
		1,
		1,
		1
	};
	colorHover[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPressed[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.2
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundFocused[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundHover[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundPressed[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0
	};
	textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	soundEnter[] = 
	{
		"",
		0.1,
		1
	};
	soundPush[] = 
	{
		"",
		0.1,
		1
	};
	soundClick[] = 
	{
		"",
		0.1,
		1
	};
	soundEscape[] = 
	{
		"",
		0.1,
		1
	};
};
class RscTextCheckBox
{
	idc = -1;
	type = 7;
	style = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	colorText[] = 
	{
		1,
		0,
		0,
		1
	};
	color[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorTextSelect[] = 
	{
		0,
		0.8,
		0,
		1
	};
	colorSelectedBg[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorTextDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	colorDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] = 
	{
		"UNCHECKED"
	};
	checked_strings[] = 
	{
		"CHECKED"
	};
};

class RscTiles: RscControlsGroupNoScrollbars
{
  idc = 115099;
  x = "safezoneX";
  y = "safezoneY";
  w = "safezoneW";
  h = "safezoneH";
  disableCustomColors = 1;

  class Controls
  {

    class TileFrame: RscFrame
    {
      idc = 114999;
      x = 0;
      y = 0;
      w = "safezoneW";
      h = "safezoneH";
      colortext[] = { 0,0,0,1 };
    };

    class Tile_0_0: RscText
    {
      idc = 115000;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_1: RscText
    {
      idc = 115001;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_2: RscText
    {
      idc = 115002;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_3: RscText
    {
      idc = 115003;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_4: RscText
    {
      idc = 115004;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_5: RscText
    {
      idc = 115005;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_0: RscText
    {
      idc = 115010;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_1: RscText
    {
      idc = 115011;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_2: RscText
    {
      idc = 115012;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_3: RscText
    {
      idc = 115013;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_4: RscText
    {
      idc = 115014;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_5: RscText
    {
      idc = 115015;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_0: RscText
    {
      idc = 115020;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_1: RscText
    {
      idc = 115021;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_2: RscText
    {
      idc = 115022;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_3: RscText
    {
      idc = 115023;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_4: RscText
    {
      idc = 115024;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_5: RscText
    {
      idc = 115025;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_0: RscText
    {
      idc = 115030;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_1: RscText
    {
      idc = 115031;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_2: RscText
    {
      idc = 115032;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_3: RscText
    {
      idc = 115033;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_4: RscText
    {
      idc = 115034;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_5: RscText
    {
      idc = 115035;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_0: RscText
    {
      idc = 115040;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_1: RscText
    {
      idc = 115041;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_2: RscText
    {
      idc = 115042;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_3: RscText
    {
      idc = 115043;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_4: RscText
    {
      idc = 115044;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_5: RscText
    {
      idc = 115045;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_0: RscText
    {
      idc = 115050;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_1: RscText
    {
      idc = 115051;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_2: RscText
    {
      idc = 115052;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_3: RscText
    {
      idc = 115053;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_4: RscText
    {
      idc = 115054;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_5: RscText
    {
      idc = 115055;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };
  };
};

class Life_V3_RscText: RscText
{
	shadow = 0;
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
};

class Life_V3_RscStructuredText: RscStructuredText
{
	shadow = 0;
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {0,0,0,0};

	class Attributes {
		font = "RobotoCondensed";
        color = "#000000";
		align = "left";
		shadow = 0;
	};
};

class Life_V3_RscEdit: RscEdit
{
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBG_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_A',0.5])"};	
	shadow = 0;
};

class Life_V3_BackGround: RscText
{	
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BG_R',1])", "(profilenamespace getvariable ['GUI_V3_BG_G',1])", "(profilenamespace getvariable ['GUI_V3_BG_B',1])", "(profilenamespace getvariable ['GUI_V3_BG_A',0.8])"};
};

class Life_V3_Title: RscTitle
{
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_TITLE_R',0.216])", "(profilenamespace getvariable ['GUI_V3_TITLE_G',0.31])", "(profilenamespace getvariable ['GUI_V3_TITLE_B',0.4])", "(profilenamespace getvariable ['GUI_V3_TITLE_A',0.8])"};
};

class Life_V3_ButtonMenu: RscButton
{	
	style = "0xC0 + 0x00";
	shadow = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 28) * 1)";	
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_V3_BTBGF_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_A',0.7])"};
};

class Life_V3_RscListBox: RscListBox
{
	colorSelect[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorSelect2[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {1,1,1,0};
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBGS_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_A',0.8])"};
	colorSelectBackground2[] = {"(profilenamespace getvariable ['GUI_V3_ELBGS_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_A',0.8])"};
};

class Life_V3_RscCombo: RscCombo
{
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorSelect[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBG_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBG_A',0.5])"};	
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_V3_ELBGS_R',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_G',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_B',1])", "(profilenamespace getvariable ['GUI_V3_ELBGS_A',0.8])"};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
};

class Life_V3_RscProcessBar {
	type = 8;
	style = 0;			
	texture = "";	
	colorFrame[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBar[] = {"(profilenamespace getvariable ['GUI_V3_PGB_R',1])", "(profilenamespace getvariable ['GUI_V3_PGB_G',1])", "(profilenamespace getvariable ['GUI_V3_PGB_B',1])", "(profilenamespace getvariable ['GUI_V3_PGB_A',0.8])"};
};

class Life_V3_RscProcessBarText: RscText
{
	shadow = 0;
	style = 2;
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_PGT_R',0])", "(profilenamespace getvariable ['GUI_V3_PGT_G',0])", "(profilenamespace getvariable ['GUI_V3_PGT_B',0])", "(profilenamespace getvariable ['GUI_V3_PGT_A',1])"};
};