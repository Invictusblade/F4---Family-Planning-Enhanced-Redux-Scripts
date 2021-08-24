Scriptname FPFP_Labour_Quest_Script Extends Quest

Event OnQuestInit()

	StartTimerGameTime(12, 0) ; Player has a timer set. Better find a doc fast!

EndEvent

Event OnQuestShutdown()

	CancelTimerGameTime(0) ; Player got to doc in time, don't hurt em.

EndEvent

Event OnTimerGameTime(int tID)

	If tID == 0
	
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