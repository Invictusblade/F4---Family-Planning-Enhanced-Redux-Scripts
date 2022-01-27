Scriptname FPE_Messages_Ring extends ObjectReference

Keyword Property ActorTypeHuman Auto const
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
String NPC_Question
String NPC_Answer

Event OnEquipped(Actor akActor)
	if !akActor.HasPerk(WLD_Perk_Married) || !akActor.HasPerk(WLD_Perk_Married_2) || !akActor.HasPerk(WLD_Perk_Married_Poly) || !akActor.HasPerk(WLD_Perk_Married_Harem)
		int random_LList = Utility.RandomInt(1, 100)
		
		
		if (random_LList <= INVB_Global_Marriage_Chance.GetValue())
			int random_Start = Utility.RandomInt(1, 2)
			if akActor.wornHasKeyword(kw_Chain)
				NPC_Question = "Will you Submit to Me?"
			elseif (random_Start == 1)
				NPC_Question = "Will you Marry Me?"
			elseif (random_Start == 2)
				NPC_Question = "Do you want to Join me Forever?"
				
			endif
			
			if INVB_Global_MessageType_Wedding.GetValue() == 0
				Debug.notification(PlayerREF.GetLeveledActorBase().GetName() +": "+NPC_Question +"   "+ akActor.GetLeveledActorBase().GetName() +": "+ NPC_Answer)
			elseif INVB_Global_MessageType_Wedding.GetValue() == 1
				Debug.MessageBox(PlayerREF.GetLeveledActorBase().GetName() +": "+NPC_Question +"   "+ akActor.GetLeveledActorBase().GetName() +": "+ NPC_Answer)
			else	
			endif
		
		
		
			if INVB_Global_Marriage_Polygamy.GetValue() == 0 && !PlayerREF.HasPerk(WLD_Perk_Married)
				Marriage_Message(akActor, PlayerREF)
			elseif INVB_Global_Marriage_Polygamy.GetValue() == 1
				Marriage_Message(akActor, PlayerREF)
			else
				Debug.notification(PlayerREF.GetLeveledActorBase().GetName() +" is Already Married(Again)")
				akActor.unequipitem(self)
				PlayerREF.additem(self)
				akActor.removeitem(self)
			endif
			
			
		
		else
			akActor.unequipitem(self)
			PlayerREF.additem(self)
			akActor.removeitem(self)
			
			if INVB_Global_MessageType_Wedding.GetValue() == 0
				Debug.notification(akActor.GetLeveledActorBase().GetName() +": Will you Marry Me?,   "+ akActor.GetLeveledActorBase().GetName() +": NO")
			elseif INVB_Global_MessageType_Wedding.GetValue() == 1
				Debug.MessageBox(akActor.GetLeveledActorBase().GetName() +": Will you Marry Me?,   "+ akActor.GetLeveledActorBase().GetName() +": NO")
			else	
			endif
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
		
	endif	
	
EndEvent


Function Marriage_Message(Actor akActor, Actor akMan)
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
	
	
	if akMan == PlayerREF && akActor == SarahLyons && PlayerREF.HasPerk(SarahLyons_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == PlayerREF && akActor == Valkyrie && PlayerREF.HasPerk(Valkyrie_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == PlayerREF && akActor == Piper && PlayerREF.HasPerk(Piper_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			int random_Start = Utility.RandomInt(1, 2)
			if (random_Start == 1)
				NPC_Answer = "Will you Marry Me?"
			elseif (random_Start == 2)
				NPC_Answer = "I will announce in the newspaper that we are looking for a man to make us babies."
			endif
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == PlayerREF && akActor == Cait && PlayerREF.HasPerk(Cait_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			int random_Start = Utility.RandomInt(1, 2)
			if (random_Start == 1)
				NPC_Answer = "Will you Marry Me?"
			elseif (random_Start == 2)
				NPC_Answer = "Let's kidnap a man, beat him up and force him to make us babies."
			endif
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == PlayerREF && akActor == Curie && PlayerREF.HasPerk(Curie_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			int random_Start = Utility.RandomInt(1, 2)
			if (random_Start == 1)
				NPC_Answer = "Will you Marry Me?"
			elseif (random_Start == 2)
				NPC_Answer = "Let's get pregnant together, for scientific purposes, of course."
			endif
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == PlayerREF && akActor == Ivy && PlayerREF.HasPerk(Ivy_Perk)
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == Deacon && PlayerREF.HasPerk(Deacon_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == Danse && PlayerREF.HasPerk(Danse_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == Garvey && PlayerREF.HasPerk(Garvey_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == Hancock && PlayerREF.HasPerk(Hancock_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == MacCready && PlayerREF.HasPerk(MacCready_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == NickValentine && PlayerREF.HasPerk(NickValentine_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == Strong && PlayerREF.HasPerk(Strong_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == X688 && PlayerREF.HasPerk(X688_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == LongFellow && PlayerREF.HasPerk(LongFellow_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == Gage && PlayerREF.HasPerk(Gage_Perk) && akActor == PlayerREF
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	elseif akMan == Dogmeat && akActor == PlayerREF && akActor.wornHasKeyword(kw_Chain)
		if PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Woof"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)	
	elseif akMan == PlayerREF && akActor.HasKeyword(ActorTypeHuman) && INVB_Global_Marriage_NPCs.GetValue() == 1
		if PlayerREF.GetLeveledActorBase().GetSex() == 0
			NPC_Answer = "Will you Marry Me?"
		elseif PlayerREF.GetLeveledActorBase().GetSex() == 1
			NPC_Answer = "Will you Marry Me?"
		endif
		akActor.AddPerk(WLD_Perk_Married)
		INVB_Global_Marriage_Count_Current.setvalue(INVB_Global_Marriage_Count_Current.getvalue() + 1)
	endif
EndFunction