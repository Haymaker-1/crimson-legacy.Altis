
private "_vehicleType";
private "_addRatingValue";

_vehicleType = _this select 0;

_addRatingValue = nil;

switch (_vehicleType) do
{
    case "O_APC_Tracked_02_cannon_F": {_addRatingValue = 2000};
    case "O_APC_Wheeled_02_rcws_F":   {_addRatingValue = 2000};
    case "O_MRAP_02_gmg_F":   {_addRatingValue = 750};
    case "O_MRAP_02_hmg_F":   {_addRatingValue = 750};
    case "O_MRAP_02_F":   {_addRatingValue = 500};
    case "O_Quadbike_01_F":   {_addRatingValue = 100};
    case "O_Truck_02_transport_F":   {_addRatingValue = 200};
    case "O_Truck_02_covered_F":   {_addRatingValue = 200};
    case "Land_spp_Transformer_F":   {_addRatingValue = 0};
};


_addRatingValue
