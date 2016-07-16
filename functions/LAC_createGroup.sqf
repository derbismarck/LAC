params ["_side","_pos","_type"];
private _units = [];
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

_group = createGroup _sideReal;
{
    _unit = _group createUnit [_x,_pos,[],0,"FORM"];
    _skillsArray = [_x] call LAC_fnc_assignSkill;
    {_unit setSkill _x} forEach _skillsArray;
    //sleep 0.5;
} forEach _units;

_group
