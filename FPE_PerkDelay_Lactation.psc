Scriptname FPE_PerkDelay_Lactation extends activemagiceffect

Actor Property PlayerREF Auto Const
Potion property aid_Next Auto Const
Bool property bool_Potion = false Auto Const
SPELL[] Property SP_Lactation_FPFP Auto
perk Property WLD_Perk_Lactation Auto Const Mandatory
perk Property WLD_Perk_Lactation_Active Auto Const Mandatory
perk Property WLD_Perk_Lactation_Inactive Auto Const Mandatory
perk Property WLD_Perk_Lactation_LowMilk Auto Const Mandatory
perk Property WLD_Perk_Lactation_Critical Auto Const Mandatory
perk Property WLD_Perk_Lactation_Leaking Auto Const Mandatory
perk Property WLD_Perk_Lactation_Spend Auto Const Mandatory
GlobalVariable property FPFP_Global_Lactation_Leaking Auto Const Mandatory
int Time

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget = Self.GetActorUnderCrosshairs()
	
	If (akTarget.GetLeveledActorBase().GetSex() == 0)
		Return
	EndIf

	if akTarget.Hasperk(WLD_Perk_Lactation) || akTarget.Hasperk(WLD_Perk_Lactation_Active) || akTarget.Hasperk(WLD_Perk_Lactation_Inactive)
		If FPFP_Global_Lactation_Leaking.GetValue() == 0
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
		
		Utility.WaitGameTime(Time)
		
		
		if (akTarget.Hasperk(WLD_Perk_Lactation) || akTarget.Hasperk(WLD_Perk_Lactation_Active) || akTarget.Hasperk(WLD_Perk_Lactation_Inactive)) && !akTarget.Hasperk(WLD_Perk_Lactation_Spend)
			int spell_leak = Utility.RandomInt(1, SP_Lactation_FPFP.Length-1) 
			akTarget.Addspell(SP_Lactation_FPFP[spell_leak])
			;SP_Lactation_FPFP[spell_leak].Cast(akTarget, akTarget)
			if akTarget == PlayerREF
				Debug.notification(akTarget.GetLeveledActorBase().GetName() +" has started leaking Breast Milk")
			elseif akTarget.GetDistance(PlayerREF as ObjectReference) > 256
				Debug.Notification("Milk leaks from the breasts of "+akTarget.GetLeveledActorBase().GetName())			
			endif
			
			akTarget.addperk(WLD_Perk_Lactation_Leaking)

			Utility.WaitGameTime(1)
			akTarget.Removespell(SP_Lactation_FPFP[spell_leak])
			
			if akTarget.Hasperk(WLD_Perk_Lactation_Leaking)
				akTarget.removeperk(WLD_Perk_Lactation_Leaking)
			endif
		else
			Utility.WaitGameTime(Time)
		endif
		
		if bool_Potion == true && (akTarget.Hasperk(WLD_Perk_Lactation) || akTarget.Hasperk(WLD_Perk_Lactation_Active) || akTarget.Hasperk(WLD_Perk_Lactation_Inactive))
			akTarget.EquipItem(aid_Next, abSilent = True) 
		endif
	elseif akTarget.Hasperk(WLD_Perk_Lactation_LowMilk) || akTarget.Hasperk(WLD_Perk_Lactation_Critical)
		if akTarget == PlayerREF
			Debug.notification(akTarget.GetLeveledActorBase().GetName() +" cannot leak milk")
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
