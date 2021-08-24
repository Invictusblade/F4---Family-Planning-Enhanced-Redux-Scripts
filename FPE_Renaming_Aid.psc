Scriptname FPE_Renaming_Aid extends activemagiceffect

FPE_BabyNames Property FPFP_BabyNames Auto Const Mandatory
Actor Property PlayerREF Auto Const Mandatory
Faction Property FPFP_AdultResource Auto Const Mandatory
Actorbase Property WorkshopNPC Auto Const Mandatory
Actorbase Property WorkshopDog Auto Const Mandatory
Actorbase Property WorkshopNPCGuard Auto Const Mandatory
Actorbase Property WorkshopBrahmin Auto Const Mandatory

Event OnEffectStart(Actor akActor, Actor akCaster)
	akActor = GetActorUnderCrosshairs()
	String Name
	
	if akActor.IsInFaction(FPFP_AdultResource) || akActor.GetLeveledActorBase() == WorkshopNPC || akActor.GetLeveledActorBase() == WorkshopBrahmin || akActor.GetLeveledActorBase() == WorkshopDog || akActor.GetLeveledActorBase() == WorkshopNPCGuard
		if akActor.GetLeveledActorBase().GetSex() == 0
			Name = FPFP_BabyNames.BabyNames_Male(akActor.GetLeveledActorBase().GetRace())
		elseif akActor.GetLeveledActorBase().GetSex() == 1
			Name = FPFP_BabyNames.BabyNames_Female(akActor.GetLeveledActorBase().GetRace())
		else
			Name = FPFP_BabyNames.BabyNames_Female(akActor.GetLeveledActorBase().GetRace())
		endif
		RenameAnything.SetRefName(akActor, Name)
	endif
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction