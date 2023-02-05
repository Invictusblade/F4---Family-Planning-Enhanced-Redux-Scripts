Scriptname FPE_Lactation_Leaking_Quest extends Quest

Actor Property PlayerREF Auto Const
ActorValue Property FPFP_AV_ActiveLactation_Leaking Auto Const
SPELL[] Property SP_Lactation_FPFP Auto
perk Property WLD_Perk_Lactation Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical Auto Const Mandatory
perk Property WLD_Perk_Lactation_Leaking Auto Const Mandatory
perk Property WLD_Perk_Lactation_Spend Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Leaking Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Leaking_Message Auto Const Mandatory
int Time
int spell_leak
Actor akActor
float ActorValue_ActiveLactation_Leaking

Perk Property WLD_perk_Milkmaid Auto
Potion Property Milk_Normal Auto Const


Function LeakingBreasts(Actor aktarget)
	ActorValue_ActiveLactation_Leaking = akActor.GetValue(FPFP_AV_ActiveLactation_Leaking)
	akActor = aktarget
	If (akActor.GetLeveledActorBase().GetSex() == 0)
		Return
	EndIf

	if akActor.Hasperk(WLD_Perk_Lactation) || akActor.Hasperk(WLD_Perk_Lactation_Active) || akActor.Hasperk(WLD_Perk_Lactation_Inactive)
		If FPFP_Global_Lactation_Leaking.GetValue() == 0
			spell_leak = Utility.RandomInt(0, SP_Lactation_FPFP.Length-1) 
			
			int choice = Utility.RandomInt(1, 6)
			if choice == 1
				Time = 11
			elseif choice == 2
				Time = 7
			elseif choice == 3
				Time = 5
			elseif choice == 4
				Time = 3
			elseif choice == 5
				Time = 9	
			elseif choice == 6
				Time = 1		
			endif
		elseIf FPFP_Global_Lactation_Leaking.GetValue() == 1
			Time = 1
		elseIf FPFP_Global_Lactation_Leaking.GetValue() == 2
			Time = 3
		elseIf FPFP_Global_Lactation_Leaking.GetValue() == 3
			Time = 5
		elseIf FPFP_Global_Lactation_Leaking.GetValue() == 4
			Time = 7
		elseIf FPFP_Global_Lactation_Leaking.GetValue() == 5
			Time = 9
		elseIf FPFP_Global_Lactation_Leaking.GetValue() == 6
			Time = 11
		endif
		
		
		
		If FPFP_Global_Lactation_Leaking_Message.GetValue() == 1
			if time == 1
				Debug.notification(akActor.GetLeveledActorBase().GetName() +" will be leaking in "+ Time +" hour")
			else
				Debug.notification(akActor.GetLeveledActorBase().GetName() +" will be leaking in "+ Time +" hours")
			endif	
		endif
		
		StartTimerGameTime(Time)
		
		
	elseif akActor.Hasperk(WLD_Perk_Lactation_LowMilk) || akActor.Hasperk(WLD_Perk_Lactation_Critical)
		if akActor == PlayerREF
			Debug.notification(akActor.GetLeveledActorBase().GetName() +" cannot leak milk")
		endif
		
		if akActor.GetValue(FPFP_AV_ActiveLactation_Leaking) == 1
			akActor.SetValue(FPFP_AV_ActiveLactation_Leaking, ActorValue_ActiveLactation_Leaking - 1)
		endif
	else
		if akActor.GetValue(FPFP_AV_ActiveLactation_Leaking) == 1
			akActor.SetValue(FPFP_AV_ActiveLactation_Leaking, ActorValue_ActiveLactation_Leaking - 1)
		endif	
	endif
EndFunction

Event OnTimerGameTime(int aiTID)
	If akActor.Hasperk(WLD_Perk_Lactation_Leaking)
		akActor.Removespell(SP_Lactation_FPFP[spell_leak])
			
		if akActor.Hasperk(WLD_perk_Milkmaid)
			akActor.additem(Milk_Normal, 1, true)
		endif	
			
		if akActor.Hasperk(WLD_Perk_Lactation_Leaking)
			akActor.removeperk(WLD_Perk_Lactation_Leaking)
		endif
	
		LeakingBreasts(akActor)
	elseif (akActor.Hasperk(WLD_Perk_Lactation) || akActor.Hasperk(WLD_Perk_Lactation_Active) || akActor.Hasperk(WLD_Perk_Lactation_Inactive)) && !akActor.Hasperk(WLD_Perk_Lactation_Spend)
			akActor.Addspell(SP_Lactation_FPFP[spell_leak])
			
			if akActor == PlayerREF && FPFP_Global_Lactation_Leaking_Message.GetValue() == 1
				Debug.notification(akActor.GetLeveledActorBase().GetName() +" has started leaking Breast Milk")
			elseif akActor.GetDistance(PlayerREF as ObjectReference) > 256 && FPFP_Global_Lactation_Leaking_Message.GetValue() == 1
				Debug.Notification("Milk leaks from the breasts of "+akActor.GetLeveledActorBase().GetName())			
			endif
			
			akActor.addperk(WLD_Perk_Lactation_Leaking)

			StartTimerGameTime(1)
	else
		if akActor.GetValue(FPFP_AV_ActiveLactation_Leaking) == 1
			akActor.SetValue(FPFP_AV_ActiveLactation_Leaking, ActorValue_ActiveLactation_Leaking - 1)
		endif
	endif	
EndEvent