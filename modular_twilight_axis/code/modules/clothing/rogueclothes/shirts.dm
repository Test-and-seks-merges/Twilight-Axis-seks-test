/obj/item/clothing/suit/roguetown/shirt/dress/stewarddress
	name = "steward's dress"
	desc = "A victorian-styled black dress with shining bronze buttons."
	icon = 'modular_twilight_axis/icons/roguetown/clothing/special/noble.dmi'
	mob_overlay_icon = 'modular_twilight_axis/icons/roguetown/clothing/special/onmob/noble.dmi'
	icon_state = "stewarddress"
	sleeved = FALSE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT

/obj/item/clothing/suit/roguetown/shirt/twilight_elven
	name = "elven suit"
	desc = "A common garnament for Etruscan countryside, each of these suits is woven in adherence to tradition."
	icon = "modular_twilight_axis/icons/roguetown/clothing/shirts.dmi"
	mob_overlay_icon = 'modular_twilight_axis/icons/roguetown/clothing/onmob/shirts.dmi'
	icon_state = "suit_blue"
	item_state = "suit_blue"
	allowed_race = NON_DWARVEN_RACE_TYPES
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS
	var/elven_colors = list("blue", "red", "beige", "black", "green")

/obj/item/clothing/suit/roguetown/shirt/twilight_elven/attack_right(mob/user)
	..()
	if(!picked)
		var/choice = input(user, "Choose a color.", "Elven colors") as anything in elven_colors
		var/playerchoice = elven_colors[choice]
		picked = TRUE
		icon_state = "suit_[playerchoice]"
		item_state = "suit_[playerchoice]"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_shirt()

/obj/item/clothing/suit/roguetown/shirt/twilight_elven/coat
	name = "elven coat"
	desc = "A common garnament for Etruscan countryside, each of these durable coats is woven in adherence to tradition."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "coat_white"
	item_state = "coat_white"
	flags_inv= HIDEBOOB|HIDECROTCH
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	elven_colors = list("blue", "red", "beige", "white", "green", "gray")

/obj/item/clothing/suit/roguetown/shirt/twilight_elven/coat/attack_right(mob/user)
	..()
	if(!picked)
		var/choice = input(user, "Choose a color.", "Elven colors") as anything in elven_colors
		var/playerchoice = elven_colors[choice]
		picked = TRUE
		icon_state = "coat_[playerchoice]"
		item_state = "coat_[playerchoice]"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_shirt()
			H.update_inv_armor()

/obj/item/clothing/suit/roguetown/shirt/twilight_elven/coat/alt
	name = "elven furcoat"
	desc = "A common garnament for Etruscan countryside, each of these durable coats is woven in adherence to tradition. Luxurious leovarg fur makes it fit for colder regions as well as self-entitled nobility."
	icon_state = "coat_white_alt"
	item_state = "coat_white_alt"
	elven_colors = list("blue", "red", "beige", "white")

/obj/item/clothing/suit/roguetown/shirt/twilight_elven/coat/alt/attack_right(mob/user)
	..()
	if(!picked)
		var/choice = input(user, "Choose a color.", "Elven colors") as anything in elven_colors
		var/playerchoice = elven_colors[choice]
		picked = TRUE
		icon_state = "coat_[playerchoice]_alt"
		item_state = "coat_[playerchoice]_alt"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_shirt()
			H.update_inv_armor()
