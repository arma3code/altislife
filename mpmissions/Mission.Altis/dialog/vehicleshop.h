class UnionDialogVehicleShopV2
{
	idd = 2300;
	name="UnionDialogVehicleShopV2";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground
	{	
		class LeftBackground : Life_V3_BackGround
		{
			idc = -1;
			
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.052 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.938 * safezoneH;
		};
	};
	
	class controls
	{
		class Title : Life_V3_Title {
			idc = 2301;
			text = "";
			
			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.00440001 * safezoneH + safezoneY;
			w = 0.994876 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
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
					
			x = 0.979062 * safezoneW + safezoneX;
			y = 0.0128 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		
		class VehicleList : Life_V3_RscListBox {
			idc = 2302;
			text = "";		
			onLBSelChanged = "_this call UnionClient_system_vehicleShopLBChange";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.3012 * safezoneH + safezoneY;
			w = 0.175875 * safezoneW;
			h = 0.5824 * safezoneH;
		};
		
		class ColorList : Life_V3_RscCombo	{
			idc = 2304;
			onLBSelChanged = "_this call UnionClient_system_vehicleShopColorLBChange";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.8892 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class MatList : Life_V3_RscCombo	{
			idc = 2305;
			onLBSelChanged = "_this call UnionClient_system_vehicleShopColorLBChange";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.92 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class vehicleInfomationList : Life_V3_RscStructuredText {
			idc = 2303;
			text = "";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.238 * safezoneH;		
		};
		
		class RentCar : Life_V3_ButtonMenu {
			idc = 2310;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn UnionClient_system_vehicleShopBuy;";
			
			x = 0.0970625 * safezoneW + safezoneX;
			y = 0.9536 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class BuyCar : Life_V3_ButtonMenu {
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn UnionClient_system_vehicleShopBuy;";
			
			x = 0.0065 * safezoneW + safezoneX;
			y = 0.9536 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};