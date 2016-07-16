params ["_group"];
_storedTypes = _group getVariable "LAC_lvar_cachedUnits";
_pos = ((leader _group) modelToWorld [0,-1,0]);
_pos set [2,0];
{
    _unit = _group createUnit [_x,_pos,[],0,"NONE"];
    _skillsArray = [_x] call LAC_fnc_assignSkill;
    {_unit setSkill _x} forEach _skillsArray;
    sleep lac_cache_build_rate;
} forEach _storedTypes;
_group setVariable ["LAC_lvar_cachedUnits",[]];
_group setVariable ["LAC_lvar_isReduced",false];
