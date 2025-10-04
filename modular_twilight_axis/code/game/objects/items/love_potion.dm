//Love potion - Charged Pink
/obj/item/lovepotion
	name = "love potion"
	desc = "A pink potion with a faintly sweet and fruity aroma emanating from the bottle. The label reads \"Love Potion\" and says it will make nearly anyone desire you."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "lovebottle"
	grid_width = 32
	grid_height = 64

/obj/item/lovepotion/attack(mob/living/carbon/human/M, mob/user)
	if(!isliving(M) || M.stat == DEAD)
		to_chat(user, span_warning("Любовное зелье может усваиваться только живыми существами. Лучше не тратить его зря!"))
		return ..()
	if(user == M)
		to_chat(user, span_warning("Слишком опасно принимать это зелье само[user.gender == FEMALE ? "й" : "му"]. Я долж[user.gender == FEMALE ? "на" : "ен"] напоить им того, кого захочу!"))
		return ..()
	if(M.has_status_effect(STATUS_EFFECT_INLOVE))
		to_chat(user, span_warning("[capitalize(M.name)] уже одержим[M.gender == FEMALE ? "а" : ""] кем-то другим!"))
		return ..()

	M.visible_message(span_danger("[capitalize(user.name)] поит [M.name] любовным зельем!"),
		span_danger("[capitalize(user.name)] поит вас любовным зельем!"))

	if(!do_after(user, 50, target = M))
		return
	to_chat(user, span_notice("Я напоил[user.gender == FEMALE ? "а" : ""] [M.name] любовным зельем!"))
	to_chat(M, span_notice("Я чувствую вкус клубники, пока зелье льется мне в горло. Мое сердце колотится в груди, а разум затуманивается мыслями о [user.name]. Будь то настоящая любовь или одержимость, не имеет значения. Поскольку у меня есть <span class='love'>[user.name]</span>."))
	if(M.mind)
		M.mind.store_memory("Вы одержимы близостью к [user.name].")
	M.faction |= "[REF(user)]"
	M.apply_status_effect(STATUS_EFFECT_INLOVE, user)
	qdel(src)
