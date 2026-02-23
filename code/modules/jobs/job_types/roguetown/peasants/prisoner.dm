/datum/job/roguetown/prisonerr
	title = TITLE_THRALL
	flag = PRISONERR
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0


	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "You’ve lost count of how long it has been since you were a freeman.  You’ve learned that the lupians are not so cruel to useful, obedient slaves.  Perhaps you can have them trust you enough to eventually slip away when the gates are open."

	outfit = /datum/outfit/job/roguetown/prisonerr
	bypass_jobban = TRUE
	display_order = JDO_PRISONERR
	give_bank_account = 10
	min_pq = -14
	max_pq = null
	can_random = FALSE

	cmode_music = 'sound/music/combat_bum.ogg'

	advclass_cat_rolls = list(CTAG_PRISONER = 20)

/datum/outfit/job/roguetown/prisonerr/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	shirt = /obj/item/clothing/suit/roguetown/shirt/exoticsilkbra
	neck = /obj/item/clothing/neck/roguetown/collar/leather
	belt = /obj/item/storage/belt/rogue/leather/exoticsilkbelt
	shoes = /obj/item/clothing/shoes/roguetown/anklets
	mask = /obj/item/clothing/mask/rogue/exoticsilkmask
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLAW, TRAIT_GENERIC)
	H.faction |= "Keep"

/datum/job/roguetown/prisonerr/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/job/roguetown/prisonerr/special_check_latejoin(client/C)
	return TRUE

// Prisoner-specific subclasses, inheriting from towner roles
/datum/outfit/job/roguetown/prisoner_farmer
	name = "Prisoner Farmer"

/datum/outfit/job/roguetown/prisoner_farmer/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	..() // Call base prisoner outfit for collar/loincloth
	head = /obj/item/clothing/head/roguetown/armingcap
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	mouth = /obj/item/rogueweapon/huntingknife
	beltr = /obj/item/flint
	backpack_contents = list(
						/obj/item/seeds/wheat=1,
						/obj/item/seeds/apple=1,
						/obj/item/ash=1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)
	beltl = /obj/item/rogueweapon/sickle
	backr = /obj/item/rogueweapon/hoe
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.adjust_skillrank(/datum/skill/labor/butchering, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
			H.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
		ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_LONGSTRIDER, TRAIT_GENERIC)

/datum/advclass/prisoner_farmer
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_farmer
	name = "Prisoner Farmer"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_thug
	name = "Prisoner Thug"

/datum/outfit/job/roguetown/prisoner_thug/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	H.adjust_blindness(-3)
	var/classes = list("Goon","Wise Guy","Big Man")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Goon")
			H.set_blindness(0)
			to_chat(H, span_warning("You're a goon, a low-lyfe thug in a painful world - not good enough for war, not smart enough for peace. What you lack in station you make up for in daring."))
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) 
			H.adjust_skillrank(/datum/skill/labor/mining, 1, TRUE)
			H.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
			H.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 3)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", -1)
			var/options = list("Frypan", "Knuckles", "Navaja", "Bare Hands")
			var/option_choice = input("Choose your means.", "TAKE UP ARMS") as anything in options
			switch(option_choice)
				if("Frypan")
					H.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE) // expert cook; expert pan-handler
					r_hand = /obj/item/cooking/pan
				if("Knuckles")
					H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					r_hand = /obj/item/rogueweapon/knuckles
				if("Navaja")
					H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
					r_hand = /obj/item/rogueweapon/huntingknife/idagger/navaja
				if("Bare Hands")
					H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
		if("Wise Guy")
			H.set_blindness(0)
			to_chat(H, span_warning("You're smarter than the rest, by a stone's throw - and you know better than to get up close and personal. Unlike most others, you can read."))
			H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE) // vaguely smart, capable of making pyrotechnics
			H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE) 
			H.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
			H.change_stat("speed", 2)
			H.change_stat("intelligence", 2)
			H.change_stat("endurance", -2)
			H.change_stat("constitution", -2)
			ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC) // very smart
			ADD_TRAIT(H, TRAIT_CICERONE, TRAIT_GENERIC)
			var/options = list("Stone Sling", "Magic Bricks", "Lockpicking Equipment")
			var/option_choice = input("Choose your means.", "TAKE UP ARMS") as anything in options
			switch(option_choice)
				if("Stone Sling")
					H.adjust_skillrank(/datum/skill/combat/slings, 4, TRUE)
					r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/sling
					l_hand = /obj/item/quiver/sling
				if("Magic Bricks")
					H.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE) // i fear not the man that has practiced a thousand moves one time, but the man that has practiced one move a thousand times
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/magicians_brick)
				if("Lockpicking Equipment")
					H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE) // specialized into stealing; but good luck fighting
					H.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
					H.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
					ADD_TRAIT(H, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
					r_hand = /obj/item/lockpickring/mundane
		if("Big Man")
			H.set_blindness(0)
			to_chat(H, span_warning("More akin to a corn-fed monster than a normal man, your size and strength are your greatest weapons; though they hardly supplement what's missing of your brains."))
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE) // knows very few practical skills; you're a moron
			H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) // unrelenting
			H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE) 
			H.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
			H.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE) 
			H.change_stat("strength", 3)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 5) // fatass
			H.change_stat("speed", -3)
			H.change_stat("intelligence", -3)
			H.change_stat("perception", -3)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_HARDDISMEMBER, TRAIT_GENERIC) // like a brick wall
			var/options = list("Hands-On", "Big Stick")
			var/option_choice = input("Choose your means.", "TAKE UP ARMS") as anything in options
			switch(option_choice) // you are big dumb guy, none of your options give you expert-level weapons skill
				if("Hands-On")
					ADD_TRAIT(H, TRAIT_BASHDOORS, TRAIT_GENERIC) // deal 200 damage to a door you sprint-charge into
					ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
				if("Big Stick")
					H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
					r_hand = /obj/item/rogueweapon/mace/cudgel // Less deadly than axes, more thematic
			var/prev_real_name = H.real_name
			var/prev_name = H.name
			var/prefix = "Big" // if i see someone named "Boss" pick big man for this bit i will kill them
			H.real_name = "[prefix] [prev_real_name]"
			H.name = "[prefix] [prev_name]"

	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/leather

	H.grant_language(/datum/language/thievescant)

/datum/advclass/prisoner_thug
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_thug
	name = "Prisoner Thug"
	category_tags = list(CTAG_PRISONER)
	traits_applied = list(TRAIT_SEEPRICES_SHITTY)
	cmode_music = 'sound/music/combat_bum.ogg'
	maximum_possible_slots = 8 // i dont want an army of towner thugs
	classes = list("Goon" = "You're a goon, a low-lyfe thug in a painful world - not good enough for war, not smart enough for peace. What you lack in station you make up for in daring.",
					"Wise Guy" = "You're smarter than the rest, by a stone's throw - and you know better than to get up close and personal. Unlike most others, you can read.",
					"Big Man" = "More akin to a corn-fed monster than a normal man, your size and strength are your greatest weapons; though they hardly supplement what's missing of your brains.")

/datum/outfit/job/roguetown/prisoner_carpenter
	name = "Prisoner Carpenter"

/datum/outfit/job/roguetown/prisoner_carpenter/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE) // They use hammers, sawes and axes all day.
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE) 
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) 
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE) // They work at great heights.
	H.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 6, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/lumberjacking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", 1)
	H.change_stat("speed", -1)
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/hammer/steel
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/rogueweapon/huntingknife = 1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/rogueweapon/handsaw = 1,
						/obj/item/dye_brush = 1,
						/obj/item/recipe_book/builder = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)

/datum/advclass/prisoner_carpenter
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_carpenter
	name = "Prisoner Carpenter"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_blacksmith
	name = "Prisoner Blacksmith"

/datum/outfit/job/roguetown/prisoner_blacksmith/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/blacksmithing, 6, TRUE)
	H.adjust_skillrank(/datum/skill/craft/armorsmithing, 6, TRUE)
	H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 6, TRUE)
	H.adjust_skillrank(/datum/skill/craft/smelting, 6, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	beltr = /obj/item/rogueweapon/hammer/iron
	beltl = /obj/item/rogueweapon/tongs
	mouth = /obj/item/rogueweapon/huntingknife

	gloves = /obj/item/clothing/gloves/roguetown/leather
	cloak = /obj/item/clothing/cloak/apron/blacksmith

	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/rogueore/coal=2,
						/obj/item/rogueore/iron=2,
						/obj/item/rogueore/silver=1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)
	ADD_TRAIT(H, TRAIT_TRAINED_SMITH, TRAIT_GENERIC)

/datum/advclass/prisoner_blacksmith
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_blacksmith
	name = "Prisoner Blacksmith"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_hunter
	name = "Prisoner Hunter"

/datum/outfit/job/roguetown/prisoner_hunter/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	..() // Call base prisoner outfit for collar/loincloth
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	beltr = /obj/item/quiver/arrows
	beltl = /obj/item/rogueweapon/scabbard/sword
	r_hand = /obj/item/storage/meatbag
	backpack_contents = list(
				/obj/item/flint = 1,
				/obj/item/bait = 1,
				/obj/item/rogueweapon/huntingknife = 1,
				/obj/item/flashlight/flare/torch = 1,
				/obj/item/flashlight/flare/torch/lantern = 1,
				/obj/item/recipe_book/survival = 1,
				/obj/item/recipe_book/leatherworking = 1,
				/obj/item/rogueweapon/scabbard/sheath = 1
				)
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("intelligence", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_OUTDOORSMAN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WOODSMAN, TRAIT_GENERIC)

/datum/advclass/prisoner_hunter
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_hunter
	name = "Prisoner Hunter"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_minstrel
	name = "Prisoner Minstrel"

/datum/outfit/job/roguetown/prisoner_minstrel/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	if(H) to_chat(H, "DEBUG: prisoner_minstrel pre_equip called")
	..() // Call base prisoner outfit for collar/loincloth
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.change_stat("speed", 3)
	H.change_stat("endurance", 2)
	H.change_stat("perception", 1)
	ADD_TRAIT(H, TRAIT_KEENEARS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
	cloak = /obj/item/clothing/cloak/half
	r_hand = /obj/item/rogue/instrument/accord
	beltr = /obj/item/rogueweapon/huntingknife/idagger
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
						/obj/item/rogue/instrument/lute = 1,
						/obj/item/rogue/instrument/flute = 1,
						/obj/item/rogue/instrument/drum = 1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)

	
/datum/advclass/prisoner_minstrel
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_minstrel
	name = "Prisoner Minstrel"
	category_tags = list(CTAG_PRISONER)
	subclass_stats = list(
		STATKEY_SPD = 1,
		STATKEY_LCK = 1
	)

/datum/advclass/prisoner_butcher
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_butcher
	name = "Prisoner Butcher"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_butcher/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	..() // Call base prisoner outfit for collar/loincloth
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 5, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/kitchen/spoon,
		/obj/item/reagent_containers/food/snacks/rogue/truffles,
		/obj/item/reagent_containers/powder/salt = 3,
		/obj/item/reagent_containers/food/snacks/rogue/meat/coppiette = 2,
		)

/datum/advclass/prisoner_cheesemaker
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_cheesemaker
	name = "Prisoner Cheesemaker"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_cheesemaker/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 1)
	mouth = /obj/item/rogueweapon/huntingknife
	cloak = /obj/item/clothing/cloak/apron
	backl = /obj/item/storage/backpack/rogue/backpack
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/reagent_containers/glass/bottle/waterskin/milk
	beltl = /obj/item/flint
	backpack_contents = list(
		/obj/item/reagent_containers/powder/salt = 3,
		/obj/item/reagent_containers/food/snacks/rogue/cheddar = 2,
		/obj/item/natural/cloth = 2,
		/obj/item/book/rogue/yeoldecookingmanual = 1,
		/obj/item/recipe_book/survival = 1,
		)
	r_hand = /obj/item/flashlight/flare/torch

/datum/advclass/prisoner_seamstress
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_seamstress
	name = "Prisoner Seamster"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_seamstress/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	..() // Call base prisoner outfit for collar/loincloth
	H.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 1)
	H.change_stat("strength", -1)
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	beltl = /obj/item/needle
	beltr = /obj/item/rogueweapon/huntingknife/scissors
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
						/obj/item/natural/cloth = 2,
						/obj/item/natural/bundle/fibers/full = 1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/needle/thorn = 1,
						/obj/item/recipe_book/sewing = 1,
						/obj/item/book/rogue/swatchbook = 1,
						/obj/item/recipe_book/leatherworking = 1
						)

/datum/advclass/prisoner_potter
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_potter
	name = "Prisoner Potter"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_potter/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/ceramics, 5, TRUE)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", -1)
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu

	cloak = /obj/item/clothing/cloak/apron/blacksmith
	beltl = /obj/item/rogueweapon/blowrod
	beltr = /obj/item/rogueweapon/tongs   // Necessary for removing hot glass panes from furnaces.
	backl = /obj/item/storage/backpack/rogue/backpack
	backr = /obj/item/rogueweapon/shovel  // For getting clay

	backpack_contents = list(
		/obj/item/natural/clay = 3,
		/obj/item/natural/clay/glassbatch = 1,
		/obj/item/rogueore/coal = 1,
		/obj/item/roguegear/bronze = 1,
		/obj/item/dye_brush = 1,
		/obj/item/recipe_book/ceramics = 1)
	// Clay and glassBatch are raw materials
	// Coal so he can build an ore furnace for glass blowing
	// Coggers so he can build a potter's wheel.

/datum/advclass/prisoner_towndoctor
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_towndoctor
	name = "Prisoner Barber Surgeon"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_towndoctor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("fortune", 1)
	head = /obj/item/clothing/head/roguetown/nightman
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/physician
	beltl = /obj/item/storage/belt/rogue/surgery_bag/full
	beltr = /obj/item/rogueweapon/huntingknife/cleaver /// proper self defense an tree aquiring
	backpack_contents = list(
						/obj/item/natural/worms/leech/cheele = 1,
						/obj/item/natural/cloth = 2,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/rogueweapon/huntingknife/scissors/steel = 1,
						/obj/item/hair_dye_cream = 3
						)
	if(H.age == AGE_OLD)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_PER, 1)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_NOSTINK)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)

/datum/advclass/prisoner_witch
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_witch
	name = "Prisoner Witch"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_witch/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	..() // Call base prisoner outfit for collar/loincloth
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/crow)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
		H.mind.adjust_spellpoints(6)
		H.change_stat("intelligence", 3)
		H.change_stat("speed", 2)
		H.change_stat("fortune", 1)
		if(H.age == AGE_OLD)
			H.change_stat("intelligence", 1)
			H.change_stat("fortune", 1)
			H.mind.adjust_spellpoints(12)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DEATHSIGHT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WITCH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ARCYNE_T3, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/combat_cult.ogg'
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_cult.ogg'
	head = /obj/item/clothing/head/roguetown/witchhat
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/phys
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	beltl = /obj/item/storage/magebag
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
						/obj/item/reagent_containers/glass/mortar = 1,
						/obj/item/pestle = 1,
						/obj/item/candle/yellow = 2,
						/obj/item/recipe_book/alchemy = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/recipe_book/magic = 1,
						/obj/item/chalk = 1
						)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/arcynebolt)
		H.mind.adjust_spellpoints(6)
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/armor/corset

/datum/advclass/prisoner_miner
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_miner
	name = "Prisoner Miner"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_miner/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mining, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	H.change_stat("fortune", 2)
	ADD_TRAIT(H, TRAIT_DARKVISION, TRAIT_GENERIC)
	head = /obj/item/clothing/head/roguetown/armingcap
	beltl = /obj/item/rogueweapon/pick
	beltr = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/rogueweapon/chisel = 1, 
						/obj/item/rogueweapon/hammer/wood = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/recipe_book/builder = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)

/datum/advclass/prisoner_woodcutter
	parent_type = /datum/advclass
	outfit = /datum/outfit/job/roguetown/prisoner_woodcutter
	name = "Prisoner Woodcutter"
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner_woodcutter/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!H) return
	..() // Call base prisoner outfit for collar/loincloth
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/lumberjacking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 1)
	head = /obj/item/clothing/head/roguetown/roguehood
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/stoneaxe/woodcut/steel/woodcutter		//Unique axe, not craftable purposefully. Good axe, but not end-all be-all for combat.
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/rogueweapon/handsaw
	beltl = /obj/item/rogueweapon/hammer/wood
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/rogueweapon/huntingknife = 1,
						/obj/item/recipe_book/builder = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)

/datum/advclass/prisoner_naledi_healer
	name = "Prisoner Naledi"
	tutorial = "You cling to your Psy-bracelet. Obedient in using your magic to heal your Masters"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/prisoner/naledi_healer
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner/naledi_healer
	allowed_patrons = list(/datum/patron/old_god)

/datum/outfit/job/roguetown/mercenary/warscholar_vizier

/datum/outfit/job/roguetown/prisoner/naledi_healer/pre_equip(mob/living/carbon/human/H)
	..() // Call base prisoner outfit for collar/loincloth
	if(!istype(H.patron, /datum/patron/old_god))
		H.set_patron(/datum/patron/old_god)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 5, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 1)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T4, passive_gain = CLERIC_REGEN_MAJOR, start_maxed = TRUE)	//Starts off maxed out.
	if(H.mind)
		H.mind.RemoveSpell(/obj/effect/proc_holder/spell/invoked/lesser_heal)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/regression)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/convergence)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/stasis)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/temporal_revival)
	backl = /obj/item/rogueweapon/woodstaff/naledi
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/angle
	backr = /obj/item/storage/backpack/rogue/satchel/black
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/black
	cloak = /obj/item/clothing/cloak/half
	wrists = /obj/item/clothing/neck/roguetown/psicross/naledi
	beltl = /obj/item/flashlight/flare/torch
	H.grant_language(/datum/language/celestial)

	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)

// Cleric Prisoner subclass
/datum/advclass/prisonercleric
	name = "Cleric Prisoner"
	tutorial = "You cling to your religious symbols for comfort."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/prisoner/cleric
	category_tags = list(CTAG_PRISONER)

/datum/outfit/job/roguetown/prisoner/cleric/pre_equip(mob/living/carbon/human/H)
	..()
	// Add druidic skill for Dendor followers
	if(istype(H.patron, /datum/patron/divine/dendor))
		H.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		to_chat(H, span_notice("As a follower of Dendor, you have innate knowledge of druidic magic."))

	// Missionary skills without equipment
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
	H.cmode_music = 'sound/music/combat_holy.ogg'
	H.change_stat(STAT_INTELLIGENCE, 2)
	H.change_stat(STAT_ENDURANCE, 1)
	H.change_stat(STAT_PERCEPTION, 2)
	H.change_stat(STAT_SPEED, 1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/revive)
	// Faith-specific cross on wrist instead of neck
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			wrists = /obj/item/clothing/neck/roguetown/psicross
		if(/datum/patron/divine/astrata)
			wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
		if(/datum/patron/divine/noc)
			wrists = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/abyssor)
			wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
			H.cmode_music = 'sound/music/combat_druid.ogg'
		if(/datum/patron/divine/necra)
			wrists = /obj/item/clothing/neck/roguetown/psicross/necra
		if(/datum/patron/divine/pestra)
			wrists = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/ravox)
			wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			wrists = /obj/item/clothing/neck/roguetown/psicross/malum
		if(/datum/patron/divine/eora)
			wrists = /obj/item/clothing/neck/roguetown/psicross/eora
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_cult.ogg'
			wrists = /obj/item/roguekey/inhumen
		if (/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_cult.ogg'
		if(/datum/patron/divine/xylix) // no longer random, rejoice my fellow xylixians!
			wrists = /obj/item/clothing/neck/roguetown/psicross/xylix
	// Grant miracles like missionary
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T4, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_4)

