//idk why it exists or with what head I did it.

#include <sourcemod>

public Plugin myinfo = 
{
	name = "Noora Adminlik Menüsü", 
	author = "Nora", 
	description = "Sunucuya giren kişiye adminlik menü açar", 
	version = "1.0", 
	url = "https://www.lodgegaming.com | https:/steamcommunity.com/id/abner_bhop"
};

public OnPluginStart()
{
	RegConsoleCmd("sm_adminlik", Command_vipadmin, "");
	RegConsoleCmd("sm_vip", Command_vipadmin, "");
}

void nooramsay(int client)
{
	Menu menu = new Menu(MenuHandler1);
	menu.SetTitle("VIP | Admin");
	menu.AddItem("", "VIP     | 10 TL");
	menu.AddItem("", "Admin | 20 TL");
	menu.ExitButton = false;
	menu.Display(client, 20);
}

public Action Command_vipadmin(int client, int args)
{
	if (!IsFakeClient(client))
	{
		nooramsay(client)
	}
}

public OnClientPostAdminCheck(client)
{
	if (!IsFakeClient(client))
	{
		nooramsay(client)
	}
}

public int MenuHandler1(Menu menu, MenuAction action, int param1, int param2)
{
	if (action == MenuAction_Select)
	{
		char info[32];
		bool found = menu.GetItem(param2, info, sizeof(info));
		PrintToChat(param1, "[\x10Lodge\x01] Discordumuza gelerek yetkiler hakkında bilgi alabilirsiniz. Discord:  \x10discord.gg/fVH5maz", param2, found, info);
	}
} 
