class UnionDialogPadMain {
	idd = 2000;
	name= "UnionDialogPadMain";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles";

	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		class Tiles: RscTiles {};

		class padImage : RscPicture {
			idc = 2001;
			text = "";

			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};

		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";

			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			colorBackgroundDisabled[] = {0, 0, 0, 0};
			colorBorder[] = {0, 0, 0, 0};
			colorDisabled[] = {0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			colorShadow[] = {0, 0, 0, 0};
			colorText[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.462499;
			y = 0.86;
			w = 0.075;
			h = 0.06;
		};
		class ToggleButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "[] spawn UnionClient_hud_togglePower";
			tooltip = "Включить\выключить планшет";

			//colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.465;
			y = 0.932;
			w = 0.067;
			h = 0.1;

			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			colorBackgroundDisabled[] = {0, 0, 0, 0};
			colorBorder[] = {0, 0, 0, 0};
			colorDisabled[] = {0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			colorShadow[] = {0, 0, 0, 0};
			colorText[] = {0, 0, 0, 0};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
		};

		class ScreenOffImage : RscPicture {
			idc = 42002;
			text = "\union_pad\pad_skins\phone_offScreen.paa";

			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};

	};

	class controls {
		//иконки кнопок
		class ButtonPicture_0 : RscPicture {
			idc = 2010;
			text = "";

			x = 0.0475;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};
		class Button_0: RscPictureButtonMenu {
			idc = 2011;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.0475;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_1 : RscPicture {
			idc = 2012;
			text = "";

			x = 0.2;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class Button_1: RscPictureButtonMenu {
			idc = 2013;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.2;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};


		class ButtonPicture_2 : RscPicture {
			idc = 2014;
			text = "";

			x = 0.3525;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class Button_2: RscPictureButtonMenu {
			idc = 2015;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.3525;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};


		class ButtonPicture_3 : RscPicture {
			idc = 2016;
			text = "";

			x = 0.505;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class Button_3: RscPictureButtonMenu {
			idc = 2017;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.505;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_4 : RscPicture {
			idc = 2018;
			text = "";

			x = 0.6575;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class Button_4: RscPictureButtonMenu {
			idc = 2019;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.6575;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_5 : RscPicture {
			idc = 2020;
			text = "";

			x = 0.81;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		class Button_5: RscPictureButtonMenu {
			idc = 2021;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.81;
			y = 0.092;
			w = 0.14;
			h = 0.188;
		};

		//второй ряд
		class ButtonPicture_6 : RscPicture {
			idc = 2022;
			text = "";

			x = 0.0475;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class Button_6: RscPictureButtonMenu {
			idc = 2023;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.0475;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_7 : RscPicture {
			idc = 2024;
			text = "";

			x = 0.2;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class Button_7: RscPictureButtonMenu {
			idc = 2025;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.2;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_8 : RscPicture {
			idc = 2026;
			text = "";

			x = 0.3525;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class Button_8: RscPictureButtonMenu {
			idc = 2027;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.3525;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_9 : RscPicture {
			idc = 2028;
			text = "";

			x = 0.505;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class Button_9: RscPictureButtonMenu {
			idc = 2029;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.505;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_10 : RscPicture {
			idc = 2030;
			text = "";

			x = 0.6575;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class Button_10: RscPictureButtonMenu {
			idc = 2031;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.6575;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_11 : RscPicture {
			idc = 2032;
			text = "";

			x = 0.81;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		class Button_11: RscPictureButtonMenu {
			idc = 2033;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.81;
			y = 0.288;
			w = 0.14;
			h = 0.188;
		};

		//третий ряд
		class ButtonPicture_12 : RscPicture {
			idc = 2034;
			text = "";

			x = 0.0475;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class Button_12: RscPictureButtonMenu {
			idc = 2035;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.0475;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_13 : RscPicture {
			idc = 2036;
			text = "";

			x = 0.2;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class Button_13: RscPictureButtonMenu {
			idc = 2037;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.2;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_14 : RscPicture {
			idc = 2038;
			text = "";

			x = 0.3525;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class Button_14: RscPictureButtonMenu {
			idc = 2039;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.3525;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_15 : RscPicture {
			idc = 2040;
			text = "";

			x = 0.505;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class Button_15: RscPictureButtonMenu {
			idc = 2041;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.505;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_16 : RscPicture {
			idc = 2042;
			text = "";

			x = 0.6575;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class Button_16: RscPictureButtonMenu {
			idc = 2043;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.6575;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class ButtonPicture_17 : RscPicture {
			idc = 2044;
			text = "";

			x = 0.81;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};

		class Button_17: RscPictureButtonMenu {
			idc = 2045;
			text = "";
			onButtonClick = "";
			tooltip = "";

			x = 0.81;
			y = 0.484;
			w = 0.14;
			h = 0.188;
		};
		class splashImage : RscPicture {
			show = "false";
			idc = 42001;
			text = "\union_pad\pad_skins\phone_splashScreen.paa";

			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};
	};
};