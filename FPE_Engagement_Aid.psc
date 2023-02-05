Scriptname FPE_Engagement_Aid extends activemagiceffect

Actor Property PlayerREF Auto Const
Perk Property WLD_Perk_Married Auto
Perk Property WLD_Perk_Married_2 Auto
Perk Property WLD_Perk_Married_Poly Auto
Perk Property WLD_Perk_Married_Harem Auto
bool Property bool_Submit Auto
armor Property Armor_Fake Auto
potion Property potion_self Auto


FPE_Engagement_Quest Property FPFP_Engagement Auto Const Mandatory

Event OnEffectStart(Actor akActor, Actor akCaster)
	akActor = GetActorUnderCrosshairs()
	if akActor != PlayerREF && (akActor.HasPerk(WLD_Perk_Married) || akActor.HasPerk(WLD_Perk_Married_2) || akActor.HasPerk(WLD_Perk_Married_Poly) || akActor.HasPerk(WLD_Perk_Married_Harem))
		Debug.notification(akActor.GetLeveledActorBase().GetName() +" is already married to you")
		PlayerREF.additem(potion_self, 1, true)
	elseif akActor != PlayerREF && (!akActor.HasPerk(WLD_Perk_Married) || !akActor.HasPerk(WLD_Perk_Married_2) || !akActor.HasPerk(WLD_Perk_Married_Poly) || !akActor.HasPerk(WLD_Perk_Married_Harem))
		if FPFP_Engagement.CheckRomance(akActor)
			FPFP_Engagement.Engagement(akActor, bool_Submit)
			akActor.equipitem(Armor_Fake)
		else
			PlayerREF.additem(potion_self, 1, true)	
		endif
	else
		PlayerREF.additem(potion_self, 1, true)	
	endif
EndEvent


Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction