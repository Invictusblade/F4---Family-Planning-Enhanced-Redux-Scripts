Scriptname FPE_Messages extends Quest

Actor Property PlayerREF Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Impreg Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Roleplay Auto Const Mandatory
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

String[] Property Impregnation_Heather Auto Const
String[] Property Impregnation_Ellen Auto Const
String[] Property Impregnation_Cass Auto Const
String[] Property Impregnation_Arcade Auto Const
String[] Property Impregnation_Boone Auto Const
String[] Property Impregnation_Raul Auto Const
String[] Property Impregnation_Veronica Auto Const
String[] Property Impregnation_Roxy Auto Const
String[] Property Impregnation_Raven Auto Const
String[] Property Impregnation_Taryn Auto Const
String[] Property Impregnation_Sloan Auto Const
String[] Property Impregnation_Sadie Auto Const
String[] Property Impregnation_Raina Auto Const
String[] Property Impregnation_Alerios Auto Const
String[] Property Impregnation_Tina Auto Const
String[] Property Impregnation_Eden Auto Const
String[] Property Impregnation_Cruz Auto Const
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
String[] Property Impregnation_Player_M_NotNate Auto Const
String[] Property Impregnation_Player_F_NotNora Auto Const
String[] Property Impregnation_Player_M_Violent Auto Const
String[] Property Impregnation_Player_F_Violent Auto Const
String[] Property Impregnation_Player_M_Enclave Auto Const
String[] Property Impregnation_Player_F_Enclave Auto Const
String[] Property Impregnation_Player_M_BoS Auto Const
String[] Property Impregnation_Player_F_BoS Auto Const
String[] Property Impregnation_Player_M_Swinger Auto Const
String[] Property Impregnation_Player_F_Swinger Auto Const
String[] Property Impregnation_NPC Auto Const

String[] Property Marriage_Heather_M Auto Const
String[] Property Marriage_Ellen_M Auto Const
String[] Property Marriage_Cass_M Auto Const
String[] Property Marriage_Arcade_M Auto Const
String[] Property Marriage_Boone_M Auto Const
String[] Property Marriage_Raul_M Auto Const
String[] Property Marriage_Veronica_M Auto Const
String[] Property Marriage_Raven_M Auto Const
String[] Property Marriage_Taryn_M Auto Const
String[] Property Marriage_Sloan_M Auto Const
String[] Property Marriage_Sadie_M Auto Const
String[] Property Marriage_Raina_M Auto Const
String[] Property Marriage_Alerios_M Auto Const
String[] Property Marriage_Tina_M Auto Const
String[] Property Marriage_Eden_M Auto Const
String[] Property Marriage_Cruz_M Auto Const
String[] Property Marriage_Roxy_M Auto Const
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

String[] Property Marriage_Heather_F Auto Const
String[] Property Marriage_Ellen_F Auto Const
String[] Property Marriage_Cass_F Auto Const
String[] Property Marriage_Arcade_F Auto Const
String[] Property Marriage_Boone_F Auto Const
String[] Property Marriage_Raul_F Auto Const
String[] Property Marriage_Veronica_F Auto Const
String[] Property Marriage_Raven_F Auto Const
String[] Property Marriage_Taryn_F Auto Const
String[] Property Marriage_Sloan_F Auto Const
String[] Property Marriage_Sadie_F Auto Const
String[] Property Marriage_Raina_F Auto Const
String[] Property Marriage_Alerios_F Auto Const
String[] Property Marriage_Tina_F Auto Const
String[] Property Marriage_Eden_F Auto Const
String[] Property Marriage_Cruz_F Auto Const
String[] Property Marriage_Roxy_F Auto Const
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

String[] Property SexMessage_Heather Auto Const
String[] Property SexMessage_Ellen Auto Const
String[] Property SexMessage_Cass Auto Const
String[] Property SexMessage_Arcade Auto Const
String[] Property SexMessage_Boone Auto Const
String[] Property SexMessage_Raul Auto Const
String[] Property SexMessage_Veronica Auto Const
String[] Property SexMessage_Raven Auto Const
String[] Property SexMessage_Taryn Auto Const
String[] Property SexMessage_Sloan Auto Const
String[] Property SexMessage_Sadie Auto Const
String[] Property SexMessage_Raina Auto Const
String[] Property SexMessage_Alerios Auto Const
String[] Property SexMessage_Tina Auto Const
String[] Property SexMessage_Eden Auto Const
String[] Property SexMessage_Cruz Auto Const
String[] Property SexMessage_Roxy Auto Const
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
String[] Property SexMessage_Player_M_NotNate Auto Const
String[] Property SexMessage_Player_F_NotNora Auto Const
String[] Property SexMessage_Player_M_Violent Auto Const
String[] Property SexMessage_Player_F_Violent Auto Const
String[] Property SexMessage_Player_M_Enclave Auto Const
String[] Property SexMessage_Player_F_Enclave Auto Const
String[] Property SexMessage_Player_M_BoS Auto Const
String[] Property SexMessage_Player_F_BoS Auto Const
String[] Property SexMessage_Player_M_Swinger Auto Const
String[] Property SexMessage_Player_F_Swinger Auto Const
String[] Property SexMessage_NPC Auto Const

String[] Property Birth_Heather Auto Const
String[] Property Birth_Ellen Auto Const
String[] Property Birth_Cass Auto Const
String[] Property Birth_Veronica Auto Const
String[] Property Birth_Raven Auto Const
String[] Property Birth_Taryn Auto Const
String[] Property Birth_Sloan Auto Const
String[] Property Birth_Sadie Auto Const
String[] Property Birth_Raina Auto Const
String[] Property Birth_Tina Auto Const
String[] Property Birth_Eden Auto Const
String[] Property Birth_Cruz Auto Const
String[] Property Birth_Roxy Auto Const
String[] Property Birth_Piper Auto Const
String[] Property Birth_Cait Auto Const
String[] Property Birth_Curie Auto Const
String[] Property Birth_Ivy Auto Const
String[] Property Birth_SarahLyons Auto Const
String[] Property Birth_Harley Auto Const
String[] Property Birth_Valkyrie Auto Const
String[] Property Birth_Player_F Auto Const
String[] Property Birth_NPC Auto Const


String[] Property Birth_Player_F_NotNora Auto Const
String[] Property Birth_Player_F_Violent Auto Const
String[] Property Birth_Player_F_Enclave Auto Const
String[] Property Birth_Player_F_BoS Auto Const
String[] Property Birth_Player_F_Swinger Auto Const





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
Actor Property V81_TinaDeLuca Auto Const

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
	Actor Ada = Game.GetFormFromFile(0x00FF12, "DLCRobot.esm") as Actor
	Actor Cruz = Game.GetFormFromFile(0x00097C, "DLCRobot.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x215F51, "Depravity.esp") as Actor
	Actor Roxy = Game.GetFormFromFile(0x0A5BA2, "Depravity.esp") as Actor
	Actor Eden = Game.GetFormFromFile(0x1EB177, "Depravity.esp") as Actor
	Actor Raven = Game.GetFormFromFile(0x21A3CE, "Depravity.esp") as Actor
	Actor Taryn = Game.GetFormFromFile(0x21E820, "Depravity.esp") as Actor
	Actor Sloan = Game.GetFormFromFile(0x21E821, "Depravity.esp") as Actor
	Actor Sadie = Game.GetFormFromFile(0x222C72, "Depravity.esp") as Actor
	Actor Raina = Game.GetFormFromFile(0x26FC4F, "Depravity.esp") as Actor
	Actor Cruz_DP = Game.GetFormFromFile(0x933115, "Depravity.esp") as Actor
	Actor Tina_DP = Game.GetFormFromFile(0x9733D1, "Depravity.esp") as Actor
	Actor Alerios = Game.GetFormFromFile(0x341458, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	;FNVCompanions
	Actor Cass = Game.GetFormFromFile(0x00180D, "FNVCompanions.esp") as Actor
	Actor Arcade = Game.GetFormFromFile(0x004177, "FNVCompanions.esp") as Actor
	Actor Boone = Game.GetFormFromFile(0x003980, "FNVCompanions.esp") as Actor
	Actor Raul = Game.GetFormFromFile(0x007266, "FNVCompanions.esp") as Actor
	Actor Veronica = Game.GetFormFromFile(0x00A57A, "FNVCompanions.esp") as Actor
	;Ellen
	Actor Ellen = Game.GetFormFromFile(0x002864, "ellen.esp") as Actor
	;llamaCompanionHeather
	Actor Heather = Game.GetFormFromFile(0x00D157, "llamaCompanionHeather.esp") as Actor
	
	NPC_String = ""
	
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_MessageType_Impreg_Chance.GetValue())
		if akMan == PlayerREF && akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Impregnation_SarahLyons.Length-1)
			NPC_String = Impregnation_SarahLyons[random_Name]
		elseif akMan == PlayerREF && akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, Impregnation_Valkyrie.Length-1)
			NPC_String = Impregnation_Valkyrie[random_Name]
		elseif akMan == PlayerREF && akActor == Harley
			int random_Name = Utility.RandomInt(0, Impregnation_Harley.Length-1)
			NPC_String = Impregnation_Harley[random_Name]
		elseif akMan == PlayerREF && akActor == Roxy
			int random_Name = Utility.RandomInt(0, Impregnation_Roxy.Length-1)
			NPC_String = Impregnation_Roxy[random_Name]
		elseif akMan == PlayerREF && akActor == Eden
			int random_Name = Utility.RandomInt(0, Impregnation_Eden.Length-1)
			NPC_String = Impregnation_Eden[random_Name]
		elseif akMan == PlayerREF && akActor == Raven
			int random_Name = Utility.RandomInt(0, Impregnation_Raven.Length-1)
			NPC_String = Impregnation_Raven[random_Name]
		elseif akMan == PlayerREF && akActor == Taryn
			int random_Name = Utility.RandomInt(0, Impregnation_Taryn.Length-1)
			NPC_String = Impregnation_Taryn[random_Name]
		elseif akMan == PlayerREF && akActor == Sloan
			int random_Name = Utility.RandomInt(0, Impregnation_Sloan.Length-1)
			NPC_String = Impregnation_Sloan[random_Name]
		elseif akMan == PlayerREF && akActor == Sadie
			int random_Name = Utility.RandomInt(0, Impregnation_Sadie.Length-1)
			NPC_String = Impregnation_Sadie[random_Name]
		elseif akMan == PlayerREF && akActor == Raina
			int random_Name = Utility.RandomInt(0, Impregnation_Raina.Length-1)
			NPC_String = Impregnation_Raina[random_Name]
		elseif akMan == PlayerREF && akActor == Alerios
			int random_Name = Utility.RandomInt(0, Impregnation_Alerios.Length-1)
			NPC_String = Impregnation_Alerios[random_Name]
		elseif akMan == PlayerREF && akActor == Cruz || akActor == Cruz_DP
			int random_Name = Utility.RandomInt(0, Impregnation_Cruz.Length-1)
			NPC_String = Impregnation_Cruz[random_Name]
		elseif akMan == PlayerREF && akActor == V81_TinaDeLuca || akActor == Tina_DP
			int random_Name = Utility.RandomInt(0, Impregnation_Tina.Length-1)
			NPC_String = Impregnation_Tina[random_Name]
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
		elseif akMan == PlayerREF && akActor == Cass
			int random_Name = Utility.RandomInt(0, Impregnation_Cass.Length-1)
			NPC_String = Impregnation_Cass[random_Name]
		elseif akMan == Arcade && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Arcade.Length-1)
			NPC_String = Impregnation_Arcade[random_Name]
		elseif akMan == Boone && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Boone.Length-1)
			NPC_String = Impregnation_Boone[random_Name]
		elseif akMan == Raul && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, Impregnation_Raul.Length-1)
			NPC_String = Impregnation_Raul[random_Name]
		elseif akMan == PlayerREF && akActor == Veronica 
			int random_Name = Utility.RandomInt(0, Impregnation_Veronica.Length-1)
			NPC_String = Impregnation_Veronica[random_Name]
		elseif akMan == PlayerREF && akActor == Ellen
			int random_Name = Utility.RandomInt(0, Impregnation_Ellen.Length-1)
			NPC_String = Impregnation_Ellen[random_Name]
		elseif akMan == PlayerREF && akActor == Heather
			int random_Name = Utility.RandomInt(0, Impregnation_Heather.Length-1)
			NPC_String = Impregnation_Heather[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 0
			int random_Name = Utility.RandomInt(0, Impregnation_Player_F.Length-1)
			NPC_String = Impregnation_Player_F[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 0
			int random_Name = Utility.RandomInt(0, Impregnation_Player_M.Length-1)
			NPC_String = Impregnation_Player_M[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 1
			int random_Name = Utility.RandomInt(0, Impregnation_Player_F.Length-1)
			NPC_String = Impregnation_Player_F_NotNora[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 1
			int random_Name = Utility.RandomInt(0, Impregnation_Player_M.Length-1)
			NPC_String = Impregnation_Player_M_NotNate[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 2
			int random_Name = Utility.RandomInt(0, Impregnation_Player_F.Length-1)
			NPC_String = Impregnation_Player_F_Violent[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 2
			int random_Name = Utility.RandomInt(0, Impregnation_Player_M.Length-1)
			NPC_String = Impregnation_Player_M_Violent[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 3
			int random_Name = Utility.RandomInt(0, Impregnation_Player_F.Length-1)
			NPC_String = Impregnation_Player_F_Enclave[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 3
			int random_Name = Utility.RandomInt(0, Impregnation_Player_M.Length-1)
			NPC_String = Impregnation_Player_M_Enclave[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 4
			int random_Name = Utility.RandomInt(0, Impregnation_Player_F.Length-1)
			NPC_String = Impregnation_Player_F_BoS[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 4
			int random_Name = Utility.RandomInt(0, Impregnation_Player_M.Length-1)
			NPC_String = Impregnation_Player_M_BoS[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 5
			int random_Name = Utility.RandomInt(0, Impregnation_Player_F.Length-1)
			NPC_String = Impregnation_Player_F_Swinger[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 5
			int random_Name = Utility.RandomInt(0, Impregnation_Player_M.Length-1)
			NPC_String = Impregnation_Player_M_Swinger[random_Name]
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
	Actor Ada = Game.GetFormFromFile(0x00FF12, "DLCRobot.esm") as Actor
	Actor Cruz = Game.GetFormFromFile(0x00097C, "DLCRobot.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x215F51, "Depravity.esp") as Actor
	Actor Roxy = Game.GetFormFromFile(0x0A5BA2, "Depravity.esp") as Actor
	Actor Eden = Game.GetFormFromFile(0x1EB177, "Depravity.esp") as Actor
	Actor Raven = Game.GetFormFromFile(0x21A3CE, "Depravity.esp") as Actor
	Actor Taryn = Game.GetFormFromFile(0x21E820, "Depravity.esp") as Actor
	Actor Sloan = Game.GetFormFromFile(0x21E821, "Depravity.esp") as Actor
	Actor Sadie = Game.GetFormFromFile(0x222C72, "Depravity.esp") as Actor
	Actor Raina = Game.GetFormFromFile(0x26FC4F, "Depravity.esp") as Actor
	Actor Cruz_DP = Game.GetFormFromFile(0x933115, "Depravity.esp") as Actor
	Actor Tina_DP = Game.GetFormFromFile(0x9733D1, "Depravity.esp") as Actor
	Actor Alerios = Game.GetFormFromFile(0x341458, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	
	;FNVCompanions
	Actor Cass = Game.GetFormFromFile(0x00180D, "FNVCompanions.esp") as Actor
	Actor Arcade = Game.GetFormFromFile(0x004177, "FNVCompanions.esp") as Actor
	Actor Boone = Game.GetFormFromFile(0x003980, "FNVCompanions.esp") as Actor
	Actor Raul = Game.GetFormFromFile(0x007266, "FNVCompanions.esp") as Actor
	Actor Veronica = Game.GetFormFromFile(0x00A57A, "FNVCompanions.esp") as Actor
	;Ellen
	Actor Ellen = Game.GetFormFromFile(0x002864, "ellen.esp") as Actor
	;llamaCompanionHeather
	Actor Heather = Game.GetFormFromFile(0x00D157, "llamaCompanionHeather.esp") as Actor
	
	
		NPC_String = ""
		if akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Marriage_SarahLyons_M.Length-1)
			NPC_String = Marriage_SarahLyons_M[random_Name]
		elseif akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, Marriage_Valkyrie_M.Length-1)
			NPC_String = Marriage_Valkyrie_M[random_Name]
		elseif akActor == Harley
			int random_Name = Utility.RandomInt(0, Marriage_Harley_M.Length-1)
			NPC_String = Marriage_Harley_M[random_Name]
		elseif akActor == Roxy
			int random_Name = Utility.RandomInt(0, Marriage_Roxy_M.Length-1)
			NPC_String = Marriage_Roxy_M[random_Name]
		elseif akActor == Eden
			int random_Name = Utility.RandomInt(0, Marriage_Eden_M.Length-1)
			NPC_String = Marriage_Eden_M[random_Name]
		elseif akActor == Raven
			int random_Name = Utility.RandomInt(0, Marriage_Raven_M.Length-1)
			NPC_String = Marriage_Raven_M[random_Name]
		elseif akActor == Taryn
			int random_Name = Utility.RandomInt(0, Marriage_Taryn_M.Length-1)
			NPC_String = Marriage_Taryn_M[random_Name]
		elseif akActor == Sloan
			int random_Name = Utility.RandomInt(0, Marriage_Sloan_M.Length-1)
			NPC_String = Marriage_Sloan_M[random_Name]
		elseif akActor == Sadie
			int random_Name = Utility.RandomInt(0, Marriage_Sadie_M.Length-1)
			NPC_String = Marriage_Sadie_M[random_Name]
		elseif akActor == Raina
			int random_Name = Utility.RandomInt(0, Marriage_Raina_M.Length-1)
			NPC_String = Marriage_Raina_M[random_Name]
		elseif akActor == Alerios
			int random_Name = Utility.RandomInt(0, Marriage_Alerios_M.Length-1)
			NPC_String = Marriage_Alerios_M[random_Name]
		elseif akActor == Cruz || akActor == Cruz_DP
			int random_Name = Utility.RandomInt(0, Marriage_Cruz_M.Length-1)
			NPC_String = Marriage_Cruz_M[random_Name]
		elseif akActor == V81_TinaDeLuca || akActor == Tina_DP
			int random_Name = Utility.RandomInt(0, Marriage_Tina_M.Length-1)
			NPC_String = Marriage_Tina_M[random_Name]
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
		elseif akActor == Cass
			int random_Name = Utility.RandomInt(0, Marriage_Cass_M.Length-1)
			NPC_String = Marriage_Cass_M[random_Name]
		elseif akActor == Arcade 
			int random_Name = Utility.RandomInt(0, Marriage_Arcade_M.Length-1)
			NPC_String = Marriage_Arcade_M[random_Name]
		elseif akActor == Boone
			int random_Name = Utility.RandomInt(0, Marriage_Boone_M.Length-1)
			NPC_String = Marriage_Boone_M[random_Name]
		elseif akActor == Raul
			int random_Name = Utility.RandomInt(0, Marriage_Raul_M.Length-1)
			NPC_String = Marriage_Raul_M[random_Name]
		elseif akActor == Veronica 
			int random_Name = Utility.RandomInt(0, Marriage_Veronica_M.Length-1)
			NPC_String = Marriage_Veronica_M[random_Name]
		elseif akActor == Ellen
			int random_Name = Utility.RandomInt(0, Marriage_Ellen_M.Length-1)
			NPC_String = Marriage_Ellen_M[random_Name]
		elseif akActor == Heather
			int random_Name = Utility.RandomInt(0, Marriage_Heather_M.Length-1)
			NPC_String = Marriage_Heather_M[random_Name]
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
	Actor Ada = Game.GetFormFromFile(0x00FF12, "DLCRobot.esm") as Actor
	Actor Cruz = Game.GetFormFromFile(0x00097C, "DLCRobot.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x215F51, "Depravity.esp") as Actor
	Actor Roxy = Game.GetFormFromFile(0x0A5BA2, "Depravity.esp") as Actor
	Actor Eden = Game.GetFormFromFile(0x1EB177, "Depravity.esp") as Actor
	Actor Raven = Game.GetFormFromFile(0x21A3CE, "Depravity.esp") as Actor
	Actor Taryn = Game.GetFormFromFile(0x21E820, "Depravity.esp") as Actor
	Actor Sloan = Game.GetFormFromFile(0x21E821, "Depravity.esp") as Actor
	Actor Sadie = Game.GetFormFromFile(0x222C72, "Depravity.esp") as Actor
	Actor Raina = Game.GetFormFromFile(0x26FC4F, "Depravity.esp") as Actor
	Actor Cruz_DP = Game.GetFormFromFile(0x933115, "Depravity.esp") as Actor
	Actor Tina_DP = Game.GetFormFromFile(0x9733D1, "Depravity.esp") as Actor
	Actor Alerios = Game.GetFormFromFile(0x341458, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	;FNVCompanions
	Actor Cass = Game.GetFormFromFile(0x00180D, "FNVCompanions.esp") as Actor
	Actor Arcade = Game.GetFormFromFile(0x004177, "FNVCompanions.esp") as Actor
	Actor Boone = Game.GetFormFromFile(0x003980, "FNVCompanions.esp") as Actor
	Actor Raul = Game.GetFormFromFile(0x007266, "FNVCompanions.esp") as Actor
	Actor Veronica = Game.GetFormFromFile(0x00A57A, "FNVCompanions.esp") as Actor
	;Ellen
	Actor Ellen = Game.GetFormFromFile(0x002864, "ellen.esp") as Actor
	;llamaCompanionHeather
	Actor Heather = Game.GetFormFromFile(0x00D157, "llamaCompanionHeather.esp") as Actor
	
		NPC_String = ""
		if akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Marriage_SarahLyons_F.Length-1)
			NPC_String = Marriage_SarahLyons_F[random_Name]
		elseif akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, Marriage_Valkyrie_F.Length-1)
			NPC_String = Marriage_Valkyrie_F[random_Name]
		elseif akActor == Harley
			int random_Name = Utility.RandomInt(0, Marriage_Harley_F.Length-1)
			NPC_String = Marriage_Harley_F[random_Name]
		elseif akActor == Roxy
			int random_Name = Utility.RandomInt(0, Marriage_Roxy_F.Length-1)
			NPC_String = Marriage_Roxy_F[random_Name]
		elseif akActor == Eden
			int random_Name = Utility.RandomInt(0, Marriage_Eden_F.Length-1)
			NPC_String = Marriage_Eden_F[random_Name]
		elseif akActor == Raven
			int random_Name = Utility.RandomInt(0, Marriage_Raven_F.Length-1)
			NPC_String = Marriage_Raven_F[random_Name]
		elseif akActor == Taryn
			int random_Name = Utility.RandomInt(0, Marriage_Taryn_F.Length-1)
			NPC_String = Marriage_Taryn_F[random_Name]
		elseif akActor == Sloan
			int random_Name = Utility.RandomInt(0, Marriage_Sloan_F.Length-1)
			NPC_String = Marriage_Sloan_F[random_Name]
		elseif akActor == Sadie
			int random_Name = Utility.RandomInt(0, Marriage_Sadie_F.Length-1)
			NPC_String = Marriage_Sadie_F[random_Name]
		elseif akActor == Raina
			int random_Name = Utility.RandomInt(0, Marriage_Raina_F.Length-1)
			NPC_String = Marriage_Raina_F[random_Name]
		elseif akActor == Alerios
			int random_Name = Utility.RandomInt(0, Marriage_Alerios_F.Length-1)
			NPC_String = Marriage_Alerios_F[random_Name]
		elseif akActor == Cruz || akActor == Cruz_DP
			int random_Name = Utility.RandomInt(0, Marriage_Cruz_F.Length-1)
			NPC_String = Marriage_Cruz_F[random_Name]
		elseif akActor == V81_TinaDeLuca || akActor == Tina_DP
			int random_Name = Utility.RandomInt(0, Marriage_Tina_F.Length-1)
			NPC_String = Marriage_Tina_F[random_Name]
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
		elseif akActor == Cass
			int random_Name = Utility.RandomInt(0, Marriage_Cass_F.Length-1)
			NPC_String = Marriage_Cass_F[random_Name]
		elseif akActor == Arcade 
			int random_Name = Utility.RandomInt(0, Marriage_Arcade_F.Length-1)
			NPC_String = Marriage_Arcade_F[random_Name]
		elseif akActor == Boone
			int random_Name = Utility.RandomInt(0, Marriage_Boone_F.Length-1)
			NPC_String = Marriage_Boone_F[random_Name]
		elseif akActor == Raul
			int random_Name = Utility.RandomInt(0, Marriage_Raul_F.Length-1)
			NPC_String = Marriage_Raul_F[random_Name]
		elseif akActor == Veronica 
			int random_Name = Utility.RandomInt(0, Marriage_Veronica_F.Length-1)
			NPC_String = Marriage_Veronica_F[random_Name]
		elseif akActor == Ellen
			int random_Name = Utility.RandomInt(0, Marriage_Ellen_F.Length-1)
			NPC_String = Marriage_Ellen_F[random_Name]
		elseif akActor == Heather
			int random_Name = Utility.RandomInt(0, Marriage_Heather_F.Length-1)
			NPC_String = Marriage_Heather_F[random_Name]
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
	Actor Ada = Game.GetFormFromFile(0x00FF12, "DLCRobot.esm") as Actor
	Actor Cruz = Game.GetFormFromFile(0x00097C, "DLCRobot.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x215F51, "Depravity.esp") as Actor
	Actor Roxy = Game.GetFormFromFile(0x0A5BA2, "Depravity.esp") as Actor
	Actor Eden = Game.GetFormFromFile(0x1EB177, "Depravity.esp") as Actor
	Actor Raven = Game.GetFormFromFile(0x21A3CE, "Depravity.esp") as Actor
	Actor Taryn = Game.GetFormFromFile(0x21E820, "Depravity.esp") as Actor
	Actor Sloan = Game.GetFormFromFile(0x21E821, "Depravity.esp") as Actor
	Actor Sadie = Game.GetFormFromFile(0x222C72, "Depravity.esp") as Actor
	Actor Raina = Game.GetFormFromFile(0x26FC4F, "Depravity.esp") as Actor
	Actor Cruz_DP = Game.GetFormFromFile(0x933115, "Depravity.esp") as Actor
	Actor Tina_DP = Game.GetFormFromFile(0x9733D1, "Depravity.esp") as Actor
	Actor Alerios = Game.GetFormFromFile(0x341458, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	;FNVCompanions
	Actor Cass = Game.GetFormFromFile(0x00180D, "FNVCompanions.esp") as Actor
	Actor Arcade = Game.GetFormFromFile(0x004177, "FNVCompanions.esp") as Actor
	Actor Boone = Game.GetFormFromFile(0x003980, "FNVCompanions.esp") as Actor
	Actor Raul = Game.GetFormFromFile(0x007266, "FNVCompanions.esp") as Actor
	Actor Veronica = Game.GetFormFromFile(0x00A57A, "FNVCompanions.esp") as Actor
	;Ellen
	Actor Ellen = Game.GetFormFromFile(0x002864, "ellen.esp") as Actor
	;llamaCompanionHeather
	Actor Heather = Game.GetFormFromFile(0x00D157, "llamaCompanionHeather.esp") as Actor
	
	
		NPC_String = ""
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_MessageType_sex_Chance.GetValue())
		if akMan == PlayerREF && akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, SexMessage_SarahLyons.Length-1)
			NPC_String = SexMessage_SarahLyons[random_Name]
		elseif akMan == PlayerREF && akActor == Valkyrie ;have no idea about the lore of the NPC, so Norse shit
			int random_Name = Utility.RandomInt(0, SexMessage_Valkyrie.Length-1)
			NPC_String = SexMessage_Valkyrie[random_Name]
		elseif akMan == PlayerREF && akActor == Harley
			int random_Name = Utility.RandomInt(0, SexMessage_Harley.Length-1)
			NPC_String = SexMessage_Harley[random_Name]
		elseif akMan == PlayerREF && akActor == Roxy
			int random_Name = Utility.RandomInt(0, SexMessage_Roxy.Length-1)
			NPC_String = SexMessage_Roxy[random_Name]
		elseif akMan == PlayerREF && akActor == Eden
			int random_Name = Utility.RandomInt(0, SexMessage_Eden.Length-1)
			NPC_String = SexMessage_Eden[random_Name]
		elseif akMan == PlayerREF && akActor == Raven
			int random_Name = Utility.RandomInt(0, SexMessage_Raven.Length-1)
			NPC_String = SexMessage_Raven[random_Name]
		elseif akMan == PlayerREF && akActor == Taryn
			int random_Name = Utility.RandomInt(0, SexMessage_Taryn.Length-1)
			NPC_String = SexMessage_Taryn[random_Name]
		elseif akMan == PlayerREF && akActor == Sloan
			int random_Name = Utility.RandomInt(0, SexMessage_Sloan.Length-1)
			NPC_String = SexMessage_Sloan[random_Name]
		elseif akMan == PlayerREF && akActor == Sadie
			int random_Name = Utility.RandomInt(0, SexMessage_Sadie.Length-1)
			NPC_String = SexMessage_Sadie[random_Name]
		elseif akMan == PlayerREF && akActor == Raina
			int random_Name = Utility.RandomInt(0, SexMessage_Raina.Length-1)
			NPC_String = SexMessage_Raina[random_Name]
		elseif akMan == Alerios && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Alerios.Length-1)
			NPC_String = SexMessage_Alerios[random_Name]
		elseif akMan == PlayerREF && akActor == Cruz || akActor == Cruz_DP
			int random_Name = Utility.RandomInt(0, SexMessage_Cruz.Length-1)
			NPC_String = SexMessage_Cruz[random_Name]
		elseif akMan == PlayerREF && akActor == V81_TinaDeLuca || akActor == Tina_DP
			int random_Name = Utility.RandomInt(0, SexMessage_Tina.Length-1)
			NPC_String = SexMessage_Tina[random_Name]
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
		elseif akActor == Cass && akMan == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Cass.Length-1)
			NPC_String = SexMessage_Cass[random_Name]
		elseif akMan == Arcade  && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Arcade.Length-1)
			NPC_String = SexMessage_Arcade[random_Name]
		elseif akMan == Boone && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Boone.Length-1)
			NPC_String = SexMessage_Boone[random_Name]
		elseif akMan == Raul && akActor == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Raul.Length-1)
			NPC_String = SexMessage_Raul[random_Name]
		elseif akActor == Veronica  && akMan == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Veronica.Length-1)
			NPC_String = SexMessage_Veronica[random_Name]
		elseif akActor == Ellen && akMan == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Ellen.Length-1)
			NPC_String = SexMessage_Ellen[random_Name]
		elseif akActor == Heather && akMan == PlayerREF
			int random_Name = Utility.RandomInt(0, SexMessage_Heather.Length-1)
			NPC_String = SexMessage_Heather[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 0
			int random_Name = Utility.RandomInt(0, SexMessage_Player_F.Length-1)
			NPC_String = SexMessage_Player_F[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 0
			int random_Name = Utility.RandomInt(0, SexMessage_Player_M.Length-1)
			NPC_String = SexMessage_Player_M[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 1
			int random_Name = Utility.RandomInt(0, SexMessage_Player_F.Length-1)
			NPC_String = SexMessage_Player_F_NotNora[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 1
			int random_Name = Utility.RandomInt(0, SexMessage_Player_M.Length-1)
			NPC_String = SexMessage_Player_M_NotNate[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 2
			int random_Name = Utility.RandomInt(0, SexMessage_Player_F.Length-1)
			NPC_String = SexMessage_Player_F_Violent[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 2
			int random_Name = Utility.RandomInt(0, SexMessage_Player_M.Length-1)
			NPC_String = SexMessage_Player_M_Violent[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 3
			int random_Name = Utility.RandomInt(0, SexMessage_Player_F.Length-1)
			NPC_String = SexMessage_Player_F_Enclave[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 3
			int random_Name = Utility.RandomInt(0, SexMessage_Player_M.Length-1)
			NPC_String = SexMessage_Player_M_Enclave[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 4
			int random_Name = Utility.RandomInt(0, SexMessage_Player_F.Length-1)
			NPC_String = SexMessage_Player_F_BoS[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 4
			int random_Name = Utility.RandomInt(0, SexMessage_Player_M.Length-1)
			NPC_String = SexMessage_Player_M_BoS[random_Name]
		elseif akActor == PlayerREF && akMan.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 5
			int random_Name = Utility.RandomInt(0, SexMessage_Player_F.Length-1)
			NPC_String = SexMessage_Player_F_Swinger[random_Name]
		elseif akMan == PlayerREF && akActor.GetLeveledActorBase().GetRace() == HumanRace && INVB_Global_MessageType_Roleplay.GetValue() == 5
			int random_Name = Utility.RandomInt(0, SexMessage_Player_M.Length-1)
			NPC_String = SexMessage_Player_M_Swinger[random_Name]
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
	Actor Ada = Game.GetFormFromFile(0x00FF12, "DLCRobot.esm") as Actor
	Actor Cruz = Game.GetFormFromFile(0x00097C, "DLCRobot.esm") as Actor
	;DLC_Farharbour
	Actor LongFellow = Game.GetFormFromFile(0x014602, "DLCCoast.esm") as Actor
	;DLC_Nukaworld
	Actor Gage = Game.GetFormFromFile(0x00a5b1, "DLCNukaWorld.esm") as Actor
	;CompanionIvy
	Actor Ivy = Game.GetFormFromFile(0x08598C, "CompanionIvy.esm") as Actor
	;OutcastsAndRemnants
	Actor SarahLyons = Game.GetFormFromFile(0x094153, "OutcastsAndRemnants.esp") as Actor
	;Depravity
	Actor Harley = Game.GetFormFromFile(0x215F51, "Depravity.esp") as Actor
	Actor Roxy = Game.GetFormFromFile(0x0A5BA2, "Depravity.esp") as Actor
	Actor Eden = Game.GetFormFromFile(0x1EB177, "Depravity.esp") as Actor
	Actor Raven = Game.GetFormFromFile(0x21A3CE, "Depravity.esp") as Actor
	Actor Taryn = Game.GetFormFromFile(0x21E820, "Depravity.esp") as Actor
	Actor Sloan = Game.GetFormFromFile(0x21E821, "Depravity.esp") as Actor
	Actor Sadie = Game.GetFormFromFile(0x222C72, "Depravity.esp") as Actor
	Actor Raina = Game.GetFormFromFile(0x26FC4F, "Depravity.esp") as Actor
	Actor Cruz_DP = Game.GetFormFromFile(0x933115, "Depravity.esp") as Actor
	Actor Tina_DP = Game.GetFormFromFile(0x9733D1, "Depravity.esp") as Actor
	;ProjectValkyrie
	Actor Valkyrie = Game.GetFormFromFile(0x001EEB, "ProjectValkyrie.esp") as Actor
	;FNVCompanions
	Actor Cass = Game.GetFormFromFile(0x00180D, "FNVCompanions.esp") as Actor
	Actor Veronica = Game.GetFormFromFile(0x00A57A, "FNVCompanions.esp") as Actor
	;Ellen
	Actor Ellen = Game.GetFormFromFile(0x002864, "ellen.esp") as Actor
	;llamaCompanionHeather
	Actor Heather = Game.GetFormFromFile(0x00D157, "llamaCompanionHeather.esp") as Actor
	
	
	
		NPC_String = ""
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_MessageType_Birth_Chance.GetValue())
		if akActor == SarahLyons
			int random_Name = Utility.RandomInt(0, Birth_SarahLyons.Length-1)
			NPC_String = Birth_SarahLyons[random_Name]
		elseif akActor == Piper
			int random_Name = Utility.RandomInt(0, Birth_Piper.Length-1)
			NPC_String = Birth_Piper[random_Name]
		elseif akActor == Valkyrie
			int random_Name = Utility.RandomInt(0, Birth_Valkyrie.Length-1)
			NPC_String = Birth_Valkyrie[random_Name]
		elseif akActor == Harley
			int random_Name = Utility.RandomInt(0, Birth_Harley.Length-1)
			NPC_String = Birth_Harley[random_Name]
		elseif akActor == Roxy
			int random_Name = Utility.RandomInt(0, Birth_Roxy.Length-1)
			NPC_String = Birth_Roxy[random_Name]
		elseif akActor == Eden
			int random_Name = Utility.RandomInt(0, Birth_Eden.Length-1)
			NPC_String = Birth_Eden[random_Name]
		elseif akActor == Raven
			int random_Name = Utility.RandomInt(0, Birth_Raven.Length-1)
			NPC_String = Birth_Raven[random_Name]
		elseif akActor == Taryn
			int random_Name = Utility.RandomInt(0, Birth_Taryn.Length-1)
			NPC_String = Birth_Taryn[random_Name]
		elseif akActor == Sloan
			int random_Name = Utility.RandomInt(0, Birth_Sloan.Length-1)
			NPC_String = Birth_Sloan[random_Name]
		elseif akActor == Sadie
			int random_Name = Utility.RandomInt(0, Birth_Sadie.Length-1)
			NPC_String = Birth_Sadie[random_Name]
		elseif akActor == Raina
			int random_Name = Utility.RandomInt(0, Birth_Raina.Length-1)
			NPC_String = Birth_Raina[random_Name]
		elseif akActor == Cruz || akActor == Cruz_DP
			int random_Name = Utility.RandomInt(0, Birth_Cruz.Length-1)
			NPC_String = Birth_Cruz[random_Name]
		elseif akActor == V81_TinaDeLuca || akActor == Tina_DP
			int random_Name = Utility.RandomInt(0, Birth_Tina.Length-1)
			NPC_String = Birth_Tina[random_Name]
		elseif akActor == Cait
			int random_Name = Utility.RandomInt(0, Birth_Cait.Length-1)
			NPC_String = Birth_Cait[random_Name]
		elseif akActor == Curie
			int random_Name = Utility.RandomInt(0, Birth_Curie.Length-1)
			NPC_String = Birth_Curie[random_Name]
		elseif akActor == Ivy
			int random_Name = Utility.RandomInt(0, Birth_Ivy.Length-1)
			NPC_String = Birth_Ivy[random_Name]
		elseif akActor == Cass
			int random_Name = Utility.RandomInt(0, Birth_Cass.Length-1)
			NPC_String = Birth_Cass[random_Name]
		elseif akActor == Veronica 
			int random_Name = Utility.RandomInt(0, Birth_Veronica.Length-1)
			NPC_String = Birth_Veronica[random_Name]
		elseif akActor == Ellen
			int random_Name = Utility.RandomInt(0, Birth_Ellen.Length-1)
			NPC_String = Birth_Ellen[random_Name]
		elseif akActor == Heather
			int random_Name = Utility.RandomInt(0, Birth_Heather.Length-1)
			NPC_String = Birth_Heather[random_Name]
		elseif akActor == PlayerREF && INVB_Global_MessageType_Roleplay.GetValue() == 0
			int random_Name = Utility.RandomInt(0, Birth_Player_F.Length-1)
			NPC_String = Birth_Player_F[random_Name]
		elseif akActor == PlayerREF && INVB_Global_MessageType_Roleplay.GetValue() == 1
			int random_Name = Utility.RandomInt(0, Birth_Player_F_NotNora.Length-1)
			NPC_String = Birth_Player_F_NotNora[random_Name]
		elseif akActor == PlayerREF && INVB_Global_MessageType_Roleplay.GetValue() == 2
			int random_Name = Utility.RandomInt(0, Birth_Player_F_Violent.Length-1)
			NPC_String = Birth_Player_F_Violent[random_Name]
		elseif akActor == PlayerREF && INVB_Global_MessageType_Roleplay.GetValue() == 3
			int random_Name = Utility.RandomInt(0, Birth_Player_F_Enclave.Length-1)
			NPC_String = Birth_Player_F_Enclave[random_Name]
		elseif akActor == PlayerREF && INVB_Global_MessageType_Roleplay.GetValue() == 4
			int random_Name = Utility.RandomInt(0, Birth_Player_F_BoS.Length-1)
			NPC_String = Birth_Player_F_BoS[random_Name]
		elseif akActor == PlayerREF && INVB_Global_MessageType_Roleplay.GetValue() == 5
			int random_Name = Utility.RandomInt(0, Birth_Player_F_Swinger.Length-1)
			NPC_String = Birth_Player_F_Swinger[random_Name]
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