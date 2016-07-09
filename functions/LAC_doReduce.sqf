params ["_group"];
_storedTypes = [];
{
    _storedTypes pushBack (typeOf _x);
    deleteVehicle _x;
    sleep lac_cache_reduce_rate;
} forEach ((units _group) - [leader _group]);
_group setVariable ["LAC_lvar_cachedUnits",_storedTypes];
_group setVariable ["LAC_lvar_isReduced",true];
