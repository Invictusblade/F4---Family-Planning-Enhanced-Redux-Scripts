ScriptName FPFP_GrowingChildScript Extends Actor

Group ChildProperties
ActorBase[] property AdultAB auto const mandatory
{The associated Adults for this child NPC}

Float property GrowthTimeMultiplier = 1.0 Auto Const
{This value will be multiplied into the child's growth time, so a lower value means faster growth.
If this child actor has a BabyScript Form that creates it, this value will be ignored, and this child will inherit the BabyScript's GrowthTimeMultiplier}

Bool Property IsWorkshopActor = False Auto Const
{This value determines if the adult that the child will grow up to be can be in a workshop.}

Float Property AddedSize = 0.125 Auto Const
{This value is the amount of size growth the child will receive during their growing process. 
Default is 0.125. That means that the max size the child will be 0.125 more than the initial size.
If you want to set the initial size of the child actor, use the "height" options in the creation kit.}

Sound Property BirthSound Auto Const
{This object determines what the baby noise will be when born. 
If set to nothing, then default noises are played.}
EndGroup

FPFP_Player_Script FPE ; holds the main quest for getting FPE global variables without needing FPE as an esp master
FPFP_BabyHandlerScript BabyHandler ; holds the handler for interactions and resetting

Bool IsGrowing

MiscObject property Caps_Object = None auto
Form Property Meat_Object Auto Const
Form Property Caged_Object Auto Const
GlobalVariable property FPFP_Global_Outcome Auto Const Mandatory
GlobalVariable property FPFP_Global_Receiver Auto Const Mandatory
GlobalVariable property FPFP_Global_Rename Auto Const Mandatory
Keyword Property kw_Outcome Auto Const 
string Property fpfp_leavingHomeMessage auto
string Property fpfp_Butchered auto
string Property fpfp_Caged auto
int Property int_howmuch_Meat auto
int Property int_howmuch_Caps auto
Bool Property Child_Allowed = true Auto Const	;if Creature is allowed to be Bah

Function Initialize()

	FPE = FPFP_Player_Script.GetAPI()
	BabyHandler = FPFP_Player_Script.GetBabyAPI()
	If !FPE || !BabyHandler
	
		Debug.MessageBox("WARNING: FPE API(s) HAVE NOT BEEN PROPERLY SET. QUIT THE GAME AND GO TO THE FAMILY PLANNING ENHANCED THREAD TO REPORT THIS ISSUE WITH YOUR PAPYRUS LOGS READY.")
	
	EndIf
	
	RegisterForCustomEvent(BabyHandler, "FPEBabyUpdateGameTimer")
	RegisterForCustomEvent(FPE, "DoUpdate")
	RegisterForCustomEvent(FPE, "DoCleaning")
	RegisterForCustomEvent(FPE, "DoReset")
	
	CheckForGrowing()
	If !IsGrowing
		StartTimerGameTime(GetUpdateTime())
	EndIf
	
EndFunction

Float Function GetUpdateTime() ; returns game hours

	float FPETimer = FPE.GetUpdateTime()
	
	float childToAdultInHours = FPE.FPFP_Global_ChildToAdult.GetValue() * FPE.FPFP_Global_Day.GetValue() * GetGrowthMultiplier() * 24
	
	float SinceChildStartInHours = ((Utility.GetCurrentGameTime() - GetValue(BabyHandler.FPFP_AV_BirthDate)) - (FPE.FPFP_Global_BabyToChild.GetValue() * GetGrowthMultiplier() * FPE.FPFP_Global_Day.GetValue())) * 24
	
	float remainingHours = childToAdultInHours - SinceChildStartInHours
	
	If remainingHours < FPETimer
		Return remainingHours
	Else
		Return FPETimer
	EndIf

EndFunction

Sound Function GetBabyBirthSound()
	
	If BirthSound
		Return BirthSound
	EndIf
	
	Return BabyHandler.VOCShaun
	
EndFunction

Event OnActivate(ObjectReference akActivator)

	If akActivator == Game.GetPlayer() && !IsDead()
	
		BabyHandler.ShowChildInfo(self)

		TryToSetWorkshopOnActivate()
	
	EndIf

EndEvent

Function TryToSetWorkshopOnActivate()

	If IsWorkshopActor
	
		If !InWorkshop()
			
			Location workshopLocation = BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(self) ; Assign NPC to workshop
			
			WorkshopScript newWorkshop = BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
			
			If newWorkshop
			
				ObjectReference homeMarker = newWorkshop.GetLinkedRef(BabyHandler.WorkshopParent.WorkshopLinkSandbox)
				
				if homeMarker == NONE
				
					homeMarker = newWorkshop.GetLinkedRef(BabyHandler.WorkshopParent.WorkshopLinkCenter)
					
				endif
				
				If homeMarker == NONE ; To prevent log errors, we make sure that there is a home marker to move to
				
					MoveTo(homeMarker)
					
				EndIf
			
			EndIf
		
		EndIf
		
	EndIf

EndFunction

Event OnDying(Actor akKiller)

	UnregisterForAllEvents()

EndEvent

Event OnTimerGameTime(int aiTID)

	If !IsDead()

		CheckForGrowing()
	
		If !IsGrowing
			StartTimerGameTime(GetUpdateTime()) 
		EndIf
		
	EndIf

EndEvent

Event FPFP_BabyHandlerScript.FPEBabyUpdateGameTimer(FPFP_BabyHandlerScript akSender, Var[] akArgs)

	CancelTimerGameTime()
	
	If !IsDead()

		CheckForGrowing()
	
		If !IsGrowing
			StartTimerGameTime(GetUpdateTime()) 
		EndIf
		
	EndIf

EndEvent

Function CheckForGrowing()

	Trace("Starting grow check")
	
	If IsGrowing
		Trace("We're already grown up! Why aren't we deleted yet?!")
		StartDelete()
		Return
	EndIf

	float childToAdult = FPE.FPFP_Global_ChildToAdult.GetValue() * GetGrowthMultiplier()
	
	float monthsSinceChildStart = ((Utility.GetCurrentGameTime() - GetValue(BabyHandler.FPFP_AV_BirthDate)) / FPE.FPFP_Global_Day.GetValue()) - (FPE.FPFP_Global_BabyToChild.GetValue() * GetGrowthMultiplier())
	
	If monthsSinceChildStart >= childToAdult
		if Child_Allowed == true
			If Self.HasKeyword(kw_Outcome)
				GrowUp()
			elseIf Self.HasKeyword(Game.GetFormFromFile(0x01EA31, "FP_FamilyPlanningEnhanced.esp") as Keyword);LeavingHome
				LeavingHome()
			elseIf Self.HasKeyword(Game.GetFormFromFile(0x01EA32, "FP_FamilyPlanningEnhanced.esp") as Keyword);Butchered
				Butchered()
			elseIf Self.HasKeyword(Game.GetFormFromFile(0x01EA33, "FP_FamilyPlanningEnhanced.esp") as Keyword);Caged
				Caged()
			endif
			
			If FPFP_Global_Outcome.GetValue() == 0.0	;Normal
				GrowUp()
			elseIf FPFP_Global_Outcome.GetValue() == 1.0	;LeavingHome
				LeavingHome()
			elseIf FPFP_Global_Outcome.GetValue() == 2.0	;Butchered
				Butchered()
			elseIf FPFP_Global_Outcome.GetValue() == 3.0	;Caged
				Caged()
			endif
		else
			GrowUp()
		endif
		
	ElseIf monthsSinceChildStart > 0
	
		Trace("Setting scale")
	
		float scaleToSetTo = 1 + ((monthsSinceChildStart / childToAdult) * AddedSize)
	
		SetScale(scaleToSetTo)
	
		QueueUpdate(flags = 0xC)
	
	EndIf

EndFunction

Float Function GetGrowthMultiplier()

	float avGrowthTimeMult = GetValue(BabyHandler.FPFP_AV_GrowthTimeMult) ; first check for the actor value

	If avGrowthTimeMult > 0 ; if the actor value was valid
		Return avGrowthTimeMult ; return with it
	EndIf
	
	; If we made it this far, that means that we don't have a valid growth multiplier yet, do another check for the script property
	
	If GrowthTimeMultiplier > 0 ; if the float property was valid
		Return GrowthTimeMultiplier ; return it
	Else
		Return 1.0 ; return a normal number if it was not normal
	EndIf

EndFunction

Function Butchered()

	Trace("Butchered")

	IsGrowing = True ; Stop our children from growning up again even though we've started the transition process.
	
	Disable() ; Disappear ourselves for smoother transition
	
	;Show the message, if enabled

	If FPE.FPFP_Global_CGNotif.GetValue() == 1.0
		if FPE.FPFP_Global_MessageType.GetValue() == 0
			Debug.MessageBox(fpfp_Butchered)
		else
			Debug.Notification(fpfp_Butchered)
		endif	
	EndIf

	if Meat_Object != None
		If FPFP_Global_Receiver.GetValue() == 1.0 ;Player
			Game.GetPlayer().additem(Meat_Object, int_howmuch_Meat, true)
		elseIf FPFP_Global_Receiver.GetValue() == 0.0 ;Workshop
			Location workshopLocation = BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(self) ; Assign NPC to workshop
				
			WorkshopScript newWorkshop = BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
			
			If newWorkshop
				newWorkshop.additem(Meat_Object, int_howmuch_Meat, true)
			else
				Game.GetPlayer().additem(Meat_Object, int_howmuch_Meat, true)
			endif
		endif
	else
		GrowUp()
	endif
	
	StartDelete()
	
EndFunction

Function LeavingHome()

	Trace("Leaving Home")

	IsGrowing = True ; Stop our children from growning up again even though we've started the transition process.
	
	Disable() ; Disappear ourselves for smoother transition
	
	;Show the message, if enabled

	If FPE.FPFP_Global_CGNotif.GetValue() == 1.0
		if FPE.FPFP_Global_MessageType.GetValue() == 0
			Debug.MessageBox(fpfp_leavingHomeMessage)
		else
			Debug.Notification(fpfp_leavingHomeMessage)
		endif	
	EndIf


	if Caps_Object != None
		If FPFP_Global_Receiver.GetValue() == 1.0 ;Player
			Game.GetPlayer().additem(Caps_Object, int_howmuch_Caps, true)
		elseIf FPFP_Global_Receiver.GetValue() == 0.0 ;Workshop
			Location workshopLocation = BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(self) ; Assign NPC to workshop
				
			WorkshopScript newWorkshop = BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
			
			If newWorkshop
				newWorkshop.additem(Caps_Object, int_howmuch_Caps, true)
			else
				Game.GetPlayer().additem(Caps_Object, int_howmuch_Caps, true)
			endif
		endif
	else
		GrowUp()
	endif
	
	StartDelete()
	
EndFunction

Function Caged()

	Trace("Caged")

	IsGrowing = True ; Stop our children from growning up again even though we've started the transition process.
	
	Disable() ; Disappear ourselves for smoother transition
	
	If FPE.FPFP_Global_CGNotif.GetValue() == 1.0
		if FPE.FPFP_Global_MessageType.GetValue() == 0
			Debug.MessageBox(fpfp_Caged)
		else
			Debug.Notification(fpfp_Caged)
		endif	
	EndIf
	
	if Caged_Object != None 
		If FPFP_Global_Receiver.GetValue() == 1.0 ;Player
			Game.GetPlayer().additem(Caged_Object, 1, true)
		elseIf FPFP_Global_Receiver.GetValue() == 0.0 ;Workshop
			Location workshopLocation = BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(self) ; Assign NPC to workshop
				
			WorkshopScript newWorkshop = BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
			
			If newWorkshop
				newWorkshop.additem(Caged_Object, 1, true)
			else
				Game.GetPlayer().additem(Caged_Object, 1, true)
			endif
		endif
	else
		GrowUp()
	endif
	StartDelete()
	
EndFunction


Function GrowUp()
		Trace("Growing up")

	IsGrowing = True ; Stop our children from growning up again even though we've started the transition process.
	
	Disable() ; Disappear ourselves for smoother transition
	
	

	;Show the message, if enabled

	If FPE.FPFP_Global_CGNotif.GetValue() == 1.0
	
		If GetCurrentLocation().GetName() == "Commonwealth"
	
			if FPE.FPFP_Global_MessageType.GetValue() == 0
				Debug.MessageBox("A child has grown into an adult in the Commonwealth")
			else
				Debug.Notification("A child has grown into an adult in the Commonwealth")
			endif
			
		ElseIf GetCurrentLocation()
	
			if FPE.FPFP_Global_MessageType.GetValue() == 0
				Debug.MessageBox("A child has grown into an adult at "+ GetCurrentLocation().GetName())
			else
				Debug.Notification("A child has grown into an adult at "+ GetCurrentLocation().GetName())
			endif
		EndIf
	
	EndIf


	; create a workshop NPC reference
	
	ObjectReference newAdult = PlaceAtMe(GetAdultAB(), 1, True, False, False)
	
	RemoveAllItems(newAdult)
	
	If FPFP_Global_Rename.GetValue() == 1.0	
		RenameAnything.SetRefName(newAdult, RenameAnything.GetRefName(self as Actor))
		newAdult.AddKeyword(Game.GetFormFromFile(0x0001EA88, "FP_FamilyPlanningEnhanced.esp") as Keyword)
	endif
	
	If HasKeyword(BabyHandler.FPFP_KW_IsPlayersChild)
		newAdult.AddKeyword(BabyHandler.FPFP_KW_IsPlayersChild)
	EndIf
	
	; for SKK50's Fallout 4-76
	If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
		newAdult.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
	EndIf 

	
	; add them to the workshop, if the child is already assigned to one
	
	TryToAddToWorkshopOnGrow(newAdult)



	; delete ourselves

	StartDelete()
	
EndFunction

ActorBase Function GetAdultAB()

	If AdultAB.Length > 1
	
		Return AdultAB[Utility.RandomInt(0, AdultAB.Length-1)]
	
	Else
	
		return AdultAB[0]
	
	EndIf

EndFunction

Function TryToAddToWorkshopOnGrow(ObjectReference akAdult)

	If IsWorkshopActor
	
		If InWorkshop()
			
			BabyHandler.WorkshopParent.RemoveActorFromWorkshopPUBLIC((self as Actor) as WorkshopNPCScript) ; Remove ourselves to make room
			
			BabyHandler.WorkshopParent.AddActorToWorkshopPUBLIC(akAdult as WorkshopNPCScript, BabyHandler.WorkshopParent.GetWorkshopFromLocation(GetCurrentLocation())) ; Add the newAdult to the workshop
			
		EndIf
		
	EndIf

EndFunction

Bool Function InWorkshop()

	If ((self as Actor) as WorkshopNPCScript).GetWorkshopID() > -1
	
		Return True
	
	EndIf
	
	Return False

EndFunction

Function StartDelete()

	UnregisterForAllEvents()

	If (self as Actor) as WorkshopChildScript
		((self as Actor) as WorkshopChildScript).UnregisterForAllEvents()
	EndIf

	If IsBoundGameObjectAvailable()
		Delete()
	EndIf
	
EndFunction

Event FPFP_Player_Script.DoUpdate(FPFP_Player_Script akSender, Var[] akArgs)
	;update code
	
	Trace("Doing update")
	
	int lastVer = akArgs[0] as Int
	if lastVer < 2100
		RegisterForCustomEvent(FPE,"DoCleaning")
		RegisterForCustomEvent(BabyHandler, "FPEBabyUpdateGameTimer")
	EndIf
	
EndEvent

Event FPFP_Player_Script.DoCleaning(FPFP_Player_Script akSender, Var[] akArgs)

	Trace("Doing cleaning")
	If !IsBoundGameObjectAvailable() || IsDeleted()
		StartDelete()
	EndIf
	
EndEvent

Event FPFP_Player_Script.DoReset(FPFP_Player_Script akSender, Var[] akArgs)
	
	Trace("Doing reset")
	;delete self
	StartDelete()
	
EndEvent

Function Trace(String theText)

	Debug.Trace("FPE "+self+" | "+theText)

EndFunction
