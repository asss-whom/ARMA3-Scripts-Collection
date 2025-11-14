_center       = createCenter side player; // side player
_playerGroup  = createGroup _center; // modules group
_requester    = _playerGroup createUnit ["SupportRequester", getpos player, [], 0, "FORM"]; // support requester
_pos          = [player, 1000, (floor (random 360))] call BIS_fnc_relPos; // create random spawn position

_artyProvider = _playerGroup createUnit ["SupportProvider_Virtual_Artillery", _pos, [], 0, "FORM"]; // init Artillery support provider
_heliProvider = _playerGroup createUnit ["SupportProvider_Virtual_CAS_Heli", _pos, [], 0, "FORM"]; // init CAS_Heli support provider
_bombProvider = _playerGroup createUnit ["SupportProvider_Virtual_CAS_Bombing", _pos, [], 0, "FORM"]; // init CAS_Bombing support provider
_uavProvider  = _playerGroup createUnit ["SupportProvider_Virtual_UAV", _pos, [], 0, "FORM"]; // init UAV support provider        
_dropProvider = _playerGroup createUnit ["SupportProvider_Virtual_Drop", _pos, [], 0, "FORM"]; // init Drop support provider     
_trspProvider = _playerGroup createUnit ["SupportProvider_Virtual_Transport", _pos, [], 0, "FORM"]; // init Transport support provider

// reset support requests for each type
[_requester, "Artillery", 0] call BIS_fnc_limitSupport;
[_requester, "CAS_Heli", 0] call BIS_fnc_limitSupport;
[_requester, "CAS_Bombing", 0] call BIS_fnc_limitSupport;
[_requester, "UAV", 0] call BIS_fnc_limitSupport;
[_requester, "Drop", 0] call BIS_fnc_limitSupport;
[_requester, "Transport", 0] call BIS_fnc_limitSupport;

// setup provider values
_artyProvider setVariable ["BIS_SUPP_crateInit", ""];
_artyProvider setVariable ["BIS_SUPP_vehicles", ["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"]];
_artyProvider setVariable ["BIS_SUPP_vehicleinit", ""];
_artyProvider setVariable ["BIS_SUPP_filter", "SIDE"];

_heliProvider setVariable ["BIS_SUPP_crateInit", ""];
_heliProvider setVariable ["BIS_SUPP_vehicles", ["B_Heli_Attack_01_F"]];
_heliProvider setVariable ["BIS_SUPP_vehicleinit", ""];
_heliProvider setVariable ["BIS_SUPP_filter", "SIDE"];

_bombProvider setVariable ["BIS_SUPP_crateInit", ""];
_bombProvider setVariable ["BIS_SUPP_vehicles", ["B_Plane_CAS_01_F", "B_Plane_CAS_01_Cluster_F"]];
_bombProvider setVariable ["BIS_SUPP_vehicleinit", ""];
_bombProvider setVariable ["BIS_SUPP_filter", "SIDE"];

_uavProvider setVariable ["BIS_SUPP_crateInit", ""];
_uavProvider setVariable ["BIS_SUPP_vehicles", ["B_UAV_01_F", "B_UAV_02_F"]];
_uavProvider setVariable ["BIS_SUPP_vehicleinit", ""];
_uavProvider setVariable ["BIS_SUPP_filter", "SIDE"];

_dropProvider setVariable ["BIS_SUPP_crateInit", ""];
_dropProvider setVariable ["BIS_SUPP_vehicles", ["B_Heli_Transport_01_F", "B_Heli_Transport_03_F"]];
_dropProvider setVariable ["BIS_SUPP_vehicleinit", ""];
_dropProvider setVariable ["BIS_SUPP_filter", "SIDE"];

_trspProvider setVariable ["BIS_SUPP_crateInit", ""];
_trspProvider setVariable ["BIS_SUPP_vehicles", ["B_Heli_Transport_01_F", "B_Heli_Transport_03_F"]];
_trspProvider setVariable ["BIS_SUPP_vehicleinit", ""];
_trspProvider setVariable ["BIS_SUPP_filter", "SIDE"];

// set limit on requester to Inf.
[_requester, "Artillery", -1] call BIS_fnc_limitSupport;
[_requester, "CAS_Heli", -1] call BIS_fnc_limitSupport;
[_requester, "CAS_Bombing", -1] call BIS_fnc_limitSupport;
[_requester, "UAV", -1] call BIS_fnc_limitSupport;
[_requester, "Drop", -1] call BIS_fnc_limitSupport;
[_requester, "Transport", -1] call BIS_fnc_limitSupport;

// add the support option to the player
[player, _requester, _artyProvider] call BIS_fnc_addSupportLink;
[player, _requester, _heliProvider] call BIS_fnc_addSupportLink;
[player, _requester, _bombProvider] call BIS_fnc_addSupportLink;
[player, _requester, _uavProvider] call BIS_fnc_addSupportLink;
[player, _requester, _dropProvider] call BIS_fnc_addSupportLink;
[player, _requester, _trspProvider] call BIS_fnc_addSupportLink;