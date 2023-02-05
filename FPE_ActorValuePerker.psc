Scriptname FPE_ActorValuePerker extends Quest

ActorValue Property FPFP_AV_SexHuman Auto Const
Perk Property WLD_Perk_SexHuman Auto
GlobalVariable property FPFP_Global_Counter_SexHuman Auto Const Mandatory
ActorValue Property FPFP_AV_SexGhoul Auto Const
Perk Property WLD_Perk_SexGhoul Auto
GlobalVariable property FPFP_Global_Counter_SexGhoul Auto Const Mandatory
ActorValue Property FPFP_AV_BirthHuman Auto Const
Perk Property WLD_Perk_BirthHuman Auto
GlobalVariable property FPFP_Global_Counter_BirthHuman Auto Const Mandatory
ActorValue Property FPFP_AV_BirthGhoul Auto Const
Perk Property WLD_Perk_BirthGhoul Auto
GlobalVariable property FPFP_Global_Counter_BirthGhoul Auto Const Mandatory
ActorValue Property FPFP_AV_SafeSex Auto Const
Perk Property WLD_Perk_SafeSex Auto
GlobalVariable property FPFP_Global_Counter_SafeSex Auto Const Mandatory


Keyword Property FPFP_UniqueSexPartner Auto Const Mandatory
ActorValue Property FPFP_AV_SexHuman_Player Auto Const
Perk[] Property WLD_Perk_SexHuman_Player Auto
GlobalVariable property FPFP_Global_Counter_SexHuman_Player Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_SexHuman_Player_Choice Auto Const Mandatory

Race Property HumanRace Auto
Race Property GhoulRace Auto

Actor Property PlayerREF Auto Const Mandatory

FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory

float ActorValue_Sex
float ActorValue_Sex_Player
float ActorValue_Birth
float ActorValue_SafeSex

Function SexCounter(Actor akActor, Actor akMan)
	if akMan.GetLeveledActorBase().GetRace() == HumanRace
		ActorValue_Sex = akActor.GetValue(FPFP_AV_SexHuman)
		akActor.SetValue(FPFP_AV_SexHuman, ActorValue_Sex + 1)
		
		if akActor.GetValue(FPFP_AV_SexHuman) >= FPFP_Global_Counter_SexHuman.GetValue() && !akActor.hasperk(WLD_Perk_SexHuman)
			akActor.addperk(WLD_Perk_SexHuman)
		endif
	elseif akMan.GetLeveledActorBase().GetRace() == GhoulRace
		ActorValue_Sex = akActor.GetValue(FPFP_AV_SexGhoul)
		akActor.SetValue(FPFP_AV_SexGhoul, ActorValue_Sex + 1)
		
		if akActor.GetValue(FPFP_AV_SexGhoul) >= FPFP_Global_Counter_SexGhoul.GetValue() && !akActor.hasperk(WLD_Perk_SexGhoul)
			akActor.addperk(WLD_Perk_SexGhoul)
		endif
	elseif !akMan.GetLeveledActorBase().GetRace() == HumanRace && !akMan.GetLeveledActorBase().GetRace() == GhoulRace
		ActorValue_Sex = akActor.GetValue(FPFP_BabyHandler.SexCounter(akMan.GetLeveledActorBase().GetRace()))
		akActor.SetValue(FPFP_BabyHandler.SexCounter(akMan.GetLeveledActorBase().GetRace()), ActorValue_Sex + 1)
				
		if akActor.GetValue(FPFP_BabyHandler.SexCounter(akMan.GetLeveledActorBase().GetRace())) >= FPFP_BabyHandler.SexCounter_Global(akMan.GetLeveledActorBase().GetRace()) && !akActor.addperk(FPFP_BabyHandler.SexPerk(akMan.GetLeveledActorBase().GetRace()))
			akActor.addperk(FPFP_BabyHandler.SexPerk(akMan.GetLeveledActorBase().GetRace()))
		endif
	endif
EndFunction

Function SexCounter_Player(Actor akActor, Actor akMan)
	if akActor == PlayerREF ;Player is Female
		if !akMan.HasKeyword(FPFP_UniqueSexPartner)
			ActorValue_Sex_Player = PlayerREF.GetValue(FPFP_AV_SexHuman_Player)
			PlayerREF.SetValue(FPFP_AV_SexHuman_Player, ActorValue_Sex_Player + 1)
			
			if PlayerREF.GetValue(FPFP_AV_SexHuman_Player) >= FPFP_Global_Counter_SexHuman_Player.GetValue() && !PlayerREF.hasperk(WLD_Perk_SexHuman_Player[FPFP_Global_Counter_SexHuman_Player_Choice.GetValue() as int])
				PlayerREF.addperk(WLD_Perk_SexHuman_Player[FPFP_Global_Counter_SexHuman_Player_Choice.GetValue() as int])
			endif
			
			akMan.AddKeyword(FPFP_UniqueSexPartner)
		endif
		
	elseif akMan == PlayerREF ;Player is Male
		if !akActor.HasKeyword(FPFP_UniqueSexPartner)
			ActorValue_Sex_Player = PlayerREF.GetValue(FPFP_AV_SexHuman_Player)
			PlayerREF.SetValue(FPFP_AV_SexHuman_Player, ActorValue_Sex_Player + 1)
			
			if PlayerREF.GetValue(FPFP_AV_SexHuman_Player) >= FPFP_Global_Counter_SexHuman_Player.GetValue() && !PlayerREF.hasperk(WLD_Perk_SexHuman_Player[FPFP_Global_Counter_SexHuman_Player_Choice.GetValue() as int])
				PlayerREF.addperk(WLD_Perk_SexHuman_Player[FPFP_Global_Counter_SexHuman_Player_Choice.GetValue() as int])
			endif
			
			akActor.AddKeyword(FPFP_UniqueSexPartner)
		endif
	endif
EndFunction

Function BirthCounter(Actor akActor, Race FatherRace) 
	
	if FatherRace == HumanRace
		ActorValue_Birth = akActor.GetValue(FPFP_AV_BirthHuman)
		akActor.SetValue(FPFP_AV_BirthHuman, ActorValue_Birth + 1)
		
		if akActor.GetValue(FPFP_AV_BirthHuman) >= FPFP_Global_Counter_BirthHuman.GetValue() && !akActor.hasperk(WLD_Perk_BirthHuman)
			akActor.addperk(WLD_Perk_BirthHuman)
		endif
	elseif FatherRace == GhoulRace
		ActorValue_Birth = akActor.GetValue(FPFP_AV_BirthGhoul)
		akActor.SetValue(FPFP_AV_BirthGhoul, ActorValue_Birth + 1)
		
		if akActor.GetValue(FPFP_AV_BirthGhoul) >= FPFP_Global_Counter_BirthGhoul.GetValue() && !akActor.hasperk(WLD_Perk_BirthGhoul)
			akActor.addperk(WLD_Perk_BirthGhoul)
		endif
	elseif !FatherRace == HumanRace && !FatherRace == GhoulRace
		ActorValue_Birth = akActor.GetValue(FPFP_BabyHandler.BirthCounter(FatherRace))
		akActor.SetValue(FPFP_BabyHandler.BirthCounter(FatherRace), ActorValue_Birth + 1)
				
		if akActor.GetValue(FPFP_BabyHandler.BirthCounter(FatherRace)) >= FPFP_BabyHandler.BirthCounter_Global(FatherRace) && !akActor.addperk(FPFP_BabyHandler.BirthPerk(FatherRace))
			akActor.addperk(FPFP_BabyHandler.BirthPerk(FatherRace))
		endif
	endif
	

EndFunction

Function SexCounter_SafeSex(Actor akActor, Actor akMan) 
	ActorValue_SafeSex = akActor.GetValue(FPFP_AV_SafeSex)
	akActor.SetValue(FPFP_AV_SafeSex, ActorValue_SafeSex + 1)
		
	if akActor.GetValue(FPFP_AV_SafeSex) >= FPFP_Global_Counter_SafeSex.GetValue() && !akActor.hasperk(WLD_Perk_SafeSex)
		akActor.addperk(WLD_Perk_SafeSex)
	endif
EndFunction