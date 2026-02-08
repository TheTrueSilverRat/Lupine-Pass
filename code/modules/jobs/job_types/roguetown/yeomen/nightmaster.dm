/datum/job/roguetown/niteman
	title = TITLE_SHIPS_CAPTAIN
	flag = NITEMASTER
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	f_title = "Ship Captain"
	allowed_races = RACES_ALL_KINDS
	tutorial = "You’re the ship’s captain, ferrying countless adventurers to the hamlet.  It's in your best interest to ensure the hamlet does not fall whilst you are in port; Both for your safety and future prospects."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/niteman
	display_order = JDO_NITEMASTER
	give_bank_account = 20
	min_pq = 1
	max_pq = null
	bypass_lastclass = TRUE
	round_contrib_points = 3
	cmode_music = 'sound/music/cmode/nobility/combat_spymaster.ogg'

	job_traits = list(TRAIT_SEEPRICES_SHITTY, TRAIT_CICERONE, TRAIT_NUTCRACKER, TRAIT_GOODLOVER)

	advclass_cat_rolls = list(CTAG_BATHMOM = 2)
	job_subclasses = list(
		/datum/advclass/bathmaster
	)

/datum/job/roguetown/niteman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/bathmaster
	name = "Ship Captain"
	tutorial = "You’re the ship’s captain, ferrying countless adventurers to the hamlet.  It's in your best interest to ensure the hamlet does not fall whilst you are in port; Both for your safety and future prospects."
	outfit = /datum/outfit/job/roguetown/niteman/basic
	category_tags = list(CTAG_BATHMOM)
	subclass_stats = list(
		STATKEY_END = 2,
		STATKEY_STR = 1,
		STATKEY_CON = 1,
		STATKEY_INT = -1
	)

/datum/outfit/job/roguetown/niteman/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	head = /obj/item/clothing/head/roguetown/helmet/tricorn/lucky
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot/steppesman
	belt = /obj/item/storage/belt/rogue/leather/cloth/bandit
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/otavan
	wrists = /obj/item/storage/keyring/nightman
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants1
	beltl = /obj/item/rogueweapon/whip/psywhip_lesser
	beltr = /obj/item/rogueweapon/sword/cutlass
	backr = /obj/item/rogueweapon/shield/buckler
	backl = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale/inqcoat
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather

	H.grant_language(/datum/language/thievescant)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE) //He's a swashBUCKLER after all
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		
	
