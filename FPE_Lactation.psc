Scriptname FPE_Lactation extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_LowMilk Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Critical Auto Const Mandatory
int Property int_Multi = 1 Auto Const
Bool property bool_Quest = false Auto Const

ActorValue Property FPFP_AV_ActiveLactation Auto Const
float ActorValue_ActiveLactation

FPE_Repeat_Lactation Property FPFP_Repeat_Lactation Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if bool_Quest == false
		akTarget = GetActorUnderCrosshairs()
	endif
	
	ActorValue_ActiveLactation = akTarget.GetValue(FPFP_AV_ActiveLactation)
	
	If (akTarget.GetLeveledActorBase().GetSex() == 0)
		Return
	EndIf
	
	if akTarget.GetValue(FPFP_AV_ActiveLactation) == 0	
		if (!akTarget.HasPerk(WLD_Perk_Lactation_Active) || !akTarget.HasPerk(WLD_Perk_Lactation_Inactive) || !akTarget.HasPerk(WLD_Perk_Lactation_LowMilk) || !akTarget.HasPerk(WLD_Perk_Lactation_Critical))
			if Utility.RandomFloat(1,100) <= FPFP_Global_Lactation_Chance.GetValue()
				akTarget.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation + 1)
			
				if akTarget.HasPerk(WLD_Perk_Lactation_LowMilk)
					akTarget.removeperk(WLD_Perk_Lactation_LowMilk)
				endif
				
				akTarget.addperk(WLD_Perk_Lactation_Active, False)
				
				if bool_Quest == false
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is actively produces Milk in her Breasts")
				elseif bool_Quest == true
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" has started producing Milk in her Breasts")
				endif
				
				FPFP_Repeat_Lactation.Lactation_Action(akTarget, bool_Quest)
			endif	
		else
			akTarget.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation + 1)
				if (FPFP_Global_Lactation_Critical.GetValue() == 1 as float)
					if Utility.RandomFloat(1,100) <= FPFP_Global_Lactation_Chance.GetValue()
						akTarget.addperk(WLD_Perk_Lactation_Critical, False)
						
						if bool_Quest == false
							Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce Milk in her Breasts whatsoever")
						elseif bool_Quest == true
							Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce Milk in her Breasts whatsoever, She would have to find alternate Milk Source")
						endif
						
						akTarget.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation + 1)
					elseif (FPFP_Global_Lactation_LowMilk.GetValue() == 1 as float)
						akTarget.addperk(WLD_Perk_Lactation_LowMilk, False)
						akTarget.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation - 1)
						
						if bool_Quest == false
							Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce enough Milk in her Breasts to useful")
						elseif bool_Quest == true
							Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce enough Milk in her Breasts to feed")
						endif
						
						FPFP_Repeat_Lactation.Lactation_Action(akTarget, bool_Quest)
					endif
				elseif (FPFP_Global_Lactation_LowMilk.GetValue() == 1 as float)
					akTarget.addperk(WLD_Perk_Lactation_LowMilk, False)
					akTarget.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation - 1)
					if bool_Quest == false
						Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce enough Milk in her Breasts to be useful")
					elseif bool_Quest == true
						Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" cannot produce enough Milk in her Breasts to feed")
					endif
				
					FPFP_Repeat_Lactation.Lactation_Action(akTarget, bool_Quest)
				endif
		endif	
	elseif akTarget.HasPerk(WLD_Perk_Lactation_Inactive) && akTarget.GetValue(FPFP_AV_ActiveLactation) == 1
		akTarget.SetValue(FPFP_AV_ActiveLactation, ActorValue_ActiveLactation + 1)
		akTarget.removeperk(WLD_Perk_Lactation_Inactive)
		akTarget.addperk(WLD_Perk_Lactation_Active)
		if bool_Quest == false
			Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" has maintained her milk production.")
		endif
	elseif akTarget.GetValue(FPFP_AV_ActiveLactation) > 0
		if bool_Quest == false
			Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is already Lactating.")
		endif
	elseif akTarget.HasPerk(WLD_Perk_Lactation_Critical)
		Debug.Notification(akTarget.GetLeveledActorBase().GetName()+"'s breast will never produce milk ever again.")
	endif
	
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction