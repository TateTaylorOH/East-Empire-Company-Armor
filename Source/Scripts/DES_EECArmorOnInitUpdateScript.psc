Scriptname DES_EECArmorOnInitUpdateScript extends Quest  

EVENT OnInit()
	EastEmpireCompanyArmorUpdater()
ENDEVENT

Function EastEmpireCompanyArmorUpdater()
	 WyrmstoothSupport()
	 EEESupport()
EndFunction

;-- Wyrmstooth Support ---------------------------------------

GlobalVariable Property DES_EECArmorCraftingEnable auto

Function WyrmstoothSupport()
	Quest WTBarrowOfTheWyrm = Game.GetFormFromFile(0x028F01, "Wyrmstooth.esm") as Quest

	If DES_EECArmorCraftingEnable.GetValue() < 1
		IF WTBarrowOfTheWyrm.IsCompleted()
			DES_EECArmorCraftingEnable.SetValue(1)
		ENDIF
	ENDIF
endFunction

;-- East Empire Expansion Support ---------------------------------------

LeveledItem Property DES_EEERing auto

bool EEEInjected = false

Function EEESupport()
	Armor kgcEEC_JewelryRingEastEmpire = Game.GetFormFromFile(0x011DC8C, "kinggathcreations_eastempirecompany.esp") as Armor

	IF kgcEEC_JewelryRingEastEmpire as bool && EEEInjected == false
		DES_EEERing.AddForm(kgcEEC_JewelryRingEastEmpire, 1, 1)
		EEEInjected = True
	ELSEIF !kgcEEC_JewelryRingEastEmpire as bool && EEEInjected == true
		DES_EEERing.Revert()
		EEEInjected = false
	ENDIF
EndFunction