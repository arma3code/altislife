class UnionDialogSurgery {
	idd = 5400;
	name= "UnionDialogSurgery";
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
		class bg: RscText
		{
			idc = -1;
			x = 0.027499 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};		
	};
	
	class controls 
	{
		class Title : RscTitle 
		{
			idc = 5401;
			text = "$STR_SURGERY_Title";
			x = 0.0274995 * safezoneW + safezoneX;
			y = 0.136 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		
		class FacesList : RscListBox 
		{
			idc = 5402;
			text = "";
			onLBSelChanged = "[_this] call UnionClient_surgery_Change";
			
			x = 0.0340615 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.177187 * safezoneW;
			h = 0.434 * safezoneH;
		};
		
		class BuyButtonKey : RscButtonUC 
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call UnionClient_surgery_SetFace";
			
			x = 0.0275 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseButtonKey : RscButtonUC 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			
			x = 0.125938 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class NVGOnBtn : RscButtonUC
		{
			idc = -1;
			text = "Темно";
			onButtonClick = "camUseNVG true";
			
			x = 0.0275 * safezoneW + safezoneX;
			y = 0.85 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class NVGOffBtn : RscButtonUC
		{
			idc = -1;
			text = "Светло";
			onButtonClick = "camUseNVG false";
			
			x = 0.125938 * safezoneW + safezoneX;
			y = 0.85 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};		
	};
};