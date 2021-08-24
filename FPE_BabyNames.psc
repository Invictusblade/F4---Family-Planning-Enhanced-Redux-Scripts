Scriptname FPE_BabyNames extends Quest

Actor Property PlayerREF Auto Const Mandatory
String[] Property Names_Male Auto Const
String[] Property Names_Female Auto Const
String[] Property Names_Unisex Auto Const
Faction Property FPFP_AdultResource Auto Const Mandatory
Actorbase Property WorkshopNPC Auto Const Mandatory
Actorbase Property WorkshopDog Auto Const Mandatory
Actorbase Property WorkshopNPCGuard Auto Const Mandatory
Actorbase Property WorkshopBrahmin Auto Const Mandatory

Race Property HumanRace Auto 
FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory
GlobalVariable property FPFP_Global_Rename_Human Auto Const Mandatory

Keyword Property kw_named Auto const
GlobalVariable property FPFP_Global_Allow_ReRenaming Auto Const Mandatory

String Function BabyNames_Male(Race akDadRace)
	if akDadRace != HumanRace && akDadRace != None && FPFP_BabyHandler.WhatsmyName_Auto(akDadRace) == 1
		return FPFP_BabyHandler.WhatsmyName_Male(akDadRace)
	elseif akDadRace == HumanRace && FPFP_Global_Rename_Human.GetValue() == 1
		int random_Name = Utility.RandomInt(0, Names_Male.Length-1)
		return Names_Male[random_Name]
	else
		return None
	endif
EndFunction

String Function BabyNames_Female(Race akDadRace)
	if akDadRace != HumanRace && akDadRace != None && FPFP_BabyHandler.WhatsmyName_Auto(akDadRace) == 1
		return FPFP_BabyHandler.WhatsmyName_Female(akDadRace)
	elseif akDadRace == HumanRace && FPFP_Global_Rename_Human.GetValue() == 1
		int random_Name = Utility.RandomInt(0, Names_Female.Length-1)
		return Names_Female[random_Name]
	else
		return None
	endif
EndFunction

String Function BabyNames(Race akDadRace)
	if akDadRace != HumanRace && akDadRace != None && FPFP_BabyHandler.WhatsmyName_Auto(akDadRace) == 1
		return FPFP_BabyHandler.WhatsmyName(akDadRace)
	elseif akDadRace == HumanRace && FPFP_Global_Rename_Human.GetValue() == 1
		int random_Name = Utility.RandomInt(0, Names_Unisex.Length-1)
		return Names_Unisex[random_Name]
	else
		return None
	endif
EndFunction

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction


Function GiveNPCUnderCrosshairs_Rename()
	Actor akActor = GetActorUnderCrosshairs()
	String Name
	if FPFP_Global_Allow_ReRenaming.GetValue() == 1 || !akActor.hasKeyword(kw_named)
		if akActor.IsInFaction(FPFP_AdultResource) || akActor.GetLeveledActorBase() == WorkshopNPC || akActor.GetLeveledActorBase() == WorkshopBrahmin || akActor.GetLeveledActorBase() == WorkshopDog || akActor.GetLeveledActorBase() == WorkshopNPCGuard
			if akActor.GetLeveledActorBase().GetSex() == 0
				Name = BabyNames_Male(akActor.GetLeveledActorBase().GetRace())
			elseif akActor.GetLeveledActorBase().GetSex() == 1
				Name = BabyNames_Female(akActor.GetLeveledActorBase().GetRace())
			else
				Name = BabyNames(akActor.GetLeveledActorBase().GetRace())
			endif
			RenameAnything.SetRefName(akActor, Name)
			akActor.addKeyword(kw_named)
		endif
	else
		Debug.notification(akActor.GetLeveledActorBase().GetName() +" looks at you like you are a fucking moron")
	endif	
EndFunction