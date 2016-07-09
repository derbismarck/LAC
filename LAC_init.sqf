// - Params Below - //

lac_playerSide = west;  //DON'T FORGET TO CHANGE!!!

// -- LAC Comms -- //
// LAC_Comms facilitates realistic communication between AI groups. Depending on what radios they have in ACRE, they will communicate differently to call in threats. They also periodically check-in with other groups, and if they miss a check-in then you can expect enemy patrols to come around all curious-like.

lac_comm_range_343 = [100,true]; //[max range for 343-holding units, LOS blocking]
lac_comm_range_148 = [400,true]; //[max range for 148-holding units, LOS blocking]
lac_comm_range_117 = [800,true]; //[max range for 117-holding units, LOS blocking]
lac_comm_retrans_towers = [];  //not currently implemented - will eventually allow for bridged transmissions (with extra jump time)
//343s can only talk to other 343s. 148s and 117s can communicate, but are limited by the max range of the the 148 if it is 148->117 or 117->148 communication.

lac_comm_jump_time = [10,30]; //[minimum reporting time, maximum reporting time] - depends on (_unit skill "commanding")
//communication is interrupted if the group leader is killed, then restarted by new group leader with zero progress

lac_comm_alert_level = 0.5; //number between 0 and 1, influences how large enemy responses to certain situations are.
//ex. how should a commander ask for help if they are being decimated by a large enemy force vs only being fired upon by a scouting force? Closer value to 1 means they react with more reinforcement, closer value to 0 means they react with less reinforcement.

lac_comm_checkin_interval = 300;  //amount of time between group-checkins to overall. If a group leader doesn't check in (is dead) and is line-of-sight with another group, they will broadcast that the group is missing/not responding to other groups in range. Set this value to 0 to disable the feature.

// -- LAC Units -- //

lac_units_infantry_ft = [ //defines small (fireteam-sized) infantry group types
  [
    ["O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_Soldier_LAT_F"],
    ["B_Soldier_TL_F","B_Soldier_AR_F","B_Soldier_AAR_F","B_Soldier_LAT_F"],
    ["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_AAR_F","I_Soldier_LAT_F"]
  ],
  [
    ["O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_Soldier_LAT_F","O_Soldier_LAT_F"],
    ["B_Soldier_TL_F","B_Soldier_AR_F","B_Soldier_AAR_F","B_Soldier_LAT_F","B_Soldier_LAT_F"],
    ["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_AAR_F","I_Soldier_LAT_F","I_Soldier_LAT_F"]
  ],
  [
    ["O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_F"],
    ["B_Soldier_TL_F","B_Soldier_AR_F","B_Soldier_AAR_F","B_Soldier_LAT_F","B_Soldier_LAT_F","B_Soldier_F"],
    ["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_AAR_F","I_Soldier_LAT_F","I_Soldier_LAT_F","I_Soldier_F"]
  ]
];

lac_units_infantry_squad = [ //defines large (squad-sized) infantry group types
  [
    ["O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_Soldier_LAT_F","O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_Soldier_LAT_F"],
    ["B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_AR_F","B_Soldier_AAR_F","B_Soldier_LAT_F","B_Soldier_TL_F","B_Soldier_AR_F","B_Soldier_AAR_F","B_Soldier_LAT_F"],
    ["I_Soldier_SL_F","I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_AAR_F","I_Soldier_LAT_F","I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_AAR_F","I_Soldier_LAT_F"]
  ],
  [
    ["O_Soldier_SL_F","O_medic_F","O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_Soldier_LAT_F","O_Soldier_TL_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_Soldier_LAT_F"],
    ["B_Soldier_SL_F","B_medic_F","B_Soldier_TL_F","B_Soldier_AR_F","B_Soldier_AAR_F","B_Soldier_LAT_F","B_Soldier_TL_F","B_Soldier_AR_F","B_Soldier_AAR_F","B_Soldier_LAT_F"],
    ["I_Soldier_SL_F","I_medic_F","I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_AAR_F","I_Soldier_LAT_F","I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_AAR_F","I_Soldier_LAT_F"]
  ],
  [
    ["O_Soldier_SL_F","O_Soldier_TL_F","O_HeavyGunner_F","O_Soldier_A_F","O_Soldier_LAT_F","O_Soldier_TL_F","O_HeavyGunner_F","O_Soldier_A_F","O_Soldier_LAT_F"],
    ["B_Soldier_SL_F","B_Soldier_TL_F","B_HeavyGunner_F","B_Soldier_A_F","B_Soldier_LAT_F","B_Soldier_TL_F","B_HeavyGunner_F","B_Soldier_A_F","B_Soldier_LAT_F"],
    ["I_Soldier_SL_F","I_Soldier_TL_F","I_HeavyGunner_F","I_Soldier_A_F","I_Soldier_LAT_F","I_Soldier_TL_F","I_HeavyGunner_F","I_Soldier_A_F","I_Soldier_LAT_F"]
  ],
  [
    ["O_Soldier_SL_F","O_medic_F","O_Soldier_TL_F","O_HeavyGunner_F","O_Soldier_A_F","O_Soldier_LAT_F","O_Soldier_TL_F","O_HeavyGunner_F","O_Soldier_A_F","O_Soldier_LAT_F"],
    ["B_Soldier_SL_F","B_medic_F","B_Soldier_TL_F","B_HeavyGunner_F","B_Soldier_A_F","B_Soldier_LAT_F","B_Soldier_TL_F","B_HeavyGunner_F","B_Soldier_A_F","B_Soldier_LAT_F"],
    ["I_Soldier_SL_F","I_medic_F","I_Soldier_TL_F","I_HeavyGunner_F","I_Soldier_A_F","I_Soldier_LAT_F","I_Soldier_TL_F","I_HeavyGunner_F","I_Soldier_A_F","I_Soldier_LAT_F"]
  ]
];

// -- LAC Skill -- //

// TO BE DONE LATER

// -- LAC Caching -- //
// LAC_Caching deletes units in a group that aren't the group leader as long as the group is outside range of the players as based on the parameters below.

lac_cache_range_los = 1500; //minimum range to start/stop caching if having line-of-sight
lac_cache_range_nlos = 500; //minimum range to start/stop caching if not having line-of-sight
lac_cache_nlos = true;  //non-line-of-sight caching? if false, AI always start/stop being cached at lac_cache_range_los. Can save on performance if the map is very flat or the AO is very small. if true, NLOS ai will cache at ranges between lac_cache_range_los and lac_cache_range_nlos - if they are about to walk into view or come within lac_cache_range_nlos they will un-cache and react normally.

// - Function Initialization Below - //

[] execVM "LAC\functions\fnc_init.sqf";
