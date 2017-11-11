class UnionDialogCopTargetMessage {
	idd = 7000;
	name= "UnionDialogCopTargetMessage";
	movingEnable = 0;
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
		
		class MainBackground:Life_V3_BackGround {			
			idc = -1;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.378 * safezoneH;
		};
	};
	
	class controls {
		class Title : Life_V3_Title {			
			idc = -1;
			text = "Сообщение для машины";
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.566936 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.566936 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class targetInfo: Life_V3_RscStructuredText
		{
			idc = 7001;			
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.3712 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.1176 * safezoneH;
		};
		
		class b1: Life_V3_ButtonMenu
		{
			idc = 7002;
			text = ""; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;			
		};

		class b2: Life_V3_ButtonMenu
		{
			idc = 7003;
			text = ""; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.5336 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b3: Life_V3_ButtonMenu
		{
			idc = 7004;
			text = ""; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.5672 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b4: Life_V3_ButtonMenu
		{
			idc = 7005;
			text = ""; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.6008 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b5: Life_V3_ButtonMenu
		{
			idc = 7006;
			text = ""; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.6344 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b6: Life_V3_ButtonMenu
		{
			idc = 7007;
			text = ""; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b7: Life_V3_ButtonMenu
		{
			idc = 7008;
			text = ""; //--- ToDo: Localize;
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.7016 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};