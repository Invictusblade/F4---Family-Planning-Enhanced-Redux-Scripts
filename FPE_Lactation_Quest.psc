Scriptname FPE_Lactation_Quest extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Length Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_LowMilk Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Critical Auto Const Mandatory
int Property int_Multi = 1 Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	if (!akTarget.HasPerk(WLD_Perk_Lactation_Active) || !akTarget.HasPerk(WLD_Perk_Lactation_Inactive) || !akTarget.HasPerk(WLD_Perk_Lactation_LowMilk) || !akTarget.HasPerk(WLD_Perk_Lactation_Critical))
		if Utility.RandomFloat(0,100) <= FPFP_Global_Lactation_Chance.GetValue()
			
			if akTarget.HasPerk(WLD_Perk_Lactation_LowMilk)
				akTarget.removeperk(WLD_Perk_Lactation_LowMilk)
			endif
			
			akTarget.addperk(WLD_Perk_Lactation_Active, False)
			Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is actively produces Milk in her Breasts")
			Lactation_Action(akTarget)
		else
			if (FPFP_Global_Lactation_Critical.GetValue() == 1 as float)
				if Utility.RandomFloat(0,100) <= FPFP_Global_Lactation_Chance.GetValue()
					akTarget.addperk(WLD_Perk_Lactation_Critical, False)
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce Milk in her Breasts whatsoever")
				elseif (FPFP_Global_Lactation_LowMilk.GetValue() == 1 as float)
					akTarget.addperk(WLD_Perk_Lactation_LowMilk, False)
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce enough Milk in her Breasts to feed")
					Lactation_Action(akTarget)
				endif
			elseif (FPFP_Global_Lactation_LowMilk.GetValue() == 1 as float)
				akTarget.addperk(WLD_Perk_Lactation_LowMilk, False)
				Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce enough Milk in her Breasts to feed")
				Lactation_Action(akTarget)
			endif
		endif
	endif
	
EndEvent


Function Lactation_Action(actor akTarget)
	Utility.WaitGameTime(FPFP_Global_Lactation_Length.getvalue() * int_Multi)
	
	if akTarget.HasPerk(WLD_Perk_Lactation_Inactive)
		Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" Breasts has stopped the production of Milk")
		akTarget.removeperk(WLD_Perk_Lactation_Inactive)
	elseif akTarget.HasPerk(WLD_Perk_Lactation_Active)	
		akTarget.removeperk(WLD_Perk_Lactation_Active)
		Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" Breasts has slowed the production of Milk")
		akTarget.addperk(WLD_Perk_Lactation_Inactive)
		Lactation_Action(akTarget)
	elseif akTarget.HasPerk(WLD_Perk_Lactation_LowMilk)
		akTarget.removeperk(WLD_Perk_Lactation_LowMilk)
	endif
EndFunction	
