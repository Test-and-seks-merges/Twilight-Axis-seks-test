/obj/item/rogueweapon/sword/rapier/psyrapier
	name = "psydonian rapier"
	desc = "An ornate rapier, plated in a ceremonial veneer of silver. The barbs pierce your palm, and - for just a moment - you see red. Never forget that you are why Psydon wept."
	icon = 'modular_twilight_axis/icons/roguetown/weapons/64.dmi'
	icon_state = "psyrapier"
	item_state = "psyrapier"
	resistance_flags = FIRE_PROOF

/obj/item/rogueweapon/sword/rapier/psyrapier/ComponentInitialize()
	AddComponent(\
		/datum/component/silverbless,\
		pre_blessed = BLESSING_NONE,\
		silver_type = SILVER_PSYDONIAN,\
		added_force = 0,\
		added_blade_int = 100,\
		added_int = 50,\
		added_def = 2,\
	)
