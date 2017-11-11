class playerHUD
{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	onUnload = "uiNamespace setVariable ['playerHUD', objNull]";
	onDestroy = "uiNamespace setVariable ['playerHUD', objNull]";
	objects[]={};

	class controlsBackground 
	{
		class icon_health_r: RscPicture {
			idc = 23515;
			x = 0.85175 * safezoneW + safezoneX;
			y = 0.836 * safezoneH + safezoneY;
			w = 0.018375 * safezoneW;
			h = 0.0336 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_health: icon_health_r
		{
			idc = 23509;
			text = "";
		};

		class icon_fatig_r: RscPicture {
			idc = 23516;
			x = 0.917374 * safezoneW + safezoneX;
			y = 0.836 * safezoneH + safezoneY;
			w = 0.018375 * safezoneW;
			h = 0.0336 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_fatig: icon_fatig_r
		{
			idc = 23510;
			text = "";						
		};

		class icon_food_r: RscPicture {
			idc = 23517;
			x = 0.854375 * safezoneW + safezoneX;
			y = 0.8836 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0252 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_food: icon_food_r
		{
			idc = 23511;
			text = "";				
		};

		class icon_drink_r: RscPicture {
			idc = 23518;
			x = 0.854375 * safezoneW + safezoneX;
			y = 0.9116 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0252 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_drink: icon_drink_r
		{
			idc = 23512;
			text = "";						
		};

		class icon_micro_r: RscPicture {
			idc = 23519;
			x = 0.854375 * safezoneW + safezoneX;
			y = 0.9396 * safezoneH + safezoneY;
			w = 0.013125 * safezoneW;
			h = 0.0252 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			text = "";
		};
		class icon_micro: icon_micro_r
		{
			idc = 23513;
			text = "";						
		};
		
		class verg_razd: RscText
		{
			idc = 23514;
			text = "";
			x = 0.84125 * safezoneW + safezoneX;
			y = 0.836 * safezoneH + safezoneY;
			w = 0.00103125 * safezoneW;
			h = 0.1298 * safezoneH;			
			sizeEx = 1 * GUI_GRID_H;
		};		
	};

	class controls
	{
		class health: RscText
		{
			idc = 23500;
			text = "";
			x = 0.871438 * safezoneW + safezoneX;
			y = 0.8388 * safezoneH + safezoneY;
			w = 0.0406875 * safezoneW;
			h = 0.028 * safezoneH;
			sizeEx = 1.1 * GUI_GRID_H;
		};

		class fatig: RscText
		{
			idc = 23501;
			text = "";
			x = 0.937062 * safezoneW + safezoneX;
			y = 0.8388 * safezoneH + safezoneY;
			w = 0.042 * safezoneW;
			h = 0.028 * safezoneH;
			sizeEx = 1.1 * GUI_GRID_H;
		};

		class food_pb: RscProgress
		{
			idc = 23502;
			x = 0.874063 * safezoneW + safezoneX;
			y = 0.8864 * safezoneH + safezoneY;
			w = 0.104814 * safezoneW;
			h = 0.0176 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};

		class food_pb_value: RscText
		{
			idc = 23507;
			text = ""; //--- ToDo: Localize;
			x = 0.875377 * safezoneW + safezoneX;
			y = 0.8892 * safezoneH + safezoneY;
			w = 0.101062 * safezoneW;
			h = 0.0112 * safezoneH;
			colorText[] = {1,1,1,0.8};
			shadow=1;
			sizeEx = 0.65 * GUI_GRID_H;
			style=1;
		};

		class water_pb: RscProgress
		{
			idc = 23503;
			x = 0.874063 * safezoneW + safezoneX;
			y = 0.9144 * safezoneH + safezoneY;
			w = 0.104814 * safezoneW;
			h = 0.0176 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};

		class water_pb_value: RscText
		{
			idc = 23508;
			text = ""; //--- ToDo: Localize;
			x = 0.875377 * safezoneW + safezoneX;
			y = 0.9172 * safezoneH + safezoneY;
			w = 0.101062 * safezoneW;
			h = 0.0112 * safezoneH;
			colorText[] = {1,1,1,0.8};
			shadow=1;
			sizeEx = 0.65 * GUI_GRID_H;
			style=1;
		};

		class micro_pb: RscProgress
		{
			idc = 23504;
			x = 0.874063 * safezoneW + safezoneX;
			y = 0.9424 * safezoneH + safezoneY;
			w = 0.104814 * safezoneW;
			h = 0.0176 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};

		class server_nmb: RscText
		{
			idc = 23505;
			text = "";
			x = 0.851186 * safezoneW + safezoneX;
			y = 0.9688 * safezoneH + safezoneY;
			w = 0.12731 * safezoneW;
			h = 0.0206 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class fps_info: RscStructuredText
		{
			idc = 23506;
			text = "";
			x = 0.296562 * safezoneW + safezoneX;
			y = 0.9592 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
	};   
};

class ExtremoNotification
{
	idd=24500;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="ExtremoNotification";
	onLoad="uiNamespace setVariable ['ExtremoNotification',_this select 0]";
	onUnload = "uiNamespace setVariable ['ExtremoNotification', objNull]";
	onDestroy = "uiNamespace setVariable ['ExtremoNotification', objNull]";
	objects[]={};

	class controls
	{
		class message1: RscStructuredText
		{
			idc = 24501;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.7828 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message2: RscStructuredText
		{
			idc = 24502;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message3: RscStructuredText
		{
			idc = 24503;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.7212 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message4: RscStructuredText
		{
			idc = 24504;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.6904 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message5: RscStructuredText
		{
			idc = 24505;
			text = "";
			x = 0.990934 * safezoneW + safezoneX;
			y = 0.6596 * safezoneH + safezoneY;
			w = 0.23625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
	};   
};

class ExtremoHint
{
	idd=24800;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="ExtremoHint";
	onLoad="uiNamespace setVariable ['ExtremoHint',_this select 0]";
	onUnload = "uiNamespace setVariable ['ExtremoHint', objNull]";
	onDestroy = "uiNamespace setVariable ['ExtremoHint', objNull]";
	objects[]={};

	class controls
	{
		class hint_message: RscStructuredText
		{
			idc = 24801;
			text = "<t size='1' align='left'>+2 item of smthi??</t>"; //--- ToDo: Localize;
			x = 0.855781 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};		
		class hint_top: RscText
		{
			idc = 24803;
			x = 0.855781 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class hint_icon: RscPicture
		{
			idc = 24802;
			text = "\union_gui\data\gui_newmessage.paa";
			x = 0.9125 * safezoneW + safezoneX;
			y = 0.1018 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};   
};

class ExtremoBuffs
{
	idd=24600;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="ExtremoBuffs";
	onLoad="uiNamespace setVariable ['ExtremoBuffs',_this select 0]";
	onUnload = "uiNamespace setVariable ['ExtremoBuffs', objNull]";
	onDestroy = "uiNamespace setVariable ['ExtremoBuffs', objNull]";
	objects[]={};

	class controls
	{		
		class debuff1_icon_r: RscPicture {
			idc = 24601;
			text = "";
			x = 0.808438 * safezoneW + safezoneX;
			y = 0.864 * safezoneH + safezoneY;
			w = 0.021 * safezoneW;
			h = 0.0392 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class debuff1_icon: debuff1_icon_r
		{
			idc = 24601+10;
		};		
		class debuff1_time: RscText
		{
			idc = 24601+20;
			text = "";
			x = 0.807876 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.0218436 * safezoneW;
			h = 0.0206 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
			style = 2;
		};		
		class debuff2_icon_r: debuff1_icon_r {
			idc = 24602;
			x = 0.782188 * safezoneW + safezoneX;
		};
		class debuff2_icon: debuff2_icon_r
		{
			idc = 24602+10;
		};		
		class debuff2_time: debuff1_time
		{
			idc = 24602+20;
			x = 0.781624 * safezoneW + safezoneX;
		};
		class debuff3_icon_r: debuff1_icon_r {
			idc = 24603;
			x = 0.755937 * safezoneW + safezoneX;
		};
		class debuff3_icon: debuff3_icon_r
		{
			idc = 24603 + 10;			
		};		
		class debuff3_time: debuff1_time
		{
			idc = 24603 + 20;			
			x = 0.755372 * safezoneW + safezoneX;
		};		
		class debuff4_icon_r: debuff1_icon_r {
			idc = 24604;
			x = 0.729688 * safezoneW + safezoneX;
		};
		class debuff4_icon: debuff4_icon_r
		{
			idc = 24604 + 10;			
		};		
		class debuff4_time: debuff1_time
		{
			idc = 24604 + 20;			
			x = 0.729124 * safezoneW + safezoneX;
		};		
		class debuff5_icon_r: debuff1_icon_r {
			idc = 24605;
			x = 0.703437 * safezoneW + safezoneX;
		};
		class debuff5_icon: debuff5_icon_r
		{
			idc = 24605 + 10;						
		};		
		class debuff5_time: debuff1_time
		{
			idc = 24605 + 20;		
			x = 0.703154 * safezoneW + safezoneX;
		};

		//buffs
		class buff1_icon_r: RscPicture {
			idc = 24701;
			text = "";
			x = 0.808438 * safezoneW + safezoneX;
			y = 0.9116 * safezoneH + safezoneY;
			w = 0.021 * safezoneW;
			h = 0.0392 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class buff1_icon: buff1_icon_r
		{
			idc = 24701 + 10;			
		};
		class buff1_time: RscText
		{
			idc = 24701 + 20;
			text = "";
			x = 0.808906 * safezoneW + safezoneX;
			y = 0.9542 * safezoneH + safezoneY;
			w = 0.0208123 * safezoneW;
			h = 0.0206 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
			style = 2;
		};
		
		class buff2_icon_r: buff1_icon_r {
			idc = 24702;
			x = 0.782188 * safezoneW + safezoneX;
		};
		class buff2_icon: buff2_icon_r
		{
			idc = 24702 + 10;			
		};
		class buff2_time: buff1_time
		{
			idc = 24702 + 20;
			x = 0.782655 * safezoneW + safezoneX;
		};
		
		class buff3_icon_r: buff1_icon_r {
			idc = 24703;
			x = 0.755937 * safezoneW + safezoneX;
		};
		class buff3_icon: buff3_icon_r
		{
			idc = 24703 + 10;			
		};
		class buff3_time: buff1_time
		{
			idc = 24703 + 20;			
			x = 0.755654 * safezoneW + safezoneX;
		};
		
		class buff4_icon_r: buff1_icon_r {
			idc = 24704;
			x = 0.729688 * safezoneW + safezoneX;
		};
		class buff4_icon: buff4_icon_r
		{
			idc = 24704 + 10;						
		};
		class buff4_time: buff1_time
		{
			idc = 24704 + 20;
			x = 0.729405 * safezoneW + safezoneX;
		};
		
		class buff5_icon_r: buff1_icon_r {
			idc = 24705;
			x = 0.703437 * safezoneW + safezoneX;
		};
		class buff5_icon: buff5_icon_r
		{
			idc = 24705 + 10;						
		};
		class buff5_time: buff1_time
		{
			idc = 24705 + 20;
			x = 0.703157 * safezoneW + safezoneX;
		};
	};   
};