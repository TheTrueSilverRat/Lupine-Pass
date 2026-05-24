/datum/status_effect/werewolf_infection/infected
	id = "hive_infected"
	alert_type = /atom/movable/screen/alert/status_effect/hive_infection
	/// Time until transformation completes
	transformation_time
	message_cooldown_time
	message_cooldown_amount = 20 SECONDS
	// Doesn't hurt making this a static list.
	infection_messages = list(
		"I CAN HEAR THE CHITTERING INSIDE MY HEAD",
		"THE HIVE IS CALLING TO ME THE HIVE IS CALLING TO ME.",
		"I can feel something GESTATING underneath my SKIN.",
		"SHE'S CALLING TO ME. I CAN HEAR HER. I CAN HEAR MOTHER.",
		"MOTHERASKSTOJOINTHEHIVEMOTHERASKSTOJOINTHEHIVEMOTHERASKSTOJOINTHEHIVEMOTHERASKSTOJOINTHEHIVE",
		"I need to feast. I'm so Hungry. I'm feeing something inside me",
		"My mind is fraying, who am I?",
		"I can feel my pulse quickening. I've never felt this angry before.",
		"There's a strange numbness spreading through my limbs, I'm bleeding but I can't tell where.",
		"DEVOUR EAT DESTROY. JOIN US JOIN US",
		"RESISTANCE IS FUTILE. \n YOU WILL BE ASSIMILATED INTO THE HIVE"
	)

/datum/status_effect/werewolf_infection/infected/on_creation(mob/living/new_owner, time_to_transform = 5 MINUTES)
	. = ..()
	transformation_time = world.time + time_to_transform
	message_cooldown_time = world.time + message_cooldown_amount

/datum/status_effect/werewolf_infection/infected/tick()
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
			H.remove_status_effect(/datum/status_effect/werewolf_infection/infected)
		H.infected_transform()
		H.remove_status_effect(/datum/status_effect/werewolf_infection/infected)

/datum/status_effect/werewolf_infection/infected/on_apply()
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

/atom/movable/screen/alert/status_effect/hive_infection
	name = "THE HIVE SPREADS"
	desc = "YOUR SENSE OF SELF DEGENERATES \n INFECTION SPREADS \n YOU ARE BECOMING ONE WITH THE HIVE!"
	icon_state = "blackeye"

// Updated proc to use status effect
/mob/living/carbon/human/proc/attempt_infected_infection(mob/living/carbon/human/source)
	
	//Tests if they're an infected race or not
	if(istype(src.dna.species, /datum/species/infected))
		return FALSE 

	// Apply status effect with timer
	apply_status_effect(
		/datum/status_effect/werewolf_infection/infected
	)


	to_chat(src, span_love("SOMETHING BURIES INTO YOU. YOU ARE BECOMING PART OF THE HIVE"))

	return TRUE
