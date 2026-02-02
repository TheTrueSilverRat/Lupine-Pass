/datum/job/roguetown/goblincook
	title = TITLE_DEEPDWELLER_STOCKMASTER
	flag = TRIBALCOOK
	department_flag = GOBLIN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(RACES_DEEPDWELLERS)
	tutorial = "You’ve an important job in the clan; Keep everyone fed and supplied, preferably without resorting to moldy bread and maggoty meat.  Those are always options, of course."


	outfit = /datum/outfit/job/roguetown/goblincook
	display_order = JDO_TRIBALCOOK
	min_pq = 0
	max_pq = null
	job_traits = list(TRAIT_STEELHEARTED, TRAIT_DARKVISION)
	round_contrib_points = 2

/datum/outfit/job/roguetown/goblincook/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/roguekey/roomi/slavecage
	cloak = /obj/item/clothing/cloak/apron/cook
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_LCK, 1)
