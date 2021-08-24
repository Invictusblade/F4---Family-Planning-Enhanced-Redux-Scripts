Scriptname FPE_Engagement_Ring extends ObjectReference

Actor Property PlayerREF Auto Const
Perk Property WLD_Perk_Married Auto
Perk Property WLD_Perk_Married_2 Auto
Perk Property WLD_Perk_Married_Poly Auto
Perk Property WLD_Perk_Married_Harem Auto
bool Property bool_Submit Auto
armor Property Armor_Fake Auto

FPE_Engagement_Quest Property FPFP_Engagement Auto Const Mandatory

Event OnEquipped(Actor akActor)

	if akActor != PlayerREF
		if akActor != PlayerREF && akActor.HasPerk(WLD_Perk_Married) || akActor.HasPerk(WLD_Perk_Married_2) || akActor.HasPerk(WLD_Perk_Married_Poly) || akActor.HasPerk(WLD_Perk_Married_Harem)
			Debug.notification(akActor.GetLeveledActorBase().GetName() +" is already married to you")
		elseif akActor != PlayerREF && !akActor.HasPerk(WLD_Perk_Married) || !akActor.HasPerk(WLD_Perk_Married_2) || !akActor.HasPerk(WLD_Perk_Married_Poly) || !akActor.HasPerk(WLD_Perk_Married_Harem)
			FPFP_Engagement.Engagement(akActor, bool_Submit)
			akActor.unequipitem(self)
			akActor.removeitem(self)
			akActor.equipitem(Armor_Fake)
		endif
	else
		akActor.unequipitem(self)	
	endif	
EndEvent