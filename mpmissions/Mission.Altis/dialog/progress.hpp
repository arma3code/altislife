class life_progress {
	idd = 38200;
	fadeout=0;
	fadein=0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_progress', displayNull]";
	duration = 10e10;
	name= "life_progress";
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class TypeOfAction: RscPicture {
			idc = 38201;
			text = "";
			colorBackground[] = {0,0,0,0};
			x = 17.7 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class RollingPic: RscPicture {
			idc = 38202;
			text = "";
			colorBackground[] = {0,0,0,0};
			x = 17.7 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
	};
};

class life_timer
{
	name = "life_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TimerText : RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
class death_timer
{
	name = "death_timer";
	idd = 38302;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['death_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['death_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TimerText : RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38303;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class jail_timer
{
	name = "jail_timer";
	idd = 38304;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['jail_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['jail_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TimerText : RscStructuredText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38305;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
};
