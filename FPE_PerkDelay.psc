Scriptname FPE_PerkDelay extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
Bool property bool_NPCs = false Auto Const
FPE_PerkDelay_Quest Property FPFP_PerkDelay_Quest Auto Const Mandatory


Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	if bool_NPCs == true
		akTarget = GetActorUnderCrosshairs()
	endif
	
	FPFP_PerkDelay_Quest.PerkDelay(akTarget)
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction