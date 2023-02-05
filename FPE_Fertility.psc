Scriptname FPE_Fertility extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
int Property int_Multi = 1 Auto Const
Bool property bool_Quest = false Auto Const
Bool property bool_End = false Auto Const
Bool property bool_Override = false Auto Const

Perk Property WLD_Perk_Infertile Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Forever Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Both Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Female Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Male Auto Const Mandatory
Perk Property WLD_Perk_Sterile Auto Const Mandatory

GlobalVariable property FPFP_Global_MaleToMaleCum Auto Const Mandatory
GlobalVariable property FPFP_Global_FemaleToFemaleCum Auto Const Mandatory
GlobalVariable property FPFP_Global_Infertile_Toggle Auto Const Mandatory

ActorValue Property FPFP_AV_ActiveFertility Auto Const
float ActorValue_ActiveFertility


FPE_Repeat_Fertility Property FPFP_Repeat_Fertility Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	if bool_Quest == false
		akTarget = GetActorUnderCrosshairs()
	endif

	ActorValue_ActiveFertility = akTarget.GetValue(FPFP_AV_ActiveFertility)
	
	if bool_Override == true && !akTarget.HasPerk(WLD_Perk_Fertile_Forever)
		if akTarget.GetValue(FPFP_AV_ActiveFertility) == 0
			akTarget.SetValue(FPFP_AV_ActiveFertility, ActorValue_ActiveFertility + 1)
		endif
		
		if akTarget.HasPerk(WLD_Perk_Fertile_Both) 
			akTarget.removeperk(WLD_Perk_Fertile_Both)
		elseif akTarget.HasPerk(WLD_Perk_Fertile_Female)
			akTarget.removeperk(WLD_Perk_Fertile_Female)
		elseif akTarget.HasPerk(WLD_Perk_Fertile_Male)
			akTarget.removeperk(WLD_Perk_Fertile_Male)
		elseif akTarget.HasPerk(WLD_Perk_Infertile)
			akTarget.removeperk(WLD_Perk_Infertile)
		endif
		
		if akTarget.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_MaleToMaleCum.GetValue() == 1;Male
			akTarget.addPerk(WLD_Perk_Fertile_Both)
			if bool_Quest == false
				Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get pregnant, as well as get others pregnant.")
			endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
		elseif akTarget.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1 ;Female
			akTarget.addPerk(WLD_Perk_Fertile_Both)
			if bool_Quest == false
				Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get pregnant, as well as get others pregnant.")
			endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
		elseif akTarget.GetLeveledActorBase().GetSex() == 0 ;Male
			akTarget.addPerk(WLD_Perk_Fertile_Male)
			if bool_Quest == false
				Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get others pregnant.")
			endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
			
		elseif akTarget.GetLeveledActorBase().GetSex() == 1 ;Female
			akTarget.addPerk(WLD_Perk_Fertile_Female)
			if bool_Quest == false
				Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get pregnant.")
			endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
		endif
	
	elseif bool_End == true && !akTarget.HasPerk(WLD_Perk_Fertile_Forever) 
		if akTarget.GetValue(FPFP_AV_ActiveFertility) == 1
			akTarget.SetValue(FPFP_AV_ActiveFertility, ActorValue_ActiveFertility - 1)
		endif
		
		if akTarget.HasPerk(WLD_Perk_Fertile_Both) 
			akTarget.removeperk(WLD_Perk_Fertile_Both)
		elseif akTarget.HasPerk(WLD_Perk_Fertile_Female)
			akTarget.removeperk(WLD_Perk_Fertile_Female)
		elseif akTarget.HasPerk(WLD_Perk_Fertile_Male)
			akTarget.removeperk(WLD_Perk_Fertile_Male)
		endif
		
		if FPFP_Global_Infertile_Toggle.GetValue() == 1
			akTarget.addperk(WLD_Perk_Infertile)
			if bool_Quest == false
				Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is experiencing some post-pregnancy Infertility")
			endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
		endif
	elseif akTarget.GetValue(FPFP_AV_ActiveFertility) == 0
		akTarget.SetValue(FPFP_AV_ActiveFertility, ActorValue_ActiveFertility + 1)
		if akTarget.HasPerk(WLD_Perk_Sterile)
			;Nothing here
		elseif akTarget.HasPerk(WLD_Perk_Infertile)
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
		elseif !akTarget.HasPerk(WLD_Perk_Fertile_Both) && !akTarget.HasPerk(WLD_Perk_Fertile_Female) && !akTarget.HasPerk(WLD_Perk_Fertile_Male) && !akTarget.HasPerk(WLD_Perk_Fertile_Forever) 
			
			if akTarget.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_MaleToMaleCum.GetValue() == 1;Male
				akTarget.addPerk(WLD_Perk_Fertile_Both)
				if bool_Quest == false
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get pregnant, as well as get others pregnant.")
				endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
			elseif akTarget.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1 ;Female
				akTarget.addPerk(WLD_Perk_Fertile_Both)
				if bool_Quest == false
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get pregnant, as well as get others pregnant.")
				endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
			elseif akTarget.GetLeveledActorBase().GetSex() == 0 ;Male
				akTarget.addPerk(WLD_Perk_Fertile_Male)
				if bool_Quest == false
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get others pregnant.")
				endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
			elseif akTarget.GetLeveledActorBase().GetSex() == 1 ;Female
				akTarget.addPerk(WLD_Perk_Fertile_Female)
				if bool_Quest == false
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is much more likely to get pregnant.")
				endif
				FPFP_Repeat_Fertility.Fertility_Action(akTarget, bool_Quest)
			endif
		endif
	else
		if bool_Quest == false
			Debug.Notification(akTarget.GetLeveledActorBase().GetName()+" is already under the effects of Fertility.")
		endif
	endif

EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction