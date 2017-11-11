class UnionDialogKeyManagement {
	idd = 2700;
	name= "UnionDialogKeyManagement";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles; [] spawn UnionClient_system_keyMenu;";
	
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
		
		class padImage : RscPicture {
			idc = 2704;
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
	
	class controls {

		
		class Title : RscTitle {
			colorBackground[] = {1,1,1,0.2};
			idc = -1;
			text = "$STR_Keys_Title";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		class KeyChainList : RscListBox 
		{
			idc = 2701;
			text = "";
			
			x = 0.0374988;
			y = 0.16;
			w = 0.925;
			h = 0.4;
		};		
		
		class NearPlayers : RscCombo {
		
			idc = 2702;
		
			x = 0.0374988;
			y = 0.58;
			w = 0.2625;
			h = 0.04;
		
		};
		
		class DropKey : RscButtonMenu {
			idc = -1;			
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] call UnionClient_system_keyDrop";
			
			x = 0.737499;
			y = 0.58;
			w = 0.225;
			h = 0.04;
		};
		
		class GiveKey : RscButtonMenu {
			idc = 2703;			
			text = "$STR_Keys_GiveKey";			
			onButtonClick = "[] call UnionClient_system_keyGive";
			
			x = 0.312501;
			y = 0.58;
			w = 0.2625;
			h = 0.04;
		};
	};
};