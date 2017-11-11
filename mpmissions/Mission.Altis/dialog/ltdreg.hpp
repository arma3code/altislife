class UnionDialogRegisterLTD {
	idd = 7100;
	name= "UnionDialogRegisterLTD";
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
			x = 0.368749 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.2884 * safezoneH;
		};
	};
	
	class controls {
		class Title : Life_V3_Title {
			idc = -1;
			text = "Регистрация ООО";
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.606313 * safezoneW + safezoneX;
			y = 0.3404 * safezoneH + safezoneY;
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
					
			x = 0.606313 * safezoneW + safezoneX;
			y = 0.3404 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class infoText: Life_V3_RscStructuredText
		{
			idc = 7101;			
			x = 0.374 * safezoneW + safezoneX;
			y = 0.3824 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.196 * safezoneH;
		};

		class name_e: Life_V3_RscEdit
		{
			idc = 7102;
			text = "Название вашей компании";
			x = 0.374 * safezoneW + safezoneX;
			y = 0.5868 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class regButton: Life_V3_ButtonMenu
		{
			idc = 7103;
			text = "Подать запрос";
			onButtonClick = "[] call UnionClient_ltd_regAction";			
			x = 0.496063 * safezoneW + safezoneX;
			y = 0.6232 * safezoneH + safezoneY;
			w = 0.124687 * safezoneW;
			h = 0.028 * safezoneH;
		};		
	};
};