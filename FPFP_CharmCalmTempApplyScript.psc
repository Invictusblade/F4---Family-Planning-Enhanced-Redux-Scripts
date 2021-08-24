Scriptname FPFP_CharmCalmTempApplyScript extends activemagiceffect
Spell Property FPFP_CharmCalmTemp Auto Const Mandatory
Event OnEffectFinish(Actor akTarget, Actor akCaster)
	FPFP_CharmCalmTemp.Cast(akTarget)
EndEvent