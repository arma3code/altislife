class UnionDialogDhl
{
	idd = 5800;
	name="UnionDialogDhl";
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
		
		class MainBackground : Life_V3_BackGround {			
			idc = -1;
			
			x = 0.368749 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.224 * safezoneH;
		};
	};
	
	class controls
	{
		class Title : Life_V3_Title
		{
			idc = -1;
			text = "$STR_DHL_Menu";
			
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.594498 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
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
					
			x = 0.594498 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		
		class DHLInfo : Life_V3_RscStructuredText
		{
			idc = 5801;
			text = "";
			
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.112 * safezoneH;
		};

		class DHLSTart : Life_V3_RscCombo	{
			idc = 5802;
			onLBSelChanged = "_this call UnionClient_dhl_menuUpdate";
			
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DHLFinish : Life_V3_RscCombo	{
			idc = 5803;
			onLBSelChanged = "_this call UnionClient_dhl_menuUpdate";
			
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DHLMoney : Life_V3_RscStructuredText
		{
			idc = 5804;
			text = "";
			
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class DHKTakeOrder : Life_V3_ButtonMenu
		{
			idc = -1;
			text = "$STR_DHL_TakeOrder";
			onButtonClick = "[] call UnionClient_dhl_orderTake";
			
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};