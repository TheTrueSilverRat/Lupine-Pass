/datum/job/roguetown/goblinsmith
	title = TITLE_DEEPDWELLER_SMITH
	flag = TRIBALSMITH
	department_flag = GOBLIN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(RACES_DEEPDWELLERS)
	tutorial = "You’re one of the few true craftsmen of the deepdwellers, and you’ve the burn scars to prove it.\
				You may only have low quality metal to use, but it matters little; The rank and file will die in droves, anyway.  Your gear only serves to prolong their lives into some semblance of usefulness."
	display_order = JDO_TRIBALSMITH
	outfit = /datum/outfit/job/roguetown/goblinsmith
	min_pq = 0
	max_pq = null
	round_contrib_points = 2
	job_traits = list(TRAIT_STEELHEARTED, TRAIT_DARKVISION)

/datum/outfit/job/roguetown/goblinsmith/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	cloak = /obj/item/clothing/cloak/apron/blacksmith
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/roguekey/roomi/slavecage

	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, pick(0,0,1), TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, pick(1,1,2), TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2 , TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, pick(2,2,3), TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, pick(1,1,2), TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, pick(1,1,2), TRUE)
	H.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/armorsmithing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 3, TRUE)
	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_SPD, -2)
