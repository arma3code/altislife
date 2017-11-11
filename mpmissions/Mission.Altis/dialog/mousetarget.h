class ExtremoRscMouseTarget
{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="ExtremoRscMouseTarget";
	onLoad = "uiNamespace setVariable ['ExtremoRscMouseTarget',_this select 0]";
	onUnload = "uiNamespace setVariable ['ExtremoRscMouseTarget', objNull]";
	onDestroy = "uiNamespace setVariable ['ExtremoRscMouseTarget', objNull]";
	objects[]={};
	
	class controlsBackground {
		class infoText: RscStructuredText
		{
			idc = 666002;
			x = 0 * safezoneW + safezoneX;
			y = 0.89 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class dot: RscPicture
		{
			idc = -1;
			text = "\A3\ui_f\data\igui\cfg\cursors\gunner_lock_ca.paa";
			x = 0.485;
			y = 0.46;
			w = 0.03;
			h = 0.04;
		};
	};
	
	class Controls
	{
		class mouse_target: RscStructuredText
		{
			idc = 666001;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.511875 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};	
	};
};