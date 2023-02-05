Scriptname FPE_Repeat_Fertility extends Quest

actor akActor
Perk Property WLD_Perk_Infertile Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Forever Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Both Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Female Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Male Auto Const Mandatory
Perk Property WLD_Perk_Sterile Auto Const Mandatory

GlobalVariable property FPFP_Global_Fertile_Length Auto Const Mandatory
GlobalVariable property FPFP_Global_Infertile_Toggle Auto Const Mandatory
ActorValue Property FPFP_AV_ActiveFertility Auto Const
float ActorValue_ActiveFertility
int Property int_Multi = 24 Auto Const
Bool bool_Quest

Function Fertility_Action(actor akTarget, bool bool_inject)
	akActor = akTarget
	bool_Quest = bool_inject
	StartTimerGameTime(FPFP_Global_Fertile_Length.GetValue() * int_Multi)

EndFunction	

Event OnTimerGameTime(int aiTID)
	ActorValue_ActiveFertility = akActor.GetValue(FPFP_AV_ActiveFertility)	
	
	if FPFP_Global_Infertile_Toggle.GetValue() == 1	
		if akActor.HasPerk(WLD_Perk_Fertile_Both)
			akActor.removeperk(WLD_Perk_Fertile_Both)
			if bool_Quest == false
				Debug.Notification(akActor.GetLeveledActorBase().GetName()+" is experiencing some Infertility")
			endif
			akActor.addperk(WLD_Perk_Infertile)
			StartTimerGameTime(FPFP_Global_Fertile_Length.GetValue() * int_Multi)
		elseif akActor.HasPerk(WLD_Perk_Fertile_Female)	
			akActor.removeperk(WLD_Perk_Fertile_Female)
			if bool_Quest == false
				Debug.Notification(akActor.GetLeveledActorBase().GetName()+" is experiencing some Infertility")
			endif
			akActor.addperk(WLD_Perk_Infertile)
			StartTimerGameTime(FPFP_Global_Fertile_Length.GetValue() * int_Multi)
		elseif akActor.HasPerk(WLD_Perk_Fertile_Male)	
			akActor.removeperk(WLD_Perk_Fertile_Male)
			if bool_Quest == false
				Debug.Notification(akActor.GetLeveledActorBase().GetName()+" is experiencing some Infertility")
			endif
			akActor.addperk(WLD_Perk_Infertile)
			StartTimerGameTime(FPFP_Global_Fertile_Length.GetValue() * int_Multi)
		elseif akActor.HasPerk(WLD_Perk_Infertile)
			if bool_Quest == false
				Debug.Notification(akActor.GetLeveledActorBase().GetName()+"'a fertility level is back to normal")
			endif
			akActor.removeperk(WLD_Perk_Infertile)
			if akActor.GetValue(FPFP_AV_ActiveFertility) == 1
				akActor.SetValue(FPFP_AV_ActiveFertility, ActorValue_ActiveFertility - 1)
			endif	
		endif
	else
		if akActor.HasPerk(WLD_Perk_Fertile_Both) 
			akActor.removeperk(WLD_Perk_Fertile_Both)
		elseif akActor.HasPerk(WLD_Perk_Fertile_Female)
			akActor.removeperk(WLD_Perk_Fertile_Female)
		elseif akActor.HasPerk(WLD_Perk_Fertile_Male)
			akActor.removeperk(WLD_Perk_Fertile_Male)
		elseif akActor.HasPerk(WLD_Perk_Infertile)
			akActor.removeperk(WLD_Perk_Infertile)
		endif
	endif	
EndEvent
