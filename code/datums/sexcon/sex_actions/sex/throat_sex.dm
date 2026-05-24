/datum/sex_action/throat_sex
	name = "Fuck their throat"
	stamina_cost = 1.0

/datum/sex_action/throat_sex/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(isdullahan(target) && knot_on_finish)
		var/datum/species/dullahan/dullahan = target.dna.species
		if(dullahan.headless)
			return FALSE
	return TRUE

/datum/sex_action/throat_sex/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(user.erpable) // User is a npc, bypasss shit I'm too tired for this
		return TRUE
	if(!check_location_accessible(user, user, BODY_ZONE_PRECISE_GROIN, TRUE))
		to_chat(world, "[user]'s groin is not accessible")
		return FALSE
	if(!check_location_accessible(user, target, BODY_ZONE_PRECISE_MOUTH))
		to_chat(world, "DEBUG: [target]'s mouth isn't available")
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		to_chat(world, "DEBUG [user]'s penis does not exist")
		return FALSE
	if(!user.sexcon.can_use_penis())
		to_chat(world, "DEBUG: [user] can't use penis")
		return FALSE
	if(isdullahan(target) && knot_on_finish)
		var/datum/species/dullahan/dullahan = target.dna.species
		if(dullahan.headless)
			return FALSE
	return TRUE

/datum/sex_action/throat_sex/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] slides [user.p_their()] cock into [target]'s throat!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/throat_sex/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s throat."))
	playsound(target, 'sound/misc/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)
	user.sexcon.do_thrust_animate(target)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)
	if(user.sexcon.check_active_ejaculation())
		if(istype(user.dna.species, /datum/species/werewolf) && target.has_quirk(/datum/quirk/kinfolk))
			target.attempt_werewolf_infection(user)
		if(istype(user.dna.species, /datum/species/infected) && target.has_quirk(/datum/quirk/infectable))
			target.attempt_infected_infection(user)
		user.sexcon.handle_orgasm_counter(target, user)
		user.visible_message(span_love("[user] cums into [target]'s throat!"))
		user.sexcon.cum_into(oral = TRUE, splashed_user = target) // give facial status effect for the target, considering this was rough throat sex
		user.virginity = FALSE

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	else
		user.sexcon.perform_sex_action(target, 0, 7, FALSE)
		user.sexcon.perform_deepthroat_oxyloss(target, 2.6)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/throat_sex/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] pulls [user.p_their()] cock out of [target]'s throat."))

/datum/sex_action/throat_sex/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

/datum/sex_action/throat_sex/knot
	name = "Knot their throat"
	knot_on_finish = TRUE

/datum/sex_action/throat_sex/knot/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!user.sexcon.knot_penis_type())
		return FALSE
	return ..()

/datum/sex_action/throat_sex/knot/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!user.sexcon.knot_penis_type())
		return FALSE
	return ..()

/datum/sex_action/throat_sex/knot/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] knot-fucks [target]'s throat."))
	playsound(target, 'sound/misc/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)
	user.sexcon.do_thrust_animate(target)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)
	if(user.sexcon.check_active_ejaculation())
		if(user.mind.has_antag_datum(/datum/antagonist/werewolf) && target.has_quirk(/datum/quirk/kinfolk))
			to_chat(target, span_love("I feel a bestial essence curling in my chest"))
			target.apply_status_effect(/datum/status_effect/werewolf_infection)
		user.sexcon.handle_orgasm_counter(target, user)
		user.visible_message(span_love("[user] cums into [target]'s throat!"))
		user.sexcon.cum_into(oral = TRUE, splashed_user = target) // give facial status effect for the target, considering this was rough throat sex
		user.virginity = FALSE

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	else
		user.sexcon.perform_sex_action(target, 0, 7, FALSE)
		user.sexcon.perform_deepthroat_oxyloss(target, 2.6)
	target.sexcon.handle_passive_ejaculation()
