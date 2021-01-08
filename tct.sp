//!t !ct on movement servers. For those who hate using the team menu.

#include <sourcemod>
#include <cstrike>

public Plugin myinfo = 
{
	name = "Team change plugin", 
	author = "Nora", 
	description = "!t !ct !afk", 
	version = "1.0", 
	url = "https://www.lodgegaming.com | https:/steamcommunity.com/id/abner_bhop"
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_ct", Cmd_join2ct, "You are going to anti terrorist team.");
	RegConsoleCmd("sm_t", Cmd_join2t, "You are going to terrorist team.");
	RegConsoleCmd("sm_afk", Cmd_join2spec, "You are going to terrorist team.");
}

public Action Cmd_join2spec(int client, int args)
{
	CS_SwitchTeam(client, CS_TEAM_SPECTATOR);
}

public Action Cmd_join2ct(int client, int args)
{
	if (IsPlayerAlive(client))
	{
		CS_SwitchTeam(client, CS_TEAM_CT);
	}
	else
	{
		CS_RespawnPlayer(client);
		CS_SwitchTeam(client, CS_TEAM_CT);
	}
	return Plugin_Continue
}

public Action Cmd_join2t(int client, int args)
{
	if (IsPlayerAlive(client))
	{
		CS_SwitchTeam(client, CS_TEAM_T);
	}
	else
	{
		CS_RespawnPlayer(client);
		CS_SwitchTeam(client, CS_TEAM_T);
	}
	return Plugin_Continue
} 
