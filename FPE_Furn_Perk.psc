ScriptName FPE_Furn_Perk extends ObjectReference

Idle Property IdleExtractionChair auto const mandatory
Idle Property FurnitureExitToStand auto const mandatory
Keyword Property AnimFaceArchetypeInPain auto const mandatory
Keyword Property AnimFaceArchetypeFatherDeath auto const mandatory
perk Property WLD_Perk_Perk Auto Const Mandatory
string Property string_Action Auto Const Mandatory
Bool property bool_Male = true Auto Const
Actor skActor
Bool bOccupied = false
Potion property aid_Leaking Auto Const
Bool property bool_Lactation = false Auto Const

Event OnActivate(ObjectReference akActionRef)
	int i
	bOccupied = true
	skActor = akActionRef as Actor
	
	If skActor.hasperk(WLD_Perk_Perk)
		Utility.Wait(5.0)
		skActor.PlayIdle(FurnitureExitToStand)
	else
		If skActor.GetLeveledActorBase().GetSex() == 0 && bool_Male == false
			Utility.Wait(5.0)
			skActor.PlayIdle(FurnitureExitToStand)
		else
			skActor.ChangeAnimFaceArchetype(AnimFaceArchetypeFatherDeath)
			
			Utility.Wait(8.0)
			
			skActor.PlayIdle(IdleExtractionChair)
			
			Utility.Wait(1.5)
			
			debug.notification("Injecting "+string_Action+" Drugs.")
			
			skActor.ChangeAnimFaceArchetype(AnimFaceArchetypeInPain)
			Utility.Wait(13.5)
			
			skActor.addperk(WLD_Perk_Perk)
			if bool_Lactation == true
				skActor.EquipItem(aid_Leaking, abSilent = True) 
			endif
			
			Utility.Wait(1.0)

			Utility.Wait(2.5)
			skActor.PlayIdle(FurnitureExitToStand)
		EndIf	
	endif
EndEvent


Event OnExitFurniture(ObjectReference akActionRef)
	
	bOccupied = false
	Utility.Wait(5.0)
	skActor.ChangeAnimFaceArchetype()
	skActor = none
	
EndEvent