Scriptname FPE_Addiction extends activemagiceffect

perk Property WLD_Perk_Addiction_1 Auto Const Mandatory
perk Property WLD_Perk_Addiction_2 Auto Const Mandatory
perk Property WLD_Perk_Addiction_3 Auto Const Mandatory
perk Property WLD_Perk_Addiction_4 Auto Const Mandatory

GlobalVariable property FPFP_Global_Addiction Auto Const Mandatory
GlobalVariable property FPFP_Global_Addiction_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Addiction_Messages Auto Const Mandatory

string[] Property string_Addiction_1 auto
string[] Property string_Addiction_1_repeat auto
string[] Property string_Addiction_repeat auto

FPE_Repeat_Addiction Property FPFP_Repeat_Addiction Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if FPFP_Global_Addiction.GetValue() >= 1
		if (!akTarget.HasPerk(WLD_Perk_Addiction_1) && !akTarget.HasPerk(WLD_Perk_Addiction_2) && !akTarget.HasPerk(WLD_Perk_Addiction_3) && !akTarget.HasPerk(WLD_Perk_Addiction_4))
			if Utility.RandomFloat(1,100) <= FPFP_Global_Addiction_Chance.GetValue()
				akTarget.addperk(WLD_Perk_Addiction_1, False)
			
				if FPFP_Global_Addiction_Messages.GetValue() == 1
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+": "+ string_Addiction_1[Utility.Randomint(0,string_Addiction_1.Length-1)])
				endif
				
				FPFP_Repeat_Addiction.Addiction_Action(akTarget)
			endif
		elseif akTarget.HasPerk(WLD_Perk_Addiction_1)
			if FPFP_Global_Addiction_Messages.GetValue() == 1
				Debug.Notification(akTarget.GetLeveledActorBase().GetName()+": "+ string_Addiction_1_repeat[Utility.Randomint(0,string_Addiction_1_repeat.Length-1)])
			endif	
			
		elseif akTarget.HasPerk(WLD_Perk_Addiction_2)
			akTarget.removeperk(WLD_Perk_Addiction_2)
				if FPFP_Global_Addiction_Messages.GetValue() == 1
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+": "+ string_Addiction_repeat[Utility.Randomint(0,string_Addiction_repeat.Length-1)])
				endif
			akTarget.addperk(WLD_Perk_Addiction_1, False)
		elseif akTarget.HasPerk(WLD_Perk_Addiction_3)
			akTarget.removeperk(WLD_Perk_Addiction_3)
				if FPFP_Global_Addiction_Messages.GetValue() == 1
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+": "+ string_Addiction_repeat[Utility.Randomint(0,string_Addiction_repeat.Length-1)])
				endif
			akTarget.addperk(WLD_Perk_Addiction_1, False)
		
		elseif akTarget.HasPerk(WLD_Perk_Addiction_4)
			akTarget.removeperk(WLD_Perk_Addiction_4)
				if FPFP_Global_Addiction_Messages.GetValue() == 1
					Debug.Notification(akTarget.GetLeveledActorBase().GetName()+": "+ string_Addiction_repeat[Utility.Randomint(0,string_Addiction_repeat.Length-1)])
				endif
			akTarget.addperk(WLD_Perk_Addiction_1, False)
		endif
	endif
EndEvent