class UnionDialogSettings
{
	idd = 2900;
	name = "UnionDialogSettings";
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles";

	class controlsBackground
	{
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
			idc = 2903;
			text = "";

			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};

		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; [] spawn UnionClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";

			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.375001;
			y = 0.86;
			w = 0.0624999;
			h = 0.06;
		};

		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";

			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.462499;
			y = 0.86;
			w = 0.075;
			h = 0.06;
		};
	};

	class controls
	{
		class Title : RscTitle
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_SM_Title";

			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};

		class VDonFoot : RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";

			x = 0.0374988;
			y = 0.16;
			w = 0.0875;
			h = 0.04;
		};

		class VDinCar : RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";

			x = 0.0374988;
			y = 0.22;
			w = 0.0875;
			h = 0.04;
		};

		class VDinAir : RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";

			x = 0.0374988;
			y = 0.28;
			w = 0.0875;
			h = 0.04;
		};

		class VD_onfoot_slider : RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call UnionClient_system_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";

			x = 0.137499;
			y = 0.16;
			w = 0.2625;
			h = 0.04;
		};

		class VD_onfoot_value : RscText
		{
			idc = 2902;
			text = "";

			x = 0.412499;
			y = 0.16;
			w = 0.1125;
			h = 0.04;
		};

		class VD_car_slider : RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call UnionClient_system_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";

			x = 0.137499;
			y = 0.22;
			w = 0.2625;
			h = 0.04;
		};

		class VD_car_value : RscText
		{
			idc = 2912;
			text = "";

			x = 0.412499;
			y = 0.22;
			w = 0.1125;
			h = 0.04;
		};

		class VD_air_slider : RscXSliderH
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call UnionClient_system_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";

			x = 0.137499;
			y = 0.28;
			w = 0.2625;
			h = 0.04;
		};

		class VD_air_value : RscText
		{
			idc = 2922;
			text = "";

			x = 0.412499;
			y = 0.28;
			w = 0.1125;
			h = 0.04;
		};



		class PlayerTagsHeader : RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.0375;
			y = 0.38;
			w = 0.3875;
			h = 0.04;
		};

		class PlayerTagsONOFF : RscActiveText
		{
			text = "";
			tooltip = "$STR_GUI_PlayTags";
			idc = 2970;
			sizeEx = 0.04;

			x = 0.4375;
			y = 0.38;
			w = 0.0875;
			h = 0.04;
		};

		class GrassHeader : RscText
		{
			idc = -1;
			text = "Прорисовка травы";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.0375;
			y = 0.44;
			w = 0.3875;
			h = 0.04;
		};

		class GrassONOFF : RscActiveText
		{
			tooltip = "Полная прорисовка травы. Выключение данного параметра может увеличить производительность";
			idc = 2972;

			x = 0.4375;
			y = 0.44;
			w = 0.0875;
			h = 0.04;
		};

		class FPSHeader : RscText
		{
			idc = -1;
			text = "Отображение FPS (кадры в сек)";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.0375;
			y = 0.504;
			w = 0.3875;
			h = 0.04;
		};

		class FPSONOFF : RscActiveText
		{
			tooltip = "Отображение количества кадров в секунду";
			idc = 2975;

			x = 0.4375;
			y = 0.504;
			w = 0.0875;
			h = 0.04;
		};

		class HUDHeader : RscText
		{
			idc = -1;
			text = "Отображение HUD";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.0375;
			y = 0.568;
			w = 0.3875;
			h = 0.04;
		};

		class HUDONOFF : RscActiveText
		{
			tooltip = "Отображение информации о персонаже на экране";
			idc = 2979;

			x = 0.4375;
			y = 0.568;
			w = 0.0875;
			h = 0.04;
		};

		class ColorTitle : RscStructuredText
		{
			idc = -1;
			text = "Планшет:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.16;
			w = 0.1125;
			h = 0.04;
		};

		class ColorList : RscCombo
		{
			idc = 2973;
			onLBSelChanged = "_this call UnionClient_system_savePadSkin";

			x = 0.65;
			y = 0.16;
			w = 0.3125;
			h = 0.04;
		};

		class PassTitle : RscStructuredText
		{
			idc = -1;
			text = "Паспорт:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.22;
			w = 0.1125;
			h = 0.04;
		};

		class PassList : RscCombo
		{
			idc = 2977;
			onLBSelChanged = "_this call UnionClient_system_savePassport";

			x = 0.65;
			y = 0.22;
			w = 0.3125;
			h = 0.04;
		};

		class TagTitle : RscStructuredText
		{
			idc = -1;
			text = "Титул:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.28;
			w = 0.1125;
			h = 0.04;
		};

		class TagList : RscCombo
		{
			idc = 2978;
			onLBSelChanged = "_this call UnionClient_system_saveTitle";

			x = 0.65;
			y = 0.28;
			w = 0.3125;
			h = 0.04;
		};

		class b_skin: RscButtonMenu
		{
			idc = -1;
			text = "Настройка окон"; //--- ToDo: Localize;
			x = 0.65;
			y = 0.36;
			w = 0.3125;
			h = 0.04;

			onButtonClick = "closeDialog 0; [] spawn UnionClient_hud_skinMenu";
		};
	};
};