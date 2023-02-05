Scriptname FPE_Cleanup_FPFP extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Leaking_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Forever_FPE Auto Const Mandatory

perk Property WLD_Perk_DeadBaby Auto Const Mandatory

Perk Property WLD_Perk_Infertile Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Forever Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Both Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Female Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Male Auto Const Mandatory
Perk Property WLD_Perk_Sterile Auto Const Mandatory
perk Property WLD_Perk_PostPartum Auto Const Mandatory

bool Property bool_NPC = false Auto Const Mandatory

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if bool_NPC == true
		akTarget = GetActorUnderCrosshairs()
	endif 

		if akTarget.HasPerk(WLD_Perk_Lactation_Forever_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Forever_FPE)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Active_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Active_FPE)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Inactive_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Inactive_FPE)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_LowMilk_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_LowMilk_FPE)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Critical_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Critical_FPE)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_DeadBaby)
			akTarget.RemovePerk(WLD_Perk_DeadBaby)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Infertile)
			akTarget.RemovePerk(WLD_Perk_Infertile)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Fertile_Forever)
			akTarget.RemovePerk(WLD_Perk_Fertile_Forever)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Fertile_Both)
			akTarget.RemovePerk(WLD_Perk_Fertile_Both)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Fertile_Female)
			akTarget.RemovePerk(WLD_Perk_Fertile_Female)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Fertile_Male)
			akTarget.RemovePerk(WLD_Perk_Fertile_Male)
		endif		
		
		if akTarget.HasPerk(WLD_Perk_Sterile)
			akTarget.RemovePerk(WLD_Perk_Sterile)
		endif
			
		if akTarget.HasPerk(WLD_Perk_PostPartum)
			akTarget.RemovePerk(WLD_Perk_PostPartum)
		endif
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Leaking_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Leaking_FPE)
		endif

		Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" Has been cleaned of broken Perks")
		if bool_NPC == false
			Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" When you are finished with cleaning NPC's, please add a ; to the spell in FP_FamilyPlanningEnhanced_DISTR.ini")
		endif 	
EndEvent