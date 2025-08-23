/datum/advclass/mercenary/kashira //shitcode approved by free
	name = "Seonjang"
	tutorial = "The respected leader and singular representative of the Ruma clan, you're an experienced swordsman. It matters not where the coin comes from, so long as you can make enough to support the clan in its survival from the Xinyi Dynasty and its conflicts, now in strange lands."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = NON_DWARVEN_RACE_TYPES
	outfit = /datum/outfit/job/roguetown/mercenary/kashira
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)
	cmode_music = 'sound/music/combat_kazengite.ogg'
	maximum_possible_slots = 1

/datum/outfit/job/roguetown/mercenary/kashira/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/sword/sabre/mulyeog/rumacaptain
	beltl = /obj/item/rogueweapon/scabbard/sword/kazengun/gold
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/flashlight/flare/torch,
		/obj/item/flashlight/flare/torch/lantern,
		/obj/item/storage/belt/rogue/pouch/coins/poor,
		)

	if(should_wear_masc_clothes(H))
		head = /obj/item/clothing/head/roguetown/eaststrawhat
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt1
		cloak = /obj/item/clothing/cloak/eastcloak1
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants2
		gloves = /obj/item/clothing/gloves/roguetown/eastgloves2
		armor = /obj/item/clothing/suit/roguetown/shirt/undershirt/easttats
		shoes = /obj/item/clothing/shoes/roguetown/armor/rumaclan
	else if(should_wear_femme_clothes(H))
		head = /obj/item/clothing/head/roguetown/eaststrawhat
		armor = /obj/item/clothing/suit/roguetown/armor/basiceast/captainrobe
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/easttats
		shoes = /obj/item/clothing/shoes/roguetown/armor/rumaclan

	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC) //i swear this isn't as good as it sounds
	H.grant_language(/datum/language/kazengunese)
	H.merctype = 9

