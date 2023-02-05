Scriptname FPE_Cumflation_Quest extends quest

GlobalVariable property FPFP_Global_Cumflation_Power Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Time Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Notif Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Notif_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Time_Refresh Auto Const Mandatory

GlobalVariable property FPFP_Global_BodyType_CBBE_CF Auto Const Mandatory
GlobalVariable property FPFP_Global_BodyType_FG_CF Auto Const Mandatory
Keyword Property FPFP_Cum_Keyword Auto Const Mandatory
Perk Property WLD_Perk_Cumflated Auto Const Mandatory

Race Property HumanRace Auto
Actor Property PlayerREF Auto Const Mandatory
Armor Dripping
Actor akActor
int random_LList
float Power_Modifier
Bool bool_strings

String[] Property Message_Start_Female Auto Const
String[] Property Message_Middle_Female Auto Const
String[] Property Message_End_Female Auto Const

GlobalVariable property FPFP_Global_Cumflation_Male Auto Const Mandatory
String[] Property OrigMorphNames Auto
Float[] Property OrigMorphValues Auto

Event OnTimerGameTime(int aiTID)
	if aiTID == 1
		If akActor.GetLeveledActorBase().GetSex() == 1
			Dripping = Dripping()
			
			akActor.equipitem(Dripping, true, true)
		
			if FPFP_Global_Cumflation_Notif.GetValue() == 1 && bool_strings == true
				random_LList = Utility.RandomInt(1, 100)
				if (random_LList <= FPFP_Global_Cumflation_Notif_Chance.GetValue())
					Cumflation_Message_Start()
				endif
			endif
		EndIf

		StartTimerGameTime(FPFP_Global_Cumflation_Time.GetValue() / 3, 2)
	elseIf aiTID == 2
		if FPFP_Global_Cumflation_Notif.GetValue() == 1 && bool_strings == true
			random_LList = Utility.RandomInt(1, 100)
			if (random_LList <= FPFP_Global_Cumflation_Notif_Chance.GetValue())
				Cumflation_Message_Middle()
			endif	
		endif
		
		Cumflation_Bodymorph_Down(akActor)
		StartTimerGameTime(FPFP_Global_Cumflation_Time.GetValue() / 3, 3)
		
	elseIf aiTID == 3
		Cumflation_ResetBody(akActor)
		
		if FPFP_Global_Cumflation_Notif.GetValue() == 1 && bool_strings == true
			random_LList = Utility.RandomInt(1, 100)
			if (random_LList <= FPFP_Global_Cumflation_Notif_Chance.GetValue())
				Cumflation_Message_End()
			endif
		endif
		
		akActor.unequipitem(Dripping, true, true)
		akActor.removeitem(Dripping, 1, true)
		akActor.removeperk(WLD_Perk_Cumflated)
	endif	
EndEvent

Function Cumflation(Actor aktarget, float Power_Modifier_inj, bool bool_strings_inj)
	akActor = akTarget
	GetOriginalMorphs()
	Power_Modifier = Power_Modifier_inj
	bool_strings = bool_strings_inj
	akActor.addperk(WLD_Perk_Cumflated)
	Cumflation_Bodymorph_Up(akActor)
	StartTimerGameTime(FPFP_Global_Cumflation_Time.GetValue() / 3, 1)
EndFunction


Armor Function Dripping()
	If (Game.IsPluginInstalled("Zaz Particles.esp") == TRUE)
		int random_Cumflation = Utility.RandomInt(1, 3)
		if (random_Cumflation == 1) ;Squirt Armor
			Dripping = Game.GetFormFromFile(0x000F9A, "Zaz Particles.esp") as Armor
		elseif (random_Cumflation == 2)  ;FCum Armor
			Dripping = Game.GetFormFromFile(0x00173A, "Zaz Particles.esp") as Armor
		elseif (random_Cumflation == 3) ;FGush Armor
			Dripping = Game.GetFormFromFile(0x001ED5, "Zaz Particles.esp") as Armor
		endif	
	elseIf (Game.IsPluginInstalled("Zaz Particle Effects.esp") == TRUE)
		int random_Cumflation = Utility.RandomInt(1, 12)
		if (random_Cumflation == 1) ;CumFart-Heavy
			Dripping = Game.GetFormFromFile(0x000801, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 2)  ;ZaZ CumFart Light
			Dripping = Game.GetFormFromFile(0x00080F, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 3)  ;ZaZ CumShort - Basic
			Dripping = Game.GetFormFromFile(0x000810, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 4)  ;ZaZ Cumshot - Thick Slow
			Dripping = Game.GetFormFromFile(0x000811, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 5)  ;ZaZ Cumshot - Thick Uber
			Dripping = Game.GetFormFromFile(0x000812, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 6) ;ZaZ Gush Heavy
			Dripping = Game.GetFormFromFile(0x000813, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 7) ;ZaZ Gush Light
			Dripping = Game.GetFormFromFile(0x000814, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 8)  ;ZaZ Pussy - Cum Leak
			Dripping = Game.GetFormFromFile(0x000815, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 9)  ;ZaZ Pussy - Droplets
			Dripping = Game.GetFormFromFile(0x000816, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 10) ;ZaZ Squirt - Heavy
			Dripping = Game.GetFormFromFile(0x000817, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 11) ;ZaZ Squirt - Light
			Dripping = Game.GetFormFromFile(0x000818, "Zaz Particle Effects.esp") as Armor
		elseif (random_Cumflation == 12) ;ZaZ Squirt - Uber
			Dripping = Game.GetFormFromFile(0x000819, "Zaz Particle Effects.esp") as Armor
		endif
	
	endif
	
	Return Dripping
EndFunction

Function GetOriginalMorphs()
	Bool isFemale = (akActor.GetLeveledActorBase().GetSex() == 1)
	
	OrigMorphNames = BodyGen.GetMorphs(akActor, isFemale)
	If (OrigMorphNames.Length)
		OrigMorphValues = New Float[OrigMorphNames.Length]
		int i = 0
		While (i < OrigMorphNames.Length)
			Keyword[] MorphKeywords = BodyGen.GetKeywords(akActor, isFemale, OrigMorphNames[i])
			Keyword MyKeyword = None
			If (MorphKeywords.Length)
				MyKeyword = MorphKeywords[MorphKeywords.Length - 1] ; always get the last keyword 
			EndIf
			
			OrigMorphValues[i] = BodyGen.GetMorph(akActor, isFemale, OrigMorphNames[i], MyKeyword)
			i += 1
		EndWhile
	EndIf
EndFunction

Float Function OrigValue(String MorphName)
	If (OrigMorphNames.Length)
		int idx = OrigMorphNames.Find(MorphName)
		If (idx > -1)
			;Trace(akActor.GetLeveledActorBase().GetName() + " found morph " + MorphName + " value " + OrigMorphValues[idx])
			Return OrigMorphValues[idx]
		EndIf
	EndIf
	
		Return 0.0
EndFunction

Function Cumflation_Bodymorph_Up(Actor Ourself)
	float power = (Utility.RandomFloat(FPFP_Global_Cumflation_Power.getValue() - 0.2, FPFP_Global_Cumflation_Power.getValue() + 0.2)) / 3
	int i
	
	if Power_Modifier != 1
		power = power * Power_Modifier
	endif	
	
	If (FPFP_Global_BodyType_CBBE_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power + OrigValue("BigBelly"))
	ElseIf (FPFP_Global_BodyType_CBBE_CF.GetValue() == 1)
		BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Cum_Keyword, (power * 0.2) + OrigValue("PregnancyBelly"))
	Else
		BodyGen.SetMorph(Ourself, true, "Belly", FPFP_Cum_Keyword, power + OrigValue("Belly"))
	EndIf
	
	if akActor.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_Cumflation_Male.GetValue() == 1
		BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Cum_Keyword, power + OrigValue("Mpreg"))
	EndIf
	
	If (FPFP_Global_BodyType_FG_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, (power * 0.5) + OrigValue("Belly Big"))
	ElseIf (FPFP_Global_BodyType_FG_CF.GetValue() == 1)
		BodyGen.SetMorph(Ourself, true, "Belly Pregnant", FPFP_Cum_Keyword, (power * 0.2) + OrigValue("Belly Pregnant"))
	Else
		BodyGen.SetMorph(Ourself, true, "Belly Size", FPFP_Cum_Keyword, power + OrigValue("Belly Size"))
	EndIf
	
	BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, power)
	
	BodyGen.UpdateMorphs(Ourself)
	
	Utility.Wait(FPFP_Global_Cumflation_Time_Refresh.GetValue() / FPFP_Global_Cumflation_Time_Refresh.GetValue())
	
	power += power
	
	If (FPFP_Global_BodyType_CBBE_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power)
	ElseIf (FPFP_Global_BodyType_CBBE_CF.GetValue() == 1)
		BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Cum_Keyword, power * 0.2)
	Else
		BodyGen.SetMorph(Ourself, true, "Belly", FPFP_Cum_Keyword, power)
	EndIf
	
	if akActor.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_Cumflation_Male.GetValue() == 1
		BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Cum_Keyword, power)
	EndIf
	
	If (FPFP_Global_BodyType_FG_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, power * 0.5)
	ElseIf (FPFP_Global_BodyType_FG_CF.GetValue() == 1)
		BodyGen.SetMorph(Ourself, true, "Belly Pregnant", FPFP_Cum_Keyword, power * 0.2)
	Else
		BodyGen.SetMorph(Ourself, true, "Belly Size", FPFP_Cum_Keyword, power)
	EndIf
	
	BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, power)
	
	BodyGen.UpdateMorphs(Ourself)
	
	Utility.Wait(FPFP_Global_Cumflation_Time_Refresh.GetValue() / FPFP_Global_Cumflation_Time_Refresh.GetValue())
	
	power += power
	
	If (FPFP_Global_BodyType_CBBE_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power)
	ElseIf (FPFP_Global_BodyType_CBBE_CF.GetValue() == 1)
		BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Cum_Keyword, power * 0.2)
	Else
		BodyGen.SetMorph(Ourself, true, "Belly", FPFP_Cum_Keyword, power)
	EndIf
	
	if akActor.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_Cumflation_Male.GetValue() == 1
		BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Cum_Keyword, power)
	EndIf
	
	If (FPFP_Global_BodyType_FG_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, power * 0.5)
	ElseIf (FPFP_Global_BodyType_FG_CF.GetValue() == 1)
		BodyGen.SetMorph(Ourself, true, "Belly Pregnant", FPFP_Cum_Keyword, power * 0.2)
	Else
		BodyGen.SetMorph(Ourself, true, "Belly Size", FPFP_Cum_Keyword, power)
	EndIf
	
	BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, power)
	
	BodyGen.UpdateMorphs(Ourself)
	
	
EndFunction


Function Cumflation_Bodymorph_Down(Actor Ourself)
	float power = (Utility.RandomFloat(FPFP_Global_Cumflation_Power.getValue() - 0.1, FPFP_Global_Cumflation_Power.getValue() + 0.1))
	int i
	
	if Power_Modifier != 1
		power = power * Power_Modifier
	endif	
	
	while i < FPFP_Global_Cumflation_Time_Refresh.GetValueint()
		If (FPFP_Global_BodyType_CBBE_CF.GetValue() == 0)
			BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power)
		ElseIf (FPFP_Global_BodyType_CBBE_CF.GetValue() == 1)
			BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Cum_Keyword, power * 0.2)
		Else
			BodyGen.SetMorph(Ourself, true, "Belly", FPFP_Cum_Keyword, power)
		EndIf
		
		if akActor.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_Cumflation_Male.GetValue() == 1
			BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Cum_Keyword, power)
		EndIf
		
		If (FPFP_Global_BodyType_FG_CF.GetValue() == 0)
			BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, power * 0.5)
		ElseIf (FPFP_Global_BodyType_FG_CF.GetValue() == 1)
			BodyGen.SetMorph(Ourself, true, "Belly Pregnant", FPFP_Cum_Keyword, power * 0.2)
		Else
			BodyGen.SetMorph(Ourself, true, "Belly Size", FPFP_Cum_Keyword, power)
		EndIf
		
		BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, power)
		
		BodyGen.UpdateMorphs(Ourself)
		
		Utility.Wait(FPFP_Global_Cumflation_Time_Refresh.GetValue() / FPFP_Global_Cumflation_Time_Refresh.GetValue())
		
		if power > 0
			power = (power - (power / FPFP_Global_Cumflation_Time_Refresh.GetValue()))
		else
			i = FPFP_Global_Cumflation_Time_Refresh.GetValueint() as int
		endif
		
		i += 1
	endwhile
EndFunction

Function Cumflation_ResetBody(Actor Ourself)
	If (FPFP_Global_BodyType_CBBE_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, 0)
	ElseIf (FPFP_Global_BodyType_CBBE_CF.GetValue() == 1)
		BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Cum_Keyword, 0)
	Else
		BodyGen.SetMorph(Ourself, true, "Belly", FPFP_Cum_Keyword, 0)
	EndIf
	
	if akActor.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_Cumflation_Male.GetValue() == 1
		BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Cum_Keyword, 0)
	EndIf
	
	If (FPFP_Global_BodyType_FG_CF.GetValue() == 0)
		BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, 0)
		ElseIf (FPFP_Global_BodyType_FG_CF.GetValue() == 1)
			BodyGen.SetMorph(Ourself, true, "Belly Pregnant", FPFP_Cum_Keyword, 0)
	Else
		BodyGen.SetMorph(Ourself, true, "Belly Size", FPFP_Cum_Keyword, 0)
	EndIf
	
	BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, 0)
	BodyGen.UpdateMorphs(Ourself)
EndFunction

Function Cumflation_Message_Start()
	if akActor == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_Start_Female.Length-1)
		Debug.notification(Message_Start_Female[random_Name])
	endif
EndFunction

Function Cumflation_Message_Middle()
	if akActor == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_Middle_Female.Length-1)
		Debug.notification(Message_Middle_Female[random_Name])
	endif
EndFunction

Function Cumflation_Message_End()
	if akActor == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_End_Female.Length-1)
		Debug.notification(Message_End_Female[random_Name])
	endif
EndFunction