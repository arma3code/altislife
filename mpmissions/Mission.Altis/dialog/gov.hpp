class UnionDialogGov {
	idd = 3200;
	name= "UnionDialogGov";
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
			idc = 3204;
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
			text = "Правительство Алтиса";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.4875;
			h = 0.04;
		};

		class PricesTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Цены";
			
			x = 0.537498;
			y = 0.1;
			w = 0.425;
			h = 0.04;
		};
		
		class BankBalance : RscStructuredText
		{
			idc = 3202;			
			text = "";
			sizeEx = 0.020;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.0374988;
			y = 0.16;
			w = 0.4875;
			h = 0.62;
		};

		class PricesList : RscListBox
		{
			idc = 3205;		
			
			x = 0.537501;
			y = 0.16;
			w = 0.425;
			h = 0.68;
		};
				
		class WantedButton : RscButtonMenu {
			idc = -1;
			text = "Розыск";
			onButtonClick = "[[getPlayerUID player,player],""wantedCheck""] call UnionClient_system_hcExec; hint ""Запрос отправлен..."";";
			
			x = 0.0374988;
			y = 0.8;
			w = 0.2375;
			h = 0.04;
		};
		
		class BankButton : RscButtonMenu {
			idc = 3203;
			text = "Казна";
			onButtonClick = "[] call UnionClient_system_openGovBankMenu";
			
			x = 0.2875;
			y = 0.8;
			w = 0.2375;
			h = 0.04;
		};		
	};
};