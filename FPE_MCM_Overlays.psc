Scriptname FPE_MCM_Overlays extends Quest

Actor Property PlayerRef Auto Const

Group GlobalVariables 

GlobalVariable property INVB_MCMHasLoaded auto Const
GlobalVariable property INVB_Global_PH_All Auto Mandatory
GlobalVariable property INVB_Global_PH_Back Auto Mandatory
GlobalVariable property INVB_Global_PH_Chest Auto Mandatory
GlobalVariable property INVB_Global_PH_LArm Auto Mandatory
GlobalVariable property INVB_Global_PH_LLeg Auto Mandatory
GlobalVariable property INVB_Global_PH_RArm Auto Mandatory
GlobalVariable property INVB_Global_PH_RLeg Auto Mandatory
GlobalVariable property INVB_Global_PH_Pelvis Auto Mandatory
GlobalVariable property INVB_Global_PH_LowerBack Auto Mandatory
GlobalVariable property INVB_Global_PH_PubicHair Auto Mandatory
GlobalVariable property INVB_Global_PH_HairCuts Auto Mandatory
GlobalVariable property INVB_Global_PH_Eyes Auto Mandatory
GlobalVariable property INVB_Global_PH_Unique Auto Mandatory

GlobalVariable property INVB_Global_OverlayChance_Custom Auto Mandatory
GlobalVariable property INVB_Global_OverlayChance_Custom_Unique Auto Mandatory
GlobalVariable property INVB_Global_OverlayChance_Custom_Choice_Hair Auto Mandatory
GlobalVariable property INVB_Global_OverlayChance_Custom_Choice_Haircuts Auto Mandatory
GlobalVariable property INVB_Global_OverlayChance_Custom_Choice_Eyes Auto Mandatory

GlobalVariable property INVB_Global_Debug_DeleteTattoo Auto Const Mandatory

EndGroup
String ThisMod = "INVB_OverlayFramework"

Event OnQuestInit()

	INVB_MCMHasLoaded.SetValue(0)

	If CheckForMCM(true)
	
		UpdateSettings(true)
	
	EndIf
	
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")

	RegisterForExternalEvent("OnMCMSettingChange|"+ThisMod, "OnMCMSettingChange")
	
	INVB_MCMHasLoaded.SetValue(1)

EndEvent

Function OnMCMSettingChange(string modName, string id)
	UnregisterForExternalEvent("OnMCMSettingChange|"+ThisMod)
	If modName == ThisMod	
		UpdateSettings()
	EndIf
	RegisterForExternalEvent("OnMCMSettingChange|"+ThisMod, "OnMCMSettingChange")
EndFunction

Function UpdateSettings(bool firstLoad = false)

	LoadSetting(INVB_Global_PH_All, "f_Global_All:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_Back, "f_Global_Back:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_Chest, "f_Global_Chest:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_LArm, "f_Global_LArm:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_LLeg, "f_Global_LLeg:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_RArm, "f_Global_RArm:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_RLeg, "f_Global_RLeg:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_Pelvis, "f_Global_Pelvis:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_LowerBack, "f_Global_LowerBack:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_PubicHair, "f_Global_PubicHair:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_HairCuts, "f_Global_HairCuts:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_Eyes, "f_Global_Eyes:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_PH_Unique, "fOverlayUnique:Misc", 0.0, 100.0)
	
	LoadSetting(INVB_Global_OverlayChance_Custom, "fOverlay_Custom:Overlay", 0.0, 100.0)
	LoadSetting(INVB_Global_OverlayChance_Custom_Unique, "fOverlay_Custom_Unique:Overlay", 0.0, 6.0)
	LoadSetting(INVB_Global_OverlayChance_Custom_Choice_Hair, "fOverlay_Custom_Hair:Overlay", 0.0, 1.0)
	LoadSetting(INVB_Global_Debug_DeleteTattoo, "fOverlay_Debug_DeleteTattoo:Misc", 0.0, 1.0)
EndFunction

Function LoadSetting(GlobalVariable akGlobal, string asSetting, float afMin, float afMax)

	float settingBuffer = MCM.GetModSettingFloat(ThisMod, asSetting)
	
	If settingBuffer != akGlobal.GetValue() ;1.15 - If the value changed

		If settingBuffer <= afMax && settingBuffer >= afMin ; The setting is within the range of values 
	
			akGlobal.SetValue(settingBuffer)
	
		ElseIf settingBuffer < afMin ; The setting is improperly less than the minimum
	
			akGlobal.SetValue(afMin)
		
			MCM.SetModSettingFloat(ThisMod, asSetting, afMin)
	
		ElseIf settingBuffer > afMax ; The setting is improperly greater than the max
	
			akGlobal.SetValue(afMax)
		
			MCM.SetModSettingFloat(ThisMod, asSetting, afMax)
	
		EndIf
		
	EndIf

EndFunction

Event Actor.OnPlayerLoadGame(Actor akSender)

	If CheckForMCM()
		UpdateSettings()
	EndIf

EndEvent

bool Function CheckForMCM(bool FirstLoad = false)

	If !MCM.IsInstalled()
	
		If FirstLoad
			
			Utility.Wait(1.0)
			DEBUG.Notification("Invictusblade Tattoo_krisser143: Please install Mod Configuration Menu.")

			
		Else
		
			DEBUG.MessageBox("Invictusblade Tattoo_krisser143: Please re-install Mod Configuration Menu.")
		
		EndIf
		
		Return False
	
	EndIf
	
	Return True

EndFunction