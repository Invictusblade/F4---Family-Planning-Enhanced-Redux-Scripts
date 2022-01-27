Scriptname FPE_Cumflation extends Quest

GlobalVariable property FPFP_Global_Cumflation_Power Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Time Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Toggle Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Notif Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Notif_Chance Auto Const Mandatory

GlobalVariable property FPFP_Global_BodyType Auto Const Mandatory
Keyword Property FPFP_Cum_Keyword Auto Const Mandatory

Race Property HumanRace Auto
Actor Property PlayerREF Auto Const Mandatory
Armor Dripping
int random_LList
float Power_Modifier
FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory

String[] Property Message_Start_Female Auto Const
String[] Property Message_Middle_Female Auto Const
String[] Property Message_End_Female Auto Const
String[] Property Message_Start_Male Auto Const
String[] Property Message_Middle_Male Auto Const
String[] Property Message_End_Male Auto Const

Function Cumflation_Up(Actor akActor, Actor akMan) 
	int random_LList_infect = Utility.RandomInt(1, 100)
	if (random_LList_infect <= FPFP_Global_Cumflation_Chance.GetValue())
		if !akMan.GetLeveledActorBase().GetRace() == HumanRace
			Power_Modifier = FPFP_BabyHandler.HowBig(akMan.GetLeveledActorBase().GetRace())
		endif
		
		Cumflation_Bodymorph_Up(akActor)
		
		Utility.Wait(FPFP_Global_Cumflation_Time.GetValue() / FPFP_Global_Cumflation_Time.GetValue())
		
		If akActor.GetLeveledActorBase().GetSex() == 1
			If (Game.IsPluginInstalled("Zaz Particles.esp") == TRUE)
				int random_Cumflation = Utility.RandomInt(1, 3)
				if (random_Cumflation == 1) ;Squirt Armor
					Dripping = Game.GetFormFromFile(0x000F9A, "Zaz Particles.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 2)  ;FCum Armor
					Dripping = Game.GetFormFromFile(0x00173A, "Zaz Particles.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 3) ;FGush Armor
					Dripping = Game.GetFormFromFile(0x001ED5, "Zaz Particles.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				endif	
			elseIf (Game.IsPluginInstalled("Zaz Particle Effects.esp") == TRUE)
				int random_Cumflation = Utility.RandomInt(1, 12)
				if (random_Cumflation == 1) ;CumFart-Heavy
					Dripping = Game.GetFormFromFile(0x000801, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 2)  ;ZaZ CumFart Light
					Dripping = Game.GetFormFromFile(0x00080F, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 3)  ;ZaZ CumShort - Basic
					Dripping = Game.GetFormFromFile(0x000810, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 4)  ;ZaZ Cumshot - Thick Slow
					Dripping = Game.GetFormFromFile(0x000811, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 5)  ;ZaZ Cumshot - Thick Uber
					Dripping = Game.GetFormFromFile(0x000812, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)	
				elseif (random_Cumflation == 6) ;ZaZ Gush Heavy
					Dripping = Game.GetFormFromFile(0x000813, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 7) ;ZaZ Gush Light
					Dripping = Game.GetFormFromFile(0x000814, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 8)  ;ZaZ Pussy - Cum Leak
					Dripping = Game.GetFormFromFile(0x000815, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 9)  ;ZaZ Pussy - Droplets
					Dripping = Game.GetFormFromFile(0x000816, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 10) ;ZaZ Squirt - Heavy
					Dripping = Game.GetFormFromFile(0x000817, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 11) ;ZaZ Squirt - Light
					Dripping = Game.GetFormFromFile(0x000818, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				elseif (random_Cumflation == 12) ;ZaZ Squirt - Uber
					Dripping = Game.GetFormFromFile(0x000819, "Zaz Particle Effects.esp") as Armor
					akActor.equipitem(Dripping, true, true)
				endif
			
			endif
			
			if FPFP_Global_Cumflation_Notif.GetValue() == 1
				random_LList = Utility.RandomInt(1, 100)
				if (random_LList <= FPFP_Global_Cumflation_Notif_Chance.GetValue())
					Cumflation_Message_Start(akActor, akMan)
				endif
			endif
		EndIf
	EndIf

EndFunction

Function Cumflation_Down(Actor akActor, Actor akMan) 
	if FPFP_Global_Cumflation_Notif.GetValue() == 1
		random_LList = Utility.RandomInt(1, 100)
		if (random_LList <= FPFP_Global_Cumflation_Notif_Chance.GetValue())
			Cumflation_Message_Middle(akActor, akMan)
		endif	
	endif
	Cumflation_Bodymorph_Down(akActor)
	Utility.Wait(FPFP_Global_Cumflation_Time.GetValue() / 10)
	Cumflation_ResetBody(akActor)
	if FPFP_Global_Cumflation_Notif.GetValue() == 1
		random_LList = Utility.RandomInt(1, 100)
		if (random_LList <= FPFP_Global_Cumflation_Notif_Chance.GetValue())
			Cumflation_Message_End(akActor, akMan)
		endif
	endif
	akActor.unequipitem(Dripping, true, true)
	akActor.removeitem(Dripping, 1, true)
EndFunction

Function Cumflation_Bodymorph_Up(Actor Ourself)
	float power = (Utility.RandomFloat(FPFP_Global_Cumflation_Power.getValue() - 0.2, FPFP_Global_Cumflation_Power.getValue() + 0.2))
	int i
	
	if Power_Modifier != 1
		power = power * Power_Modifier
	endif	
	
	If (FPFP_Global_BodyType.GetValue() == 0) ; CBBE Original
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power)
	ElseIf (FPFP_Global_BodyType.GetValue() == 1) ; CBBE Redux
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power)
	ElseIf (FPFP_Global_BodyType.GetValue() == 2) ; Fusion Girl Original
		BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, power)
	ElseIf (FPFP_Global_BodyType.GetValue() == 3) ; Fusion Girl Redux
		bodygen.SetMorph(Ourself, True, "Belly Big", FPFP_Cum_Keyword, power)
	Else ; JaneBod
		BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, power)
	EndIf
	BodyGen.UpdateMorphs(Ourself)
		
EndFunction

Function Cumflation_Bodymorph_Down(Actor Ourself)
	float power = (Utility.RandomFloat(FPFP_Global_Cumflation_Power.getValue() - 0.1, FPFP_Global_Cumflation_Power.getValue() + 0.1))
	int i
	
	if Power_Modifier != 1
		power = power * Power_Modifier
	endif	
	
	while i < FPFP_Global_Cumflation_Time.GetValueint()
		If (FPFP_Global_BodyType.GetValue() == 0) ; CBBE Original
			BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power)
		ElseIf (FPFP_Global_BodyType.GetValue() == 1) ; CBBE Redux
			BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, power)
		ElseIf (FPFP_Global_BodyType.GetValue() == 2) ; Fusion Girl Original
			BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, power)
		ElseIf (FPFP_Global_BodyType.GetValue() == 3) ; Fusion Girl Redux
			bodygen.SetMorph(Ourself, True, "Belly Big", FPFP_Cum_Keyword, power)
		Else ; JaneBod
			BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, power)
		EndIf
		BodyGen.UpdateMorphs(Ourself)
		
		Utility.Wait(FPFP_Global_Cumflation_Time.GetValue() / FPFP_Global_Cumflation_Time.GetValue())
		
		if power > 0
			power = (power - (power / FPFP_Global_Cumflation_Time.GetValue()))
		else
			i = FPFP_Global_Cumflation_Time.GetValueint() as int
		endif
		
		i += 1
	endwhile
EndFunction

Function Cumflation_ResetBody(Actor Ourself)
	If (FPFP_Global_BodyType.GetValue() == 0) ; CBBE Original
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, 0)
	ElseIf (FPFP_Global_BodyType.GetValue() == 1) ; CBBE Redux
		BodyGen.SetMorph(Ourself, true, "BigBelly", FPFP_Cum_Keyword, 0)
	ElseIf (FPFP_Global_BodyType.GetValue() == 2) ; Fusion Girl Original
		BodyGen.SetMorph(Ourself, true, "Belly Big", FPFP_Cum_Keyword, 0)
	ElseIf (FPFP_Global_BodyType.GetValue() == 3) ; Fusion Girl Redux
		bodygen.SetMorph(Ourself, True, "Belly Big", FPFP_Cum_Keyword, 0)
	Else ; JaneBod
		BodyGen.SetMorph(Ourself, true, "BellyFatty", FPFP_Cum_Keyword, 0)

	EndIf
	BodyGen.UpdateMorphs(Ourself)
EndFunction

Function Cumflation_Message_Start(Actor akActor, Actor akMan)
	if akActor == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_Start_Female.Length-1)
		Debug.notification(Message_Start_Female[random_Name])
	elseif akMan == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_Start_Male.Length-1)
		Debug.notification(Message_Start_Male[random_Name])
	endif
EndFunction

Function Cumflation_Message_Middle(Actor akActor, Actor akMan)
	if akActor == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_Middle_Female.Length-1)
		Debug.notification(Message_Middle_Female[random_Name])
	elseif akMan == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_Middle_Male.Length-1)
		Debug.notification(Message_Middle_Male[random_Name])
	endif
EndFunction

Function Cumflation_Message_End(Actor akActor, Actor akMan)
	if akActor == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_End_Female.Length-1)
		Debug.notification(Message_End_Female[random_Name])
	elseif akMan == PlayerREF
		int random_Name = Utility.RandomInt(0, Message_End_Male.Length-1)
		Debug.notification(Message_End_Male[random_Name])
	endif
EndFunction