/mob/living/carbon/human/species/infected
	name = "Common Infected"
	race = /datum/species/infected
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	var/datum/language_holder/stored_language
	var/list/stored_skills
	var/list/stored_experience

/mob/living/carbon/human/species/infected/male
	//They're all futas
	gender = FEMALE

/mob/living/carbon/human/species/infected/female
	gender = FEMALE

/datum/species/infected
	name = "Infected"
	id = "infected"
	species_traits = list(NO_UNDERWEAR, NO_ORGAN_FEATURES, NO_BODYPART_FEATURES, NOEYESPRITES)
	inherent_traits = list(
		TRAIT_STRONGBITE,
		TRAIT_ZJUMP,
		TRAIT_NOFALLDAMAGE1,
		TRAIT_INFINITE_STAMINA,
		TRAIT_BASHDOORS,
		TRAIT_SHOCKIMMUNE,
		TRAIT_STEELHEARTED,
		TRAIT_BREADY,
		TRAIT_ORGAN_EATER,
		TRAIT_NASTY_EATER,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_IGNOREDAMAGESLOWDOWN,
		TRAIT_HARDDISMEMBER, //Necessary for mobs with non modular sprites. Shits fuckd otherwise
		TRAIT_PIERCEIMMUNE, //Prevents weapon dusting and caltrop effects due to them transforming when killed/stepping on shards.
		TRAIT_IGNORESLOWDOWN,
		TRAIT_LONGSTRIDER,
		TRAIT_NOPAIN,
		TRAIT_NOPAINSTUN,
	)
	inherent_biotypes = MOB_HUMANOID
	armor = 30
	no_equip = list(SLOT_SHIRT, SLOT_HEAD, SLOT_WEAR_MASK, SLOT_ARMOR, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS, SLOT_CLOAK, SLOT_BELT, SLOT_BACK_R, SLOT_BACK_L, SLOT_S_STORE)
	nojumpsuit = 1
	sexes = 1
	offset_features = list(OFFSET_HANDS = list(0,2), OFFSET_HANDS_F = list(0,2))
	soundpack_m = /datum/voicepack/zombie/m
	soundpack_f = /datum/voicepack/zombie/f
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/night_vision/nightmare,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
	)

	languages = list(
		/datum/language/common
	)

/datum/species/infected/send_voice(mob/living/carbon/human/H)
	playsound(get_turf(H), pick('sound/vo/mobs/spider/speak (1).ogg','sound/vo/mobs/spider/speak (2).ogg', 'sound/vo/mobs/spider/speak (3).ogg', 'sound/vo/mobs/spider/speak (4).ogg'), 100, TRUE, -1)

/datum/species/infected/regenerate_icons(mob/living/carbon/human/H)
	H.icon = 'icons/roguetown/mob/monster/infected_mobs.dmi'
	H.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, INTENT_HARM)
	H.icon_state = "infected"
	return TRUE

/datum/species/infected/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/* When we get wounded overlays we can put these in, but for now nothing
/datum/species/infected/update_damage_overlays(mob/living/carbon/human/H)
	H.remove_overlay(DAMAGE_LAYER)
	var/list/hands = list()
	var/mutable_appearance/inhand_overlay = mutable_appearance("[H.icon_state]-dam", layer=-DAMAGE_LAYER)
	var/burnhead = 0
	var/brutehead = 0
	var/burnch = 0
	var/brutech = 0
	var/obj/item/bodypart/affecting = H.get_bodypart(BODY_ZONE_HEAD)
	if(affecting)
		burnhead = (affecting.burn_dam / affecting.max_damage)
		brutehead = (affecting.brute_dam / affecting.max_damage)
	affecting = H.get_bodypart(BODY_ZONE_CHEST)
	if(affecting)
		burnch = (affecting.burn_dam / affecting.max_damage)
		brutech = (affecting.brute_dam / affecting.max_damage)
	var/usedloss = 0
	if(burnhead > usedloss)
		usedloss = burnhead
	if(brutehead > usedloss)
		usedloss = brutehead
	if(burnch > usedloss)
		usedloss = burnch
	if(brutech > usedloss)
		usedloss = brutech
	inhand_overlay.alpha = 255 * usedloss
	testing("damalpha [inhand_overlay.alpha]")
	hands += inhand_overlay
	H.overlays_standing[DAMAGE_LAYER] = hands
	H.apply_overlay(DAMAGE_LAYER)
	return TRUE
*/
/* Not sure if I should have this but commenting it for now
/datum/species/infected/random_name(gender,unique,lastname)
	return "VEREWOLF"
*/

/obj/item/clothing/suit/roguetown/armor/skin_armor/infected_carpace
	slot_flags = null
	name = "\improper common infected's carpace"
	desc = ""
	icon_state = null
	body_parts_covered = FULL_BODY
	body_parts_inherent = FULL_BODY
	armor = ARMOR_PADDED
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	sewrepair = FALSE
	max_integrity = 150
	item_flags = DROPDEL


//Infection Proc, used for specifying transformation stuff.
/mob/living/carbon/human/proc/infected_transform()
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

	var/infected_path
	if(gender == MALE)
		infected_path = /mob/living/carbon/human/species/infected/male
	else
		infected_path = /mob/living/carbon/human/species/infected/female

	var/mob/living/carbon/human/species/infected/inf = new infected_path(loc)

	inf.set_patron(src.patron)
	inf.gender = gender
	inf.regenerate_icons()
	inf.stored_mob = src
	inf.limb_destroyer = TRUE
	inf.ambushable = FALSE
	inf.cmode_music = 'sound/music/cmode/antag/combat_darkstar.ogg'
	inf.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/infected_carpace(inf)
	playsound(inf.loc, pick('sound/combat/gib (1).ogg','sound/combat/gib (2).ogg'), 200, FALSE, 3)
	inf.spawn_gibs(FALSE)
	src.forceMove(inf)

	inf.after_creation()
	inf.real_name = "Common Infected"
	inf.name = "Common Infected"

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

	to_chat(inf, span_userdanger("I SERVE THE HIVE!"))
	inf.emote("rage")

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


	inf.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	inf.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	inf.adjust_skillrank(/datum/skill/misc/climbing, 6, TRUE)
	inf.adjust_skillrank(/datum/skill/misc/swimming, 5, TRUE)

	inf.STASTR = src.STASTR -2
	inf.STAPER = src.STAPER +2
	inf.STAINT = src.STAINT -4
	inf.STALUC = src.STALUC 
	inf.STASPD = src.STASPD +4
	inf.STACON = src.STACON -4
	inf.STAEND = src.STAEND +4

//To do, make a changeling like hivemind chat
	inf.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	inf.AddSpell(new /obj/effect/proc_holder/spell/targeted/woundlick)

	ADD_TRAIT(src, TRAIT_NOSLEEP, TRAIT_GENERIC)
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

