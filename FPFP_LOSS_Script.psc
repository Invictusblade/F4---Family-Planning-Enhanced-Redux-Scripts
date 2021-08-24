Scriptname FPFP_LOSS_Script extends Quest

Event OnQuestInit()

	StartTimerGameTime(6, 0) ; Player has a timer set. Better find a doc fast!

EndEvent

Event OnQuestShutdown()

	CancelTimerGameTime(0) ; Player got to doc in time, don't hurt em.

EndEvent

Event OnTimerGameTime(int tID)

	If tID == 0 && GetStage() == 0
		
		PlayerRef.DamageValue(Health, PlayerRef.GetBaseValue(Health)/20)

		FPFP_DamageVisuals.Cast(PlayerRef)
		
		Debug.Notification("I still need to find a doctor!")

		StartTimerGameTime(6, 0)
			
	EndIf

EndEvent

ActorValue Property Health Auto Const

Spell Property FPFP_DamageVisuals Auto Const

Actor Property PlayerRef Auto Const

