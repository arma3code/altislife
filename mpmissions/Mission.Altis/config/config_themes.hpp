/*
	Конфиг тем для окон (v3)

	Список скинов, которые будут применяться на новый GUI.


*/

class LifeCfgThemes {
	class default {
		displayName = "Стандарт";
		colorText[] = {1,1,1,1};
		colorTextHTML = "#FFFFFF";

		titleBackground[] = {0,0,0,0.9};
		windowBackground[] = {0,0,0,0.7};

		elementBackground[] = {0,0,0,0.7};
		elementBackgroundSelected[] = {1,1,1,0.2};

		buttonBackground[] = {0.133,0.373,0.514,1};
		buttonBackgroundFocused[] = {0.161,0.561,0.8,1};

		progressBackground[] = {1,1,1,0.3};
		progressText[] = {1,1,1,1};
	};
	
	class dark {
		displayName = "Светлая";
		colorText[] = {0,0,0,1};
		colorTextHTML = "#000000";

		titleBackground[] = {0.216,0.31,0.4,0.8};
		windowBackground[] = {1,1,1,0.7};

		elementBackground[] = {1,1,1,0.7};
		elementBackgroundSelected[] = {1,1,1,0.4};

		buttonBackground[] = {0,0,0,0.7};
		buttonBackgroundFocused[] = {0,0,0,1};

		progressBackground[] = {1,1,1,0.9};
		progressText[] = {0,0,0,1};
	};
};