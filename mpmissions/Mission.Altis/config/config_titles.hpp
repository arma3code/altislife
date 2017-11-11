class LifeCfgTitles {
	class default {
		title = "";
		conditions = "";
	};
	class vip {
		title = "Меценат";
		conditions = "(call life_donator) > 0";
	};
	class viptop {
		title = "Магнат";
		conditions = "(call life_donator) > 3";
	};
	class topgang {
		title = "Головорез";
		conditions = "((group player) getVariable [""gang_id"",-1]) isEqualTo (server_gangsRating select 0 select 0)";
	};
	class s1win {
		title = "Завоеватель";
		conditions = "((group player) getVariable [""gang_license"",""-1""]) isEqualTo ""aff""";
	};
};