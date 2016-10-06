#include <sourcemod>
#include <cstrike>
#include <sdktools>

public Plugin myinfo = {
	name = "Pug Score Checker",
	author = "Warlord",
	description = "Simple plugin to retrieve match scores, avoiding the hassle of reading from the UDP stream.",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};

public OnPluginStart() {

    RegConsoleCmd("getpugscore", team_scores);
    
}

public Action:team_scores(client, argc) {
	new tscore = CS_GetTeamScore(CS_TEAM_T);
	new ctscore = CS_GetTeamScore(CS_TEAM_CT);

	ReplyToCommand(client, "T's = %d, CT's = %d", tscore, ctscore);

	return Plugin_Handled;
}