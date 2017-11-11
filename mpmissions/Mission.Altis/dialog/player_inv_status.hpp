class UnionDialogPadStatus {
	idd = 7200;
	name= "UnionDialogPadStatus";
	movingEnable = 1;
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
			idc = 7201;
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
		class finance_title: RscText
		{
			idc = 7202;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_MoneyStats";
			sizeEx = 0.03;

			x = 0.0375;
			y = 0.096;
			w = 0.3;
			h = 0.04;			
		};
		class money_status: RscStructuredText
		{
			idc = 7203;
			
			x = 0.0375;
			y = 0.152;
			w = 0.3;
			h = 0.18;
		};
		class money_edit: RscEdit
		{
			idc = 7204;
			text = "1";

			x = 0.0375;
			y = 0.348;
			w = 0.1125;
			h = 0.04;
		};
		class money_players_combo: RscCombo
		{
			idc = 7205;

			x = 0.1625;
			y = 0.348;
			w = 0.175;
			h = 0.04;
		};
		class give_money_button: RscButtonUC
		{
			idc = 7206;
			text = "$STR_PM_SendMoney";	
			onButtonClick = "[] call UnionClient_system_giveMoney";

			x = 0.0375;
			y = 0.4;
			w = 0.3;
			h = 0.052;
		};



		class licenses_title: RscText
		{
			idc = 7207;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_Licenses";
			sizeEx = 0.03;

			x = 0.0375;
			y = 0.468;
			w = 0.3;
			h = 0.04;			
		};
		class licenses_list: RscListbox
		{
			idc = 7208;

			x = 0.0375;
			y = 0.524;
			w = 0.3;
			h = 0.324;			
		};


		class i_items_title: RscText
		{
			idc = 7209;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_Inventory";
			sizeEx = 0.03;

			x = 0.3475;
			y = 0.096;
			w = 0.315001;
			h = 0.04;			
		};
		class i_items_list: RscListbox
		{
			idc = 7210;

			x = 0.3475;
			y = 0.152;
			w = 0.315;
			h = 0.696;
		};
		

		class backpack_title: RscText
		{
			idc = 7211;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.03;

			x = 0.672501;
			y = 0.096;
			w = 0.292501;
			h = 0.04;			
		};
		class backpack_items_list: RscListbox
		{
			idc = 7212;

			x = 0.6725;
			y = 0.152;
			w = 0.2925;
			h = 0.46;
		};
		class items_numbers: RscEdit
		{
			idc = 7213;
			text = "1";

			x = 0.6725;
			y = 0.624;
			w = 0.0875;
			h = 0.04;
		};
		class items_players_combo: RscCombo
		{
			idc = 7214;

			x = 0.7725;
			y = 0.624;
			w = 0.1925;
			h = 0.04;
		};		
		class use_item_button: RscButtonUC
		{
			idc = 7215;
			text = "$STR_Global_Use";	
			onButtonClick = "[] call UnionClient_system_useItem";	

			x = 0.6725;
			y = 0.676;
			w = 0.292501;
			h = 0.052;
		};
		class give_item_button: RscButtonUC
		{
			idc = 7216;
			text = "$STR_Global_Give";	
			onButtonClick = "[] call UnionClient_system_giveItem";

			x = 0.6725;
			y = 0.736;
			w = 0.292501;
			h = 0.052;
		};
		class delete_item_button: RscButtonUC
		{
			idc = 7217;
			text = "$STR_Global_Remove";	
			onButtonClick = "[] call UnionClient_system_yItemRemove";

			x = 0.6725;
			y = 0.796;
			w = 0.292501;
			h = 0.052;
		};
		

		class donate_status_text: RscStructuredText
		{
			idc = 7218;
			text = "";

			x = 0.7175;
			y = 0.872;
			w = 0.25;
			h = 0.036;			
		};
	};
};