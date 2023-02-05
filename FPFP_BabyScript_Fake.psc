Scriptname FPFP_BabyScript_Fake extends ObjectReference

FPFP_Player_Script FPE ; holds the main quest for getting FPE global variables without needing FPE as an esp master
FPFP_BabyHandlerScript BabyHandler ; holds the handler for interactions and resetting

String Property Custom_Message Auto Const

Bool Property IsWorkshopActor = False Auto Const
{This value determines if the child that the baby will grow up to be can be in a workshop.}

Bool Property Killable = True Auto Const
{This value determines if the baby can be killed from an attack from the player character.
You'd have to be a real monster to kill a baby.}


Group DoNotEditInCreationKit
Float property BirthDate Auto ; Stores bday. When child actor is created, use the actorvalue to have the child inherit the birthday
{This value is only used via scripts. Do not edit this value.}
ObjectReference Property CribOR Auto; Stores the crib ref
{This value is only used via scripts. Do not edit this value.}
ObjectReference Property ContainerOR Auto; Stores the container we're in. Mainly for persistence so that the baby can properly grow in the inventory
{This value is only used via scripts. Do not edit this value.}
EndGroup

Actor Target
Form TheBaby



Event OnInit() 
	If IsBoundGameObjectAvailable(); Make sure we are a loaded object so that the papyrus logs don't throw us errors
		
		FPE = FPFP_Player_Script.GetAPI()
		BabyHandler = FPFP_Player_Script.GetBabyAPI()
		
			If !FPE || !BabyHandler
				Debug.MessageBox("WARNING: FPE API(s) HAVE NOT BEEN PROPERLY SET. QUIT THE GAME AND GO TO THE FAMILY PLANNING ENHANCED THREAD TO REPORT THIS ISSUE WITH YOUR PAPYRUS LOGS READY.")
			EndIf
			
		RegisterForHitEvent(Self)
		RegisterForCustomEvent(FPE, "DoUpdate")
		RegisterForCustomEvent(FPE, "DoCleaning")
		RegisterForCustomEvent(FPE, "DoReset")
		
		BirthDate = Utility.GetCurrentGameTime()
		
		Trace("On init has finished internal setup of timers and quests")
	Else
		Trace("ERROR Okay bethesda why was a script run when we don't even have an object bound to us!?")
	EndIf

EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer) ; Base functionality, best not to change it
		
	ContainerOR = akNewContainer ; Whatever the container is, we shove it into the ContainerOR. ; ovh do a no container check that would initiate looking for a crib.
	
	If ContainerOR ; put into a container
	
		If CribOR
			BabyHandler.SetCribOwner(CribOR, False)
			CribOR = NONE
		EndIf
		
	ElseIf akOldContainer && akOldContainer As Actor; we were taken out of a valid container
		
		Location CurLo = akOldContainer.GetCurrentLocation()
		
		PlaceSelfAt(akOldContainer)
		
		If CurLo && CurLo.HasKeyword(BabyHandler.KeySettle) 
			CribOR = BabyHandler.GetCrib()
			If CribOR
				BabyHandler.SetCribOwner(CribOR)
				PlaceSelfAt(CribOR, 52.0)
			EndIf
			If akOldContainer == FPE.PlayerREF
				String Message_DroppedBaby
				Message_DroppedBaby = "This baby will now be brought up by the people at "+CurLo.GetName()+ ".\n"
				Message_DroppedBaby += Custom_Message
				Message_DroppedBaby += "\n and a reminder that this baby will not grow up."
				
				debug.messagebox(Message_DroppedBaby)
				
			EndIf
		EndIf
		
	EndIf
	
EndEvent

Function PlaceSelfAt(ObjectReference akDestination, float afHeight = 4.0); Dear christ get a good math education folks, it's important in the programming field.

	; All these values found via experimentation with the creation kit. Painstankingly found. Very painful.
	;/ 
	For angles 
	At destAZ = 0   || X = -90 | y = -90 | z = 0
	At destAZ = 45  || X = -90 | y = -45 | z = 0
	At destAZ = 90  || X = -90 | y = 0   | z = 0
	At destAZ = 135 || X = -90 | y = 45  | z = 0
	At destAZ = 180 || X = 90  | y = 90  | z = 180
	At destAZ = 225 || X = 90  | y = 45  | z = 180
	At destAZ = 270 || X = 90  | y = 0   | z = 180
	At destAZ = 305 || X = 90  | y = -45 | z = 180
	/;
	
	float destAZ = UnsignAngle(akDestination.GetAngleZ()) 
	
	float xAngle
	float yAngle
	float zAngle
	
	If destAZ < 180 ; If we're within 0 to less than 180
	
		xAngle = -90
		yAngle = -90 + destAZ 
		zAngle = 0
	
	Else ; Otherwise, we're either 180 to less than 360
		
		xAngle = 90
		yAngle = 270 - destAZ
		zAngle = 180
	
	EndIf
	
	;/ 
	For x and y position 
	At destAZ = 0   || X = -16 | y = 0
	At destAZ = 90  || X = 0   | y = 16 
	At destAZ = 180 || X = 16  | y = 0  
	At destAZ = 270 || X = 0   | y = -16  
	/;
	
	float xChange = akDestination.GetPositionX() + ( -16 * Math.Cos(destAZ) )
	float yChange = akDestination.GetPositionY() + ( 16 * Math.Sin(destAZ) )
	float zChange = akDestination.GetPositionZ() + afHeight
	
	setPosition(xChange, yChange, zChange)
	setAngle(xAngle, yAngle, zAngle)

EndFunction

Float Function UnsignAngle(float afAngle); Take the angle and put it somewhere between 0 and 360 (Inclusive and exclusive respectively)

	If afAngle <= -360 || afAngle >= 360 ; If we're, oddly enough, >= 360 or we're <= -360, we take our number and put it within the range of > -360 and < 360
	
		int deltaModulus = (afAngle / 360) as int

		afAngle = afAngle - ( 360 * deltaModulus ) ; remove all the extra amount of angle
		
	EndIf
	
	If afAngle < 0 ;Then we check if the angle is negative and make it the positive value
	
		afAngle += 360
	
	EndIf
	
	Return afAngle
EndFunction

Function DetermineWorkshop(Location akLocation, ObjectReference akChild)

	If IsWorkshopActor
	
		If akLocation && akLocation.HasKeyword(BabyHandler.KeySettle)
		
			WorkshopScript theWorkshop = BabyHandler.WorkshopParent.GetWorkshopFromLocation(akLocation)
		
			Debug.Trace("Family Planning Enhanced : A Baby has grown in location with workshop "+ theWorkshop)
		
			BabyHandler.WorkshopParent.AddActorToWorkshopPUBLIC(akChild as WorkshopNPCScript, theWorkshop)
		
		EndIf
	
	EndIf
	
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

	If Killable && FPE.PlayerRef == (akAggressor as Actor)
		
		EndBaby()
	
	Else
	
		RegisterForHitEvent(Self)
	
	EndIf

EndEvent

Function EndBaby()
	
	PlayImpactEffect(BabyHandler.BloodSprayImpactSetRed, "Skin_Baby_BN_C_Spine"); Place blood decal to show that you're a monster you fuck
	
	BabyHandler.FXExplosionLimb.Play(Self)
	
	Disable()
	
	StartDelete()
	
	Debug.Trace("Family Planning Enhanced: Baby "+ Self +" has been killed! You fucking monster.")

EndFunction

Function StartDelete()

	BabyHandler.SetCribOwner(CribOR, False) ; Remove crib ownership

	CribOR = NONE
	
	ContainerOR = NONE
	
	UnregisterForAllEvents()
	
	CancelTimerGameTime()				  
	If IsBoundGameObjectAvailable()
		Delete()
	EndIf

EndFunction

Event FPFP_Player_Script.DoUpdate(FPFP_Player_Script akSender, Var[] akArgs)

	;update code
	Trace("Doing update")
	
EndEvent

Event FPFP_Player_Script.DoCleaning(FPFP_Player_Script akSender, Var[] akArgs)
	
	Trace("Doing Cleaning")
	
	If !IsBoundGameObjectAvailable()
		Trace("WARNING No bound object on cleaning event handle, shut er down")
		StartDelete()
	EndIf
	
EndEvent

Event FPFP_Player_Script.DoReset(FPFP_Player_Script akSender, Var[] akArgs)
	
	Trace("Doing reset")
	;delete self
	StartDelete()
	
EndEvent

Function Trace(string theString)
	Debug.Trace("FPE BabyScript "+Self+" : " +theString)
EndFunction
