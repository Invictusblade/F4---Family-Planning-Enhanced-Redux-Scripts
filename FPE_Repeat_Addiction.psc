Scriptname FPE_Repeat_Addiction extends Quest

actor akActor
perk Property WLD_Perk_Addiction_1 Auto Const Mandatory
perk Property WLD_Perk_Addiction_2 Auto Const Mandatory
perk Property WLD_Perk_Addiction_3 Auto Const Mandatory
perk Property WLD_Perk_Addiction_4 Auto Const Mandatory

GlobalVariable property FPFP_Global_Addiction_Length Auto Const Mandatory
GlobalVariable property FPFP_Global_Addiction_Messages Auto Const Mandatory

string[] Property string_Addiction_2 auto
string[] Property string_Addiction_3 auto
string[] Property string_Addiction_4 auto
string[] Property string_Addiction_finished auto
int Property int_Multi = 24 Auto Const


Function Addiction_Action(actor akTarget)
	akActor = akTarget
	StartTimerGameTime(FPFP_Global_Addiction_Length.GetValue() * int_Multi)

EndFunction	

Event OnTimerGameTime(int aiTID)
	if akActor.HasPerk(WLD_Perk_Addiction_1)
		akActor.removeperk(WLD_Perk_Addiction_1)
		akActor.addperk(WLD_Perk_Addiction_2, False)
	
		if FPFP_Global_Addiction_Messages.GetValue() == 1
			Debug.Notification(akActor.GetLeveledActorBase().GetName()+": "+ string_Addiction_2[Utility.Randomint(0,string_Addiction_2.Length-1)])
		endif
		
		
		StartTimerGameTime(FPFP_Global_Addiction_Length.GetValue() * int_Multi)
	elseif akActor.HasPerk(WLD_Perk_Addiction_2)
		akActor.removeperk(WLD_Perk_Addiction_2)
		akActor.addperk(WLD_Perk_Addiction_3, False)
	
		if FPFP_Global_Addiction_Messages.GetValue() == 1
			Debug.Notification(akActor.GetLeveledActorBase().GetName()+": "+ string_Addiction_3[Utility.Randomint(0,string_Addiction_3.Length-1)])
		endif
		
		
		StartTimerGameTime(FPFP_Global_Addiction_Length.GetValue() * int_Multi)
	elseif akActor.HasPerk(WLD_Perk_Addiction_3)
		akActor.removeperk(WLD_Perk_Addiction_3)
		akActor.addperk(WLD_Perk_Addiction_4, False)
		
		if FPFP_Global_Addiction_Messages.GetValue() == 1
			Debug.Notification(akActor.GetLeveledActorBase().GetName()+": "+ string_Addiction_4[Utility.Randomint(0,string_Addiction_4.Length-1)])
		endif
		
		
		StartTimerGameTime(FPFP_Global_Addiction_Length.GetValue() * int_Multi)
	elseif akActor.HasPerk(WLD_Perk_Addiction_4)
		akActor.removeperk(WLD_Perk_Addiction_4)
		
		if FPFP_Global_Addiction_Messages.GetValue() == 1
			Debug.Notification(akActor.GetLeveledActorBase().GetName()+": "+ string_Addiction_finished[Utility.Randomint(0,string_Addiction_finished.Length-1)])
		endif
	endif
EndEvent
