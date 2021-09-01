Scriptname FPE_AdultResources extends Quest

FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory ; holds the handler for interactions and resetting
Actor property PlayerRef Auto Const Mandatory
MiscObject property Caps001 auto
GlobalVariable property FPFP_Global_ARReceiver Auto Const Mandatory
GlobalVariable property FPFP_Global_ARMessageType Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowNONWDF Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowSettlers Auto Const Mandatory
Actorbase property WorkshopNPC Auto Const Mandatory
Actorbase property WorkshopDog Auto Const Mandatory
Actorbase property WorkshopBrahmin Auto Const Mandatory
Faction Property FPFP_AdultResource Auto Const Mandatory
potion Property Pokeball_Settler_Female Auto const
potion Property Pokeball_Settler_Male Auto const

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
		Return ScannedActor
EndFunction

Function GiveNPCUnderCrosshairs_Caged()
	Actor akActor = GetActorUnderCrosshairs()
	Caged(akActor)
EndFunction

Function GiveNPCUnderCrosshairs_LeavingHome()
	Actor akActor = GetActorUnderCrosshairs()
	LeavingHome(akActor)
EndFunction

Function GiveNPCUnderCrosshairs_Butchered()
	Actor akActor = GetActorUnderCrosshairs()
	Butchered(akActor)
EndFunction

Function GiveNPCUnderCrosshairs_SellasSlave()
	Actor akActor = GetActorUnderCrosshairs()
	SellasSlave(akActor)
EndFunction

Function Butchered(actor akActor)
	form Object_Given
	int int_Object_Given
	String string_Message
	bool Allowed = False
	
	if (FPFP_BabyHandler.AdultAllowed(akActor.GetLeveledActorBase().GetRace())) && (akActor.IsInFaction(FPFP_AdultResource) || akActor.IsInFaction(Game.GetFormFromFile(0x01EA39, "INVB_Wasteland_Zoo.esp") as Faction))
		Object_Given = FPFP_BabyHandler.WhatsmyStuff_Butcher(akActor.GetLeveledActorBase().GetRace())
		int_Object_Given = FPFP_BabyHandler.HowMuch_Butcher(akActor.GetLeveledActorBase().GetRace())
		string_Message = FPFP_BabyHandler.WhatsmyLine_Butcher(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	elseif FPFP_Global_AllowNONWDF.GetValue() == 1 && (akActor.GetLeveledActorBase() == WorkshopDog || akActor.GetLeveledActorBase() == WorkshopBrahmin)
		Object_Given = FPFP_BabyHandler.WhatsmyStuff_Butcher(akActor.GetLeveledActorBase().GetRace())
		int_Object_Given = FPFP_BabyHandler.HowMuch_Butcher(akActor.GetLeveledActorBase().GetRace())
		string_Message = FPFP_BabyHandler.WhatsmyLine_Butcher(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	else
		Allowed = False
	endif
	
	if (Allowed)
		Game.FadeOutGame(true, true, 0, 1, true)
		Utility.Wait(1)

		;Show the message, if enabled
		akActor.Disable() ; Disappear ourselves for smoother transition

		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox(string_Message)
		else
			Debug.Notification(string_Message)
		endif	
		
		if Object_Given != None
			If FPFP_Global_ARReceiver.GetValue() == 1.0 ;Player
				Game.GetPlayer().additem(Object_Given, int_Object_Given, true)
			elseIf FPFP_Global_ARReceiver.GetValue() == 0.0 ;Workshop
				Location workshopLocation = FPFP_BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(akActor) ; Assign NPC to workshop
					
				WorkshopScript newWorkshop = FPFP_BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
				
				If newWorkshop
					newWorkshop.additem(Object_Given, int_Object_Given, true)
				else
					Game.GetPlayer().additem(Object_Given, int_Object_Given, true)
				endif
				
			endif
		endif
		StartDelete(akActor)
		Game.FadeOutGame(false, true, 0, 1)
	else
		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox("You are not allowed to Butcher "+ akActor.GetLeveledActorBase().GetName())
		else
			Debug.Notification("You are not allowed to Butcher "+ akActor.GetLeveledActorBase().GetName())
		endif	
	endif	
EndFunction

Function SellasSlave(actor akActor)
	int int_Object_Given
	String string_Message
	bool Allowed = False
	
	if (FPFP_BabyHandler.AdultAllowed(akActor.GetLeveledActorBase().GetRace())) && (akActor.IsInFaction(FPFP_AdultResource) || akActor.IsInFaction(Game.GetFormFromFile(0x01EA39, "INVB_Wasteland_Zoo.esp") as Faction))
		int_Object_Given = FPFP_BabyHandler.HowMuch_Slave(akActor.GetLeveledActorBase().GetRace())
		string_Message = FPFP_BabyHandler.WhatsmyLine_Slave(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	elseif FPFP_Global_AllowNONWDF.GetValue() == 1 && (akActor.GetLeveledActorBase() == WorkshopDog || akActor.GetLeveledActorBase() == WorkshopBrahmin)
		int_Object_Given = FPFP_BabyHandler.HowMuch_Slave(akActor.GetLeveledActorBase().GetRace())
		string_Message = FPFP_BabyHandler.WhatsmyLine_Slave(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	elseif FPFP_Global_AllowSettlers.GetValue() == 1 && akActor.GetLeveledActorBase() == WorkshopNPC
		int_Object_Given = 100
		string_Message = "Time to go, Slave"
		Allowed = True
	else
		Allowed = False
	endif
	
	if (Allowed)
		Game.FadeOutGame(true, true, 0, 1, true)
		Utility.Wait(1)

		;Show the message, if enabled
		akActor.Disable() ; Disappear ourselves for smoother transition

		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox(string_Message)
		else
			Debug.Notification(string_Message)
		endif

		if Caps001 != None
			If FPFP_Global_ARReceiver.GetValue() == 1.0 ;Player
				Game.GetPlayer().additem(Caps001, int_Object_Given, true)
			elseIf FPFP_Global_ARReceiver.GetValue() == 0.0 ;Workshop
				Location workshopLocation = FPFP_BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(akActor) ; Assign NPC to workshop
					
				WorkshopScript newWorkshop = FPFP_BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
				
				If newWorkshop
					newWorkshop.additem(Caps001, int_Object_Given, true)
				else
					Game.GetPlayer().additem(Caps001, int_Object_Given, true)
				endif
				
			endif
		endif
		StartDelete(akActor)
		Game.FadeOutGame(false, true, 0, 1)
	else
		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox("You are not allowed to Sell "+ akActor.GetLeveledActorBase().GetName())
		else
			Debug.Notification("You are not allowed to Sell "+ akActor.GetLeveledActorBase().GetName())	
		EndIf
	endif
EndFunction

Function LeavingHome(actor akActor)
	form Object_Given
	int int_Object_Given
	String string_Message
	bool Allowed = False
	
	if (FPFP_BabyHandler.AdultAllowed(akActor.GetLeveledActorBase().GetRace())) && (akActor.IsInFaction(FPFP_AdultResource) || akActor.IsInFaction(Game.GetFormFromFile(0x01EA39, "INVB_Wasteland_Zoo.esp") as Faction))
		Object_Given = FPFP_BabyHandler.WhatsmyStuff_Exile(akActor.GetLeveledActorBase().GetRace())
		int_Object_Given = FPFP_BabyHandler.HowMuch_Exile(akActor.GetLeveledActorBase().GetRace())
		string_Message = FPFP_BabyHandler.WhatsmyLine_Exile(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	elseif FPFP_Global_AllowNONWDF.GetValue() == 1 && (akActor.GetLeveledActorBase() == WorkshopDog || akActor.GetLeveledActorBase() == WorkshopBrahmin)
		Object_Given = FPFP_BabyHandler.WhatsmyStuff_Exile(akActor.GetLeveledActorBase().GetRace())
		int_Object_Given = FPFP_BabyHandler.HowMuch_Exile(akActor.GetLeveledActorBase().GetRace())
		string_Message = FPFP_BabyHandler.WhatsmyLine_Exile(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	elseif FPFP_Global_AllowSettlers.GetValue() == 1 && akActor.GetLeveledActorBase() == WorkshopNPC
		Object_Given = Caps001
		int_Object_Given = 100
		string_Message = "Leave Now and Never Come Back"
		Allowed = True
	else
		Allowed = False
	endif
	
	if (Allowed)
		Game.FadeOutGame(true, true, 0, 1, true)
		Utility.Wait(1)

		;Show the message, if enabled
		akActor.Disable() ; Disappear ourselves for smoother transition

		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox(string_Message)
		else
			Debug.Notification(string_Message)	
		EndIf

		if Caps001 != None
			If FPFP_Global_ARReceiver.GetValue() == 1.0 ;Player
				Game.GetPlayer().additem(Caps001, int_Object_Given, true)
			elseIf FPFP_Global_ARReceiver.GetValue() == 0.0 ;Workshop
				Location workshopLocation = FPFP_BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(akActor) ; Assign NPC to workshop
					
				WorkshopScript newWorkshop = FPFP_BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
				
				If newWorkshop
					newWorkshop.additem(Caps001, int_Object_Given, true)
				else
					Game.GetPlayer().additem(Caps001, int_Object_Given, true)
				endif
				
			endif
		endif
		StartDelete(akActor)
		Game.FadeOutGame(false, true, 0, 1)
	else
		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox("You are not allowed to Exile "+ akActor.GetLeveledActorBase().GetName())
		else
			Debug.Notification("You are not allowed to Exile "+ akActor.GetLeveledActorBase().GetName())
		endif
	endif
	
EndFunction

Function Caged(actor akActor)
	form Object_Given
	int int_Object_Given
	String string_Message
	bool Allowed = False
	
	if (FPFP_BabyHandler.AdultAllowed(akActor.GetLeveledActorBase().GetRace())) && (akActor.IsInFaction(FPFP_AdultResource) || akActor.IsInFaction(Game.GetFormFromFile(0x01EA39, "INVB_Wasteland_Zoo.esp") as Faction))
		Object_Given = FPFP_BabyHandler.WhatsmyStuff_Caged(akActor.GetLeveledActorBase().GetRace())
		int_Object_Given = 1
		string_Message = FPFP_BabyHandler.WhatsmyLine_Caged(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	elseif FPFP_Global_AllowNONWDF.GetValue() == 1 && (akActor.GetLeveledActorBase() == WorkshopDog || akActor.GetLeveledActorBase() == WorkshopBrahmin)
		Object_Given = FPFP_BabyHandler.WhatsmyStuff_Caged(akActor.GetLeveledActorBase().GetRace())
		int_Object_Given = 1
		string_Message = FPFP_BabyHandler.WhatsmyLine_Caged(akActor.GetLeveledActorBase().GetRace())
		Allowed = True
	elseif FPFP_Global_AllowSettlers.GetValue() == 1 && akActor.GetLeveledActorBase() == WorkshopNPC
		if akActor.GetLeveledActorBase().GetSex() == 0
			Object_Given = Pokeball_Settler_Male
		elseIf akActor.GetLeveledActorBase().GetSex() == 1
			Object_Given = Pokeball_Settler_Female
		endif
		int_Object_Given = 1
		string_Message = "Being Caged has a habit of changing people, so enjoy your looks while they last"
		Allowed = True
	else
		Allowed = False
	endif
	
	if (Allowed)
		Game.FadeOutGame(true, true, 0, 1, true)
		Utility.Wait(1)

		;Show the message, if enabled
		akActor.Disable() ; Disappear ourselves for smoother transition

		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox(string_Message)
		else
			Debug.Notification(string_Message)
		endif	
		
		if Caps001 != None
			If FPFP_Global_ARReceiver.GetValue() == 1.0 ;Player
				Game.GetPlayer().additem(Caps001, int_Object_Given, true)
			elseIf FPFP_Global_ARReceiver.GetValue() == 0.0 ;Workshop
				Location workshopLocation = FPFP_BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(akActor) ; Assign NPC to workshop
					
				WorkshopScript newWorkshop = FPFP_BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
				
				If newWorkshop
					newWorkshop.additem(Caps001, int_Object_Given, true)
				else
					Game.GetPlayer().additem(Caps001, int_Object_Given, true)
				endif
				
			endif
		endif
		StartDelete(akActor)
		Game.FadeOutGame(false, true, 0, 1)
	elseIf akActor.IsInFaction(Game.GetFormFromFile(0x01EA39, "INVB_Wasteland_Zoo.esp") as Faction)
		Debug.Notification("INVB_Wasteland_Zoo is not Supported")
	else
		if FPFP_Global_ARMessageType.GetValue() == 0
			Debug.MessageBox("You are not allowed to Cage "+ akActor.GetLeveledActorBase().GetName())
		else
			Debug.Notification("You are not allowed to Cage "+ akActor.GetLeveledActorBase().GetName())
		endif	
		
	endif
EndFunction

Function StartDelete(actor akActor)

	UnregisterForAllEvents()

	If akActor as WorkshopChildScript
		(akActor as WorkshopChildScript).UnregisterForAllEvents()
	EndIf

	If IsBoundGameObjectAvailable()
		akActor.Delete()
	EndIf
	
EndFunction


;-- Debug/Logging Functions -------------------------

bool Function InDevelopmentMode() DebugOnly
    return False
EndFunction

Function OpenLog() DebugOnly
    Debug.OpenUserLog("FPE_AdultResources")
EndFunction

Function DisplayDebugMessage(string asMessage) DebugOnly
    LogMessage(asMessage, 0)
    If (InDevelopmentMode())
        Debug.Notification(asMessage)
    EndIf
EndFunction

Function LogMessage(string asMessage, int aiSeverity = 0)
    If (InDevelopmentMode())
        Debug.Trace(self + ": " + asMessage, aiSeverity)
    EndIf
    Debug.TraceUser("FPE_AdultResources", self + ": " + asMessage, aiSeverity);
EndFunction

Function LogInfo(string asMessage) DebugOnly
    LogMessage(asMessage, 0)
EndFunction

Function LogWarning(string asMessage) DebugOnly
    LogMessage(asMessage, 1)
EndFunction

Function LogError(string asMessage) DebugOnly
    LogMessage(asMessage, 2)
EndFunction