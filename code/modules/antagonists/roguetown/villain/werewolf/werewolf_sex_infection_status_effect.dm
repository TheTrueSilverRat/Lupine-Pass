/datum/status_effect/werewolf_infection
	id = "werewolf_infection"
	alert_type = /atom/movable/screen/alert/status_effect/werewolf_infection
	/// Time until transformation completes
	var/transformation_time
	var/message_cooldown_time
	var/message_cooldown_amount = 20 SECONDS
	// Doesn't hurt making this a static list.
	var/list/infection_messages = list(
		"I can feel fur growing underneath my skin.",
		"My teeth feel sharper than usual, I've almost cut myself on it.",
		"My loins constantly churn and grow in heat.",
		"I'm starting to enjoy the taste of meat raw more and more.",
		"I keep hearing whispers from the earth. Is she calling for me?",
		"Maybe Lupians were right all along.",
		"My mind is fraying, who am I?",
		"I can feel my pulse quickening. I've never felt this angry before.",
		"There's a strange numbness spreading through my limbs, I'm bleeding but I can't tell where.",
		"Silver is an ugly metal."
	)

/datum/status_effect/werewolf_infection/on_creation(mob/living/new_owner, time_to_transform = 5 MINUTES)
	. = ..()
	transformation_time = world.time + time_to_transform
	message_cooldown_time = world.time + message_cooldown_amount

/datum/status_effect/werewolf_infection/tick()
	if(world.time > message_cooldown_time)
		var/warning_message = pick(infection_messages)
		if(prob(10))
			to_chat(owner, span_userdanger("[warning_message]"))
		else
			to_chat(owner, span_danger("[warning_message]"))
		message_cooldown_time = world.time + message_cooldown_amount
//The Infection has ran its course, full time werewolfication
	if(world.time > transformation_time)
		var/mob/living/carbon/human/H = owner
		if(!iscarbon(H))
			H.remove_status_effect(/datum/status_effect/werewolf_infection)
		H.mind.add_antag_datum(/datum/antagonist/werewolf/lesser)
		H.werewolf_transform()
		H.remove_status_effect(/datum/status_effect/werewolf_infection)

/datum/status_effect/werewolf_infection/on_apply()
	. = ..()
	var/warning_message = pick(infection_messages)
	if(prob(10))
		to_chat(owner, span_userdanger("[warning_message]"))
	else
		to_chat(owner, span_danger("[warning_message]"))
	var/mob/living/carbon/human/H = owner
	if(!iscarbon(H))
		owner.remove_status_effect(/datum/status_effect/werewolf_infection)
	return TRUE

/atom/movable/screen/alert/status_effect/werewolf_infection
	name = "Growing Lycantrophy"
	desc = "You feel a bestial heat growing within you. You're becoming a wolf!"
	icon_state = "dream_mark"

// Updated proc to use status effect
/mob/living/carbon/human/proc/attempt_werewolf_infection(mob/living/carbon/human/source)


	if(!client)
		return

	//Source batch of effects makes sure that it's a proper werewolf and not a lesser

	if(source.mind?.has_antag_datum(/datum/antagonist/werewolf/lesser))
		return

	if(!(source.mind?.has_antag_datum(/datum/antagonist/werewolf)) && !((source.mind?.has_spell(/obj/effect/proc_holder/spell/self/werewolf_transform))))
		//If they don't have the datum but have the werewolf transform spell it'll not trigger
		return


	//If has wersewolf datums, can't be infected obv
	if(mind?.has_antag_datum(/datum/antagonist/werewolf) ||(mind?.has_antag_datum(/datum/antagonist/werewolf/lesser)))
		return FALSE

	//If has werewolf spell can't be infected obv
	if(mind?.has_spell(/obj/effect/proc_holder/spell/self/werewolf_transform))
		return FALSE

	// Apply status effect with timer
	apply_status_effect(
		/datum/status_effect/werewolf_infection
	)


	to_chat(src, span_love("As you rut with the beast, you can feel like a part of its beastial nature is forecefully imparted into you!!"))

	return TRUE
