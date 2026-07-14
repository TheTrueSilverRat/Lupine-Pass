// Because no one fucking know about inheritance in this bleak codebase.
/obj/item/clothing/gloves/roguetown/leather
	name = "leather gloves"
	desc = "Gloves made out of sturdy leather. Barely offer any protection, but are better than nothing."
	icon_state = "leather_gloves"
	armor = ARMOR_GLOVES_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	max_integrity = ARMOR_INT_SIDE_LEATHER
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured
	unarmed_bonus = 1.1
	cold_protection = HAND_LEFT | HAND_RIGHT
	min_cold_protection_temperature = BODYTEMP_COLD_LEVEL_ONE_MAX
	heat_protection = null
	max_heat_protection_temperature = BODYTEMP_NORMAL_MAX

/obj/item/clothing/gloves/roguetown/leather/black
	color = CLOTHING_BLACK

/obj/item/clothing/gloves/roguetown/fingerless
	name = "fingerless gloves"
	desc = "Cloth gloves to absorb palm sweat while leaving the fingers free for fine manipulation."
	icon_state = "fingerless_gloves"
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	cold_protection = null
	min_cold_protection_temperature = BODYTEMP_NORMAL_MIN
	heat_protection = HAND_LEFT | HAND_RIGHT
	max_heat_protection_temperature = BODYTEMP_HEAT_LEVEL_ONE_MAX

/obj/item/clothing/gloves/roguetown/fingerless/shadowgloves
	name = "fingerless gloves"
	desc = "Cloth gloves to absorb palm sweat while leaving the fingers free for fine manipulation."
	icon_state = "shadowgloves"
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/gloves/roguetown/fingerless_leather
	name = "fingerless leather gloves"
	desc = "A pair of protective gloves favored by lockshimmers, laborers, and smokers for maintaining \
	manual dexterity over regular gloves."
	icon_state = "roguegloves"
	armor = ARMOR_GLOVES_LEATHER_GOOD
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	max_integrity = ARMOR_INT_SIDE_CLOTH
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/gloves/roguetown/otavan
	name = "otavan leather gloves"
	desc = "A pair of heavy Otavan leather gloves, commonly used by fencers, renowned for their quality."
	icon_state = "fencergloves"
	item_state = "fencergloves"
	armor = ARMOR_GLOVES_CHAIN
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	max_integrity = ARMOR_INT_SIDE_HARDLEATHER
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	cold_protection = null
	min_cold_protection_temperature = BODYTEMP_NORMAL_MIN
	heat_protection = HAND_LEFT | HAND_RIGHT
	max_heat_protection_temperature = BODYTEMP_HEAT_LEVEL_ONE_MAX

/obj/item/clothing/gloves/roguetown/otavan/inqgloves
	name = "inquisitorial leather gloves"
	desc = "Masterfully crafted leather gloves, psycross included."
	icon_state = "inqgloves"
	item_state = "inqgloves"
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/gloves/roguetown/otavan/psygloves
	name = "psydonian leather gloves"
	desc = "Made with Otava's Finest leather, these gloves are fashioned to last."
	icon_state = "psydongloves"
	item_state = "psydongloves"
	salvage_result = /obj/item/natural/hide/cured	
	allowed_race = ALL_RACES_TYPES

// Eastern gloves
/obj/item/clothing/gloves/roguetown/eastgloves1
	name = "black gloves"
	desc = "Sleek gloves typically used by swordsmen."
	icon_state = "eastgloves1"
	item_state = "eastgloves1"
	armor = ARMOR_GLOVES_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE

/obj/item/clothing/gloves/roguetown/eastgloves2
	name = "stylish gloves"
	desc = "Unusual gloves worn by foreign gangs."
	icon_state = "eastgloves2"
	item_state = "eastgloves2"
	armor = ARMOR_GLOVES_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE

/obj/item/clothing/gloves/roguetown/harms
	name = "arm harness"
	desc = "Reinforced leather bindings for the arms."
	icon_state = "harms"
	item_state = "harms"
	body_parts_covered = HANDS
	max_integrity = 400
	armor = list("blunt" = 60, "slash" = 90, "stab" = 60, "piercing" = 60, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	sewrepair = TRUE
	sleeved = FALSE
