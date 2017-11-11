class UnionDialogParkingCiv
{
	idd = 5700;
	name="UnionDialogParkingCiv";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles";
	
	class controlsBackground
	{
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
		
		class MainBackground : Life_V3_BackGround {			
			idc = -1;
			
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.2172 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.518 * safezoneH;
		};
	};
	
	class controls
	{
		class Title : Life_V3_Title
		{
			idc = 5701;
			text = "Оплата штрафстоянки";
			
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.704748 * safezoneW + safezoneX;
			y = 0.1864 * safezoneH + safezoneY;
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
					
			x = 0.704748 * safezoneW + safezoneX;
			y = 0.1864 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		
		class VehicleList : Life_V3_RscListBox
		{
			idc = 5702;
			text = "";
			
			onLBSelChanged = "_this call UnionClient_parking_MenuLBChange";
			
			x = 0.280811 * safezoneW + safezoneX;
			y = 0.2228 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.5068 * safezoneH;
		};
		
		class vehicleInfomationList : Life_V3_RscStructuredText
		{
			idc = 5703;
			text = "";
			
			x = 0.468497 * safezoneW + safezoneX;
			y = 0.2228 * safezoneH + safezoneY;
			w = 0.250686 * safezoneW;
			h = 0.4704 * safezoneH;
		};	
		
		class PayForCar : Life_V3_ButtonMenu
		{
			idc = 5704;
			text = "Оплатить";
			onButtonClick = "[] call UnionClient_parking_Pay";
			
			x = 0.543297 * safezoneW + safezoneX;
			y = 0.7016 * safezoneH + safezoneY;
			w = 0.177187 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};