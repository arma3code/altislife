class UnionDialogAtm {
	idd = 2700;
	name= "UnionDialogAtm";
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
			idc = -1;
			text = "\union_pad\atm_skins\atm_sc.paa";
			
			x = -0.0999998;
			y = -0.24;
			w = 1.2125;
			h = 1.46;
		};
		
		class balancebg: RscText
		{
			idc = -1;
			x = 0.087499;
			y = 0.26;
			w = 0.3875;
			h = 0.28;
			colorBackground[] = {0,0,0,0.8};
		};
		class sendbg: RscText
		{
			idc = -1;
			x = 0.487501;
			y = 0.26;
			w = 0.4375;
			h = 0.54;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {
		
		class Title : RscTitle {			
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.087499;
			y = 0.18;
			w = 0.837499;
			h = 0.06;
			colorBackground[] = {0,0,0,0.8};
		};

		class CashInfo : RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.100001;
			y = 0.28;
			w = 0.362501;
			h = 0.18;
		};		
				
		class WithdrawButton : RscButtonUC 
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";			
			onButtonClick = "[] call UnionClient_atm_withdraw";
			
			x = 0.087499;
			y = 0.56;
			w = 0.175;
			h = 0.06;
		};
		
		class DepositButton : RscButtonUC 
		{
			idc = -1;
			text = "$STR_ATM_Deposit";			
			onButtonClick = "[] call UnionClient_atm_deposit";
			
			x = 0.2875;
			y = 0.56;
			w = 0.1875;
			h = 0.06;
		};
		
		class moneyEdit : RscEdit {		
			idc = 2702;
			text = "1";
		
			x = 0.100001;
			y = 0.48;
			w = 0.362501;
			h = 0.04;
		
		};
		
		class PlayerList : RscListBox 
		{
			idc = 2703;
			x = 0.5;
			y = 0.28;
			w = 0.412501;
			h = 0.42;
		};

		class SendMoneyEdit : RscEdit {		
			idc = 2704;
			text = "1";
		
			x = 0.5;
			y = 0.72;
			w = 0.1625;
			h = 0.06;
		};
		
		class TransferButton : RscButtonUC 
		{
			idc = -1;
			text = "$STR_ATM_Transfer";			
			onButtonClick = "[] call UnionClient_atm_transfer";
			
			x = 0.675;
			y = 0.72;
			w = 0.2375;
			h = 0.06;
		};
		
		class GangDeposit : RscButtonUC
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";			
			onButtonClick = "[] spawn UnionClient_gangs_Deposit";

			x = 0.087499;
			y = 0.64;
			w = 0.3875;
			h = 0.06;
		};
		
		class CloseButtonKey : RscButtonUC {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";			
			
			x = 0.087499;
			y = 0.72;
			w = 0.3875;
			h = 0.08;
		};
	};
};