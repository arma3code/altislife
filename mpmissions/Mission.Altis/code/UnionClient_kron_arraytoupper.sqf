private["_in","_i","_e","_out"];
_in=_this select 0;
_out=[];
if ((count _in)>0) then {
	for "_i" from 0 to (count _in)-1 do {
		_e=_in select _i;
		if (typeName _e=="STRING") then {
			_e=toUpper(_e);
		};
		_out set [_i,_e];
	};
};
_out