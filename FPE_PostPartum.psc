Scriptname FPE_PostPartum extends Quest

Actor Property PlayerREF Auto Const Mandatory
perk Property Perk_PostPartum Auto Const Mandatory
GlobalVariable property FPFP_Global_PostPartum_Length Auto Const Mandatory
GlobalVariable property FPFP_Global_Day auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int i
	akTarget.addperk(Perk_PostPartum)
	
	while i <= FPFP_Global_PostPartum_Length.getvalue()
		Utility.WaitGameTime(GetUpdateTime())
	
	
		i += 1
	endwhile
	
	akTarget.removeperk(Perk_PostPartum)
	
EndEvent

Float Function GetUpdateTime()
	float time_PostPartum = 24.0 * FPFP_Global_Day.getvalue()
	
	If time_PostPartum > 0
		return time_PostPartum
	Else
		return 24.0
	EndIf
EndFunction
