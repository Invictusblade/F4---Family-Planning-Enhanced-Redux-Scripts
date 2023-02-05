ScriptName FPE_Furn_Birth extends ObjectReference

Idle Property IdleExtractionChair auto const mandatory
Idle Property FurnitureExitToStand auto const mandatory
Keyword Property AnimFaceArchetypeInPain auto const mandatory
Keyword Property AnimFaceArchetypeFatherDeath auto const mandatory
Actor skActor
Bool bOccupied = false
Faction Property FPFP_Preggo Auto Const Mandatory
Bool property bool_Chair = true Auto Const
ActorValue Property FPFP_AV_PregnancyStage Auto Const
Perk Property WLD_Perk_PostPartum Auto

FPFP_Player_Script FPE

Bool Function LoadFPE()
	If Game.IsPluginInstalled("FP_FamilyPlanningEnhanced.esp")
		FPE = FPFP_Player_Script.GetAPI()
		Return True
	Else
		Return false
	EndIf
EndFunction

Function Setup()
	If LoadFPE() == true
		Debug.Trace("FPE Birthing Furniture: Family Planning Enhanced is loaded")
	Else
		Debug.Trace("FPE Birthing Furniture: Family Planning Enhanced not found")
	EndIf
EndFunction

Event OnInit()
	Setup()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	int i
	bOccupied = true
	skActor = akActionRef as Actor
	
	if skActor.HasPerk(WLD_Perk_PostPartum)
		skActor.ChangeAnimFaceArchetype(AnimFaceArchetypeFatherDeath)

		;Debug.Notification("This epidural better work!")
		Utility.Wait(8.0)
		
		if bool_Chair == true
			skActor.PlayIdle(IdleExtractionChair)
		endIf
		
		Utility.Wait(1.5)
		
		
		skActor.ChangeAnimFaceArchetype(AnimFaceArchetypeInPain)
		
		Utility.Wait(13.5)
		;Debug.Notification("my Baby is crowning!")
		
		Instant_PostPartum(skActor)
		
		Utility.Wait(1.0)

		Utility.Wait(2.5)
		skActor.PlayIdle(FurnitureExitToStand)
	elseIf skActor.IsInFaction(FPFP_Preggo)
		skActor.ChangeAnimFaceArchetype(AnimFaceArchetypeFatherDeath)

		;Debug.Notification("This epidural better work!")
		Utility.Wait(8.0)
		
		if bool_Chair == true
			skActor.PlayIdle(IdleExtractionChair)
		endIf
		
		Utility.Wait(1.5)
		
		
		skActor.ChangeAnimFaceArchetype(AnimFaceArchetypeInPain)
		
		Utility.Wait(13.5)
		;Debug.Notification("my Baby is crowning!")
		
		if skActor.GetValue(FPFP_AV_PregnancyStage) == 1
			Instant_Birth(skActor, False)
		elseif skActor.GetValue(FPFP_AV_PregnancyStage) == 2
			Debug.Notification("Cannot give birth or abort Baby at this time")
		elseif skActor.GetValue(FPFP_AV_PregnancyStage) == 3
			Instant_Birth(skActor, True)
		elseif skActor.GetValue(FPFP_AV_PregnancyStage) == 4
			Instant_Birth(skActor, True)
		EndIf
		
		Utility.Wait(1.0)

		Utility.Wait(2.5)
		skActor.PlayIdle(FurnitureExitToStand)
	else
		Utility.Wait(5.0)
		skActor.PlayIdle(FurnitureExitToStand)	
	endif
EndEvent

Function Instant_Birth(actor akFemale, bool akBirth = True)
	bool Worked = false
	if akFemale.IsInFaction(FPFP_Preggo)
		FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
			Worked = true
		tmpData.GiveBirth(akBirth)
	endIf
EndFunction

Function Instant_PostPartum(actor akFemale)
	bool Worked = false
	if akFemale.IsInFaction(FPFP_Preggo)
		FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
			Worked = true
		tmpData.FinishPostPartum()
	endIf
EndFunction

Event OnExitFurniture(ObjectReference akActionRef)
	
	bOccupied = false
	Utility.Wait(5.0)
	skActor.ChangeAnimFaceArchetype()
	skActor = none
	
EndEvent