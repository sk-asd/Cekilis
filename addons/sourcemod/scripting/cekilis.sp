#include <sourcemod>
#include <warden>
#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "...", 
	author = "phiso", 
	description = "...", 
	version = "1.0", 
	url = "phiso#3331"
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_cek", cekilis);
}
public Action cekilis(int client, int args)
{
	if (warden_iswarden(client) || (GetAdminFlag(GetUserAdmin(client), Admin_Slay)))
	{
		int sansli = GetRandomPlayer();
		PrintToChatAll("[SM] Şanslı kişi: %N", sansli);
	}
}
stock int GetRandomPlayer()
{
	int[] clients = new int[MaxClients];
	int clientCount;
	for (int i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && (!IsFakeClient(i)))
		{
			clients[clientCount++] = i;
		}
	}
	return (clientCount == 0) ? -1 : clients[GetRandomInt(0, clientCount - 1)];
}