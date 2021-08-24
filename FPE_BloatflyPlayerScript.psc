Scriptname FPE_BloatflyPlayerScript extends ReferenceAlias

Projectile Property Enemy_Ranged Auto Const
form Property Enemy_Melee Auto Const
Quest Property FPE_Bloatfly Auto
GlobalVariable property INVB_Global_Creature_Attack_Impregnation_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_Creature_Attack_Impregnation_Allow Auto Const Mandatory
ActorBase Property ac_FatherCum Auto
bool Property bool_Melee Auto
bool Property bool_Range Auto
string Property String_Creature auto
 

FPE_Interface_Script FPE_Interface

Function Setup()
	RegisterForHitEvent(GetReference())
	FPE_Interface = FPE_Bloatfly as FPE_Interface_Script
	If FPE_Interface.LoadFPE() == true
		Debug.Trace("FPE Creature Attack Impregnation: "+ String_Creature)
	Else
		Debug.Trace("FPE Creature Attack Impregnation: Family Planning Enhanced not found")
	EndIf
EndFunction

Event OnAliasInit()
	Debug.Trace("FPE Creature Attack Impregnation: FPE_BloatflyPlayerScript OnAliasInit")
	Setup()
EndEvent

Event OnPlayerLoadGame()
	Debug.Trace("FPE Creature Attack Impregnation: FPE_BloatflyPlayerScript OnPlayerLoadGame")
	Setup()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, \
	bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

	Actor akActor = akTarget as Actor
	if akActor.GetLeveledActorBase().GetSex() == 1 || INVB_Global_Creature_Attack_Impregnation_Allow.GetValue() == 1
		int random_LList_infect = Utility.RandomInt(1, 100)
		if (random_LList_infect <= INVB_Global_Creature_Attack_Impregnation_Chance.GetValue())
		
			; Check if this is the right projectile
			If akProjectile == Enemy_Ranged && akAggressor != None && bool_Range == true
			;	Debug.Trace ("FPE Creature Attack Impregnation: FPE_BloatflyPlayerScript OnHit - Trying to impregnate our actor")
				Actor tempActor = akAggressor.PlaceAtMe(ac_FatherCum, abInitiallyDisabled = true) as Actor
				FPE_Interface.TryToMakePregnant(akTarget as Actor, tempActor)
				Utility.Wait(1.0)
				tempActor.delete()
			elseIf akSource == Enemy_Melee && akAggressor != None && bool_Melee == true
			;	Debug.Trace ("FPE Creature Attack Impregnation: FPE_BloatflyPlayerScript OnHit - Trying to impregnate our actor")
				Actor tempActor = akAggressor.PlaceAtMe(ac_FatherCum, abInitiallyDisabled = true) as Actor
				FPE_Interface.TryToMakePregnant(akTarget as Actor, tempActor)
				Utility.Wait(1.0)
				tempActor.delete()
			Endif
			RegisterForHitEvent(akTarget)
		Endif
	Endif
	

EndEvent