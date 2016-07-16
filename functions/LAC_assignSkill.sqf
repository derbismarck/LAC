params ["_class"];
private ["_aimingAccuracy","_aimingShake","_aimingSpeed","_endurance","_spotDistance","_spotTime","_courage","_reloadSpeed","_commanding"];

_randomF = {params ["_value","_variance"]; _value - _variance + random (2 * _variance)};

//get random base values for each skill
_aimingAccuracy = lac_skill_aimingAccuracy call _randomF;
_aimingShake = lac_skill_aimingShake call _randomF;
_aimingSpeed = lac_skill_aimingSpeed call _randomF;
_endurance = lac_skill_endurance call _randomF;
_spotDistance = lac_skill_spotDistance call _randomF;
_spotTime = lac_skill_spotTime call _randomF;
_courage = lac_skill_courage call _randomF;
_reloadSpeed = lac_skill_reloadSpeed call _randomF;
_commanding = lac_skill_commanding call _randomF;

//apply modifiers on each skill per classname modifiers list
{
    if (_class in (_x select 0)) then {
        {
            _skillType = _x select 0;
            _skillMod = _x select 1;
            switch (true) do {
                case ("aimingAccuracy" == _skillType):  {_aimingAccuracy =  _aimingAccuracy + _skillMod};
                case ("aimingShake" == _skillType):     {_aimingshake =     _aimingshake + _skillMod};
                case ("aimingSpeed" == _skillType):     {_aimingSpeed =     _aimingSpeed + _skillMod};
                case ("endurance" == _skillType):       {_endurance =       _endurance + _skillMod};
                case ("spotDistance" == _skillType):    {_spotDistance =    _spotDistance + _skillMod};
                case ("spotTime" == _skillType):        {_spotTime =        _spotTime + _skillMod};
                case ("courage" == _skillType):         {_courage =         _courage + _skillMod};
                case ("reloadSpeed" == _skillType):     {_reloadSpeed =     _reloadSpeed + _skillMod};
                case ("commanding" == _skillType):      {_commanding =      _commanding + _skillMod};
            };
        } foreach _x;
    };
} forEach lac_skill_modifiers;


[["aimingAccuracy",_aimingAccuracy],["aimingShake",_aimingShake],["aimingSpeed",_aimingSpeed],["endurance",_endurance],["spotDistance",_spotDistance],["spotTime",_spotTime],["courage",_courage],["reloadSpeed",_reloadSpeed],["commanding",_commanding]]
