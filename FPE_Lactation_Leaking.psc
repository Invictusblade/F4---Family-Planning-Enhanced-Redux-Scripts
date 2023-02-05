Scriptname FPE_Lactation_Leaking extends activemagiceffect

Actor Property PlayerREF Auto Const
ActorValue Property FPFP_AV_ActiveLactation_Leaking Auto Const
perk Property WLD_Perk_Lactation Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical Auto Const Mandatory
int Time

float ActorValue_ActiveLactation_Leaking
FPE_Lactation_Leaking_Quest Property FPFP_Lactation_Leaking_Quest Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ActorValue_ActiveLactation_Leaking = akTarget.GetValue(FPFP_AV_ActiveLactation_Leaking)
	Utility.Wait(5)
			
	If akTarget.GetLeveledActorBase().GetSex() == 0
		Return
	EndIf

	if (akTarget.Hasperk(WLD_Perk_Lactation) || akTarget.Hasperk(WLD_Perk_Lactation_Active) || akTarget.Hasperk(WLD_Perk_Lactation_Inactive)) && akTarget.GetValue(FPFP_AV_ActiveLactation_Leaking) == 0
		akTarget.SetValue(FPFP_AV_ActiveLactation_Leaking, ActorValue_ActiveLactation_Leaking + 1)	
		FPFP_Lactation_Leaking_Quest.LeakingBreasts(akTarget)
		
	elseif akTarget.Hasperk(WLD_Perk_Lactation_LowMilk) || akTarget.Hasperk(WLD_Perk_Lactation_Critical)
		if akTarget == PlayerREF
			Debug.notification(akTarget.GetLeveledActorBase().GetName() +" cannot leak milk")
		endif
	endif
EndEvent