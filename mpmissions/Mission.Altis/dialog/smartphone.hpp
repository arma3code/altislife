class UnionDialogSmartphone {
	idd = 88888;
	name = "UnionDialogSmartphone";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles; [] spawn UnionClient_system_smartphone;";
	
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
			idc = 888907;
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
		
		class MessagesTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 88886;
			text = "";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			
			x = 0.299999;
			y = 0.1;
			w = 0.6625;
			h = 0.04;
		};		
		
		class MessageTextTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 88890;
			text = "$STR_SMARTPHONE_SELTITLE";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			
			x = 0.299999;
			y = 0.44;
			w = 0.6625;
			h = 0.04;
		};
		
		class PlayerList : RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn UnionClient_system_smartphone;";
			
			x = 0.0374988;
			y = 0.16;
			w = 0.250001;
			h = 0.6;
		};
		
		class MessageList : RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] spawn UnionClient_system_showMsg;";
			//sizeEx = 0.04;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			
			x = 0.299999;
			y = 0.16;
			w = 0.6625;
			h = 0.26;
		};

		class TextShow : RscControlsGroup {
			x = 0.299999;
			y = 0.5;
			w = 0.6625;
			h = 0.26;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.6625;
					h = 1;
				};
			};
		};
				
		class NewMessageButton: RscButtonUC
		{
			idc = 887892;
			text = "$STR_SMARTPHONE_SCHREIBEN";	
			onButtonClick = "[4] spawn UnionClient_system_smartphone";			
			
			x = 0.0374988;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};
		
		class 911MessageButton: RscButtonUC
		{
			idc = -1;
			text = "$STR_SMARTPHONE_NOTRUF";	
			onButtonClick = "createDialog ""UnionDialogSmartphoneNotruf""";			
			
			x = 0.299999;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};
		
		class ClearMessageButton: RscButtonUC
		{
			idc = -1;
			text = "$STR_SMARTPHONE_DELMESSAGES";	
			onButtonClick = "[3] spawn UnionClient_system_smartphone";
			tooltip = "Очистить историю сообщений";
			
			x = 0.7125;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};

		class ContactsTitle : RscTitle {
			idc = -1;
			text = "$STR_SMARTPHONE_PLAYERLISTTITLE";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0374988;
			y = 0.1;
			w = 0.250001;
			h = 0.04;
		};
	};

};

class UnionDialogSmartphoneTargetMessage
{
	idd = 88883;
	name = "UnionDialogSmartphoneTargetMessage";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	

	class controlsBackground {
		class RscTitleBackground:RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.1;
		};
		
	};
	class controls {
		class Title : RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "$STR_SMARTPHONE_NACHRICHTTITLE";
			x = 0.1;
			y = 0.2;
			w = 0.95;
			h = (1 / 25);
		};
		
		class Absenden : RscButtonMenu {
			idc = 88885;
			text = "$STR_SMARTPHONE_ABSENDEN";
			onButtonClick = "[1,-1,(ctrlText 88884)] call UnionClient_system_newMsg;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.6 - (6.25 / 40) + 0.088;
			y = 0.3 + (1 / 25)  - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminMsg : RscButtonMenu 
		{
			idc = 888897;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[5,-1,(ctrlText 88884)] call UnionClient_system_newMsg;";
			
			x = 0.6 - (6.25 / 40) - 0.121;
			y = 0.3 + (1 / 25)  - 0.048;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Close : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			x = 0.11;
			y = 0.3 + (1 / 25)  - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class textEdit : RscEdit {
			idc = 88884;
			text = "";
			sizeEx = 0.030;
			x = 0.11; y = 0.3 - 0.048;
			w = 0.58; h = 0.03;
		};
	
	};
	
};

class UnionDialogSmartphoneNotruf {
	idd = 887890;
	name= "UnionDialogSmartphoneNotruf";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[6] spawn UnionClient_system_newMsg;";
	
	class controlsBackground {
		class RscTitleBackground:RscText {
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.64;
			h = (1 / 25);
		};
		
		class MainBackground:RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.64;
			h = 0.15 - (5 / 250);
		};
	};
	
	class controls {

		
		class Title : RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 888892;
			text = "$STR_SMARTPHONE_NOTRUF";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : RscEdit {
		
		idc = 888894;
		
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.25;
		w = 0.62; h = 0.03;
		
		};
		
		class TxtCopButton : RscButtonMenu 
		{
			idc = 888895;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[2,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			
			x = 0.32;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TxtAdminButton : RscButtonMenu 
		{
			idc = 888896;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[3,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			
			x = 0.53;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		
		class AdminMsgAll : RscButtonMenu 
		{
			idc = 888898;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[7,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			
			x = 0.53;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class CopAllButton : RscButtonMenu 
		{
			idc = 888900;
			text = "Полиц всем";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			
			x = 0.32;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class EMSReq : RscButtonMenu
		{
			idc = 888899;
			text = "$STR_CELL_EMSRequest";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[4,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			
			x = 0.11;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class EMSToAll : RscButtonMenu
		{
			idc = 888905;
			text = "МЧС всем";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[9,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			
			x = 0.11;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TaxiButton : RscButtonMenu {
			idc = 888906;
			text = "Такси";
			colorBackground[] = {0.655,0.318,0.094,1};
			onButtonClick = "[10,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			x = 0.53;
			y = 0.36 + (1 / 50);
			w = 0.2;
			h = (1 / 25);
		};		
		
		class CloseButton : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.36 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Shab1 : RscButtonMenu {
			idc = 888901;
			text = "КПП Кавала";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,""Внимание! Военное положение на КПП Кавала в радиусе 2км! Всем покинуть территорию, ведется огонь на поражение!""] call UnionClient_system_newMsg;";
			x = 0.53;
			y = 0.38;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Shab2 : RscButtonMenu {
			idc = 888902;
			text = "Федрезерв";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,""Внимание! Военное положение на Федеральном резерве в радиусе 2км! Всем покинуть территорию, ведется огонь на поражение!""] call UnionClient_system_newMsg;";
			x = 0.53;
			y = 0.43;
			w = 0.2;
			h = (1 / 25);
		};

		class PressButton : RscButtonMenu {
			idc = 888908;
			text = "7NEWS";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[11,-1,(ctrlText 888894)] call UnionClient_system_newMsg;";
			x = 0.53;
			y = 0.43;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Shab3 : RscButtonMenu {
			idc = 888903;
			text = "Руки Вверх!";
			
			onButtonClick = "[8,-1,(ctrlText 888894) + ""! Сдавайтесь! Вы окружены, сопротивление бесполезно! В случае невыполнения требований полиции будет открыт огонь на поражение!""] call UnionClient_system_newMsg;";
			x = 0.53;
			y = 0.5;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Shab4 : RscButtonMenu {
			idc = 888904;
			text = "Стой и выйди";
			
			onButtonClick = "[8,-1,(ctrlText 888894) + ""! Немедленно остановитесь, выйдите из техники и поднимите руки вверх! В случае невыполнения требований полиции будет открыт огонь на поражение!""] call UnionClient_system_newMsg;";
			x = 0.53;
			y = 0.55;
			w = 0.2;
			h = (1 / 25);
		};
		class Shab5 : RscButtonMenu {
			idc = 888909;
			text = "Стой и сиди";
			
			onButtonClick = "[8,-1,(ctrlText 888894) + ""! Немедленно остановитесь! Заглушите двигатель и оставайтесь в транспортном средстве! Ожидайте дальнейших указаний! В случае невыполнения требований будет применено оружие!""] call UnionClient_system_newMsg;";
			x = 0.53;
			y = 0.6;
			w = 0.2;
			h = (1 / 25);
		};
				
	};
};