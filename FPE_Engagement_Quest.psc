Scriptname FPE_Engagement_Quest extends Quest

Actor Property PlayerREF Auto Const
GlobalVariable property INVB_Global_Marriage_Polygamy Auto
GlobalVariable property INVB_Global_Marriage_Count_Current Auto
GlobalVariable property INVB_Global_MessageType_Wedding Auto Const
GlobalVariable property INVB_Global_Marriage_Chance Auto
GlobalVariable property INVB_Global_Marriage_NPCs Auto
Perk Property WLD_Perk_Married Auto
Perk Property WLD_Perk_Married_2 Auto
Perk Property WLD_Perk_Married_Poly Auto
Perk Property WLD_Perk_Married_Harem Auto
Keyword Property kw_Chain Auto const
String[] Property NPC_Question_Chain Auto Const
String[] Property NPC_Question Auto Const
String[] Property NPC_Answer_Reject Auto Const
String NPC_String
String NPC_String_Reject
aaf:aaf_api AAF_API 
GlobalVariable property INVB_Global_Marriage_Honeynoon Auto
GlobalVariable property INVB_Global_Marriage_Honeynoon_Duration Auto
FPE_Messages Property FPFP_Messages Auto Const Mandatory

Function Engagement(Actor akActor, bool bool_Submit)
	if INVB_Global_Marriage_Polygamy.GetValue() == 1 || (INVB_Global_Marriage_Polygamy.GetValue() == 0 && !PlayerREF.HasPerk(WLD_Perk_Married))
		int random_LList = Utility.RandomInt(1, 100)
		
		if (random_LList <= INVB_Global_Marriage_Chance.GetValue())
			if bool_Submit == true
				int random_Name = Utility.RandomInt(0, NPC_Question_Chain.Length-1)
				NPC_String = NPC_Question_Chain[random_Name]
			else
				int random_Name = Utility.RandomInt(0, NPC_Question.Length-1)
				NPC_String = NPC_Question[random_Name]
			endif
		
			if INVB_Global_MessageType_Wedding.GetValue() == 0
				Debug.notification(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Wedding.GetValue() == 1
				Debug.MessageBox(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			endif
		
			Marriage_Message(akActor)
			
			if INVB_Global_Marriage_Honeynoon.GetValue() == 1 && akActor != PlayerREF && akActor.HasPerk(WLD_Perk_Married) || akActor.HasPerk(WLD_Perk_Married_2) || akActor.HasPerk(WLD_Perk_Married_Poly) || akActor.HasPerk(WLD_Perk_Married_Harem)
				Utility.wait(2.5 as float)
				FPFP_Messages.Sex_Message(PlayerREF, akActor)
				Utility.wait(2.5 as float)
					
				Actor[] Actors = new Actor[2]
				Actors[0] = PlayerREF
				Actors[1] = akActor
				AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
				settings.duration = INVB_Global_Marriage_Honeynoon_Duration.GetValue()
				settings.excludeTags = "Spanking,Jackoff,Pose,Utility,Tease,Foreplay,Finish,TitJob"
				aaf:aaf_api.GetAPI().StartScene(Actors, settings)
			endif
			
			if INVB_Global_Marriage_Count_Current.getvalue() == 1
				PlayerREF.addperk(WLD_Perk_Married)
				PlayerREF.removeperk(WLD_Perk_Married_2)
			elseif INVB_Global_Marriage_Count_Current.getvalue() == 2
				PlayerREF.addperk(WLD_Perk_Married_2)
				PlayerREF.removeperk(WLD_Perk_Married)
			elseif INVB_Global_Marriage_Count_Current.getvalue() > 10
				PlayerREF.addperk(WLD_Perk_Married_Harem)
				PlayerREF.removeperk(WLD_Perk_Married_Poly)
			elseif INVB_Global_Marriage_Count_Current.getvalue() > 3
				PlayerREF.addperk(WLD_Perk_Married_Poly)
				PlayerREF.removeperk(WLD_Perk_Married_2)
			endif
		else
			if bool_Submit == true
				int random_Name = Utility.RandomInt(0, NPC_Question_Chain.Length-1)
				NPC_String = NPC_Question_Chain[random_Name]
			else
				int random_Name = Utility.RandomInt(0, NPC_Question.Length-1)
				NPC_String = NPC_Question[random_Name]
			endif
				int random_Name = Utility.RandomInt(0, NPC_Answer_Reject.Length-1)
				NPC_String_Reject = NPC_Answer_Reject[random_Name]
				
			if INVB_Global_MessageType_Wedding.GetValue() == 0
				Debug.notification(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Wedding.GetValue() == 1
				Debug.MessageBox(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			endif
		
			if INVB_Global_MessageType_Wedding.GetValue() == 0
				Debug.notification(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String_Reject)
			elseif INVB_Global_MessageType_Wedding.GetValue() == 1
				Debug.MessageBox(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String_Reject)
			endif
		endif
	endif
EndFunction

Function LoadAAF()
	Quest Main = Game.GetFormFromFile(0x01000F99, "AAF.esm") as quest
	AAF_API = Game.GetFormFromFile(0x01000F99, "AAF.esm") as aaf:aaf_api
	If (!AAF_API)
		Debug.Notification("Can't find AAF API.")
		Utility.wait(0.1)
	Else
		AAF_API = Main as AAF:AAF_API
		RegisterForCustomEvent(AAF_API, "OnAnimationStop")
	EndIf
EndFunction

Event OnInit()
	Self.LoadAAF()
EndEvent

Event AAF:AAF_API.OnAnimationStop(AAF:AAF_API akSender, Var[] akArgs)

	Actor Actor0 = None
	Actor Actor1 = None
	Actor[] Actors = Utility.VarToVarArray(akArgs[1]) as Actor[]
	If (Actors.length > 0)
		If (Actors[0] != PlayerREF && Actors[1] != PlayerREF)
			Actor0 = Actors[0]
			Actor1 = Actors[1]
		EndIf
	EndIf
EndEvent


Function Marriage_Message(Actor akActor)
	;Vanilla
	Actor Piper = Game.GetFormFromFile(0x002F1F, "Fallout4.esm") as Actor
	Perk Piper_Perk = Game.GetFormFromFile(0x178D54, "Fallout4.esm") as Perk
	Actor Cait = Game.GetFormFromFile(0x079305, "Fallout4.esm") as Actor
	Perk Cait_Perk = Game.GetFormFromFile(0x1F4187, "Fallout4.esm") as Perk
	Actor Curie = Game.GetFormFromFile(0x102249, "Fallout4.esm") as Actor
	Perk Curie_Perk = Game.GetFormFromFile(0x1E67BC, "Fallout4.esm") as Perk
	Actor Danse = Game.GetFormFromFile(0x05DE4D, "Fallout4.esm") as Actor
	Perk Danse_Perk = Game.GetFormFromFile(0x08428D, "Fallout4.esm") as Perk
	Actor Deacon = Game.GetFormFromFile(0x050976, "Fallout4.esm") as Actor
	Perk Deacon_Perk = Game.GetFormFromFile(0x08530E, "Fallout4.esm") as Perk
	Actor Dogmeat = Game.GetFormFromFile(0x01D162, "Fallout4.esm") as Actor
	Actor Garvey = Game.GetFormFromFile(0x01A4D7, "Fallout4.esm") as Actor
	Perk Garvey_Perk = Game.GetFormFromFile(0x084298, "Fallout4.esm") as Perk
	Actor Hancock = Game.GetFormFromFile(0x022615, "Fallout4.esm") as Actor
	Perk Hancock_Perk = Game.GetFormFromFile(0x178D57, "Fallout4.esm") as Perk
	Actor MacCready = Game.GetFormFromFile(0x02A8A7, "Fallout4.esm") as Actor
	Perk MacCready_Perk = Game.GetFormFromFile(0x178D50, "Fallout4.esm") as Perk
	Actor NickValentine = Game.GetFormFromFile(0x002F25, "Fallout4.esm") as Actor
	Perk NickValentine_Perk = Game.GetFormFromFile(0x1E67BD, "Fallout4.esm") as Perk
	Actor Strong = Game.GetFormFromFile(0x03F2BB, "Fallout4.esm") as Actor
	Perk Strong_Perk = Game.GetFormFromFile(0x084290, "Fallout4.esm") as Perk
	Actor X688 = Game.GetFormFromFile(0x0E210A, "Fallout4.esm") as Actor
	Perk X688_Perk = Game.GetFormFromFile(0x0842A0, "Fallout4.esm") as Perk
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	Perk LongFellow_Perk = Game.GetFormFromFile(0x018621, "DLCCoast.esm") as Perk
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	Perk Gage_Perk = Game.GetFormFromFile(0x0479EF, "DLCNukaWorld.esm") as Perk
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	Perk Ivy_Perk = Game.GetFormFromFile(0x0359B3, "CompanionIvy.esm") as Perk
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	Perk SarahLyons_Perk = Game.GetFormFromFile(0x1413EE, "OutcastsAndRemnants.esp") as Perk

	;Depravity
	Actor Harley = Game.GetFormFromFile(0x08598C, "Depravity.esp") as Actor
	Perk Harley_Perk = Game.GetFormFromFile(0x08598C, "Depravity.esp") as Perk
	
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	Perk Valkyrie_Perk = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Perk
	
	
	if akActor == SarahLyons && PlayerREF.HasPerk(SarahLyons_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Valkyrie && PlayerREF.HasPerk(Valkyrie_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Piper && PlayerREF.HasPerk(Piper_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Cait && PlayerREF.HasPerk(Cait_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Curie && PlayerREF.HasPerk(Curie_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Ivy && PlayerREF.HasPerk(Ivy_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Deacon && PlayerREF.HasPerk(Deacon_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Danse && PlayerREF.HasPerk(Danse_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Garvey && PlayerREF.HasPerk(Garvey_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Hancock && PlayerREF.HasPerk(Hancock_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == MacCready && PlayerREF.HasPerk(MacCready_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == NickValentine && PlayerREF.HasPerk(NickValentine_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Strong && PlayerREF.HasPerk(Strong_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == X688 && PlayerREF.HasPerk(X688_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == LongFellow && PlayerREF.HasPerk(LongFellow_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Gage && PlayerREF.HasPerk(Gage_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akActor == Dogmeat && akActor.wornHasKeyword(kw_Chain)
		if PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)	
	elseif INVB_Global_Marriage_NPCs.GetValue() == 1
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			FPFP_Messages.Marriage_Message_Male(akActor)
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			FPFP_Messages.Marriage_Message_Female(akActor)
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	endif
EndFunction