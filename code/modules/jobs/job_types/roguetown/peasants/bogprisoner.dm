/datum/job/roguetown/prisonerb
	title = TITLE_DEEPDWELLER_SLAVE
	flag = PRISONERB
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 4
	spawn_positions = 4

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "You are nothing.  You are property to be used and abused by the clan.  You'll do anything to avoid another beating, or worse.  This is your life now."

	outfit = /datum/outfit/job/roguetown/prisonerb
	bypass_jobban = TRUE
	display_order = JDO_PRISONERB
	give_bank_account = 10
	min_pq = -14
	max_pq = null
	can_random = FALSE

	cmode_music = 'sound/music/combat_bum.ogg'

/datum/outfit/job/roguetown/prisonerb/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/cursed_collar
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_LCK, 2)
	if(H.mind)
		var/datum/antagonist/new_antag = new /datum/antagonist/prisoner()
		H.mind.add_antag_datum(new_antag)
	ADD_TRAIT(H, TRAIT_BANDITCAMP, TRAIT_GENERIC)
	if(should_wear_masc_clothes(H))
		H.change_stat(STATKEY_STR, -1)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	else if(should_wear_femme_clothes(H))
		H.change_stat(STATKEY_STR, -1)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/random
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
