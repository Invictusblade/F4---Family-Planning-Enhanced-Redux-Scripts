Scriptname FPE_PerkCravingRemover extends activemagiceffect

Perk Property Perk_Addiction Auto
string Property string_Enable auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget.HasPerk(Perk_Addiction)
		akTarget.RemovePerk(Perk_Addiction)
		
		debug.notification(string_Enable)
		
	endIf
	
EndEvent