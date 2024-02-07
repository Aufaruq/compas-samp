#include <YSI_Coding\y_hooks>

new textcompass[4][MAX_PLAYERS];
new PlayerText: AufaCompas[MAX_PLAYERS][1];

stock GetPlayerHeading(playerid)
{
	new Float:rz, Float:yx, Float:yy, Float:yz;
	new p_PreviousCompass[4], compass[128];

	strcat((p_PreviousCompass[0] = EOS, p_PreviousCompass), textcompass[playerid]);

	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleZAngle(GetPlayerVehicleID(playerid), rz);
	}
	else 
	{
		GetPlayerFacingAngle(playerid, rz);
	}

	if(rz >= 348.75 || rz < 11.25) textcompass[playerid] = "Utara";
	else if(rz >= 258.75 && rz < 281.25) textcompass[playerid] = "Timur";
	else if(rz >= 210.0 && rz < 249.0) textcompass[playerid] = "Tenggara";
	else if(rz >= 168.75 && rz < 191.25) textcompass[playerid] = "Selatan";
	else if(rz >= 110.0 && rz < 159.0)  textcompass[playerid] = "Barat Daya";
	else if(rz >= 78.75 && rz < 101.25) textcompass[playerid] = "Barat";
	else if(rz >= 20 && rz < 69.0) textcompass[playerid] = "Barat Laut";
	else if(rz >= 291.0 && rz < 339) textcompass[playerid] = "Timur Laut";
 
    GetPlayerPos(playerid, yx, yy, yz);
    format(compass, sizeof(compass), "%s l %s", textcompass[playerid],GetLocation(yx, yy, yz));
	PlayerTextDrawSetString(playerid, AufaCompas[playerid][0], compass);
    PlayerTextDrawShow(playerid, AufaCompas[playerid][0]);
	return 1;
}

//show compas ketika si player naik vehicle
ptask SpeedoUpdate[100](playerid) {

    if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsEngineVehicle(GetPlayerVehicleID(playerid)) && !PlayerData[playerid][pTogHud]) {
        new vehicleid = GetPlayerVehicleID(playerid);
		//callback func compas
        GetPlayerHeading(playerid);
    }
}

hook OnGameModeInit() {
    AufaCompas[playerid][0] = CreatePlayerTextDraw(playerid, 154.000, 412.000, "Barat Daya");
    PlayerTextDrawLetterSize(playerid, AufaCompas[playerid][0], 0.369, 1.900);
    PlayerTextDrawAlignment(playerid, AufaCompas[playerid][0], 1);
    PlayerTextDrawColor(playerid, AufaCompas[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, AufaCompas[playerid][0], 1);
    PlayerTextDrawSetOutline(playerid, AufaCompas[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, AufaCompas[playerid][0], 150);
    PlayerTextDrawFont(playerid, AufaCompas[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, AufaCompas[playerid][0], 1);
    return 1
}