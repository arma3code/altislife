class UnionDialogChopShop
{
	idd = 39400;
	name= "UnionDialogChopShop";
	movingEnabled = 0;
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

		class RscTitleBackground : RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1; y = 0.2;
			w = 0.48; h = (1 / 25);
		};

		class MainBackGround : RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; y = 0.2 + (11 / 250);
			w = 0.48; h = 0.6 - (22 / 250);
		};

		class Title : RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_ChopShop_Title";
			x = 0.1; y = 0.2;
			w = 0.48; h = (1 / 25);
		};

		class priceInfo : RscStructuredText
		{
			idc = 39401;
			text = "";
			sizeEx = 0.035;
			x = 0.11; y = 0.65;
			w = 0.4; h = 0.2;
		};
		class priceOwnInfo : RscStructuredText
		{
			idc = 39403;
			text = "";
			sizeEx = 0.035;
			x = 0.11; y = 0.68;
			w = 0.4; h = 0.2;
		};
	};

	class controls
	{
		class vehicleList : RscListBox
		{
			idc = 39402;
			onLBSelChanged = "_this call UnionClient_system_chopShopSelection";
			x = 0.11; y = 0.25;
			w = 0.46; h = 0.38;
		};

		class BtnSell : RscButtonMenu
		{
			idc = 39405;
			text = "$STR_Global_Sell";
			onButtonclick = "[] call UnionClient_system_chopShopSell;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class BtnOwn : RscButtonMenu
		{
			idc = 39404;
			text = "Перебить";
			onButtonclick = "[] spawn UnionClient_system_chopShopOwn;";
			x = 0.1 + ((6.25 / 40)*2) + ((1 / 250 / (safezoneW / safezoneH))*2);
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class BtnClose : RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};