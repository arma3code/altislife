class UnionDialogClothingShop {
	idd = 3100;
	name= "UnionDialogClothingShop";
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
		class bg: Life_V3_BackGround
		{
			idc = -1;

			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.052 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.938 * safezoneH;
		};		
	};
	
	class controls 
	{
		class Title : Life_V3_Title 
		{
			idc = 3103;
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

		
		class ClothingList : Life_V3_RscListBox 
		{
			idc = 3101;
			text = "";
			onLBSelChanged = "[_this] call UnionClient_system_changeClothes";
			
			x = 0.006499 * safezoneW + safezoneX;
			y = 0.0912 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.8092 * safezoneH;
		};
		
		class PriceTag : Life_V3_RscStructuredText
		{
			idc = 3102;
			text = "";		
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.906 * safezoneH + safezoneY;
			w = 0.175875 * safezoneW;
			h = 0.042 * safezoneH;
		};		
				
		class FilterList : Life_V3_RscCombo
		{
			idc = 3105;			
			onLBSelChanged  = "_this call UnionClient_system_clothingFilter";
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};		

		class BuyButtonKey : Life_V3_ButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call UnionClient_system_buyClothes";
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.9536 * safezoneH + safezoneY;
			w = 0.175873 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};