class UnionDialogWeaponShop {
	idd = 38400;
	name= "UnionDialogWeaponShop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground {
		class bg: Life_V3_BackGround
		{
			idc = -1;

			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.0492 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.9492 * safezoneH;
		};
	};

	class controls {
		
		class Title : Life_V3_Title
		{
			idc = 38401;			
			text = ""; //--- ToDo: Localize;
			
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.00440001 * safezoneH + safezoneY;
			w = 0.994876 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
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
					
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class FilterList: Life_V3_RscCombo {
			idc = 38402;
			onLBSelChanged = "_this call UnionClient_system_weaponShopFilter";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.028 * safezoneH;
		};	

		class itemList: Life_V3_RscListBox {
			idc = 38403;
			onLBSelChanged = "_this call UnionClient_system_weaponShopSelection";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.2564 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.7028 * safezoneH;
		};

		class itemInfo: Life_V3_RscStructuredText {
			idc = 38404;
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0912 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.1596 * safezoneH;	
		};	

		class ButtonBuySell: Life_V3_ButtonMenu {
			idc = 38405;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call UnionClient_system_weaponShopBuySell";
			
			x = 0.0576875 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.126 * safezoneW;
			h = 0.028 * safezoneH;	
		};
	
		class ItemCount: Life_V3_RscEdit {
			idc = 38406;
			text = "1";
			
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.049875 * safezoneW;
			h = 0.028 * safezoneH;			
		};

		class MagsBg: Life_V3_BackGround
		{
			idc = 38410;
			x = 0.18894 * safezoneW + safezoneX;
			y = 0.8416 * safezoneH + safezoneY;
			w = 0.182437 * safezoneW;
			h = 0.1568 * safezoneH;			
		};

		class MagsList: Life_V3_RscListBox {
			idc = 38407;
			
			x = 0.191564 * safezoneW + safezoneX;
			y = 0.8472 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.112 * safezoneH;
		};	

		class MagsCount: Life_V3_RscEdit {
			idc = 38408;
			text = "1";
			
			x = 0.191563 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.049875 * safezoneW;
			h = 0.028 * safezoneH;		
		};

		class MagsButtonBuy: Life_V3_ButtonMenu {
			idc = 38409;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call UnionClient_system_weaponShopBuyMags";
			
			x = 0.244058 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.124688 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};