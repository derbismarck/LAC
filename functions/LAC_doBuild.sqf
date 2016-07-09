params ["_group"];
_storedTypes = _group getVariable "LAC_lvar_cachedUnits";
_pos = ((leader _group) modelToWorld [0,-1,0]);
_pos set [2,0];
{
    _unit = _group createUnit [_x,_pos,[],0,"NONE"];
    sleep lac_cache_build_rate;
} forEach _storedTypes;
_group setVariable ["LAC_lvar_cachedUnits",[]];
_group setVariable ["LAC_lvar_isReduced",false];
