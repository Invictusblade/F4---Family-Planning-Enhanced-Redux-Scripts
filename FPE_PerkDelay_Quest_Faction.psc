Scriptname FPE_PerkDelay_Quest_Faction extends Quest

perk Property Perk_Misc Auto Const Mandatory
GlobalVariable property Global_Length Auto Const Mandatory
int Property int_Multi = 1 Auto Const
Potion property aid_Next Auto Const
Bool property bool_Potion = false Auto Const
string Property string_intro auto
string Property string_outro auto
Actor akTarget
Faction Property Faction_WDF Auto Const mandatory

Function PerkDelay(Actor akActor)
	akActor.addperk(Perk_Misc)
	Utility.Wait(0.5)
	akActor.addToFaction(Faction_WDF)
	
	if string_intro != ""
		Debug.notification(akActor.GetLeveledActorBase().GetName() +" "+ string_intro)
	endif
	akTarget = akActor
	StartTimerGameTime(Global_Length.getvalue() * int_Multi) 
EndFunction


Event OnTimerGameTime(int aiTID)
	akTarget.removeperk(Perk_Misc)
	Utility.Wait(0.5)
	akTarget.removeFromFaction(Faction_WDF)
	
	if string_outro != ""
		Debug.notification(akTarget.GetLeveledActorBase().GetName() +" "+ string_outro)
	endif
	
	if bool_Potion == true
		akTarget.EquipItem(aid_Next, abSilent = True) 
	endif
EndEvent