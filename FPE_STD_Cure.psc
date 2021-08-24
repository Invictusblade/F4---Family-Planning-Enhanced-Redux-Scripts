Scriptname FPE_STD_Cure extends activemagiceffect

Actor Property PlayerRef Auto Const
Perk[] Property WLD_STD Auto

Event OnEffectStart(Actor akActor, Actor akCaster)
	Actor akActor_Target = GetActorUnderCrosshairs()
	int i
	while (i <= WLD_STD.Length)
		If (akActor_Target.HasPerk(WLD_STD[i]))
			akActor_Target.RemovePerk(WLD_STD[i])
			Debug.notification(akActor_Target.GetLeveledActorBase().GetName() +" has been cured of "+ WLD_STD[i].GetName())
			i = WLD_STD.Length
		endIf
		i += 1
	endwhile
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerRef
	EndIf
	Return ScannedActor
EndFunction