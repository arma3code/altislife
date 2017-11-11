class UnionDialogWanted {
	idd = 2400;
	name= "UnionDialogWanted";
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

		class padImage : RscPicture {
			idc = 2406;
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
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "$STR_Wanted_Title";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		class WantedConnection : Title {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class WantedList : RscListBox 
		{
			idc = 2401;
			text = "";
			onLBSelChanged = "[] call UnionClient_system_wantedInfo";
			
			x = 0.0374988;
			y = 0.16;
			w = 0.275;
			h = 0.68;
		};
		
		class WantedDetails : RscListBox
		{
			idc = 2402;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.325001;
			y = 0.24;
			w = 0.637501;
			h = 0.52;
		};
		
		class BountyPrice : RscStructuredText
		{
			idc = 2403;
			text = "";
			
			x = 0.325001;
			y = 0.16;
			w = 0.637501;
			h = 0.06;
		};		
		
		class PardonButtonKey : RscButtonUC {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] spawn UnionClient_system_pardon;";
			
			x = 0.325001;
			y = 0.78;
			w = 0.637501;
			h = 0.06;
		};
	};
};