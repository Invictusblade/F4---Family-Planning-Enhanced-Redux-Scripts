Scriptname FPFP_BaseDataCreatorEffectScript extends activemagiceffect

ObjectReference Property FPFP_DataMainMarker Auto Const

Activator Property FPFP_BasePregDataForm Auto Const

Keyword Property FPFP_HasData Auto Const

Spell Property FPFP_BasePregSpell Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	HandleActor(akTarget)
EndEvent

Function HandleActor(Actor akA)

	akA.AddKeyword(FPFP_HasData)
	
	FPFP_BasePregData newData = FPFP_DataMainMarker.PlaceAtMe(FPFP_BasePregDataForm, 1, abForcePersist = true, abInitiallyDisabled = false, abDeleteWhenAble = false) as FPFP_BasePregData
	
	newData.Initialize(akA)

	akA.RemoveSpell(FPFP_BasePregSpell)

EndFunction