


_nMinutesCountdown = 5;
_radius = 10;
_vehicles = nearestObjects [getPos player,["Car","Tank","Land_spp_Transformer_F"],_radius]; 
_veh = _vehicles select 0;
_vehicleType = typeOf _veh;
_placementOffset = nil;
_placementVectorDir = [0,0,0];
_placementVectorUp = nil;

switch (_vehicleType) do 
{ 
    case "O_APC_Tracked_02_cannon_F": {_placementOffset = [0,-4.4,-1.5]; _placementVectorUp = [0.07,-1,-0.10]}; 
    case "O_APC_Wheeled_02_rcws_F":   {_placementOffset = [0.3,-4.3925,-1]; _placementVectorUp = [0,-1,-0.1]}; 
    case "O_MRAP_02_gmg_F":   {_placementOffset = [0.3,-4.4,-1.2]; _placementVectorUp = [0,-1,-1.9]}; 
    case "O_MRAP_02_hmg_F":   {_placementOffset = [0.3,-4.4,-1.2]; _placementVectorUp = [0,-1,-1.9]}; 
    case "O_MRAP_02_F":   {_placementOffset =  [-0.2,-4.3,-0.9]; _placementVectorUp = [0,-1,-1.5]}; 
    case "O_Quadbike_01_F":   {_placementOffset =  [0,-0.87,-0.9]; _placementVectorUp = [0,-1,0.3]}; 
    case "O_Truck_02_transport_F":   {_placementOffset =  [-0.88,1.1,-1.2]; _placementVectorUp = [-1,0,0]}; 
    case "O_Truck_02_covered_F":   {_placementOffset =  [-0.88,1.1,-1.2]; _placementVectorUp = [-1,0,0]}; 
    case "Land_spp_Transformer_F":   {_placementOffset =  [-0.95,1.1,0.4]; _placementVectorDir = [-1,0,0]; _placementVectorUp = [-1,0,0]}; 
};

null = [_veh,_nMinutesCountDown,_placementOffset,_placementVectorDir,_placementVectorUp] execVM "scripts\place-charge-on-vehicle.sqf";
