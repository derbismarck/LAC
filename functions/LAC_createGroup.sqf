params ["_side","_pos","_type"];
private _units = [];
createCenter _side;
_sideReal = _side;
if (_side isEqualTo east) then {_side = 0};
if (_side isEqualTo west) then {_side = 1};
if (_side isEqualTo resistance) then {_side = 2};


if (_type == "fireteam") then {
    _units = (selectRandom lac_units_infantry_ft) select _side;
};

if (_type == "squad") then {
    _units = (selectRandom lac_units_infantry_squad) select _side;
};

_grp = createGroup _sideReal;
{
    _unit = _grp createUnit [_x,_pos,[],0,"FORM"];
    sleep 0.5;
} forEach _units;
