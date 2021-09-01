Scriptname FPFP_BabyScript extends ObjectReference

FPFP_Player_Script FPE ; holds the main quest for getting FPE global variables without needing FPE as an esp master
FPFP_BabyHandlerScript BabyHandler ; holds the handler for interactions and resetting

Group ChildProperties
ActorBase[] property Children_F auto const Mandatory; Stores the female child actor bases
ActorBase[] property Children_M auto const Mandatory; Stores the male child actor bases

{Stores the male and female child actor bases that the baby will grow into.
This can also be fully grown adult actors, if you wish to skip the growing child stage}

Float property GrowthTimeMultiplier = 1.0 Auto Const
{This value will be multiplied into the baby's growth time, so a lower value means faster growth. 
This value is passed onto the child actor the baby spawns.}

Bool Property IsWorkshopActor = False Auto Const
{This value determines if the child that the baby will grow up to be can be in a workshop.}

Bool Property Killable = True Auto Const
{This value determines if the baby can be killed from an attack from the player character.
You'd have to be a real monster to kill a baby.}

Sound Property BirthSound Auto Const
{This object determines what the baby noise will be when born. 
If set to nothing, then default noises are played.}
EndGroup

Group DoNotEditInCreationKit
Float property BirthDate Auto ; Stores bday. When child actor is created, use the actorvalue to have the child inherit the birthday
{This value is only used via scripts. Do not edit this value.}
ObjectReference Property CribOR Auto; Stores the crib ref
{This value is only used via scripts. Do not edit this value.}
ObjectReference Property ContainerOR Auto; Stores the container we're in. Mainly for persistence so that the baby can properly grow in the inventory
{This value is only used via scripts. Do not edit this value.}
Bool Property IsGrowingUp Auto
{This value is only used via scripts. Do not edit this value.}
EndGroup

Actor Target
Form TheBaby


GlobalVariable property FPFP_Global_Gender_Select Auto Const Mandatory
GlobalVariable property FPFP_Global_Rename_Baby Auto Const Mandatory
String property Babies_Original_Name Auto Const Mandatory

Event OnEquipped(Actor akActor)
	Target = akActor
	TheBaby = Self
EndEvent



Event OnInit() 
	Container Bad_Container
	If Game.IsPluginInstalled("ESPExplorerFO4.esp")
		Bad_Container = Game.GetFormFromFile(0x001742, "ESPExplorerFO4.esp") as Container
	Else
		Bad_Container = None
	EndIf
	
	If Bad_Container && Self.GetContainer().GetBaseObject() == Bad_Container
		Trace("On init has failed because of ESPExplorerFO4")
	Else	
		Trace("On init has started")
		If IsBoundGameObjectAvailable(); Make sure we are a loaded object so that the papyrus logs don't throw us errors
			Trace("On init has determined we aren't NONE")
			FPE = FPFP_Player_Script.GetAPI()
			BabyHandler = FPFP_Player_Script.GetBabyAPI()
			
			If !FPE || !BabyHandler

				Debug.MessageBox("WARNING: FPE API(s) HAVE NOT BEEN PROPERLY SET. QUIT THE GAME AND GO TO THE FAMILY PLANNING ENHANCED THREAD TO REPORT THIS ISSUE WITH YOUR PAPYRUS LOGS READY.")

			EndIf
			
			RegisterForHitEvent(Self)
			RegisterForCustomEvent(BabyHandler, "FPEBabyUpdateGameTimer")
			RegisterForCustomEvent(FPE, "DoUpdate")
			RegisterForCustomEvent(FPE, "DoCleaning")
			RegisterForCustomEvent(FPE, "DoReset")
			
			BirthDate = Utility.GetCurrentGameTime()

			StartTimerGameTime(GetBabyToChildTimeLeft()) ; Start a timer
			Trace("On init has finished internal setup of timers and quests")
		Else
			Trace("ERROR Okay bethesda why was a script run when we don't even have an object bound to us!?")
		EndIf
		Trace("On init has finished")
	Endif
EndEvent


Float Function GetBabyToChildTimeLeft()

	Return ((FPE.FPFP_Global_BabyToChild.GetValue() * GetGrowthMultiplier() * FPE.FPFP_Global_Day.GetValue()) - (Utility.GetCurrentGameTime() - BirthDate)) * 24 

EndFunction

Event FPFP_BabyHandlerScript.FPEBabyUpdateGameTimer(FPFP_BabyHandlerScript akSender, Var[] akArgs)

	CancelTimerGameTime()
	
	float timeLeftToGrow = GetBabyToChildTimeLeft()
	
	If timeLeftToGrow > 0.033
		StartTimerGameTime(timeLeftToGrow)
	Else
		GrowIntoChild()
	EndIf

EndEvent

Sound Function GetBabyBirthSound()
	
	If BirthSound
		Return BirthSound
	EndIf
	
	Return BabyHandler.VOCShaun
	
EndFunction

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer) ; Base functionality, best not to change it
	Container Bad_Container
	If Game.IsPluginInstalled("ESPExplorerFO4.esp")
		Bad_Container = Game.GetFormFromFile(0x001742, "ESPExplorerFO4.esp") as Container
	Else
		Bad_Container = None
	EndIf
	
	If Bad_Container && akNewContainer.GetBaseObject() == Bad_Container
		Trace("OnContainerChanged has failed because of ESPExplorerFO4")
	Else
		Trace("We've been moved to " + akNewContainer + " from " + akOldContainer)
		If IsGrowingUp
			Trace("It was done while growing up")
			Return
		EndIf
		
		ContainerOR = akNewContainer ; Whatever the container is, we shove it into the ContainerOR. ; ovh do a no container check that would initiate looking for a crib.
		
		If ContainerOR ; put into a container
			If CribOR
				BabyHandler.SetCribOwner(CribOR, False)
				CribOR = NONE
			EndIf
			If ContainerOR == FPE.PlayerREF
				BabyHandler.ShowBabyInfo(self)
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
					debug.messagebox("This baby will now be brought up by the people at "+CurLo.GetName())
				EndIf
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

Event OnTimerGameTime(int aiTID)

	GrowIntoChild()

EndEvent

Float Function GetGrowthMultiplier()

	If GrowthTimeMultiplier > 0 ; if the float property was valid
		Return GrowthTimeMultiplier ; return it
	Else
		Return 1.0 ; return a normal number if it was not normal
	EndIf

EndFunction

Function GrowIntoChild()
	If !IsBoundGameObjectAvailable()
		Trace("WARNING No bound object on growth call, shut er down")
		StartDelete()
		Return
	EndIf
	
	If IsGrowingUp
		Trace("WARNING We were already grown up! shut er down")
		StartDelete()
		Return
	EndIf
	
		If IsDeleted()
		Trace("WARNING We are deleted! shut er down")
		StartDelete()
		Return
	EndIf
			   
	UnregisterForAllEvents()
	
	IsGrowingUp = True
	
	Trace("Started to grow")
	
	ObjectReference theChild
	
	If ContainerOR
		Drop()
		Trace("This is what we are now after we dropped")
	EndIf
	
	Disable()
	
	theChild = PlaceAtMe(GetChildBase(), 1, False, False, False) ; were're out in the world
	
	If FPFP_Global_Rename_Baby.GetValue() == 1.0	
		if Babies_Original_Name != RenameAnything.GetRefName(self)
			RenameAnything.SetRefName(theChild, RenameAnything.GetRefName(self))
			theChild.AddKeyword(Game.GetFormFromFile(0x0001EA88, "FP_FamilyPlanningEnhanced.esp") as Keyword)
		endif	
	endif
	
	Trace("We placed "+theChild)
	
	theChild.SetValue(BabyHandler.FPFP_AV_BirthDate, BirthDate)
	
	theChild.SetValue(BabyHandler.FPFP_AV_GrowthTimeMult, GetGrowthMultiplier())
	
	If HasKeyword(BabyHandler.FPFP_KW_IsPlayersChild)
		theChild.AddKeyword(BabyHandler.FPFP_KW_IsPlayersChild)
	EndIf
	
	; for SKK50's Fallout 4-76
	If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
		theChild.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
	EndIf 
	
	Location currentLocation = theChild.GetCurrentLocation()
	
	Trace("grown in location "+ currentLocation)
	
	If FPE.FPFP_Global_BGNotif.GetValue() == 1.0 && currentLocation
	
		string locName = currentLocation.GetName()

		If locName == "Commonwealth"
		
			Debug.Notification("A baby has grown into an child in the Commonwealth")
		
		Else
	
			Debug.Notification("A baby has grown into an child at "+ locName)
			
		EndIf
	
	EndIf
	
	DetermineWorkshop(currentLocation, theChild)
	
	If theChild as FPFP_GrowingChildScript ; init the child now that everything should be set up
	
		(theChild as FPFP_GrowingChildScript).Initialize()
	
	EndIf
	
	StartDelete()
	
EndFunction

ActorBase Function GetChildBase()

	int random_LList = Utility.RandomInt(1, 100)
	
	if (random_LList <= FPFP_Global_Gender_Select.GetValue())
		Return Children_F[Utility.RandomInt(0,Children_F.Length-1)]
	else
		Return Children_M[Utility.RandomInt(0,Children_M.Length-1)]
	EndIf

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
	
	If IsGrowingUp
		Trace("WARNING We were already grown up on cleaning event handle! shut er down")
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
