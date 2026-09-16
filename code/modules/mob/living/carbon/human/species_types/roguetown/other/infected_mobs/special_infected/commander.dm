/datum/species/infected/commander
	name = "Commander"
	id = "infected_commander"
	infected_alt_sprite = "commander"

/datum/species/infected/flasher/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.AddSpell()
	C.AddSpell()
	C.AddSpell()
	

/obj/item/clothing/suit/roguetown/armor/skin_armor/infected_carpace/commander
	name = "\improper commander infected's carpace"
	armor = ARMOR_LEATHER_STUDDED
	max_integrity = 500

//Infection Proc, used for specifying transformation stuff.
/mob/living/carbon/human/proc/infected_transform_commander()
	if(!mind)
		log_runtime("NO MIND ON [src.name] WHEN TRANSFORMING")
		return

	Paralyze(1, ignore_canstun = TRUE)
	for(var/obj/item/i in src)
		dropItemToGround(i)
	regenerate_icons()
	icon = null
	var/oldinv = invisibility
	invisibility = INVISIBILITY_MAXIMUM
	cmode = FALSE
	if(client)
		SSdroning.play_area_sound(get_area(src), client)

	src.fully_heal(FALSE)

	var/infected_path = /mob/living/carbon/human/species/infected/jizzer

	var/mob/living/carbon/human/species/infected/inf = new infected_path(loc)

	inf.set_patron(src.patron)
	inf.gender = FEMALE
	inf.regenerate_icons()
	inf.stored_mob = src
	inf.limb_destroyer = TRUE
	inf.ambushable = FALSE
	inf.cmode_music = 'sound/music/cmode/antag/combat_darkstar.ogg'
	inf.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/infected_carpace/jizzer(inf)
	playsound(inf.loc, pick('sound/combat/gib (1).ogg','sound/combat/gib (2).ogg'), 200, FALSE, 3)
	inf.spawn_gibs(FALSE)
	src.forceMove(inf)

	inf.after_creation()
	inf.real_name = "Jizzer Infected"
	inf.name = "Jizzer Infected"

	inf.stored_language = new
	inf.stored_language.copy_known_languages_from(src)

	inf.stored_skills = ensure_skills().known_skills.Copy()
	inf.stored_experience = ensure_skills().skill_experience.Copy()

	inf.cmode_music_override = cmode_music_override
	inf.cmode_music_override_name = cmode_music_override_name
	mind.transfer_to(inf)
/*
	skills?.known_skills = list()
	skills?.skill_experience = list()
*/

//	inf.grant_language(/datum/language/aphasia) [Need to make language]

	inf.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, INTENT_HARM)
	inf.update_a_intents()

	to_chat(inf, span_infection("I LEAD THE HIVE!"))
	inf.emote("hiss")

	//INSERT THE PART WHERE YOU GET THE GIBLETS


	if(!inf.getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/testicles/testicles = inf.getorganslot(ORGAN_SLOT_TESTICLES)
		testicles = new /obj/item/organ/testicles
		testicles.ball_size = MAX_TESTICLES_SIZE
		testicles.Insert(inf, TRUE)

	if(!inf.getorganslot(ORGAN_SLOT_PENIS))
		var/obj/item/organ/penis/penis = inf.getorganslot(ORGAN_SLOT_PENIS)
		penis = new /obj/item/organ/penis/tentacle
		penis.penis_size = MAX_PENIS_SIZE
		penis.Insert(inf, TRUE)

	if(!inf.getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/breasts/breasts = inf.getorganslot(ORGAN_SLOT_BREASTS)
		breasts = new /obj/item/organ/breasts
		breasts.breast_size = MAX_BREASTS_SIZE
		breasts.Insert(inf, TRUE)

	if(!inf.getorganslot(ORGAN_SLOT_VAGINA))
		var/obj/item/organ/vagina/vagina = inf.getorganslot(ORGAN_SLOT_VAGINA)
		vagina = new /obj/item/organ/vagina
		vagina.Insert(inf, TRUE)


	inf.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	inf.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	inf.adjust_skillrank(/datum/skill/misc/climbing, 6, TRUE)
	inf.adjust_skillrank(/datum/skill/misc/swimming, 5, TRUE)
	inf.adjust_skillrank(/datum/skill/combat/slings, 6, TRUE)

	inf.STASTR = src.STASTR -4
	inf.STAPER = src.STAPER +4
	inf.STAINT = src.STAINT -2
	inf.STALUC = src.STALUC 
	inf.STASPD = src.STASPD +4
	inf.STACON = src.STACON -6
	inf.STAEND = src.STAEND +6

//To do, make a changeling like hivemind chat
	inf.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	inf.AddSpell(new /obj/effect/proc_holder/spell/targeted/woundlick)

	ADD_TRAIT(inf, TRAIT_NOSLEEP, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_STRONGBITE, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_ZJUMP, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_ORGAN_EATER, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_IGNORESLOWDOWN, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_HARDDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_PIERCEIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
	ADD_TRAIT(inf, TRAIT_DEATHBYSNUSNU, TRAIT_GENERIC)
	faction |= list("Infected")

	invisibility = oldinv
