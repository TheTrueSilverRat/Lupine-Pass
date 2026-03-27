/obj/item/organ/penis
	name = "penis"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	organ_dna_type = /datum/organ_dna/penis
	accessory_type = /datum/sprite_accessory/penis/human
	var/sheath_type = SHEATH_TYPE_NONE
	var/erect_state = ERECT_STATE_NONE
	var/penis_type = PENIS_TYPE_PLAIN
	var/penis_size = DEFAULT_PENIS_SIZE
	var/functional = TRUE

/obj/item/organ/penis/Initialize()
	. = ..()

/obj/item/organ/penis/proc/update_erect_state()
	var/oldstate = erect_state
	var/new_state = ERECT_STATE_NONE

	if(owner)
		var/mob/living/carbon/human/human = owner
		if(!human?.sexcon.can_use_penis())
			new_state = ERECT_STATE_NONE
		else if(human.sexcon.arousal > 20 && human.sexcon.manual_arousal == 1 || human.sexcon.manual_arousal == 4)
			new_state = ERECT_STATE_HARD
		else if(human.sexcon.arousal > 10 && human.sexcon.manual_arousal == 1 || human.sexcon.manual_arousal == 3)
			new_state = ERECT_STATE_PARTIAL
		else
			new_state = ERECT_STATE_NONE

	erect_state = new_state
	if(oldstate != erect_state && owner)
		owner.update_body_parts(TRUE)

/obj/item/organ/penis/knotted
	name = "knotted penis"
	penis_type = PENIS_TYPE_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/knotted/big
	penis_size = 3

/obj/item/organ/penis/equine
	name = "equine penis"
	penis_type = PENIS_TYPE_EQUINE
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tapered_mammal
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tapered
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_SLIT

/obj/item/organ/penis/tapered_knotted
	name = "tapered knotted penis"
	penis_type = PENIS_TYPE_TAPERED_KNOTTED
	sheath_type = SHEATH_TYPE_SLIT

/obj/item/organ/penis/tapered_knotted_mammal
	name = "tapered knotted penis"
	penis_type = PENIS_TYPE_TAPERED_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tapered_double
	name = "hemi tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE
	sheath_type = SHEATH_TYPE_SLIT

/obj/item/organ/penis/tapered_double_mammal
	name = "hemi tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tapered_double_knotted
	name = "hemi knotted tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE_KNOTTED
	sheath_type = SHEATH_TYPE_SLIT

/obj/item/organ/penis/tapered_double_knotted_mammal
	name = "hemi knotted tapered penis (sheath)"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/barbed
	name = "barbed penis"
	penis_type = PENIS_TYPE_BARBED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/barbed_knotted
	name = "barbed knotted penis"
	penis_type = PENIS_TYPE_BARBED_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tentacle
	name = "tentacle penis"
	penis_type = PENIS_TYPE_TENTACLE
	sheath_type = SHEATH_TYPE_NONE

	
/obj/item/organ/vagina
	name = "vagina"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	accessory_type = /datum/sprite_accessory/vagina/human
	var/pregnant = FALSE
	var/fertility = TRUE
	var/impregnation_probability = IMPREG_PROB_DEFAULT

/obj/item/organ/vagina/proc/be_impregnated(mob/living/carbon/human/species/father)
    if(!owner)
        return
    if(owner.stat == DEAD)
        return
    if(pregnant)
        to_chat(owner, span_love("I feel a surge of warmth in my belly again..."))
        return
    to_chat(owner, span_love("I feel a surge of warmth in my belly, I’m definitely pregnant!"))
    pregnant = TRUE
	//TODO add a way to trigger lactating when pregnancy happens

// PREGNANCY-ASSOCIATED DEBUFFS
// Leaving them here for now because it feels like the most appropriate spot.

/datum/status_effect/pregnancy
	duration = -1 //Permanent until cleared.

/datum/status_effect/pregnancy/goblin
	id = "preggo_gob"
	alert_type = /atom/movable/screen/alert/status_effect/preggo_gob
	var/affecting = FALSE

/atom/movable/screen/alert/status_effect/preggo_gob
	name = "Goblin Rascals"
	desc = "<font color='#f590ce'><span class='bold'>I've been knocked up by a goblin.. Just thinking about those horrid creatures fills me with paralyzing fear.</span></font>"

/datum/status_effect/debuff/preg_goblin
	id = "preggo_gob_debuff"
	effectedstats = list(STATKEY_STR = -2)
	alert_type = /atom/movable/screen/alert/status_effect/debuff/preggo_gob

/atom/movable/screen/alert/status_effect/debuff/preggo_gob
	name = "Paralyzing Fear"
	desc = "<font color='#f590ce'><span class='bold'>There are goblins here, I feel weaker.</span></font>"

/datum/status_effect/pregnancy/goblin/tick()
	if(!owner)
		return
	affecting = FALSE
	for(var/mob/living/carbon/human/species/L in view(7, owner))
		if(L.stat >= UNCONSCIOUS)	//We shouldn't be afraid of dead or unconscious goblins.
			continue
		if((L.race == /datum/species/goblin) || (L.race == /datum/species/goblinp))
			owner.add_stress(/datum/stressevent/goblins)
			affecting = TRUE //Creecher found, start affecting the mother.
			break
	if(affecting)
		owner.apply_status_effect(/datum/status_effect/debuff/preg_goblin)
	else
		owner.remove_status_effect(/datum/status_effect/debuff/preg_goblin)


/datum/status_effect/pregnancy/werewolf
	id = "preggo_werewolf"
	alert_type = /atom/movable/screen/alert/status_effect/preggo_werewolf
	var/affecting = FALSE

/atom/movable/screen/alert/status_effect/preggo_werewolf
	name = "Werewolf Litter"
	desc = "<font color='#f590ce'><span class='bold'>I've been bred by a werewolf.. Staying outside at night fills me with worry and saps at my vigor.</span></font>"

/datum/status_effect/debuff/preg_werewolf
	id = "preggo_werewolf_debuff"
	effectedstats = list(STATKEY_STR = -1, STATKEY_CON = -1)
	alert_type = /atom/movable/screen/alert/status_effect/debuff/preggo_werewolf

/atom/movable/screen/alert/status_effect/debuff/preggo_werewolf
	name = "Moonlight Call"
	desc = "<font color='#f590ce'><span class='bold'>The moonlight fills me with dread. Something growing within me is drawn to it...</span></font>"

/datum/status_effect/pregnancy/werewolf/tick()
	var/turf/loc = owner.loc
	if(GLOB.tod == "night" && !affecting)
		if(isturf(owner.loc))
			if(loc.can_see_sky())
				owner.add_stress(/datum/stressevent/werewolf_litter)
				owner.apply_status_effect(/datum/status_effect/debuff/preg_werewolf)
				affecting = TRUE	//Start affecting the mother.
	if(affecting)
		if(isturf(owner.loc))	//Technically you could freeze the debuff if you put the werewolf chewtoy into something that's not a turf (I think a crate or closet works), but it'll clear as soon as they exit it so doesn't really matter.
			if(GLOB.tod != "night" || !loc.can_see_sky())
				owner.remove_status_effect(/datum/status_effect/debuff/preg_werewolf)
				owner.remove_stress(/datum/stressevent/werewolf_litter)
				affecting = FALSE


/datum/status_effect/pregnancy/minotaur
	id = "preggo_taur"
	alert_type = /atom/movable/screen/alert/status_effect/preggo_taur

/atom/movable/screen/alert/status_effect/preggo_taur
	name = "Minotaur Foal"
	desc = "<font color='#f590ce'><span class='bold'>I've been violated by a minotaur.. I feel an intense craving for more of their thick cum...</span></font>"

/datum/status_effect/pregnancy/orc
	id = "preggo_orc"
	alert_type = /atom/movable/screen/alert/status_effect/preggo_orc
	var/affecting = FALSE

/atom/movable/screen/alert/status_effect/preggo_orc
	name = "Orc Bastard"
	desc = "<font color='#f590ce'><span class='bold'>I've been claimed by an orc.. Being reminded of their brute strength makes me weak in the legs...</span></font>"

/datum/status_effect/debuff/preg_orc
	id = "preggo_orc_debuff"
	effectedstats = list(STATKEY_STR = -1, STATKEY_SPD = -1)
	alert_type = /atom/movable/screen/alert/status_effect/debuff/

/atom/movable/screen/alert/status_effect/debuff/preggo_orc
	name = "Shaking Legs"
	desc = "<font color='#f590ce'><span class='bold'>There are orcs here, my legs feel weaker.</span></font>"

/datum/status_effect/pregnancy/orc/tick()
	if(!owner)
		return
	affecting = FALSE
	for(var/mob/living/carbon/human/species/L in view(7, owner))
		if(L.stat >= UNCONSCIOUS)	//We shouldn't be afraid of dead or unconscious goblins.
			continue
		if(L.race == /datum/species/orc)
			owner.add_stress(/datum/stressevent/goblins/orc)
			affecting = TRUE //Creecher found, start affecting the mother.
			break
	if(affecting)
		owner.apply_status_effect(/datum/status_effect/debuff/preg_orc)
	else
		owner.remove_status_effect(/datum/status_effect/debuff/preg_orc)


/datum/status_effect/pregnancy/bandit
	id = "preggo_bandit"
	alert_type = /atom/movable/screen/alert/status_effect/preggo_bandit
	var/affecting = FALSE

/atom/movable/screen/alert/status_effect/preggo_bandit
	name = "Bandit Child"
	desc = "<font color='#f590ce'><span class='bold'>I've been impregnated by a bandit.. I carry the child of an outlaw.</span></font>"

/datum/status_effect/pregnancy/bandit/tick()
	if(!affecting)
		owner.add_stress(/datum/stressevent/bandit_child)
	affecting = TRUE


/datum/status_effect/pregnancy/lupian
	id = "preggo_lupian"
	alert_type = /atom/movable/screen/alert/status_effect/preggo_lupian

/atom/movable/screen/alert/status_effect/preggo_lupian
	name = "Lupian Pups"
	desc = "<font color='#f590ce'><span class='bold'>I carry the pups of the pillaging lupians.. I can at least find safety in knowing I will be protected until they are born.</span></font>"

/obj/item/organ/breasts
	name = "breasts"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	organ_dna_type = /datum/organ_dna/breasts
	accessory_type = /datum/sprite_accessory/breasts/pair
	var/breast_size = DEFAULT_BREASTS_SIZE
	var/lactating = FALSE
	var/milk_stored = 0
	var/milk_max = 75

/obj/item/organ/breasts/New()
	..()
	milk_max = max(75, breast_size * 100)

/obj/item/organ/testicles
	name = "testicles"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	organ_dna_type = /datum/organ_dna/testicles
	accessory_type = /datum/sprite_accessory/testicles/pair
	var/ball_size = DEFAULT_TESTICLES_SIZE
	var/virility = TRUE

/obj/item/organ/testicles/internal
	name = "internal testicles"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none
