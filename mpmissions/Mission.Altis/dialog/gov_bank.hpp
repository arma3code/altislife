class UnionDialogGovAtm {
	idd = 3900;
	name= "UnionDialogGovAtm";
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

		class RscTitleBackground:RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.45 - (22 / 250);
		};
	};
	
	class controls {
		
		class Title : RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Казна";
			x = 0.39;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class BankTitle : RscStructuredText
		{
			idc = 3901;
			text = "";
			
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = .14;
		};
		
		class WithdrawButton : RscButtonMenu 
		{
			idc = -1;
			text = "Снять";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[""take""] call UnionClient_system_govBank";
			
			x = 0.432;
			y = 0.45;
			w = (6 / 40);
			h = (1 / 25);
		};
		
		class DepositButton : RscButtonMenu 
		{
			idc = -1;
			text = "Внести";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[""add""] call UnionClient_system_govBank";
			
			x = 0.432;
			y = 0.502;
			w = (6 / 40);
			h = (1 / 25);
		};
		
		class moneyEdit : RscEdit {
		
		idc = 3902;
		
		text = "1";
		sizeEx = 0.030;
		x = 0.4; y = 0.4;
		w = 0.2; h = 0.03;
		
		};
		
		class CloseButtonKey : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.65 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};