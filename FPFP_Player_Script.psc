Scriptname FPFP_Player_Script extends Quest

Group TechnicalProperties
{Technical properties for this script to use}
Actor property PlayerREF auto const Mandatory
FPFP_PlayerPregData Property I_PlayerPregnancyInfo Auto Const Mandatory
Faction property FPFP_Preggo auto const Mandatory
Message Property FPFP_Msg_PlayerPregInfo Auto Const Mandatory
Keyword property FPFP_HasData Auto Const Mandatory
FormList property FPFP_DataHoldersList Auto Const Mandatory
Keyword Property FPFP_NoDaddy Auto Const Mandatory
EndGroup

Function AddToDataList(ObjectReference akRef)
	FPFP_DataHoldersList.AddForm(akRef)
EndFunction

Function RemoveFromDataList(ObjectReference akRef)
	FPFP_DataHoldersList.RemoveAddedForm(akRef)
EndFunction

Group GlobalVariables 
{This script holds all the data for FPE globals so that other mods who use the base FPE scripts to add new babies and children don't need the FPE esp as a master to their esp}
GlobalVariable property FPFP_Internal_MCMHasLoaded auto const
GlobalVariable property FPFP_Internal_CloakEffectActive auto const
GlobalVariable property FPFP_Internal_UpdateTime auto const

GlobalVariable property FPFP_Global_Chance auto Const
GlobalVariable property FPFP_Global_Fertile auto Const
GlobalVariable property FPFP_Global_FertileEffects auto  Const
GlobalVariable property FPFP_Global_Contra auto Const
GlobalVariable property FPFP_Global_NPCContra auto Const
GlobalVariable property FPFP_Global_BabyToChild auto Const
GlobalVariable property FPFP_Global_ChildToAdult auto Const
GlobalVariable property FPFP_Global_CNotif auto Const
GlobalVariable property FPFP_Global_FNotif auto Const
GlobalVariable property FPFP_Global_BNotif auto Const
GlobalVariable property FPFP_Global_BGNotif auto Const
GlobalVariable property FPFP_Global_CGNotif auto Const
GlobalVariable property FPFP_Global_Day auto Const
GlobalVariable property FPFP_Global_Power auto Const
GlobalVariable property FPFP_Global_PlayerImpregsOnly auto Const
GlobalVariable property FPFP_Global_FPregPlayerOnly auto Const
GlobalVariable property FPFP_Global_MPreg auto Const
GlobalVariable property FPFP_Global_MPregPlayerOnly auto Const
GlobalVariable property FPFP_Global_AllowNonNPC auto Const
;1.1
GlobalVariable property FPFP_Global_FemaleToFemaleCum auto const
;1.15
GlobalVariable property FPFP_Global_POCNotif auto Const
GlobalVariable property FPFP_Global_CCNotif auto Const
;2.0
GlobalVariable Property FPFP_Global_MultiChance Auto Const Mandatory
GlobalVariable Property FPFP_Global_MultiMax Auto Const Mandatory
GlobalVariable Property FPFP_Global_EquipNewCondom Auto Const Mandatory
GlobalVariable Property FPFP_Global_GhoulifyChildren Auto Const Mandatory
GlobalVariable Property FPFP_Global_BabyHealth Auto Const Mandatory
GlobalVariable Property FPFP_Global_SelfImpreg Auto Const Mandatory
GlobalVariable Property FPFP_Global_LastingMorphs Auto Const Mandatory
GlobalVariable Property FPFP_Global_NPCPlayerSexUseContraOption Auto Const Mandatory
;2.1
GlobalVariable Property FPFP_Global_SynthImpreg Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowFertileNPC Auto Const Mandatory
GlobalVariable property FPFP_Global_FertileNPC Auto Const Mandatory
;3.2
GlobalVariable property INVB_Global_ForceFatherQuest Auto Const Mandatory
;3.25

GlobalVariable property INVB_Global_ForceAbortQuest Auto Const Mandatory
GlobalVariable property INVB_Global_ForceLossQuest Auto Const Mandatory
GlobalVariable property FPFP_Global_MessageType Auto Const Mandatory

;3.8
GlobalVariable property FPFP_Internal_UpdateTime_Breeder Auto Const Mandatory
GlobalVariable property FPFP_Internal_UpdateTime_Player Auto Const Mandatory 
GlobalVariable property FPFP_Internal_UpdateTime_PostPartum Auto Const Mandatory 

;4.0
GlobalVariable property FPFP_Global_Sterile Auto Const Mandatory
EndGroup

Group FPEQuests
{Quests for resetting and gameplay handling}
Quest property FPFP_Player auto const ; Oh look, it's ourself!

FPFP_BabyHandlerScript property FPFP_BabyHandler auto const
Quest property FPFP_Announce auto const
Quest property FPFP_MCM auto const
; Dialogue related quests
Quest property FPFP_BabyGeneral auto const
Quest property FPFP_Daddy auto const
Quest property FPFP_DNA auto const
; Birth related quests
Quest property FPFP_Labour auto const
Quest property FPFP_Abort auto const
Quest property FPFP_LOSS auto const
Quest property FPFP_SelfImpreg auto const
EndGroup

Group FPEQuestsData
{Data for quest stuff}
ReferenceAlias[] property ParnersRef auto const
ReferenceAlias property DaddyRef auto const
ReferenceAlias property BirthGiver auto const
LocationAlias property BirthGiverLoc auto const
EndGroup

Group VariableProperties
{Variable properties that get set during runtime}
Actor Property Daddy auto 
Actor[] property Partners auto
Bool property BlockDaddyQuest auto
EndGroup

Group Perks
;4.00
Perk Property WLD_Perk_Month_1 Auto
Perk Property WLD_Perk_Month_2 Auto
Perk Property WLD_Perk_Month_3 Auto
Perk Property WLD_Perk_Month_4 Auto
Perk Property WLD_Perk_Month_5 Auto
Perk Property WLD_Perk_Month_6 Auto
Perk Property WLD_Perk_Month_7 Auto
Perk Property WLD_Perk_Month_8 Auto
Perk Property WLD_Perk_Month_9 Auto
Perk Property WLD_Perk_Month_10 Auto
Perk Property WLD_Perk_Birth_Nothing Auto Const Mandatory
Perk Property WLD_Perk_Birth_PoorLifestyle Auto Const Mandatory
Perk Property WLD_Perk_Birth_Stillborn Auto Const Mandatory
Perk Property WLD_Perk_Surrogate_1 Auto
Perk Property WLD_Perk_Surrogate_2 Auto
Perk Property WLD_Perk_Surrogate_3 Auto
Perk Property WLD_Perk_Pregnancy_Freezing Auto
Perk Property WLD_Perk_Sterile Auto
EndGroup


ActorValue Property FPFP_AV_RemainingPregnancy Auto Const
ActorValue Property FPFP_AV_PregnancyStage Auto Const


Race Property HumanRace Auto 

int currentL = 0
int LastVersion

CustomEvent DoUpdate
CustomEvent DoCleaning
CustomEvent DoReset
CustomEvent SendBasePreg
CustomEvent DebugDataDump
CustomEvent FPFP_GiveBirth
CustomEvent FPFP_GetPregnant


; Initialization

FPFP_Player_Script Function GetAPI() Global
	Return Game.GetFormFromFile(0x0F99, "FP_FamilyPlanningEnhanced.esp") as FPFP_Player_Script
EndFunction

FPFP_BabyHandlerScript Function GetBabyAPI() Global 
	Return Game.GetFormFromFile(0x03DB1, "FP_FamilyPlanningEnhanced.esp") as FPFP_BabyHandlerScript
EndFunction

Float Function GetUpdateTime()
	
	float UpdateTime = FPFP_Internal_UpdateTime.GetValue()
	If UpdateTime > 0
		return UpdateTime
	Else
		return 24.0
	EndIf
	
EndFunction

Float Function GetUpdateTime_Player()
	
	float UpdateTime = FPFP_Internal_UpdateTime_Player.GetValue()
	If UpdateTime > 0
		return UpdateTime
	Else
		return 24.0
	EndIf
	
EndFunction

Float Function GetUpdateTime_PostPartum()
	
	float UpdateTime = FPFP_Internal_UpdateTime_PostPartum.GetValue()
	If UpdateTime > 0
		return UpdateTime
	Else
		return 24.0
	EndIf
	
EndFunction

Float Function GetUpdateTime_Breeder()
	
	float UpdateTime = FPFP_Internal_UpdateTime_Breeder.GetValue()
	
	If UpdateTime > 0
		return UpdateTime
	Else
		return 24.0
	EndIf
	
EndFunction

Event OnQuestInit()
	StartTimer(1, 0)
EndEvent

Event OnTimer(int TID)

	If TID == 0
	
		If FPFP_Internal_MCMHasLoaded.GetValue() == 1 ; If our MCM is loaded
			RegisterForRemoteEvent(PlayerREF,"OnPlayerLoadGame")
			LastVersion = CurrentVersion()
			If FPFP_Internal_CloakEffectActive.GetValue() == -1.0 ; If this was our first time setting up FPE
				FPFP_Internal_CloakEffectActive.SetValue(1.0) ; Enable cloaking
				debug.notification("Family Planning Enhanced: Thanks for installing!")
			EndIf
			
		Else
			StartTimer(1,0) ; Wait till our MCM has loaded the values from the preset a player might have installed
		EndIf
	Endif
	
EndEvent

; Maintenance

int Function CurrentVersion()

	Return 2611

EndFunction

Event Actor.OnPlayerLoadGame(Actor akSender)
	CheckUpdate()
EndEvent

Function CheckUpdate()

	If LastVersion < CurrentVersion()
		Debug.notification("Family Planning Enhanced: Older version found on save. Updating ...")
		utility.wait(0.1)
		VersionUpdate()
	Endif
	
EndFunction

Function VersionUpdate()

	;Update code goes here
	
	If LastVersion < 2000
	
		CancelTimerGameTime()
	
		DEBUG.MessageBox("FAMILY PLANNING ENHANCED IMPORTANT MESSAGE.")
		
		DEBUG.MessageBox("FPE Version 2.0 is a completely new version of the mod. It requires a clean installation OR a previous version of FPE that has been reset.")
		
		DEBUG.MessageBox("If you are seeing this message, please make sure to follow these steps: ")
		
		DEBUG.MessageBox("Uninstall this version of FPE, and reinstall the version you had before.")
		
		DEBUG.MessageBox("Restart your FPE via the \"Restart Family Planning Enhanced\" option in the MCM menu, then uninstall the mod, load your save, wait 30 seconds, save, then exit and install this version.")
		
		DEBUG.MessageBox("FAMILY PLANNING ENHANCED IMPORTANT MESSAGE ENDED.")
	
		;...
	
	EndIf
	
	If LastVersion < 2200
	
		Debug.MessageBox("Family Planning Enhanced: Starting 2.2 update")
	
		;...
	
	EndIf
	
	FPFP_BabyHandler.OnUpdate(LastVersion)
	
	UnregisterForRemoteEvent(PlayerREF,"OnPlayerLoadGame")
	
	RegisterForRemoteEvent(PlayerREF,"OnPlayerLoadGame")
	
	Var[] Args = New Var[1]
	Args[0] = LastVersion
	SendCustomEvent("DoUpdate", Args)
	
	Utility.Wait(5) ; wait 5 seconds for everything to update

	LastVersion = CurrentVersion()
	
	Debug.Notification("Family Planning Enhanced: Updated!")

EndFunction

; Notification functions

Function ConceptionNotifications(Actor akWoman, Actor akMan, float afChance, bool wasImpregnatedDuringThisSexAct, int numChildren)

	string manName = akMan.GetLeveledActorBase().GetName()
	string womanName = akWoman.GetLeveledActorBase().GetName()
	
	Debug.Trace("FPE: Pregnancy chance for " + akWoman.GetLeveledActorBase().GetName() + " was " + DisplayFloat(afChance) +"%. Pregnancy is " + wasImpregnatedDuringThisSexAct)

	If FPFP_Global_POCNotif.GetValue() == 1.0 && akWoman != PlayerREF && akMan != PlayerREF
		Return ; Only the player is supposed to be notified of conception related things. End func
	EndIf

	If FPFP_Global_CCNotif.getValue() == 1.0 && (!akWoman.IsInFaction(FPFP_Preggo) || wasImpregnatedDuringThisSexAct)
		If akMan == PlayerREF
			debug.notification("I reckon the chance of pregnancy for "+ womanName +" is "+ DisplayFloat(afChance) +"%") 
		ElseIf akWoman == PlayerREF
			debug.notification("I reckon the chance of me getting pregnant is "+ DisplayFloat(afChance) +"%") 
		Else
			debug.notification("I reckon the chance of pregnancy for "+ womanName +" from "+ manName +"'s semen is "+ DisplayFloat(afChance) +"%") 
		EndIf
	EndIf
	
	If FPFP_Global_CNotif.GetValue() == 1.0 && wasImpregnatedDuringThisSexAct
		String theConceptionMessage = "Something tells me "
		String theBabyAmount = "bab"
		
		If numChildren == 1
			theBabyAmount = theBabyAmount + "y was"
		Else
			theBabyAmount = theBabyAmount + "ies were"
		EndIf
		
		If akWoman == PlayerREF
			theConceptionMessage = theConceptionMessage + manName +"'s "+ theBabyAmount +" conceived inside of me today."
		ElseIf akMan == PlayerREF
			theConceptionMessage = theConceptionMessage +"my "+ theBabyAmount +" conceived inside of "+ womanName +" today."
		Else
			theConceptionMessage = theConceptionMessage + manName +"'s "+ theBabyAmount +" conceived inside of "+ womanName +" today."
		EndIf
		
		debug.notification(theConceptionMessage)
	EndIf

EndFunction

String Function DisplayFloat(float afNum)

	float leftOvers = afNum - (afNum as Int)
	
	If leftOvers >= 0.5
		Return Math.Ceiling(afNum) as String
	Else
		Return Math.Floor(afNum) as String
	EndIf

EndFunction

Function SendBirthEvent(Actor akMother, bool akBirth)
	Var[] kArgs = new Var[2]
	kArgs[0] = akMother
	kArgs[1] = akBirth
	SendCustomEvent("FPFP_GiveBirth", kargs)
EndFunction

Function SendPregEvent(Actor akMother, Actor akFather, int NumChildren)
	Var[] kArgs = new Var[3]
	kArgs[0] = akMother
	kArgs[1] = akFather
	kArgs[2] = NumChildren
	SendCustomEvent("FPFP_GetPregnant", kargs)
EndFunction

; Quest functions

Function SetDaddy(Actor akMan)

	if akMan.HasKeyword(FPFP_NoDaddy)
		BlockDaddyQuest = akMan && akMan.HasKeyword(FPFP_NoDaddy)
	elseif akMan.GetLeveledActorBase().GetRace() == HumanRace
		Daddy = akMan
	else
		BlockDaddyQuest = akMan
	endif
	
	PSTrace("SetDaddy " + akMan + " BlockDaddyQuest " + BlockDaddyQuest)
	
EndFunction

Function RecordPartner(Actor akMan)
	If Partners.Find(akMan) <= -1; not in the current three
		Partners[currentL] = akMan
		currentL += 1
		If currentL == 3
			currentL = 0
		Endif
	Endif
EndFunction

Function StopDNAQuest()

	If FPFP_DNA.IsRunning()
		FPFP_DNA.FailAllObjectives()
		;FPFP_DNA.CompleteQuest()
		FPFP_DNA.SetStage(9999)
		FPFP_DNA.Stop()
	Endif

EndFunction

Function TryToStartDaddy()
	If (BlockDaddyQuest)
		PSTrace("BlockDaddyQuest is true, not starting Daddy quest")
	ElseIf Daddy == PlayerREF
		debug.notification("I think that I may be the father of my own child!")
		utility.Wait(0.1)
	ElseIf Daddy && !Daddy.IsDead() && !Daddy.IsDisabled() && INVB_Global_ForceFatherQuest.GetValue() == 1
		FPFP_Daddy.Start()
		DaddyREF.ForceRefTo(Daddy)
		int currentE = 0
		int currentR = 0
		While currentE < 3
			Actor currentA = Partners[currentE]
			If currentA && currentA != Daddy
				ParnersRef[currentR].ForceRefTo(currentA)
				currentR += 1
			Endif
			currentE += 1
			utility.wait(0.1)
		Endwhile
		
		If currentR == 0; Only slept with one guy
			FPFP_Daddy.setStage(70)
		Else
			FPFP_Daddy.setStage(10)
		Endif
	elseif INVB_Global_ForceFatherQuest.GetValue() == 0
		debug.notification("Instinct somehow tells me that the father of the child is a complete loser.")
		utility.Wait(0.1)
	Else
		debug.notification("Instinct somehow tells me that the father of the child is already dead.")
		utility.Wait(0.1)
	Endif
	
	Partners = new Actor[3]
	Daddy = None
EndFunction

Function StopDaddyQuest()

	If FPFP_Daddy.IsRunning()
		FPFP_Daddy.FailAllObjectives()
		FPFP_Daddy.SetStage(9999)
		FPFP_Daddy.Stop()
	Endif

EndFunction

Function StartBabyGeneral()

	FPFP_BabyGeneral.Start()

EndFunction

Function StopBabyGeneral()

	If FPFP_BabyGeneral.IsRunning()
		FPFP_BabyGeneral.Stop()
	Endif

EndFunction

Function DoLabourQuest()
	
	debug.notification("I'm going into labour. I need to find a doctor as soon as possible!") 
	FPFP_Labour.Start()
	
EndFunction

Bool Function LabourQuestRunning()

	Return FPFP_Labour.IsRunning()
	
EndFunction

Function StopLabourQuest()

	If FPFP_Labour.IsRunning()
		FPFP_Labour.FailAllObjectives()
		;FPFP_Labour.CompleteQuest()
		FPFP_Labour.SetStage(9999)
		FPFP_Labour.Stop()
	Endif
	
EndFunction

Function StartAbort()
	if INVB_Global_ForceAbortQuest.GetValue() == 1
		FPFP_Abort.Start()
	endif
EndFunction

Function TooLateToAbort()

	If FPFP_Abort.IsRunning()
		FPFP_Abort.setStage(20)
	Endif

EndFunction

Function StopAbortQuest()

	If FPFP_Abort.IsRunning()
		FPFP_Abort.FailAllObjectives()
		;FPFP_Abort.CompleteQuest()
		FPFP_Abort.SetStage(9999)
		FPFP_Abort.Stop()
	Endif

EndFunction

Function StartLOSSQuest()
	if INVB_Global_ForceLossQuest.GetValue() == 1
		FPFP_LOSS.Start()
		; |  ||
		; || |_
		; Yeah. That's right.
	endif
EndFunction

Bool Function LOSSQuestRunning()

	Return FPFP_LOSS.IsRunning()

EndFunction

Function StopLOSSQuest()

	If FPFP_LOSS.IsRunning()
		FPFP_LOSS.FailAllObjectives()
		;FPFP_LOSS.CompleteQuest()
		FPFP_LOSS.SetStage(9999)
		FPFP_LOSS.Stop()
	Endif

EndFunction

Bool I_AnnounceBirth_Lock = false
Function AnnounceBirth(Actor akWoman)

	int i

	While I_AnnounceBirth_Lock && i < 10
	
		Utility.Wait(0.1)
		i += 1
	
	EndWhile
	
	I_AnnounceBirth_Lock = True

	If FPFP_Global_BNotif.getValue() == 1
		If FPFP_Announce.IsRunning()
			FPFP_Announce.CompleteAllObjectives()
			FPFP_Announce.CompleteQuest()
			FPFP_Announce.Stop()	
		EndIf
		FPFP_Announce.Start()
		BirthGiver.ForceRefTo(akWoman)
		BirthGiverLoc.ForceLocationTo(akWoman.GetCurrentLocation())
		FPFP_Announce.setObjectiveDisplayed(0)
		FPFP_Announce.setObjectiveCompleted(0)
		FPFP_Announce.CompleteQuest()
		FPFP_Announce.Stop()
	Endif
	
	I_AnnounceBirth_Lock = False

EndFunction

; MCM functions and Reset

Function ResetPlayerBody()
	If !I_PlayerPregnancyInfo.IsPregnant
		I_PlayerPregnancyInfo.ResetBody()
	EndIf
EndFunction

Function RestartMCM()

	FPFP_MCM.Stop()
	FPFP_MCM.Start()
	
	Debug.Notification("Family Planning Enhanced: MCM Reset")

EndFunction

Function DoCleaningFunc()
	SendCustomEvent("DoCleaning")
EndFunction

Function StopFPE()

	FPFP_Internal_CloakEffectActive.SetValue(0.0)

	Debug.MessageBox("Please exit the MCM menu to begin the stopping process.")

	While Utility.IsInMenuMode()
	
		Utility.Wait(1.0)
	
	EndWhile
	
	Debug.Notification("Family Planning Enhanced Stop process initiated...")
	
	; stop any birthing quests
	StopLabourQuest()
	StopAbortQuest()
	StopLOSSQuest()
	; stop any pregnancy dialogue quests
	StopBabyGeneral()
	StopDNAQuest()
	StopDaddyQuest()
	; stop notification quest
	FPFP_Announce.Stop()
	
	;Stop the ones that are always running
	FPFP_MCM.Stop()
	FPFP_SelfImpreg.Stop()
	
	;stop the meat quests
	FPFP_BabyHandler.StartReset()
	FPFP_BabyHandler.Stop()

	ResetPreggos()
	FPFP_Player.Stop()
	
	;restart things, but only halfway
	FPFP_MCM.Start()
	FPFP_Player.Start()
	FPFP_BabyHandler.Start()
	FPFP_BabyHandler.ReregisterBabyTypeAddons()
	FPFP_SelfImpreg.Start()
	
	Debug.MessageBox("To reactivate FPE, go into the debug options page of FPE's MCM and click \"Start Family Planning Enhanced\"")
	
	Debug.MessageBox("Family Planning Enhanced stop process complete. It is now safe to uninstall.")

EndFunction

Function ResetPreggos()
	SendCustomEvent("DoReset")
	Utility.Wait(5)
EndFunction

Function StartFPE()

	If FPFP_Internal_CloakEffectActive.GetValue() == 0.0
		FPFP_Internal_CloakEffectActive.SetValue(1.0)
		
		; 2.600 force all handlers to rerun LoadAAF()
		Var[] Args = New Var[1]
		Args[0] = LastVersion
		SendCustomEvent("DoUpdate", Args)
		Utility.Wait(5) ; wait 5 seconds for everything to update
		LastVersion = CurrentVersion()
		
		Debug.Notification("Family Planning Enhanced has been restarted")
	EndIf
	
EndFunction

; Communication functions

int I_GetPregnancyInfo_LockCount = 1
bool I_GetPregnancyInfo_Lock
FPFP_BasePregData I_temporaryBPSC ; get's set by magic effect that receives our event
Function I_SendBackBasePreg(FPFP_BasePregData akRef)

	I_temporaryBPSC = akRef

EndFunction

FPFP_BasePregData function GetPregnancyInfo(actor akActor)
	
	;our locking just in case multiple calls of this function occur
	I_GetPregnancyInfo_LockCount += 1
	While (I_GetPregnancyInfo_Lock)
		Utility.Wait(0.1 * I_GetPregnancyInfo_LockCount)
	EndWhile
	I_GetPregnancyInfo_LockCount -= 1
	I_GetPregnancyInfo_Lock = True
	
	
	FPFP_BasePregData theReturn
	
	I_temporaryBPSC = NONE ; Make sure that we don't return the wrong data
	
	If akActor == PlayerREF
	
		theReturn = GetPlayerPregnancyInfo() as FPFP_BasePregData
	
	ElseIf akActor.HasKeyword(FPFP_HasData)
		Var[] eventArgs = new Var[1]
		eventArgs[0] = akActor
		SendCustomEvent("SendBasePreg", eventArgs)
	
		int i = 0
		int timeout = 10 ; timeout after number of tries
		While (!I_temporaryBPSC && i < timeout )
			Utility.Wait(0.1)
			i += 1
		EndWhile

		theReturn = I_temporaryBPSC
		I_temporaryBPSC = NONE ; clear our temporary BPSC
	
	EndIf
	
	;remove our lock
	I_GetPregnancyInfo_Lock = False
	
	return theReturn

Endfunction

FPFP_PlayerPregData Function GetPlayerPregnancyInfo()

	return I_PlayerPregnancyInfo

EndFunction

Function ShowPlayerPregnancyInfo()

	If !I_PlayerPregnancyInfo.IsPregnant
		Debug.MessageBox("The player isn't pregnant right now.")
		Return
	EndIf

	float BabyHealth = I_PlayerPregnancyInfo.BabyHealth
	float RadiationDamage = I_PlayerPregnancyInfo.RadiationDamage
	float NumChildren = I_PlayerPregnancyInfo.NumChildren
	float PregnancyProgress = ((Utility.GetCurrentGameTime() - I_PlayerPregnancyInfo.IncepDate) / FPFP_Global_Day.GetValue())

	FPFP_Msg_PlayerPregInfo.Show(PregnancyProgress,NumChildren,BabyHealth,RadiationDamage,FPFP_Global_Day.GetValue())

EndFunction

Actor Function GetActorUnderCrosshairs()
	PSTrace("GetActorUnderCrosshairs has started")
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.IsChild() || ScannedActor.IsDead() || ScannedActor.GetDistance(PlayerRef) > 256.000
		PSTrace("GetActorUnderCrosshairs has not found anyone viable, returning NONE")
		return None
	EndIf
	Return ScannedActor
EndFunction

Function ShowNPCUnderCrosshairsPregnancyInfo()
	Actor akActor = GetActorUnderCrosshairs()
	
	If akActor == NONE
		akActor = PlayerREF
	endif
	
	If (akActor)
		FPFP_BasePregData akPregData = GetPregnancyInfo(akActor)
		String ActorName = RenameAnything.GetRefName(akActor)
		If (akPregData)
			If !akPregData.IsPregnant
				String Message_NotPregNPC
				String gender_pronoun
				String gender_pronoun_2
				
				if akActor.GetLeveledActorBase().GetSex() == 0
					gender_pronoun = "his"
					gender_pronoun_2 = "he"
				else	
					gender_pronoun = "her"
					gender_pronoun_2 = "she"
				endif
				
				
				
				Message_NotPregNPC = ActorName + " isn't pregnant right now.\n"
				
				Message_NotPregNPC += "However "+gender_pronoun_2+" "	
				
				if akActor.HasPerk(WLD_Perk_Birth_Nothing)
					Message_NotPregNPC += "has serious(really serious) issues with raising children, so "+gender_pronoun_2+" might do something bad to the baby.\n"	
				elseif akActor.HasPerk(WLD_Perk_Birth_PoorLifestyle)
					Message_NotPregNPC += "has a poor lifestyle with a very poor diet, so "+gender_pronoun+" health might not be able to support a baby.\n"	
				elseif akActor.HasPerk(WLD_Perk_Birth_Stillborn)
					Message_NotPregNPC += "has a history of Stillbirths so the baby might not survive if one is conceived.\n"	
				elseif akActor.HasPerk(WLD_Perk_Surrogate_1) || akActor.HasPerk(WLD_Perk_Surrogate_2) || akActor.HasPerk(WLD_Perk_Surrogate_3)
					Message_NotPregNPC += "is a paid surrogate, so any babies will be sold to third parties.\n"	
				elseif akActor.HasPerk(WLD_Perk_Pregnancy_Freezing)
					Message_NotPregNPC += "has an unique condition that seems to freeze pregnancies.\n"	
				elseif akActor.HasPerk(WLD_Perk_Sterile)
					if FPFP_Global_Sterile.GetValue() == 0
						Message_NotPregNPC += "is sterile so it is impossible to conceive any children. (Disabled)\n"
					else
						Message_NotPregNPC += "is sterile so it is impossible to conceive any children. (Enabled).\n"
					endif
				else
					Message_NotPregNPC += "is healthy and has a stable lifestyle so any children borned will be raised in a loving environment.\n"	
				endif
				
				Debug.MessageBox(Message_NotPregNPC)
			Else
				Race FatherRace = akPregData.FatherRace
				float NumChildren = akPregData.NumChildren
				float PregnancyProgress = ((Utility.GetCurrentGameTime() - akPregData.IncepDate) / FPFP_Global_Day.GetValue())
				String Message_PregNPC
				String gender_pronoun
				String gender_pronoun_2
				float Creature_Length = akPregData.Creature_Cycle
				;int Total_left = Creature_Length as Int - PregnancyProgress as Int
				float Total_left = akActor.getValue(FPFP_AV_RemainingPregnancy) as float
				int Pregnant_Stage = akActor.getValue(FPFP_AV_PregnancyStage) as int
				
				
				if akActor.GetLeveledActorBase().GetSex() == 0
					gender_pronoun = "his"
					gender_pronoun_2 = "he"
				else	
					gender_pronoun = "her"
					gender_pronoun_2 = "she"
				endif
				
				String babyNoun
				If NumChildren == 1
					babyNoun = "baby"
				Else
					babyNoun = "babies"
				EndIf
				
				String progressString
				If (PregnancyProgress < 1)
					progressString = "less than 1 month"
				Elseif (PregnancyProgress < 2)
					progressString = "1 month"
				Else
					progressString = PregnancyProgress as Int + " months"
				EndIf
				
				String fatherRaceString = akPregData.FatherRace.GetName()
				If fatherRaceString == ""
					fatherRaceString = "Unknown Creature"
				EndIf
				
				Message_PregNPC = ActorName + " is pregnant with " + NumChildren as Int + " " + babyNoun + ".\n"
				
				if akActor.HasPerk(WLD_Perk_Month_1)
					Message_PregNPC += ActorName + " is in Month 1 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_2)
					Message_PregNPC += ActorName + " is in Month 2 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_3)
					Message_PregNPC += ActorName + " is in Month 3 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_4)
					Message_PregNPC += ActorName + " is in Month 4 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_5)
					Message_PregNPC += ActorName + " is in Month 5 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_6)
					Message_PregNPC += ActorName + " is in Month 6 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_7)
					Message_PregNPC += ActorName + " is in Month 7 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_8)
					Message_PregNPC += ActorName + " is in Month 8 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_9)
					Message_PregNPC += ActorName + " is in Month 9 of "+gender_pronoun+" Pregnancy.\n"	
				elseif akActor.HasPerk(WLD_Perk_Month_10)
					Message_PregNPC += ActorName + " is in Month 9+ of "+gender_pronoun+" Pregnancy.\n"
				else
					Message_PregNPC += gender_pronoun_2+" is " + progressString + " along.\n"
				endif	
				
				If (Total_left == 0)
					Message_PregNPC += ActorName + " is in Labour, right around now.\n"
				ElseIf (Total_left < 1)
					Message_PregNPC += "The due date is in less than 1 month time.\n"
				Else
					Message_PregNPC += "The due date is in "+Total_left as int+" months time.\n"
				EndIf
				
				If (Pregnant_Stage == 1)
					Message_PregNPC += "The Pregnancy is its First Stage (Abortion is possible).\n"
				ElseIf (Pregnant_Stage == 2)
					Message_PregNPC += "The Pregnancy is its Middle Stage (Abortion is impossible).\n"
				ElseIf (Pregnant_Stage == 3)
					Message_PregNPC += "The Pregnancy is its Final Stage (Premature Birth is now possible).\n"
				ElseIf (Pregnant_Stage == 4)
					Message_PregNPC += ActorName + " is in Labour, right now.\n"
				EndIf
				
				Message_PregNPC += "\n"	
				
				Message_PregNPC += "The father is a " + fatherRaceString +  "."	
				
				Message_PregNPC += "\n"				
				
				if akActor.HasPerk(WLD_Perk_Birth_Nothing)
					Message_PregNPC += "Worryingly, "+ ActorName + " has no plans whatsoever.\n"	
				elseif akActor.HasPerk(WLD_Perk_Birth_PoorLifestyle)
					Message_PregNPC += ActorName + " has a poor lifestyle so it is hard to say if the baby will live or die.\n"	
				elseif akActor.HasPerk(WLD_Perk_Birth_Stillborn)
					Message_PregNPC += ActorName + " has a history of Stillbirths so the baby might not survive.\n"	
				elseif akActor.HasPerk(WLD_Perk_Surrogate_1) || akActor.HasPerk(WLD_Perk_Surrogate_2) || akActor.HasPerk(WLD_Perk_Surrogate_3)
					Message_PregNPC += ActorName + " is giving away this baby for Money.\n"	
				elseif akActor.HasPerk(WLD_Perk_Pregnancy_Freezing)
					Message_PregNPC += ActorName + " has a pregnancy that seems to last forever.\n"	
				elseif akActor.HasPerk(WLD_Perk_Sterile)
					Message_PregNPC += ActorName + " looks like "+ gender_pronoun_2 +" has a pregnancy that will damage to "+gender_pronoun+" reproductive system. \n This may be her only pregnancy.\n"	
				else
					Message_PregNPC += ActorName + " is fine with raising this baby.\n"	
				endif
				
				if (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
					Message_PregNPC += ActorName + LactationMessage(akActor)
				endif
				
				Debug.MessageBox(Message_PregNPC)
				
			EndIf
		Else
			Debug.MessageBox("No pregnancy data available for " + ActorName)
		EndIf
	Else
		Debug.MessageBox("There is no NPC to report on.")
	EndIf
EndFunction	

String Function LactationMessage(actor akActor) 
	
	If akActor.HasPerk(Game.GetFormFromFile(0x01012357, "INVB_WastelandDairy.esp") as perk) ;WLD_Perk_Lactation
		return " actively produces Milk in her Breasts.\n"
	elseif akActor.HasPerk(Game.GetFormFromFile(0x0101235A, "INVB_WastelandDairy.esp") as perk) ;WLD_Perk_Lactation_Inactive
		return "s Milk Production is reduced at the Moment."
	elseif akActor.HasPerk(Game.GetFormFromFile(0x0101235C, "INVB_WastelandDairy.esp") as perk) ;WLD_Perk_Lactation_LowMilk
		return " cannot produce enough Milk in her Breasts to feed.\n"
	elseIf akActor.HasPerk(Game.GetFormFromFile(0x01012358, "INVB_WastelandDairy.esp") as perk) ;WLD_Perk_Lactation_Critical
		return " cannot produce Milk in her Breasts whatsoever.\n"
	elseif akActor.HasPerk(Game.GetFormFromFile(0x01012359, "INVB_WastelandDairy.esp") as perk) ;WLD_Perk_Lactation_Forever
		return " actively produces Milk in her Breasts.\n and will also produce milk forever.\n"
	else
		return " is not lactating.\n"	
	Endif
EndFunction

;-----------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------

; Console Debug functions
; BIG NOTE TO SCRIPTING MODDERS: THESE FUNCTIONS ARE FOR CONSOLE COMMANDS. 
; USE GetPlayerPregancyInfo AND GetPregnancyInfo TO GET PREGNANCY SCRIPTS SO THAT YOU CAN MODIFY THEM 
;   WITHIN YOUR SCRIPTS BY DIRECTLY CALLING THEIR FUNCTIONS

; How to use: Type in console ---> CQF FPE PregnancyDataDump [refID]
Function PregnancyDataDump(Actor akActor)

	Debug.Notification("FPE is starting a character data dump.")
	
	PSTrace("-----------------------------------------------------------------------------")

	PSTrace("STARTING DATA DUMP FOR "+ akActor +" " + akActor.GetLeveledActorBase().GetName())
	
	FPFP_BasePregData theData = GetPregnancyInfo(akActor)
	
	If theData != NONE
		PSTrace("Is the actor pregnant? : "+ theData.IsPregnant)
		If theData.IsPregnant
			PSTrace("Incept date: "+ theData.IncepDate)
			PSTrace("Current month of pregnancy: "+ ((Utility.GetCurrentGameTime() - theData.IncepDate) / FPFP_Global_Day.GetValue()))
			PSTrace("Father's Race: "+ theData.FatherRace)
			PSTrace("Number of Children: "+ theData.NumChildren)
			PSTrace("Is next update the first update? : "+ theData.FirstCheck)
		EndIf
		PSTrace("Other important property data")
		;PSTrace("FourPlay that's registered: "+ theData.four_play_event)
		PSTrace("AAF that's registered: "+ theData.AAF_Events)

		;...
	Else
		PSTrace("There was no data on record for that actor. Either they don't have the spell applied, or they took to long to respond")
		Debug.Notification("FPE found that there was no data on record for that actor")
	EndIf
	
	PSTrace("FINISHING DATA DUMP FOR "+ akActor +" " + akActor.GetLeveledActorBase().GetName())
	
	PSTrace("-----------------------------------------------------------------------------")
	
	Debug.Notification("FPE has finished a character data dump.")

EndFunction

; How to use: Type in console ---> CQF FPE PlayerDataDump
Function PlayerDataDump()

	Debug.Notification("FPE is starting a player data dump.")
	
	PSTrace("-----------------------------------------------------------------------------")

	PSTrace("STARTING DATA DUMP FOR THE PLAYER")

	If !I_PlayerPregnancyInfo
	
		PSTrace("PlayerDataDump : SOMETHING WENT WRONG. PlayerPregnancyInfo missing!!!")
		Return
		
	EndIf
	
	;PSTrace("Is the player pregnant? : "+ I_PlayerPregnancyInfo.IsPregnant)
	If I_PlayerPregnancyInfo.IsPregnant
		PSTrace("Incept date: "+ I_PlayerPregnancyInfo.IncepDate)
		PSTrace("Current month of pregnancy: "+ ((Utility.GetCurrentGameTime() - I_PlayerPregnancyInfo.IncepDate) / FPFP_Global_Day.GetValue()))
		PSTrace("Father's Race: "+ I_PlayerPregnancyInfo.FatherRace)
		PSTrace("Number of Children: "+ I_PlayerPregnancyInfo.NumChildren)
		PSTrace("Is next update the first update? : "+ I_PlayerPregnancyInfo.FirstCheck)
		PSTrace("Baby health: "+ I_PlayerPregnancyInfo.BabyHealth)
		PSTrace("Baby radiation damage: "+ I_PlayerPregnancyInfo.RadiationDamage)
	EndIf
	PSTrace("Other important property data")
	;PSTrace("FourPlay that's registered: "+ I_PlayerPregnancyInfo.four_play_event)
	PSTrace("AAF that's registered: "+ I_PlayerPregnancyInfo.AAF_Events)
	
	;...
	
	PSTrace("FINISHING DATA DUMP FOR THE PLAYER")
	
	PSTrace("-----------------------------------------------------------------------------")
	
	Debug.Notification("FPE has finished a player data dump.")

EndFunction

; How to use: Type in console ---> CQF FPE CallFunctionFor [refID] [functionName]
; OR ---> CQF FPE CFF [functionName]
;--------------------------------------
; functions that can be used are:
; Impregnate
; GiveBirth
; Abortion
; MakeFertile OR MakeVirile
; TraceDataDump OR DataDump
; NOTE: THE FUNCTION CALLS NEED TO MATCH THE CASE.
Function CallFunctionFor(Actor akActor, string theFunction, Actor akOptionalFather = NONE)
	
	FPFP_BasePregData theData = GetPregnancyInfo(akActor)
	
	If !theData
	
		PSTrace("CallFunctionFor : There's no data for that actor.")
		Debug.Notification("FPE : CallFunctionFor : There's no data for that actor.")
		Return
		
	EndIf
	
	If theFunction == "Impregnate" && !theData.IsPregnant
		If !akOptionalFather
			akOptionalFather = akActor
		EndIf
		theData.Impregnate(akOptionalFather, false) 
	ElseIf theFunction == "GiveBirth" && theData.IsPregnant
		theData.GiveBirth()
	ElseIf theFunction == "Abortion" && theData.IsPregnant
		theData.GiveBirth(false)
	ElseIf (theFunction == "MakeFertile" || theFunction == "MakeVirile" ) && !theData.IsPregnant
		theData.MakeFertile()
	ElseIf (theFunction == "TraceDataDump" || theFunction == "DataDump" )
		theData.TraceDataDump()
	EndIf
	
EndFunction
Function CFF(Actor akActor, string theFunction, Actor akOptionalFather = NONE)
	CallFunctionFor(akActor, theFunction, akOptionalFather )
EndFunction 

; How to use: Type in console ---> CQF FPE CallPlayerFunction [functionName] 
; OR ---> CQF FPE CPF [functionName]
;--------------------------------------
; functions that can be used are:
; --- NON PREGNANT FUNCTIONS ---
; Impregnate
; MakeFertile OR MakeVirile
; --- PREGNANT FUNCTIONS ---
; Labor OR Labour
; GiveBirth
; Abortion OR Abort
; Miscarriage
; FullyHealBaby
; KillBaby
; TraceDataDump OR DataDump
; NOTE: THE FUNCTION CALLS NEED TO MATCH THE CASE.
Function CallPlayerFunction(string theFunction, Actor akOptionalFather = NONE)

	If !I_PlayerPregnancyInfo
	
		PSTrace("CallPlayerFunction : SOMETHING WENT WRONG. PlayerPregnancyInfo missing!!!")
		Debug.Notification("FPE : CallPlayerFunction : SOMETHING WENT WRONG. PlayerPregnancyInfo missing!!!")
		Return
		
	EndIf
	
	If theFunction == "Impregnate" && !I_PlayerPregnancyInfo.IsPregnant
		If !akOptionalFather
			akOptionalFather = PlayerREF
		EndIf
		I_PlayerPregnancyInfo.Impregnate(akOptionalFather, false) 
	ElseIf (theFunction == "MakeFertile" || theFunction == "MakeVirile" ) && !I_PlayerPregnancyInfo.IsPregnant
		I_PlayerPregnancyInfo.MakeFertile()
	; Begin pregnancy reliant function calls
	ElseIf (theFunction == "Labor" || theFunction == "Labour")
		I_PlayerPregnancyInfo.DoLabour()
	ElseIf theFunction == "GiveBirth" && I_PlayerPregnancyInfo.IsPregnant 
		While Utility.IsInMenuMode()
			Utility.Wait(1)
		EndWhile
		I_PlayerPregnancyInfo.GiveBirth()
		StopLOSSQuest() ; because this is a debug function, expect to close the birthing quests
		StopLabourQuest()
		StopAbortQuest()
	ElseIf (theFunction == "Abortion" || theFunction == "Abort") && (I_PlayerPregnancyInfo.IsPregnant || LOSSQuestRunning())
		While Utility.IsInMenuMode()
			Utility.Wait(1)
		EndWhile
		I_PlayerPregnancyInfo.GiveBirth(false)
		StopLOSSQuest() ; because this is a debug function, expect to close the birthing quests
		StopLabourQuest()
		StopAbortQuest()
	ElseIf theFunction == "Miscarriage" && I_PlayerPregnancyInfo.IsPregnant
		I_PlayerPregnancyInfo.DoMiscarriage()
	ElseIf theFunction == "FullyHealBaby" && I_PlayerPregnancyInfo.IsPregnant
		I_PlayerPregnancyInfo.FullyHealBaby()
	ElseIf theFunction == "KillBaby" && I_PlayerPregnancyInfo.IsPregnant
		I_PlayerPregnancyInfo.BabyHealth = 0
	ElseIf theFunction == "TraceDataDump" || theFunction == "DataDump"
		I_PlayerPregnancyInfo.TraceDataDump()
	EndIf
	
EndFunction
Function CPF(string theFunction, Actor akOptionalFather = NONE)
	CallPlayerFunction(theFunction, akOptionalFather)
EndFunction

;-----------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------

; Debug

Function DumpDataList()

	Debug.MessageBox("Wait up to ten seconds, then check your logs.")

	int listSize = FPFP_DataHoldersList.GetSize()
	PSTrace("--------------------------------------------------------------------------------------------------------------------------------------------------")
	PSTrace("Starting data dump of our formlist of "+ listSize+" items")
	PSTrace("--------------------------------------------------------------------------------------------------------------------------------------------------")

	int i = 0
	
	While i < listSize

		Debug.Trace("FormList item "+i+" is " + FPFP_DataHoldersList.GetAt(i))
		i+=1
	
	Endwhile
	
	PSTrace("--------------------------------------------------------------------------------------------------------------------------------------------------")
	PSTrace("Ending data dump of our formlist of "+ listSize+" items. Starting data dump of the special player data holder")
	PSTrace("--------------------------------------------------------------------------------------------------------------------------------------------------")
	
	I_PlayerPregnancyInfo.TraceDataDump()
	
	PSTrace("--------------------------------------------------------------------------------------------------------------------------------------------------")
	PSTrace(" Ending data dump of player. Now sending debug event to the base data holders")
	PSTrace("--------------------------------------------------------------------------------------------------------------------------------------------------")
	
	SendCustomEvent("DebugDataDump")
	
EndFunction

Function PSTrace(string theText)

	Debug.Trace("Family Planning Player Script: "+ theText)

EndFunction

