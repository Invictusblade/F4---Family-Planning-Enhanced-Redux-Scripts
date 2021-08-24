Scriptname FPFP_SelfImpreg_Script Extends Quest

;four_play:Main FourPlayAPI
AAF:AAF_API AAF_Events

Group MainProperties

FPFP_Player_Script Property FPE Auto Const Mandatory
Actor Property PlayerREF Auto Const Mandatory
GlobalVariable Property FPFP_Global_SelfImpreg Auto Const Mandatory
MagicEffect property FPFP_ME_Pill auto const Mandatory
MagicEffect property FPFP_ME_Fertile auto const Mandatory
Armor property FPFP_Condom auto const Mandatory
Message property FPFP_Msg_SelfImpreg auto const mandatory
Faction Property FPFP_Preggo Auto Const Mandatory

EndGroup

Group PregnancyConditionProperties

GlobalVariable property FPFP_Global_MPreg Auto Const Mandatory
GlobalVariable property FPFP_Global_FemaleToFemaleCum Auto Const Mandatory
;Notifications
GlobalVariable property FPFP_Global_CCNotif Auto Const Mandatory
GlobalVariable property FPFP_Global_CNotif Auto Const Mandatory

EndGroup

Group PregnancyCalcProperties

GlobalVariable property FPFP_Global_Chance_Player_F Auto Const Mandatory
GlobalVariable property FPFP_Global_Contra auto Const Mandatory
GlobalVariable property FPFP_Global_FertileEffects Auto Const Mandatory

EndGroup


GlobalVariable property FPFP_Global_PlayerClone Auto Const Mandatory
Actorbase Property PlayerClone_F Auto Const Mandatory
Actorbase Property PlayerClone_M Auto Const Mandatory

; Initialization
Event OnQuestInit()
	LoadFP()
EndEvent

Function LoadFP()
	;Quest Main = Game.GetFormFromFile(0x02679, "four_play.esp") as quest
	Quest Main = Game.GetFormFromFile(0x01000F99, "AAF.esm") as quest
	If Main
		;FourPlayAPI = Main as four_play:Main
		;RegisterForCustomEvent(FourPlayAPI, "animation_over")
		AAF_Events = Main as AAF:AAF_API
		RegisterForCustomEvent(AAF_Events, "OnAnimationStop")
	Else
		;debug.Trace("Family Planning Self Impreg can't find Four-Play.")
		;debug.Trace("Family Planning Self Impreg can't find AAF.")
		utility.wait(0.1)
	Endif
EndFunction

; Meat of functionality
;Event four_play:Main.animation_over(four_play:Main akSender, Var[] akArgs)
Event AAF:AAF_API.OnAnimationStop(AAF:AAF_API akSender, Var[] akArgs)

	If FPFP_Global_SelfImpreg.GetValue() == 0.0
		Return
	EndIf

	if (akArgs[0] as int) != 0
		debug.Trace("FPE AAF_error - " +(akArgs[1] as string))
		return
		return
	endif
	Var[] acs = Utility.VarToVarArray(akArgs[1])
	
	;If (akArgs[0] as Actor) == PlayerREF && !(akArgs[1] as Actor) ; If it's player masturbation
	If (acs[0] as Actor) == PlayerREF && (acs.Length > 1 && !(acs[1] as Actor) || acs.Length < 2) ; If it's player masturbation
		
		If DetermineIfViable()
			
			PropmtForSelfImpreg()
			
		EndIf
		
	EndIf
	
EndEvent

Bool Function DetermineIfViable()
	
	If PlayerREF.IsEquipped(FPFP_Condom) || PlayerREF.IsInPowerArmor(); if the player has a condom on (or if they're in power armor)
		
		If (PlayerREF.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_MPreg.GetValue() == 1.0) || \		
		   (PlayerREF.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1.0) ;If we are a viable herm
		
			If !FPE.FPFP_BabyGeneral.IsRunning(); if we aren't pregnant

				Return True
				
			EndIf
			
		EndIf
		
	EndIf
	
	Return False

EndFunction

Function PropmtForSelfImpreg()

	If FPFP_Msg_SelfImpreg.Show() == 0
		
		Debug.MessageBox("You put your seed inside of you, hoping for conception")
		TryForSelfImpreg()
		
	EndIf

EndFunction

Function TryForSelfImpreg() ; meat of the determination. Uses most of TryforSperm function to keep in the spirit of things. Will need updating if there's ever any changes to the system tho
	
	FPFP_PlayerPregData PlayerInfo = FPE.GetPlayerPregnancyInfo()
	
	float chance = FPFP_Global_Chance_Player_F.getValue()
	bool impregnated = false
	
	If PlayerREF.HasMagicEffect(FPFP_ME_Fertile) ; Is the player fertile?
		chance *= FPFP_Global_FertileEffects.getValue()
	Endif
	
	If PlayerREF.HasMagicEffect(FPFP_ME_Pill) ; Is the player on the pill?
		chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
	Endif
	
	If Utility.RandomFloat(0,100) <= chance && !PlayerREF.IsInFaction(FPFP_Preggo)
		impregnated = true
	Endif
	
	If impregnated && FPFP_Global_PlayerClone.GetValue() == 0
		PlayerInfo.Impregnate(PlayerREF)
	elseif impregnated && FPFP_Global_PlayerClone.GetValue() == 1 && PlayerREF.GetLeveledActorBase().GetSex() == 1
		Actor tempActor = PlayerREF.PlaceAtMe(PlayerClone_F, abInitiallyDisabled = true) as Actor
		Utility.Wait(1)
		PlayerInfo.Impregnate(tempActor)
	elseif impregnated && FPFP_Global_PlayerClone.GetValue() == 1 && PlayerREF.GetLeveledActorBase().GetSex() == 0
		Actor tempActor = PlayerREF.PlaceAtMe(PlayerClone_M, abInitiallyDisabled = true) as Actor
		Utility.Wait(1)
		PlayerInfo.Impregnate(tempActor)
	EndIf
	
	
	
	SelfConceptionNotifications(chance,impregnated,PlayerInfo.NumChildren)
	
EndFunction

Function SelfConceptionNotifications(float afChance, bool wasImpregnated, int numChildren)

	If FPFP_Global_CCNotif.getValue() == 1.0

		debug.notification("I reckon the chance of me getting pregnant is "+ afChance as Int +"%") 

	EndIf
	
	If FPFP_Global_CNotif.GetValue() == 1.0 && wasImpregnated
	
		debug.notification("I've got a feeling that it worked.")
		
	EndIf

EndFunction


