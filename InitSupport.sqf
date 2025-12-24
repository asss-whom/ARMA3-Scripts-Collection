_center       = createCenter side player; // side player
_playerGroup  = createGroup _center; // modules group
_requester    = _playerGroup createUnit ["SupportRequester", getpos player, [], 0, "FORM"]; // support requester

_artyProvider = _playerGroup createUnit ["SupportProvider_Virtual_Artillery", player getPos [3000, (floor (random 360))], [], 0, "FORM"]; // init Artillery support provider
_heliProvider = _playerGroup createUnit ["SupportProvider_Virtual_CAS_Heli", player getPos [1000, (floor (random 360))], [], 0, "FORM"]; // init CAS_Heli support provider
_bombProvider = _playerGroup createUnit ["SupportProvider_Virtual_CAS_Bombing", player getPos [2000, (floor (random 360))], [], 0, "FORM"]; // init CAS_Bombing support provider
_dropProvider = _playerGroup createUnit ["SupportProvider_Virtual_Drop", player getPos [1000, (floor (random 360))], [], 0, "FORM"]; // init Drop support provider     
_trspProvider = _playerGroup createUnit ["SupportProvider_Virtual_Transport", player getPos [1000, (floor (random 360))], [], 0, "FORM"]; // init Transport support provider

// reset support requests for each type
[_requester, "Artillery", 0] call BIS_fnc_limitSupport;
[_requester, "CAS_Heli", 0] call BIS_fnc_limitSupport;
[_requester, "CAS_Bombing", 0] call BIS_fnc_limitSupport;
[_requester, "UAV", 0] call BIS_fnc_limitSupport;
[_requester, "Drop", 0] call BIS_fnc_limitSupport;
[_requester, "Transport", 0] call BIS_fnc_limitSupport;

// setup provider values
if (side player == west) then
{
    _artyProvider setVariable ["BIS_SUPP_crateInit", ""];
    _artyProvider setVariable ["BIS_SUPP_vehicles", ["B_Mortar_01_F", "B_MBT_01_arty_F", "B_MBT_01_mlrs_F"]];
    _artyProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _artyProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _heliProvider setVariable ["BIS_SUPP_crateInit", ""];
    _heliProvider setVariable ["BIS_SUPP_vehicles", ["B_Heli_Attack_01_F"]];
    _heliProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _heliProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _bombProvider setVariable ["BIS_SUPP_crateInit", ""];
    _bombProvider setVariable ["BIS_SUPP_vehicles", ["B_Plane_Fighter_01_F", "B_Plane_Fighter_01_Cluster_F"]];
    _bombProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _bombProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _dropProvider setVariable ["BIS_SUPP_crateInit", '_this addItemCargo ["optic_Nightstalker", 1]; _this addItemCargo ["muzzle_snds_H", 1]; _this addItemCargo ["acc_pointer_IR", 1]; _this addItemCargo ["H_HelmetSpecB", 1]; _this addItemCargo ["NVGoggles", 1];'];
    _dropProvider setVariable ["BIS_SUPP_vehicles", ["B_Heli_Transport_01_F", "B_Heli_Transport_03_F"]];
    _dropProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _dropProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _trspProvider setVariable ["BIS_SUPP_crateInit", ""];
    _trspProvider setVariable ["BIS_SUPP_vehicles", ["B_Heli_Light_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_03_F"]];
    _trspProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _trspProvider setVariable ["BIS_SUPP_filter", "SIDE"];
};

if (side player == east) then
{
    _artyProvider setVariable ["BIS_SUPP_crateInit", ""];
    _artyProvider setVariable ["BIS_SUPP_vehicles", ["O_Mortar_01_F", "O_MBT_02_arty_F"]];
    _artyProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _artyProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _heliProvider setVariable ["BIS_SUPP_crateInit", ""];
    _heliProvider setVariable ["BIS_SUPP_vehicles", ["O_Heli_Attack_02_F"]];
    _heliProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _heliProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _bombProvider setVariable ["BIS_SUPP_crateInit", ""];
    _bombProvider setVariable ["BIS_SUPP_vehicles", ["O_Plane_Fighter_02_F", "O_Plane_Fighter_02_Cluster_F"]];
    _bombProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _bombProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _dropProvider setVariable ["BIS_SUPP_crateInit", '_this addItemCargo ["optic_Nightstalker", 1]; _this addItemCargo ["muzzle_snds_H", 1]; _this addItemCargo ["acc_pointer_IR", 1]; _this addItemCargo ["H_HelmetSpecB", 1]; _this addItemCargo ["NVGoggles", 1];'];
    _dropProvider setVariable ["BIS_SUPP_vehicles", ["O_Heli_Transport_04_ammo_F"]];
    _dropProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _dropProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _trspProvider setVariable ["BIS_SUPP_crateInit", ""];
    _trspProvider setVariable ["BIS_SUPP_vehicles", ["O_Heli_Light_02_F", "O_Heli_Transport_04_covered_F"]];
    _trspProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _trspProvider setVariable ["BIS_SUPP_filter", "SIDE"];
};

if (side player == independent) then
{
    _artyProvider setVariable ["BIS_SUPP_crateInit", ""];
    _artyProvider setVariable ["BIS_SUPP_vehicles", ["I_Mortar_01_F", "I_Truck_02_MRL_F"]];
    _artyProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _artyProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _heliProvider setVariable ["BIS_SUPP_crateInit", ""];
    _heliProvider setVariable ["BIS_SUPP_vehicles", ["I_Heli_Light_03_F"]];
    _heliProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _heliProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _bombProvider setVariable ["BIS_SUPP_crateInit", ""];
    _bombProvider setVariable ["BIS_SUPP_vehicles", ["I_Plane_Fighter_04_F", "I_Plane_Fighter_04_Cluster_F"]];
    _bombProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _bombProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _dropProvider setVariable ["BIS_SUPP_crateInit", '_this addItemCargo ["optic_Nightstalker", 1]; _this addItemCargo ["muzzle_snds_H", 1]; _this addItemCargo ["acc_pointer_IR", 1]; _this addItemCargo ["H_HelmetSpecB", 1]; _this addItemCargo ["NVGoggles", 1];'];
    _dropProvider setVariable ["BIS_SUPP_vehicles", ["I_Heli_Transport_02_F"]];
    _dropProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _dropProvider setVariable ["BIS_SUPP_filter", "SIDE"];

    _trspProvider setVariable ["BIS_SUPP_crateInit", ""];
    _trspProvider setVariable ["BIS_SUPP_vehicles", ["I_Heli_Light_03_F", "I_Heli_Transport_02_F"]];
    _trspProvider setVariable ["BIS_SUPP_vehicleinit", ""];
    _trspProvider setVariable ["BIS_SUPP_filter", "SIDE"];
};

// set limit on requester to Inf.
[_requester, "Artillery", -1] call BIS_fnc_limitSupport;
[_requester, "CAS_Heli", -1] call BIS_fnc_limitSupport;
[_requester, "CAS_Bombing", -1] call BIS_fnc_limitSupport;
[_requester, "Drop", -1] call BIS_fnc_limitSupport;
[_requester, "Transport", -1] call BIS_fnc_limitSupport;

// add the support option to the player
[player, _requester, _artyProvider] call BIS_fnc_addSupportLink;
[player, _requester, _heliProvider] call BIS_fnc_addSupportLink;
[player, _requester, _bombProvider] call BIS_fnc_addSupportLink;
[player, _requester, _dropProvider] call BIS_fnc_addSupportLink;
[player, _requester, _trspProvider] call BIS_fnc_addSupportLink;
