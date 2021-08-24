Scriptname FPE_Messages extends Quest

Actor Property PlayerREF Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Impreg Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Impreg_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_sex Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_sex_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Move_sex_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Birth Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Birth_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_NPC Auto Const Mandatory
String NPC_String
Race Property HumanRace Auto 

FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Wedding Auto Const

String[] Property Sex_Movement_Player Auto Const
String[] Property Sex_Movement_NPC Auto Const

String[] Property Impregnation_Piper Auto Const
String[] Property Impregnation_Dogmeat Auto Const
String[] Property Impregnation_Cait Auto Const
String[] Property Impregnation_Curie Auto Const
String[] Property Impregnation_Curie_robot Auto Const
String[] Property Impregnation_Danse Auto Const
String[] Property Impregnation_Deacon Auto Const
String[] Property Impregnation_Garvey Auto Const
String[] Property Impregnation_Hancock Auto Const
String[] Property Impregnation_MacCready Auto Const
String[] Property Impregnation_NickValentine Auto Const
String[] Property Impregnation_Strong Auto Const
String[] Property Impregnation_X688 Auto Const
String[] Property Impregnation_Codsworth Auto Const
String[] Property Impregnation_Ada Auto Const
String[] Property Impregnation_LongFellow Auto Const
String[] Property Impregnation_Gage Auto Const
String[] Property Impregnation_Ivy Auto Const
String[] Property Impregnation_SarahLyons Auto Const
String[] Property Impregnation_Harley Auto Const
String[] Property Impregnation_Valkyrie Auto Const
String[] Property Impregnation_Player_M Auto Const
String[] Property Impregnation_Player_F Auto Const
String[] Property Impregnation_NPC Auto Const

String[] Property Marriage_Piper_M Auto Const
String[] Property Marriage_Dogmeat_M Auto Const
String[] Property Marriage_Cait_M Auto Const
String[] Property Marriage_Curie_M Auto Const
String[] Property Marriage_Curie_robot_M Auto Const
String[] Property Marriage_Danse_M Auto Const
String[] Property Marriage_Deacon_M Auto Const
String[] Property Marriage_Garvey_M Auto Const
String[] Property Marriage_Hancock_M Auto Const
String[] Property Marriage_MacCready_M Auto Const
String[] Property Marriage_NickValentine_M Auto Const
String[] Property Marriage_Strong_M Auto Const
String[] Property Marriage_X688_M Auto Const
String[] Property Marriage_Codsworth_M Auto Const
String[] Property Marriage_Ada_M Auto Const
String[] Property Marriage_LongFellow_M Auto Const
String[] Property Marriage_Gage_M Auto Const
String[] Property Marriage_Ivy_M Auto Const
String[] Property Marriage_SarahLyons_M Auto Const
String[] Property Marriage_Harley_M Auto Const
String[] Property Marriage_Valkyrie_M Auto Const
String[] Property Marriage_NPC_M Auto Const

String[] Property Marriage_Piper_F Auto Const
String[] Property Marriage_Dogmeat_F Auto Const
String[] Property Marriage_Cait_F Auto Const
String[] Property Marriage_Curie_F Auto Const
String[] Property Marriage_Curie_robot_F Auto Const
String[] Property Marriage_Danse_F Auto Const
String[] Property Marriage_Deacon_F Auto Const
String[] Property Marriage_Garvey_F Auto Const
String[] Property Marriage_Hancock_F Auto Const
String[] Property Marriage_MacCready_F Auto Const
String[] Property Marriage_NickValentine_F Auto Const
String[] Property Marriage_Strong_F Auto Const
String[] Property Marriage_X688_F Auto Const
String[] Property Marriage_Codsworth_F Auto Const
String[] Property Marriage_Ada_F Auto Const
String[] Property Marriage_LongFellow_F Auto Const
String[] Property Marriage_Gage_F Auto Const
String[] Property Marriage_Ivy_F Auto Const
String[] Property Marriage_SarahLyons_F Auto Const
String[] Property Marriage_Harley_F Auto Const
String[] Property Marriage_Valkyrie_F Auto Const
String[] Property Marriage_NPC_F Auto Const

String[] Property SexMessage_Piper Auto Const
String[] Property SexMessage_Dogmeat Auto Const
String[] Property SexMessage_Cait Auto Const
String[] Property SexMessage_Curie Auto Const
String[] Property SexMessage_Curie_robot Auto Const
String[] Property SexMessage_Danse Auto Const
String[] Property SexMessage_Deacon Auto Const
String[] Property SexMessage_Garvey Auto Const
String[] Property SexMessage_Hancock Auto Const
String[] Property SexMessage_MacCready Auto Const
String[] Property SexMessage_NickValentine Auto Const
String[] Property SexMessage_Strong Auto Const
String[] Property SexMessage_X688 Auto Const
String[] Property SexMessage_Codsworth Auto Const
String[] Property SexMessage_Ada Auto Const
String[] Property SexMessage_LongFellow Auto Const
String[] Property SexMessage_Gage Auto Const
String[] Property SexMessage_Ivy Auto Const
String[] Property SexMessage_SarahLyons Auto Const
String[] Property SexMessage_Harley Auto Const
String[] Property SexMessage_Valkyrie Auto Const
String[] Property SexMessage_Player_M Auto Const
String[] Property SexMessage_Player_F Auto Const
String[] Property SexMessage_NPC Auto Const

String[] Property Birth_Piper Auto Const
String[] Property Birth_Cait Auto Const
String[] Property Birth_Curie Auto Const
String[] Property Birth_Ivy Auto Const
String[] Property Birth_SarahLyons Auto Const
String[] Property Birth_Harley Auto Const
String[] Property Birth_Valkyrie Auto Const
String[] Property Birth_Player_F Auto Const
String[] Property Birth_NPC Auto Const


;Vanilla
Actor Property Piper Auto Const
Actor Property Dogmeat Auto Const
Actor Property Cait Auto Const
Actor Property Curie Auto Const
Actor Property Curie_robot Auto Const
Actor Property Danse Auto Const
Actor Property Deacon Auto Const
Actor Property Garvey Auto Const
Actor Property Hancock Auto Const
Actor Property MacCready Auto Const
Actor Property NickValentine Auto Const
Actor Property Strong Auto Const
Actor Property X688 Auto Const
Actor Property Codsworth Auto Const

Function Sex_Movement(Actor akActor, Actor akMan)
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_MessageType_Move_sex_Chance.GetValue())
		if akActor == PlayerREF || akMan == PlayerREF
			int random_Name = Utility.RandomInt(0, Sex_Movement_Player.Length-1)
			Debug.notification(Sex_Movement_Player[random_Name])
		else
			int random_Name = Utility.RandomInt(0, Sex_Movement_NPC.Length-1)
			Debug.notification(Sex_Movement_NPC[random_Name])
		endif
	endif	
EndFunction

Function Impregnation_Message(Actor akActor, Actor akMan)
	;DLC_Automatron
	Actor Ada = Game.GetFormFromFile(0x00FF12, "Fallout4.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x08598C, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	
	NPC_String = ""
	
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_MessageType_Impreg_Chance.GetValue())
		if akMan == PlayerREF && akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Impregnation_SarahLyons.Length-1)
			NPC_String = Impregnation_SarahLyons[random_Name]
		elseif akMan == PlayerREF && akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, Impregnation_Valkyrie.Length-1)
			NPC_String = Impregnation_Valkyrie[random_Name]
		elseif akMan == PlayerREF && akActor == Piper
			int random_Name = Utility.RandomInt(0, Impregnation_Piper.Length-1)
			NPC_String = Impregnation_Piper[random_Name]
		elseif akMan == PlayerREF && akActor == Cait
			int random_Name = Utility.RandomInt(0, Impregnation_Cait.Length-1)
			NPC_String = Impregnation_Cait[random_Name]
		elseif akMan == PlayerREF && akActor == Curie
			int random_Name = Utility.RandomInt(0, Impregnation_Curie.Length-1)
			NPC_String = Impregnation_Curie[random_Name]
		elseif akMan == PlayerREF && akActor == Ivy
			int random_Name = Utility.RandomInt(0, Impregnation_Ivy.Length-1)
			NPC_String = Impregnation_Ivy[random_Name]
		elseif akMan == Curie_robot && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Curie_robot.Length-1)
			NPC_String = Impregnation_Curie_robot[random_Name]
		elseif akMan == Codsworth && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Codsworth.Length-1)
			NPC_String = Impregnation_Codsworth[random_Name]
		elseif akMan == Dogmeat && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Dogmeat.Length-1)
			NPC_String = Impregnation_Dogmeat[random_Name]
		elseif akMan == Deacon && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Deacon.Length-1)
			NPC_String = Impregnation_Deacon[random_Name]
		elseif akMan == Danse && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Danse.Length-1)
			NPC_String = Impregnation_Danse[random_Name]
		elseif akMan == Garvey && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Garvey.Length-1)
			NPC_String = Impregnation_Garvey[random_Name]
		elseif akMan == Hancock && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Hancock.Length-1)
			NPC_String = Impregnation_Hancock[random_Name]
		elseif akMan == MacCready && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_MacCready.Length-1)
			NPC_String = Impregnation_MacCready[random_Name]
		elseif akMan == NickValentine && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_NickValentine.Length-1)
			NPC_String = Impregnation_NickValentine[random_Name]
		elseif akMan == Strong && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Strong.Length-1)
			NPC_String = Impregnation_Strong[random_Name]
		elseif akMan == X688 && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_X688.Length-1)
			NPC_String = Impregnation_X688[random_Name]
		elseif akMan == LongFellow && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_LongFellow.Length-1)
			NPC_String = Impregnation_LongFellow[random_Name]
		elseif akMan == Gage && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Gage.Length-1)
			NPC_String = Impregnation_Gage[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace
			int random_Name = Utility.RandomInt(0, Impregnation_Player_F.Length-1)
			NPC_String = Impregnation_Player_F[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace
			int random_Name = Utility.RandomInt(0, Impregnation_Player_M.Length-1)
			NPC_String = Impregnation_Player_M[random_Name]
		elseif akMan.GetLeveledActorBase().GetRace() == HumanRace && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_NPC.GetValue() == 1
			int random_Name = Utility.RandomInt(0, Impregnation_NPC.Length-1)
			NPC_String = Impregnation_NPC[random_Name]		
		elseif akActor == PlayerREF && !akMan.GetLeveledActorBase().GetRace() == HumanRace
			NPC_String = FPFP_BabyHandler.WhatsmyLine_Impreg(akMan.GetLeveledActorBase().GetRace())
		else
			int random_Name = Utility.RandomInt(0, Impregnation_NPC.Length-1)
			NPC_String = Impregnation_NPC[random_Name]
		endif
		
		if !NPC_String == ""
			if INVB_Global_MessageType_Impreg.GetValue() == 0 && (akActor == PlayerREF || akMan == PlayerREF)
				Debug.notification(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Impreg.GetValue() == 1 && (akActor == PlayerREF || akMan == PlayerREF)
				Debug.MessageBox(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Impreg.GetValue() == 0 && INVB_Global_MessageType_NPC.GetValue() == 1
				Debug.notification(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Impreg.GetValue() == 1 && INVB_Global_MessageType_NPC.GetValue() == 1
				Debug.MessageBox(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)	
			endif
		endif
		
	endif
EndFunction

Function Marriage_Message_Male(Actor akActor)
	;DLC_Automatron
	Actor Ada = Game.GetFormFromFile(0x00FF12, "Fallout4.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x08598C, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	
		NPC_String = ""
		if akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Marriage_SarahLyons_M.Length-1)
			NPC_String = Marriage_SarahLyons_M[random_Name]
		elseif akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, Marriage_Valkyrie_M.Length-1)
			NPC_String = Marriage_Valkyrie_M[random_Name]
		elseif akActor == Piper
			int random_Name = Utility.RandomInt(0, Marriage_Piper_M.Length-1)
			NPC_String = Marriage_Piper_M[random_Name]
		elseif akActor == Cait
			int random_Name = Utility.RandomInt(0, Marriage_Cait_M.Length-1)
			NPC_String = Marriage_Cait_M[random_Name]
		elseif akActor == Curie
			int random_Name = Utility.RandomInt(0, Marriage_Curie_M.Length-1)
			NPC_String = Marriage_Curie_M[random_Name]
		elseif akActor == Ivy
			int random_Name = Utility.RandomInt(0, Marriage_Ivy_M.Length-1)
			NPC_String = Marriage_Ivy_M[random_Name]
		elseif akActor == Curie_robot
			int random_Name = Utility.RandomInt(0, Marriage_Curie_robot_M.Length-1)
			NPC_String = Marriage_Curie_robot_M[random_Name]
		elseif akActor == Codsworth
			int random_Name = Utility.RandomInt(0, Marriage_Codsworth_M.Length-1)
			NPC_String = Marriage_Codsworth_M[random_Name]
		elseif akActor == Dogmeat
			int random_Name = Utility.RandomInt(0, Marriage_Dogmeat_M.Length-1)
			NPC_String = Marriage_Dogmeat_M[random_Name]
		elseif akActor == Deacon
			int random_Name = Utility.RandomInt(0, Marriage_Deacon_M.Length-1)
			NPC_String = Marriage_Deacon_M[random_Name]
		elseif akActor == Danse
			int random_Name = Utility.RandomInt(0, Marriage_Danse_M.Length-1)
			NPC_String = Marriage_Danse_M[random_Name]
		elseif akActor == Garvey
			int random_Name = Utility.RandomInt(0, Marriage_Garvey_M.Length-1)
			NPC_String = Marriage_Garvey_M[random_Name]
		elseif akActor == Hancock
			int random_Name = Utility.RandomInt(0, Marriage_Hancock_M.Length-1)
			NPC_String = Marriage_Hancock_M[random_Name]
		elseif akActor == MacCready
			int random_Name = Utility.RandomInt(0, Marriage_MacCready_M.Length-1)
			NPC_String = Marriage_MacCready_M[random_Name]
		elseif akActor == NickValentine
			int random_Name = Utility.RandomInt(0, Marriage_NickValentine_M.Length-1)
			NPC_String = Marriage_NickValentine_M[random_Name]
		elseif akActor == Strong
			int random_Name = Utility.RandomInt(0, Marriage_Strong_M.Length-1)
			NPC_String = Marriage_Strong_M[random_Name]
		elseif akActor == X688
			int random_Name = Utility.RandomInt(0, Marriage_X688_M.Length-1)
			NPC_String = Marriage_X688_M[random_Name]
		elseif akActor == LongFellow
			int random_Name = Utility.RandomInt(0, Marriage_LongFellow_M.Length-1)
			NPC_String = Marriage_LongFellow_M[random_Name]
		elseif akActor == Gage
			int random_Name = Utility.RandomInt(0, Marriage_Gage_M.Length-1)
			NPC_String = Marriage_Gage_M[random_Name]
		elseif akActor.GetLeveledActorBase().GetRace() == HumanRace
			int random_Name = Utility.RandomInt(0, Marriage_NPC_M.Length-1)
			NPC_String = Marriage_NPC_M[random_Name]
		else
			int random_Name = Utility.RandomInt(0, Marriage_NPC_M.Length-1)
			NPC_String = Marriage_NPC_M[random_Name]	
		endif
		
		if akActor != PlayerREF
			if INVB_Global_MessageType_Wedding.GetValue() == 0
				Debug.notification(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Wedding.GetValue() == 1
				Debug.MessageBox(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)	
			endif
		endif
EndFunction

Function Marriage_Message_Female(Actor akActor)
	;DLC_Automatron
	Actor Ada = Game.GetFormFromFile(0x00FF12, "Fallout4.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x08598C, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	
		NPC_String = ""
		if akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Marriage_SarahLyons_F.Length-1)
			NPC_String = Marriage_SarahLyons_F[random_Name]
		elseif akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, Marriage_Valkyrie_F.Length-1)
			NPC_String = Marriage_Valkyrie_F[random_Name]
		elseif akActor == Piper
			int random_Name = Utility.RandomInt(0, Marriage_Piper_F.Length-1)
			NPC_String = Marriage_Piper_F[random_Name]
		elseif akActor == Cait
			int random_Name = Utility.RandomInt(0, Marriage_Cait_F.Length-1)
			NPC_String = Marriage_Cait_F[random_Name]
		elseif akActor == Curie
			int random_Name = Utility.RandomInt(0, Marriage_Curie_F.Length-1)
			NPC_String = Marriage_Curie_F[random_Name]
		elseif akActor == Ivy
			int random_Name = Utility.RandomInt(0, Marriage_Ivy_F.Length-1)
			NPC_String = Marriage_Ivy_F[random_Name]
		elseif akActor == Curie_robot
			int random_Name = Utility.RandomInt(0, Marriage_Curie_robot_F.Length-1)
			NPC_String = Marriage_Curie_robot_F[random_Name]
		elseif akActor == Codsworth
			int random_Name = Utility.RandomInt(0, Marriage_Codsworth_F.Length-1)
			NPC_String = Marriage_Codsworth_F[random_Name]
		elseif akActor == Dogmeat
			int random_Name = Utility.RandomInt(0, Marriage_Dogmeat_F.Length-1)
			NPC_String = Marriage_Dogmeat_F[random_Name]
		elseif akActor == Deacon
			int random_Name = Utility.RandomInt(0, Marriage_Deacon_F.Length-1)
			NPC_String = Marriage_Deacon_F[random_Name]
		elseif akActor == Danse
			int random_Name = Utility.RandomInt(0, Marriage_Danse_F.Length-1)
			NPC_String = Marriage_Danse_F[random_Name]
		elseif akActor == Garvey
			int random_Name = Utility.RandomInt(0, Marriage_Garvey_F.Length-1)
			NPC_String = Marriage_Garvey_F[random_Name]
		elseif akActor == Hancock
			int random_Name = Utility.RandomInt(0, Marriage_Hancock_F.Length-1)
			NPC_String = Marriage_Hancock_F[random_Name]
		elseif akActor == MacCready
			int random_Name = Utility.RandomInt(0, Marriage_MacCready_F.Length-1)
			NPC_String = Marriage_MacCready_F[random_Name]
		elseif akActor == NickValentine
			int random_Name = Utility.RandomInt(0, Marriage_NickValentine_F.Length-1)
			NPC_String = Marriage_NickValentine_F[random_Name]
		elseif akActor == Strong
			int random_Name = Utility.RandomInt(0, Marriage_Strong_F.Length-1)
			NPC_String = Marriage_Strong_F[random_Name]
		elseif akActor == X688
			int random_Name = Utility.RandomInt(0, Marriage_X688_F.Length-1)
			NPC_String = Marriage_X688_F[random_Name]
		elseif akActor == LongFellow
			int random_Name = Utility.RandomInt(0, Marriage_LongFellow_F.Length-1)
			NPC_String = Marriage_LongFellow_F[random_Name]
		elseif akActor == Gage
			int random_Name = Utility.RandomInt(0, Marriage_Gage_F.Length-1)
			NPC_String = Marriage_Gage_F[random_Name]
		elseif akActor.GetLeveledActorBase().GetRace() == HumanRace
			int random_Name = Utility.RandomInt(0, Marriage_NPC_F.Length-1)
			NPC_String = Marriage_NPC_F[random_Name]
		else
			int random_Name = Utility.RandomInt(0, Marriage_NPC_F.Length-1)
			NPC_String = Marriage_NPC_F[random_Name]	
		endif
		
		if akActor != PlayerREF
			if INVB_Global_MessageType_Wedding.GetValue() == 0
				Debug.notification(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Wedding.GetValue() == 1
				Debug.MessageBox(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)	
			endif
		endif
EndFunction



Function Sex_Message(Actor akActor, Actor akMan)
	;DLC_Automatron
	Actor Ada = Game.GetFormFromFile(0x00FF12, "Fallout4.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x08598C, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	
		NPC_String = ""
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_MessageType_sex_Chance.GetValue())
		if akMan == PlayerREF && akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, SexMessage_SarahLyons.Length-1)
			NPC_String = SexMessage_SarahLyons[random_Name]
		elseif akMan == PlayerREF && akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, SexMessage_Valkyrie.Length-1)
			NPC_String = SexMessage_Valkyrie[random_Name]
		elseif akMan == PlayerREF && akActor == Piper
			int random_Name = Utility.RandomInt(0, SexMessage_Piper.Length-1)
			NPC_String = SexMessage_Piper[random_Name]
		elseif akMan == PlayerREF && akActor == Cait
			int random_Name = Utility.RandomInt(0, SexMessage_Cait.Length-1)
			NPC_String = SexMessage_Cait[random_Name]
		elseif akMan == PlayerREF && akActor == Curie
			int random_Name = Utility.RandomInt(0, SexMessage_Curie.Length-1)
			NPC_String = SexMessage_Curie[random_Name]
		elseif akMan == PlayerREF && akActor == Ivy
			int random_Name = Utility.RandomInt(0, SexMessage_Ivy.Length-1)
			NPC_String = SexMessage_Ivy[random_Name]
		elseif akMan == Curie_robot && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Curie_robot.Length-1)
			NPC_String = SexMessage_Curie_robot[random_Name]
		elseif akMan == Codsworth && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Codsworth.Length-1)
			NPC_String = SexMessage_Codsworth[random_Name]
		elseif akMan == Dogmeat && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Dogmeat.Length-1)
			NPC_String = SexMessage_Dogmeat[random_Name]
		elseif akMan == Deacon && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Deacon.Length-1)
			NPC_String = SexMessage_Deacon[random_Name]
		elseif akMan == Danse && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Danse.Length-1)
			NPC_String = SexMessage_Danse[random_Name]
		elseif akMan == Garvey && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Garvey.Length-1)
			NPC_String = SexMessage_Garvey[random_Name]
		elseif akMan == Hancock && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Hancock.Length-1)
			NPC_String = SexMessage_Hancock[random_Name]
		elseif akMan == MacCready && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_MacCready.Length-1)
			NPC_String = SexMessage_MacCready[random_Name]
		elseif akMan == NickValentine && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_NickValentine.Length-1)
			NPC_String = SexMessage_NickValentine[random_Name]
		elseif akMan == Strong && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Strong.Length-1)
			NPC_String = SexMessage_Strong[random_Name]
		elseif akMan == X688 && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_X688.Length-1)
			NPC_String = SexMessage_X688[random_Name]
		elseif akMan == LongFellow && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_LongFellow.Length-1)
			NPC_String = SexMessage_LongFellow[random_Name]
		elseif akMan == Gage && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Gage.Length-1)
			NPC_String = SexMessage_Gage[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace
			int random_Name = Utility.RandomInt(0, SexMessage_Player_F.Length-1)
			NPC_String = SexMessage_Player_F[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace
			int random_Name = Utility.RandomInt(0, SexMessage_Player_M.Length-1)
			NPC_String = SexMessage_Player_M[random_Name]
		elseif akMan.GetLeveledActorBase().GetRace() == HumanRace && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_NPC.GetValue() == 1
			int random_Name = Utility.RandomInt(0, SexMessage_NPC.Length-1)
			NPC_String = SexMessage_NPC[random_Name]		
		elseif akActor == PlayerREF && !akMan.GetLeveledActorBase().GetRace() == HumanRace
			NPC_String = FPFP_BabyHandler.WhatsmyLine(akMan.GetLeveledActorBase().GetRace())
		else
			int random_Name = Utility.RandomInt(0, SexMessage_NPC.Length-1)
			NPC_String = SexMessage_NPC[random_Name]	
		endif
	endif
	
	if !NPC_String == ""
		if INVB_Global_MessageType_sex.GetValue() == 0 && (akActor == PlayerREF || akMan == PlayerREF)
			Debug.notification(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
		elseif INVB_Global_MessageType_sex.GetValue() == 1 && (akActor == PlayerREF || akMan == PlayerREF)
			Debug.MessageBox(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
		elseif INVB_Global_MessageType_sex.GetValue() == 0 && INVB_Global_MessageType_NPC.GetValue() == 1
			Debug.notification(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)
		elseif INVB_Global_MessageType_sex.GetValue() == 1 && INVB_Global_MessageType_NPC.GetValue() == 1
			Debug.MessageBox(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)
		endif
	endif
EndFunction

Function Birth_Death(Actor akActor)
	NPC_String = " Has Died giving Birth"

	if INVB_Global_MessageType_Birth.GetValue() == 0
		Debug.notification(akActor.Getname() + NPC_String)
	elseif INVB_Global_MessageType_Birth.GetValue() == 1
		Debug.MessageBox(akActor.Getname() + NPC_String)
	endif
	
EndFunction

Function BirthMessage(Actor akActor, Race akDadRace)
	;DLC_Automatron
	Actor Ada = Game.GetFormFromFile(0x00FF12, "Fallout4.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x08598C, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	
		NPC_String = ""
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_MessageType_Birth_Chance.GetValue())
		if akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Birth_SarahLyons.Length-1)
			NPC_String = Birth_SarahLyons[random_Name]
		elseif akActor == Piper
			int random_Name = Utility.RandomInt(0, Birth_Piper.Length-1)
			NPC_String = Birth_Piper[random_Name]
		elseif akActor == Cait
			int random_Name = Utility.RandomInt(0, Birth_Cait.Length-1)
			NPC_String = Birth_Cait[random_Name]
		elseif akActor == Curie
			int random_Name = Utility.RandomInt(0, Birth_Curie.Length-1)
			NPC_String = Birth_Curie[random_Name]
		elseif akActor == Ivy
			int random_Name = Utility.RandomInt(0, Birth_Ivy.Length-1)
			NPC_String = Birth_Ivy[random_Name]
		elseif akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Birth_Player_F.Length-1)
			NPC_String = Birth_Player_F[random_Name]
		elseif akDadRace != HumanRace && akDadRace != None
			NPC_String = FPFP_BabyHandler.WhatsmyLine_Birth(akDadRace)	
		else
			int random_Name = Utility.RandomInt(0, Birth_NPC.Length-1)
			NPC_String = Birth_NPC[random_Name]
		endif
		
		if !NPC_String == ""
			if INVB_Global_MessageType_Birth.GetValue() == 0 && akActor == PlayerREF
				Debug.notification(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Birth.GetValue() == 1 && akActor == PlayerREF
				Debug.MessageBox(PlayerREF.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Birth.GetValue() == 0
				Debug.notification(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)
			elseif INVB_Global_MessageType_Birth.GetValue() == 1
				Debug.MessageBox(akActor.GetLeveledActorBase().GetName() +": "+ NPC_String)	
			endif
		endif	
	endif
EndFunction