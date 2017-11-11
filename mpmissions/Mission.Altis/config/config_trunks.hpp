/*


	Class = столбец name в gang_trunks
		object = имя хранилища на карте
		side = фракция, имеющая доступ к хранилищу
		conditions = условия, необходимые для доступа к хранилищу


*/
class LifeCfgTrunks {
	//civ
	class fb {
		object = "fb_trunk";
		side = "civ";
		conditions = "license_civ_fb";
	};
	class ccp {
		object = "ccp_trunk";
		side = "civ";
		conditions = "license_civ_ccp";
	};
	class ics {
		object = "ics_trunk";
		side = "civ";
		conditions = "license_civ_ics";
	};
	class ics_officer {
		object = "ics_trunk_officer";
		side = "civ";
		conditions = "license_civ_ics && life_civlevel > 2";
	};
	class bf {
		object = "bf_trunk";
		side = "civ";
		conditions = "license_civ_bf";
	};

	class vl {
		object = "vl_trunk";
		side = "civ";
		conditions = "license_civ_vl";
	};
	class ira {
		object = "ira_trunk";
		side = "civ";
		conditions = "license_civ_ira";
	};
	class ira_officer {
		object = "ira_trunk_officer";
		side = "civ";
		conditions = "license_civ_ira && life_civlevel > 2";
	};
	class led {
		object = "led_trunk";
		side = "civ";
		conditions = "license_civ_led";
	};
	class bst {
		object = "bst_trunk";
		side = "civ";
		conditions = "license_civ_bst";
	};

	//reb
	class sdr {
		object = "sdr_trunk";
		side = "reb";
		conditions = "license_reb_sdr";
	};
	class sdr_east: sdr {
		object = "sdr_east_trunk";
	};
	class sdr_north: sdr {
		object = "sdr_north_trunk";
	};
	class sdr_officer {
		object = "sdr_trunk_officer";
		side = "reb";
		conditions = "license_reb_sdr && life_reblevel > 2";
	};

	class aff {
		object = "aff_trunk";
		side = "reb";
		conditions = "license_reb_aff";
	};
	class aff2: aff {
		object = "aff2_trunk";
	};

	class nsb {
		object = "nsb_trunk";
		side = "reb";
		conditions = "license_reb_nsb";
	};
	class nsb2: nsb {
		object = "nsb2_trunk";
	};
	class nsb_tanoa: nsb {
		object = "nsb_tanoa_trunk";
	};

	class nsb_officer {
		object = "nsb_trunk_officer";
		side = "reb";
		conditions = "license_reb_nsb && life_reblevel > 2";
	};
	class nsb2_officer: nsb_officer {
		object = "nsb2_trunk_officer";
	};

	class mc {
		object = "mc_trunk";
		side = "reb";
		conditions = "license_reb_mc";
	};
	class mfo {
		object = "mfo_trunk";
		side = "reb";
		conditions = "license_reb_mfo";
	};
	class arg {
		object = "arg_trunk";
		side = "reb";
		conditions = "license_reb_arg";
	};
	class arg_officer {
		object = "arg_trunk_officer";
		side = "reb";
		conditions = "license_reb_arg && life_reblevel > 2";
	};
	class rfa {
		object = "rfa_trunk";
		side = "reb";
		conditions = "license_reb_rfa";
	};
	class rfa_officer {
		object = "rfa_trunk_officer";
		side = "reb";
		conditions = "license_reb_rfa && life_reblevel > 2";
	};
	class nmd {
		object = "nmd_trunk";
		side = "reb";
		conditions = "license_reb_nmd";
	};
	class fsg {
		object = "fsg_trunk";
		side = "reb";
		conditions = "license_reb_fsg";
	};

	//cop
	class police {
		object = "police_trunk";
		side = "cop";
		conditions = "";
	};
	class dea {
		object = "dea_trunk";
		side = "cop";
		conditions = "life_coplevel == 22";
	};
	class swat {
		object = "swat_trunk";
		side = "cop";
		conditions = "life_coplevel == 23";
	};

	//med
	class medic {
		object = "medic_trunk";
		side = "med";
		conditions = "";
	};
};