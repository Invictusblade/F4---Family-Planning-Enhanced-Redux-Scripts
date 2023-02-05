Scriptname FPFP_Labour_Quest_Script Extends Quest

Bool bBirthedAlready = false
Faction Property FPFP_Preggo Auto Const Mandatory

Event OnQuestInit()

	StartTimerGameTime(12, 0) ; Player has a timer set. Better find a doc fast!

EndEvent

Event OnQuestShutdown()

	CancelTimerGameTime(0) ; Player got to doc in time, don't hurt em.
	
	if bBirthedAlready == false
		FPFP_Player_Script.GetAPI().GetPlayerPregnancyInfo().StartPostPartum()
	endif
EndEvent

Event OnTimerGameTime(int tID)

	If tID == 0 && PlayerRef.IsInFaction(FPFP_Preggo)
	
		SetStage(5) ; Make sure that doc dialogue can't happen
	
		PlayerRef.DamageValue(Health, PlayerRef.GetBaseValue(Health)/6)

		FPFP_DamageVisuals.Cast(PlayerRef)
		
		Debug.Notification("Finding a doctor can wait. The baby is coming now!")
		
		Utility.Wait(1.5)
		
		PlayerRef.DamageValue(Health, PlayerRef.GetBaseValue(Health)/6)

		FPFP_DamageVisuals.Cast(PlayerRef)

		bool success = FPFP_Player_Script.GetAPI().GetPlayerPregnancyInfo().GiveBirth()
		
		If success
		
			SetStage(15)
		
		Else
		
			SetStage(10)
		
		EndIf
	else
		bBirthedAlready = true
		SetStage(20)
	EndIf

EndEvent

Function DetermineSceneAfterBirth(bool abSuccessfulBirth)

	If abSuccessfulBirth
		SetStage(2)
	Else
		SetStage(3)
	EndIf

EndFunction

ActorValue Property Health Auto Const

Spell Property FPFP_DamageVisuals Auto Const

Actor Property PlayerRef Auto Const