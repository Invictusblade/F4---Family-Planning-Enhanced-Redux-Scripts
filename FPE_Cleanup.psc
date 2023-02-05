Scriptname FPE_Cleanup extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Leaking_FPE Auto Const Mandatory
perk Property WLD_Perk_Lactation_Forever Auto Const Mandatory
perk Property WLD_Perk_Lactation_Forever_FPE Auto Const Mandatory

perk Property WLD_Perk_DeadBaby Auto Const Mandatory

Perk Property WLD_Perk_Infertile Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Forever Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Both Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Female Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Male Auto Const Mandatory
Perk Property WLD_Perk_Sterile Auto Const Mandatory


perk Property WLD_Perk_Drugs_Delay Auto Const Mandatory
perk Property WLD_Perk_Gifts_Delay Auto Const Mandatory
perk Property WLD_Perk_Sex_Delay Auto Const Mandatory
perk Property WLD_Perk_PostPartum Auto Const Mandatory
perk Property WLD_perk_Active_Blood Auto Const Mandatory
perk Property WLD_perk_Active_Milk Auto Const Mandatory
perk Property WLD_perk_Active_Semen Auto Const Mandatory
Potion property FPFP_Lactation_Quest Auto Const Mandatory

bool Property bool_Cleanup = false Auto Const Mandatory
bool Property bool_NPC = false Auto Const Mandatory


perk Property WLD_Perk_Baby_Smell Auto Const Mandatory
Faction Property WDF_DeathclawFaction_WDF Auto Const mandatory
Faction Property WDF_MirelurkFaction_WDF Auto Const mandatory
Faction Property WDF_MoleRatFaction_WDF Auto Const mandatory
Faction Property WDF_MutantHoundFaction_WDF Auto Const mandatory

Faction Property WDF_RadroachFaction_WDF Auto Const mandatory
Faction Property WDF_RadScorpionFaction_WDF Auto Const mandatory
Faction Property WDF_RadStagFaction_WDF Auto Const mandatory
Faction Property WDF_StingwingFaction_WDF Auto Const mandatory

Faction Property WDF_ViciousDogFaction_WDF Auto Const mandatory
Faction Property WDF_YaoGuaiFaction_WDF Auto Const mandatory
Faction Property WDF_AlienFaction_WDF Auto Const mandatory
Faction Property WDF_BloatflyFaction_WDF Auto Const mandatory

Faction Property WDF_BloodbugFaction_WDF Auto Const mandatory
Faction Property CreatureFaction_WDF Auto Const mandatory
Faction Property WDF_DLC04_BrahmiluffFaction_WDF Auto Const mandatory
Faction Property WDF_DLC03AnglerFaction_WDF Auto Const mandatory

Faction Property WDF_DLC03ChickenFaction_WDF Auto Const mandatory
Faction Property WDF_DLC03FogCrawler_WDF Auto Const mandatory
Faction Property WDF_DLC03RabbitFaction_WDF Auto Const mandatory
Faction Property WDF_DLC03_GulperFaction_WDF Auto Const mandatory

Faction Property WDF_DLC03_WolfFaction_WDF Auto Const mandatory
Faction Property WDF_BabyFaction Auto Const mandatory
Faction Property WDF_FeralGhoulFaction_WDF Auto Const mandatory
Faction Property WDF_GunnerFaction_WDF Auto Const mandatory

Faction Property WDF_RaiderFaction_WDF Auto Const mandatory
Faction Property WDF_SynthFaction_WDF Auto Const mandatory
Faction Property WDF_SuperMutantFaction_WDF Auto Const mandatory


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

	if bool_Cleanup == true
			
		akTarget.removeFromFaction(WDF_DeathclawFaction_WDF)
		akTarget.removeFromFaction(WDF_MirelurkFaction_WDF)
		akTarget.removeFromFaction(WDF_MoleRatFaction_WDF)
		akTarget.removeFromFaction(WDF_MutantHoundFaction_WDF)

		akTarget.removeFromFaction(WDF_RadroachFaction_WDF)
		akTarget.removeFromFaction(WDF_RadScorpionFaction_WDF)
		akTarget.removeFromFaction(WDF_RadStagFaction_WDF)
		akTarget.removeFromFaction(WDF_StingwingFaction_WDF)

		akTarget.removeFromFaction(WDF_ViciousDogFaction_WDF)
		akTarget.removeFromFaction(WDF_YaoGuaiFaction_WDF)
		akTarget.removeFromFaction(WDF_AlienFaction_WDF)
		akTarget.removeFromFaction(WDF_BloatflyFaction_WDF)

		akTarget.removeFromFaction(WDF_BloodbugFaction_WDF)
		akTarget.removeFromFaction(CreatureFaction_WDF)
		akTarget.removeFromFaction(WDF_DLC04_BrahmiluffFaction_WDF)
		akTarget.removeFromFaction(WDF_DLC03AnglerFaction_WDF)

		akTarget.removeFromFaction(WDF_DLC03ChickenFaction_WDF)
		akTarget.removeFromFaction(WDF_DLC03FogCrawler_WDF)
		akTarget.removeFromFaction(WDF_DLC03RabbitFaction_WDF)
		akTarget.removeFromFaction(WDF_DLC03_GulperFaction_WDF)

		akTarget.removeFromFaction(WDF_DLC03_WolfFaction_WDF)
		akTarget.removeFromFaction(WDF_BabyFaction)
		akTarget.removeFromFaction(WDF_FeralGhoulFaction_WDF)
		akTarget.removeFromFaction(WDF_GunnerFaction_WDF)

		akTarget.removeFromFaction(WDF_RaiderFaction_WDF)
		akTarget.removeFromFaction(WDF_SynthFaction_WDF)
		akTarget.removeFromFaction(WDF_SuperMutantFaction_WDF)
		
		if akTarget.HasPerk(WLD_Perk_Baby_Smell)
			akTarget.RemovePerk(WLD_Perk_Baby_Smell)
		endif
		

		if akTarget.HasPerk(WLD_Perk_Lactation_Forever_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Forever_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Forever)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Active_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Active_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Active)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Inactive_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Inactive_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Inactive)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_LowMilk_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_LowMilk_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_LowMilk)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Critical_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Critical_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Critical)
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
		
		if akTarget.HasPerk(WLD_Perk_Drugs_Delay)
			akTarget.RemovePerk(WLD_Perk_Drugs_Delay)
		endif
		
		if akTarget.HasPerk(WLD_Perk_Gifts_Delay)
			akTarget.RemovePerk(WLD_Perk_Gifts_Delay)
		endif
		
		if akTarget.HasPerk(WLD_Perk_Sex_Delay)
			akTarget.RemovePerk(WLD_Perk_Sex_Delay)
		endif
		
		if akTarget.HasPerk(WLD_Perk_PostPartum)
			akTarget.RemovePerk(WLD_Perk_PostPartum)
		endif
		
		if akTarget.HasPerk(WLD_perk_Active_Blood)
			akTarget.RemovePerk(WLD_perk_Active_Blood)
		endif
		
		if akTarget.HasPerk(WLD_perk_Active_Milk)
			akTarget.RemovePerk(WLD_perk_Active_Milk)
		endif
				
		if akTarget.HasPerk(WLD_perk_Active_Semen)
			akTarget.RemovePerk(WLD_perk_Active_Semen)
		endif

		
		if akTarget.HasPerk(WLD_Perk_Lactation_Leaking_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Leaking_FPE)
			akTarget.EquipItem(FPFP_Lactation_Quest, abSilent = True)
		endif

		Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" Has been cleaned of broken Perks")
		if bool_NPC == false
			Debug.Notification(akTarget.GetLeveledActorBase().GetName()+"When you are finished with cleaning NPC's, please delete INVB_WastelandOffspring_DISTR.ini")
		endif 
	else
		if akTarget.HasPerk(WLD_Perk_Lactation_Forever_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Forever_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Forever)
		endif
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Active_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Active_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Active)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Inactive_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Inactive_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Inactive)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_LowMilk_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_LowMilk_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_LowMilk)
		endif	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Critical_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Critical_FPE)
			akTarget.AddPerk(WLD_Perk_Lactation_Critical)
		endif
	
		
		if akTarget.HasPerk(WLD_Perk_Lactation_Leaking_FPE)
			akTarget.RemovePerk(WLD_Perk_Lactation_Leaking_FPE)
			akTarget.EquipItem(FPFP_Lactation_Quest, abSilent = True)
		endif
		Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" Lactation perks Has been updated")
		if bool_NPC == false
			Debug.Notification(akTarget.GetLeveledActorBase().GetName()+"When you are finished with cleaning NPC's, please delete INVB_WastelandOffspring_DISTR.ini")
		endif 
	endif	
EndEvent