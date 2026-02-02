/datum/job/roguetown/goblinking
	title = TITLE_DEEPDWELLER_CHIEFTAIN
	flag = CHIEFTAIN
	department_flag = GOBLIN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(RACES_DEEPDWELLERS)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "You’ve garnered power amongst your clan through deception and cutthroat ruthlessness.  Maintain power by providing for your clan; Be it food, trinkets, or slaves.\
				All can be found in the surrounding area, for the brave or foolhardy- Especially as fresh adventurers arrive frequently."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/goblinking
	job_traits = list(TRAIT_STEELHEARTED, TRAIT_MEDIUMARMOR, TRAIT_CRITICAL_RESISTANCE, TRAIT_NOPAINSTUN, TRAIT_DARKVISION) //The strongest of the horde

	display_order = JDO_CHIEFTAIN
	min_pq = 0
	max_pq = null
	round_contrib_points = 5

/datum/outfit/job/roguetown/goblinking/pre_equip(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/goblinannouncement
	//H.verbs |= /mob/living/carbon/human/proc/goblinopenslot
	beltl = /obj/item/roguekey/mercenary/bedrooms/chiefmanor
	beltr = /obj/item/roguekey/roomi/slavecage
	belt = /obj/item/storage/belt/rogue/leather/rope
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/crown/surplus
	cloak = /obj/item/clothing/cloak/lordcloak
	backl = /obj/item/storage/backpack/rogue/satchel
	r_hand = /obj/item/rogueweapon/spear/billhook
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 6, TRUE)
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_CON, 8)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_SPD, -4)

/mob/living/carbon/human/proc/goblinannouncement()
	set name = "Announcement"
	set category = "Deepdweller"
	if(stat)
		return
	var/inputty = input("Make an announcement", "ROGUETOWN") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/shelter/mountains/decap))
			to_chat(src, span_warning("I need to do this from the Deepdweller Village."))
			return FALSE
		priority_announce("[inputty]", title = "The Deepdweller Chief Squeals", sound = 'sound/misc/dun.ogg', sender = src)


