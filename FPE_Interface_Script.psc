Scriptname FPE_Interface_Script extends Quest Conditional

Actor property PlayerRef Auto Const Mandatory

FormList FPFP_DataHoldersList
Quest FPE
Keyword FPFP_HasData

Bool Function LoadFPE()
	If Game.IsPluginInstalled("FP_FamilyPlanningEnhanced.esp")
		FPFP_DataHoldersList = Game.GetFormFromFile(0x0000D015 ,"FP_FamilyPlanningEnhanced.esp") as FormList
		FPE = Game.GetFormFromFile(0x00000F99 ,"FP_FamilyPlanningEnhanced.esp") as Quest
		FPFP_HasData = Game.GetFormFromFile(0x0000D010 ,"FP_FamilyPlanningEnhanced.esp") as Keyword
		Return True
	Else
		Return false
	EndIf
EndFunction

FPFP_BasePregData Function GetPregData(actor akActor)
	If (akActor == PlayerRef)
		Return (FPE as FPFP_Player_Script).GetPlayerPregnancyInfo()
	ElseIf !akActor.HasKeyword(FPFP_HasData)
		Return None
	Else
		FPFP_BasePregData tmpData
		Int i = FPFP_DataHoldersList.GetSize() 
		While (i)
			i -= 1
			tmpData = FPFP_DataHoldersList.GetAt(i) as FPFP_BasePregData
			If (tmpData.OurSelf == akActor)
				Return tmpData
			EndIf
		EndWhile
	EndIf
EndFunction

Function TryToMakePregnant(actor akFemale, actor akMale)
	FPFP_BasePregData tmpData = GetPregData(akFemale)
	If (tmpData)
		If (tmpData.DeterminePotentialMan(akMale) != None)
			tmpData.TrySpermFrom(akMale)
		EndIf
	EndIf
EndFunction

Function TryToAbort(actor akFemale)
	FPFP_BasePregData tmpData = GetPregData(akFemale)
	if (tmpData)
		tmpData.GiveBirth(false)
	EndIf
EndFunction