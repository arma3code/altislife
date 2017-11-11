class UnionDialogCraftShop {
	idd = 1401;
	name= "UnionDialogCraftShop";
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

		class MainBackground: RscText {
			idc = -1;
			x = 0.309687 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.374063 * safezoneW;
			h = 0.4452 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};

	class controls {
		class Title : RscTitle {	
			idc = -1;	
			text = "$STR_CRAFT_Title";
			x = 0.309687 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.374063 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class craftList : RscListBox
		{
			idc = 669;		
			x = 0.314938 * safezoneW + safezoneX;
			y = 0.2564 * safezoneH + safezoneY;
			w = 0.363561 * safezoneW;
			h = 0.392 * safezoneH;
		};

		class RecipeType: RscCombo
		{
			idc = 668;
			onLBSelChanged = "_this call UnionClient_crafting_ShopFilter";			
			x = 0.314938 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.2415 * safezoneW;
			h = 0.0308 * safezoneH;
		};

		class ButtonCraftBuy : RscButtonMenu {
			idc = 674;
			text = "Купить";
			onButtonClick = "[] spawn UnionClient_crafting_Buy";
			x = 0.560367 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.118126 * safezoneW;
			h = 0.0308 * safezoneH;
		};

		class CloseButtonKey : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.309687 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
}; 