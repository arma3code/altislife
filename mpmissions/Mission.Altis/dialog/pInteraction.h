class UnionDialogPlayerInteraction
{
	idd = 37400;
	name= "UnionDialogPlayerInteraction";
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
		
		class padImage : RscPicture {
			idc = 37401;
			text = "\union_pad\phone_skins\phone_s_bg1.paa";
			
			x = 5.36442e-007;
			y = -0.08;
			w = 0.999999;
			h = 1.38;
		};
	};
	
	class controls
	{				
		class ButtonClose: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.485;
			y = 0.8;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonOne : RscButtonMenu
		{
			idc = 37402;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.3875;
			y = 0.16;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonTwo : RscButtonMenu
		{
			idc = 37403;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.3875;
			y = 0.212;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonThree : RscButtonMenu
		{
			idc = 37404;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.264;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonFour : RscButtonMenu
		{
			idc = 37405;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.316;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonFive : RscButtonMenu
		{
			idc = 37406;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.3875;
			y = 0.368;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonSixHalf : RscButtonMenu
		{
			idc = 37407;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.462502;
			y = 0.42;
			w = 0.1625;
			h = 0.04;
		};
		
		class jtimeEdit : RscEdit 
		{
			idc = 37408;
			
			text = "15";
			sizeEx = 0.025;
			
			x = 0.3875;
			y = 0.42;
			w = 0.0624999;
			h = 0.04;
		};
		
		class ButtonSix : RscButtonMenu
		{
			idc = 37409;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.42;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonSeven : RscButtonMenu
		{
			idc = 37410;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.472;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonEight : RscButtonMenu
		{
			idc = 37411;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.524;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonNine : RscButtonMenu
		{
			idc = 37412;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.576;
			w = 0.2375;
			h = 0.04;
		};	

		class ButtonTen : RscButtonMenu
		{
			idc = 37413;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.628;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonEleven : RscButtonMenu
		{
			idc = 37414;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.387503;
			y = 0.68;
			w = 0.2375;
			h = 0.04;
		};
		
		class ButtonTwelve : RscButtonMenu
		{
			idc = 37415;
			colorBackground[] = {1,1,1,0.1};
			text = "";
			sizeEx = 0.025;
			
			x = 0.385002;
			y = 0.732;
			w = 0.2375;
			h = 0.04;
		};
	};
};