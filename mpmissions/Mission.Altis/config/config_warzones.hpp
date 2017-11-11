/*

	vehClass = техника которая спаунится в точке
	boxClass = коробка которая спаунится после вскрытия техники
	minPlayersOnServer = минимум игроковна сервере для активации боя
	sleepOnServerStart = пауза в МИНУТАХ после старта сервера перед первой игрой
	bombTimer = таймер на бомбе в МИНУТАХ

	class SpawnZones {
		class Название острова {
			class название {
				markerName = маркер где спауним военное положение
				spawnPoints = массив [координата,vectorDirUp], в одной из которых спауним vehClass
			}
		}
	}

*/

class LifeCfgWarZones {
	vehClass = "Land_Wreck_Heli_Attack_01_F";
	boxClass = "Land_Pallet_MilBoxes_F";
	minPlayersOnServer = 90;
	sleepOnServerStart = 20;
	bombTimer = 15;
	class SpawnZones {
		class Altis {
			class dp23 {
				markerName = "dp_23_marker";
				spawnPoints[] = {
					{20551,8887,0},
					{20487,8847,0},
					{20615,8869,0},
					{20505,8776,0},
					{20402,8837,0},
					{20494,9003,0}
				};
			};
			class dp24 {
				markerName = "dp_24_marker";
				spawnPoints[] = {
					{21744,7522,0},
					{21617,7710,0},
					{21647,7530,0},
					{21684,7635,0}
				};
			};
			class dp25 {
				markerName = "dp_25_marker";
				spawnPoints[] = {
					{20794,6771,0},
					{20691,6808,0},
					{20786,6674,0}
				};
			};
		};
		class kerama {

		};
	};
};