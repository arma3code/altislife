class CrimeStatusBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['CrimeStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['CrimeStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['CrimeStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class CrimeBarText {
			idc = 10000;
			x = safezoneX + safezoneW - 0.25;
			y = safezoneY + (safezoneH/4);
			w = 0.25;
			h = 0.6;
			shadow = 2;
			colorBackground[] = { 1, 0.3, 0, 0 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.03;
			type = 13;
			style = 1;
			text="";
			class Attributes {
				align="right";
				color = "#ffffff";
			};
		};
	};
};