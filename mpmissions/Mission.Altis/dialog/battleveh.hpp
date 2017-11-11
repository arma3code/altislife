class UnionDialogBattleVeh {
	idd = 5900;
	name= "UnionDialogBattleVeh";
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
			x = 0.395 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.3724 * safezoneH;
		};
	};
	
	class controls {
		class Title : Life_V3_Title {			
			idc = 5901;
			text = "Боевая техника";
			x = 0.395 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.585312 * safezoneW + safezoneX;
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
					
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class Vehlist : Life_V3_RscListBox 
		{
			idc = 5902;
			text = "";	
			
			x = 0.398934 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.202124 * safezoneW;
			h = 0.322 * safezoneH;
		};	

		class ButtonGetVeh : Life_V3_ButtonMenu
		{
			idc = -1;
			text = "Получить технику";			
			onButtonClick = "[] spawn UnionClient_system_getCombatVehicle";
			
			x = 0.397997 * safezoneW + safezoneX;
			y = 0.650978 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};