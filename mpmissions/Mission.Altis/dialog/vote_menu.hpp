class UnionDialogVote {
    idd = 3300;
    name= "UnionDialogVote";
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
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };
        
        class MainBackground:RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.6 - (2 / 250);
        };
    };
    
    class controls {

		class Title : RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Губернаторские выборы";
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };
        
        class PlayerList_Vote : RscListBox
        {
            idc = 3301;
            text = "";         
			onLBSelChanged = "[_this] spawn UnionClient_system_voteMenyLB";			
            
            x = 0.11; y = 0.26;
            w = 0.35; h = 0.57;
        };
		
		class SelectListInfo : RscStructuredText
        {
            idc = 3302;
			colorBackground[] = {0,0,0,0}; 
            text = "";
            x = 0.46;
            y = 0.26;
            w = 0.42;
            h = 0.55;
        };
        
        class CloseButtonKey : RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
        
        class VoteButton : RscButtonMenu {
            idc = -1;
            text = "Голосовать";
            onButtonClick = "[] call UnionClient_system_voteAction;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};