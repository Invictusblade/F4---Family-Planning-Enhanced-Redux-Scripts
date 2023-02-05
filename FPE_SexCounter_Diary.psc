Scriptname FPE_SexCounter_Diary extends activemagiceffect

FPE_MCM_Debug Property FPFP_MCM_Debug Auto Const Mandatory
potion Property potion_self Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Sex_bool())
		FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Sex()
	endif
	
	if (FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Births_bool())
		FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Births()
	endif
	
	if (FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Misc_bool())
		FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Misc()
	endif
	
	FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Romance()
	
	akcaster.additem(potion_self, 1, true)	
EndEvent