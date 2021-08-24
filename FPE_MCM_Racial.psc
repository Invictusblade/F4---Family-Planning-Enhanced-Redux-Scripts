Scriptname FPE_MCM_Racial extends Quest

Actor Property PlayerRef Auto Const

Perk[] Property Perk_Race Auto
Perk Property WLD_Perk_Racial_Asian Auto
Perk Property WLD_Perk_Racial_Black Auto
Perk Property WLD_Perk_Racial_Hispanic Auto
Perk Property WLD_Perk_Racial_White Auto

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction

Function Remove_Perk_Race(Actor akActor)
	int i
	while (i <= Perk_Race.Length)
		akActor.removePerk(Perk_Race[i])
		i += 1
	endwhile
EndFunction

Function GiveNPCUnderCrosshairs_Racial_Asian()
	Actor akActor = GetActorUnderCrosshairs()
	Remove_Perk_Race(akActor)
	akActor.addperk(WLD_Perk_Racial_Asian)
EndFunction

Function GiveNPCUnderCrosshairs_Racial_Black()
	Actor akActor = GetActorUnderCrosshairs()
	Remove_Perk_Race(akActor)
	akActor.addperk(WLD_Perk_Racial_Black)
EndFunction

Function GiveNPCUnderCrosshairs_Racial_Hispanic()
	Actor akActor = GetActorUnderCrosshairs()
	Remove_Perk_Race(akActor)
	akActor.addperk(WLD_Perk_Racial_Hispanic)
EndFunction

Function GiveNPCUnderCrosshairs_Racial_White()
	Actor akActor = GetActorUnderCrosshairs()
	Remove_Perk_Race(akActor)
	akActor.addperk(WLD_Perk_Racial_White)
EndFunction

Function GiveNPCUnderCrosshairs_Racial_Reset()
	Actor akActor = GetActorUnderCrosshairs()
	Remove_Perk_Race(akActor)
EndFunction