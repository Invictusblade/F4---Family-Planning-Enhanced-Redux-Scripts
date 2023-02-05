Scriptname FPE_Cumflation_Aid extends activemagiceffect

GlobalVariable property FPFP_Global_Cumflation_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Toggle Auto Const Mandatory

Perk Property WLD_Perk_Cumflated Auto Const Mandatory
float Property Power_Modifier Auto Const Mandatory
Bool property bool_strings Auto Const

FPE_Cumflation_Quest Property FPFP_Cumflation_Quest Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)

	if FPFP_Global_Cumflation_Toggle.GetValue() == 1 && !akTarget.hasperk(WLD_Perk_Cumflated)
	
		if (Utility.RandomInt(1, 100) <= FPFP_Global_Cumflation_Chance.GetValue())
			FPFP_Cumflation_Quest.Cumflation(akTarget, Power_Modifier, bool_strings)
		EndIf
	EndIf
EndEvent
