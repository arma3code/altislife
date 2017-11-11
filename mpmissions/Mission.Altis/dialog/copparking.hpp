class UnionDialogParkingCop
{
	idd = 5500;
	name = "UnionDialogParkingCop";
	movingEnabled = 0;
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

	
		class MainBackground: Life_V3_BackGround {
			idc = -1;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.14 * safezoneH;			
		};
	};
	
	class controls 
	{
		class Title : Life_V3_Title {			
			idc = 5501;
			text = "";
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.606308 * safezoneW + safezoneX;
			y = 0.2984 * safezoneH + safezoneY;
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
					
			x = 0.606308 * safezoneW + safezoneX;
			y = 0.2984 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class t_cost: Life_V3_RscText {
			idc = -1;
			text = "$STR_PARKING_Total";
			x = 0.351685 * safezoneW + safezoneX;
			y = 0.3376 * safezoneH + safezoneY;
			w = 0.0616875 * safezoneW;
			h = 0.042 * safezoneH;			
		};
		class e_cost: Life_V3_RscEdit {
			idc = 5502;
			text = "100";
			x = 0.418631 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.028 * safezoneH;			
		};
		class cost_message: Life_V3_RscText	{
			idc = -1;
			text = "$STR_PARKING_TotalMax";
			x = 0.49475 * safezoneW + safezoneX;
			y = 0.3376 * safezoneH + safezoneY;
			w = 0.123375 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class t_message: Life_V3_RscText {
			idc = -1;
			text = "$STR_PARKING_Message";
			x = 0.351685 * safezoneW + safezoneX;
			y = 0.3796 * safezoneH + safezoneY;
			w = 0.0616875 * safezoneW;
			h = 0.042 * safezoneH;			
		};
		class e_Message: Life_V3_RscEdit {
			idc = 5503;
			text = ""; //--- ToDo: Localize;
			x = 0.418629 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.199501 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class b_send: Life_V3_ButtonMenu {
			idc = -1;
			text = "$STR_PARKING_Send";
			onButtonClick = "[life_vInact_curTarget] spawn UnionClient_parking_ImpoundAction;";
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};