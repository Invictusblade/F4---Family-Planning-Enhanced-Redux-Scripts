Scriptname FPE_Repeat_Lactation extends Quest

actor akActor
perk Property WLD_Perk_Lactation_Active Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical Auto Const Mandatory

GlobalVariable property FPFP_Global_Lactation_Length Auto Const Mandatory

ActorValue Property FPFP_AV_ActiveLactation Auto Const
float ActorValue_ActiveLactation
Bool bool_Quest

int Property int_Multi = 24 Auto Const

Function Lactation_Action(actor akTarget, bool bool_inject)
	akActor = akTarget
	bool_Quest = bool_inject
	StartTimerGameTime(FPFP_Global_Lactation_Length.GetValue() * int_Multi)

EndFunction	

Event OnTimerGameTime(int aiTID)
	ActorValue_ActiveLactation = akActor.GetValue(FPFP_AV_ActiveLactation)	
	
	if akActor.HasPerk(WLD_Perk_Lactation_Inactive)
		if bool_Quest == false
			Debug.Notification(akActor.GetLeveledActorBase().GetName()+" Breasts has stopped the production of Milk")
		endif
		akActor.removeperk(WLD_Perk_Lactation_Inactive)
		akActor.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation - 1)
	elseif akActor.HasPerk(WLD_Perk_Lactation_Active) && akActor.GetValue(FPFP_AV_ActiveLactation) == 2
		akActor.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation - 1)
		StartTimerGameTime(FPFP_Global_Lactation_Length.GetValue() * int_Multi)
	elseif akActor.HasPerk(WLD_Perk_Lactation_Active) && akActor.GetValue(FPFP_AV_ActiveLactation) == 1	
		akActor.removeperk(WLD_Perk_Lactation_Active)
		if bool_Quest == false
			Debug.Notification(akActor.GetLeveledActorBase().GetName()+" Breasts has slowed the production of Milk")
		endif
		akActor.addperk(WLD_Perk_Lactation_Inactive)
		StartTimerGameTime(FPFP_Global_Lactation_Length.GetValue() * int_Multi)
	
	elseif akActor.HasPerk(WLD_Perk_Lactation_LowMilk)
		if bool_Quest == false
			Debug.Notification(akActor.GetLeveledActorBase().GetName()+" Breasts has been healed")
		endif
		akActor.removeperk(WLD_Perk_Lactation_LowMilk)
	endif
EndEvent
