/obj/item/clothing/cloak/captain/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete/roguetown/cloak)

/obj/item/clothing/cloak/captain/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))
		
/obj/item/clothing/cloak/captain/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/captain/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/cloak/half/knight
	name = "champion's halfcloak"
	desc = "A halfcloak of the Grand Duke's most loyal champion."
	color = CLOTHING_AZURE

/obj/item/clothing/cloak/half/knight/Initialize(mob/living/L)
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	GLOB.lordcolor += src

/obj/item/clothing/cloak/half/knight/lordcolor(primary,secondary)

	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/half/knight/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/raincloak/furcloak/knight
	name = "champion's cloak"
	desc = "A cloak of the Grand Duke's most loyal champion."
	color = CLOTHING_AZURE

/obj/item/clothing/cloak/raincloak/furcloak/knight/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	GLOB.lordcolor += src

/obj/item/clothing/cloak/raincloak/furcloak/knight/lordcolor(primary,secondary)
	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/half/knight/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/twilight_elven
	name = "elven cloak"
	desc = "It is said that this design might predate the War in Heaven and the consequient fall of the ancient Elven Empire."
	icon = "modular_twilight_axis/icons/roguetown/clothing/cloaks.dmi"
	mob_overlay_icon = 'modular_twilight_axis/icons/roguetown/clothing/onmob/cloaks.dmi'
	icon_state = "cape_blue"
	item_state = "cape_blue"
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	sleeved = 'modular_twilight_axis/icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE
	var/elven_colors = list("Blue Cloak", "Red Cloak", "Blue Furcloak", "Red Furcloak", "Blue Short Cloak", "Red Short Cloak", "Blue Short Furcloak", "Red Short Furcloak")

/obj/item/clothing/cloak/twilight_elven/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete/roguetown/cloak)

/obj/item/clothing/cloak/twilight_elven/attack_right(mob/user)
	..()
	if(!picked)
		var/choice = input(user, "Choose a style.", "Elven styles") as anything in elven_colors
		var/playerchoice = elven_colors[choice]
		picked = TRUE
		swith(playerchoice)
			if("Blue Cloak")
				icon_state = "cape_blue"
				item_state = "cape_blue"
			if("Red Cloak")
				icon_state = "cape_red"
				item_state = "cape_red"
			if("Blue Furcloak")
				icon_state = "cape_blue_alt"
				item_state = "cape_blue_alt"
			if("Red Furcloak")
				icon_state = "cape_red_alt"
				item_state = "cape_red_alt"
			if("Blue Short Cloak"")
				icon_state = "shortcape_blue"
				item_state = "shortcape_blue"
			if("Red Short Cloak"")
				icon_state = "shortcape_red"
				item_state = "shortcape_red"
			if("Blue Short Furcloak"")
				icon_state = "shortcape_blue_alt"
				item_state = "shortcape_blue_alt"
			if("Red Short Furcloak"")
				icon_state = "shortcape_red_alt"
				item_state = "shortcape_red_alt"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_neck()

/obj/item/clothing/cloak/twilight_scarf
	name = "scarf"
	desc = "A long piece of cloth, meant to be worn around one's neck, Keeps you warm even under colder winds."
	icon = "modular_twilight_axis/icons/roguetown/clothing/cloaks.dmi"
	mob_overlay_icon = 'modular_twilight_axis/icons/roguetown/clothing/onmob/cloaks.dmi'
	icon_state = "scarf_white"
	item_state = "scarf_white"
	sleeved = 'modular_twilight_axis/icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE
	var/elven_colors = list("blue", "black", "green", "beige", "brown", "white")

/obj/item/clothing/cloak/twilight_scarf/attack_right(mob/user)
	..()
	if(!picked)
		var/choice = input(user, "Choose a color.", "Elven colors") as anything in elven_colors
		var/playerchoice = elven_colors[choice]
		picked = TRUE
		icon_state = "scarf_[playerchoice]"
		item_state = "scarf_[playerchoice]"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_neck()
