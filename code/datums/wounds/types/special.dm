/datum/wound/facial
	name = "facial trauma"
	sound_effect = 'sound/combat/crit.ogg'
	severity = WOUND_SEVERITY_SEVERE
	whp = null
	woundpain = 0
	can_sew = FALSE
	can_cauterize = FALSE
	critical = FALSE

/datum/wound/facial/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial) && (type == other.type))
		return FALSE
	return TRUE

/datum/wound/facial/ears
	name = "tympanosectomy"
	check_name = span_danger("EARS")
	crit_message = list(
		"The eardrums are gored!",
		"The eardrums are ruptured!",
	)
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE
	woundpain = 30 // it REALLY HURTS to have ruptured eardrums

/datum/wound/facial/ears/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_EARS)

/datum/wound/facial/ears/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(10)
	var/obj/item/organ/ears/ears = affected.getorganslot(ORGAN_SLOT_EARS)
	if(ears)
		ears.Remove(affected)
		ears.forceMove(affected.drop_location())

/datum/wound/facial/eyes
	name = "eye evisceration"
	check_name = span_warning("EYE")
	crit_message = list(
		"The eye is poked!",
		"The eye is gouged!",
		"The eye is destroyed!",
	)
	woundpain = 30
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE
	var/do_blinding = TRUE

/datum/wound/facial/eyes/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_EYES)

/datum/wound/facial/eyes/on_mob_gain(mob/living/affected)
	. = ..()
	if(do_blinding)
		affected.Stun(10)
		affected.blind_eyes(5)

/datum/wound/facial/eyes/right
	name = "right eye evisceration"
	check_name = span_danger("RIGHT EYE")
	crit_message = list(
		"The right eye is poked!",
		"The right eye is gouged!",
		"The right eye is destroyed!",
	)

/datum/wound/facial/eyes/right/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial/eyes/right))
		return FALSE
	return TRUE

/datum/wound/facial/eyes/right/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_CYCLOPS_RIGHT, "[type]")
	affected.update_fov_angles()
	if(affected.has_wound(/datum/wound/facial/eyes/left) && affected.has_wound(/datum/wound/facial/eyes/right))
		var/obj/item/organ/my_eyes = affected.getorganslot(ORGAN_SLOT_EYES)
		if(my_eyes)
			my_eyes.Remove(affected)
			my_eyes.forceMove(affected.drop_location())

/datum/wound/facial/eyes/right/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_CYCLOPS_RIGHT, "[type]")
	affected.update_fov_angles()

/datum/wound/facial/eyes/right/permanent
	whp = null
	woundpain = 0
	sound_effect = null
	do_blinding = FALSE

/datum/wound/facial/eyes/left
	name = "left eye evisceration"
	check_name = span_danger("LEFT EYE")
	crit_message = list(
		"The left eye is poked!",
		"The left eye is gouged!",
		"The left eye is destroyed!",
	)

/datum/wound/facial/eyes/left/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial/eyes/left))
		return FALSE
	return TRUE

/datum/wound/facial/eyes/left/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_CYCLOPS_LEFT, "[type]")
	affected.update_fov_angles()
	if(affected.has_wound(/datum/wound/facial/eyes/left) && affected.has_wound(/datum/wound/facial/eyes/right))
		var/obj/item/organ/my_eyes = affected.getorganslot(ORGAN_SLOT_EYES)
		if(my_eyes)
			my_eyes.Remove(affected)
			my_eyes.forceMove(affected.drop_location())

/datum/wound/facial/eyes/left/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_CYCLOPS_LEFT, "[type]")
	affected.update_fov_angles()

/datum/wound/facial/eyes/left/permanent
	whp = null
	woundpain = 0
	sound_effect = null
	do_blinding = FALSE

/datum/wound/facial/tongue
	name = "glossectomy"
	check_name = span_danger("TONGUE")
	crit_message = list(
		"The tongue is cut!",
		"The tongue is severed!",
		"The tongue flies off in an arc!"
	)
	woundpain = 20
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE

/datum/wound/facial/tongue/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_TONGUE)

/datum/wound/facial/tongue/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(10)
	var/obj/item/organ/tongue/tongue_up_my_asshole = affected.getorganslot(ORGAN_SLOT_TONGUE)
	if(tongue_up_my_asshole)
		tongue_up_my_asshole.Remove(affected)
		tongue_up_my_asshole.forceMove(affected.drop_location())

/datum/wound/facial/disfigurement
	name = "disfigurement"
	check_name = span_warning("FACE")
	severity = 0
	crit_message = "The face is mangled beyond recognition!"
	whp = null
	woundpain = 20
	mob_overlay = "cut"
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE

/datum/wound/facial/disfigurement/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_DISFIGURED, "[type]")

/datum/wound/facial/disfigurement/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_DISFIGURED, "[type]")
	
/datum/wound/facial/disfigurement/nose
	name = "rhinotomy"
	check_name = span_warning("NOSE")
	crit_message = list(
		"The nose is mangled beyond recognition!",
		"The nose is destroyed!",
	)
	mortal = TRUE
	woundpain = 10

/datum/wound/facial/disfigurement/nose/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_MISSING_NOSE, "[type]")

/datum/wound/facial/disfigurement/nose/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_MISSING_NOSE, "[type]")

/datum/wound/cbt
	name = "testicular torsion"
	check_name = span_userdanger("<B>NUTCRACK</B>")
	crit_message = list(
		"The testicles are twisted!",
		"The testicles are torsioned!",
	)
	whp = 50
	woundpain = 100
	mob_overlay = ""
	sewn_overlay = ""
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = TRUE
	critical = TRUE
	mortal = TRUE

/datum/wound/cbt/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/cbt))
		return FALSE
	return TRUE

/datum/wound/cbt/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("groin", forced = TRUE)
	affected.Stun(20)
	to_chat(affected, span_userdanger("Something twists inside my groin!"))
	if(affected.gender != MALE)
		name = "ovarian torsion"
		check_name = span_userdanger("<B>EGGCRACK</B>")
		crit_message = list(
			"The ovaries are twisted!",
			"The ovaries are torsioned!",
		)
	else
		name = "testicular torsion"
		check_name = span_userdanger("<B>NUTCRACK</B>")
		crit_message = list(
			"The testicles are twisted!",
			"The testicles are torsioned!",
		)

/datum/wound/cbt/on_life()
	. = ..()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/carbon_owner = owner
	if(!carbon_owner.stat && prob(5))
		carbon_owner.vomit(1, stun = TRUE)

/datum/wound/cbt/permanent
	name = "testicular evisceration"
	crit_message = list(
		"The testicles are destroyed!",
		"The testicles are eviscerated!",
	)
	whp = null

/datum/wound/cbt/permanent/on_mob_gain(mob/living/affected)
	. = ..()
	if(affected.gender != MALE)
		name = "ovarian evisceration"
		check_name = span_userdanger("<B>EGGCRACK</B>")
		crit_message = list(
			"The ovaries are destroyed!",
			"The ovaries are eviscerated!",
		)
	else
		name = "testicular evisceration"
		check_name = span_userdanger("<B>NUTCRACK</B>")
		crit_message = list(
			"The testicles are destroyed!",
			"The testicles are eviscerated!",
		)

/datum/wound/scarring
	name = "permanent scarring"
	check_name = "<span class='userdanger'><B>SCARRED</B></span>"
	severity = WOUND_SEVERITY_SEVERE
	crit_message = list(
		"The whiplash cuts deep!",
		"The tissue is irreversibly rended!",
		"The %BODYPART is thoroughly disfigured!",
	)
	sound_effect = 'sound/combat/crit.ogg'
	whp = 80
	woundpain = 30
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = TRUE
	critical = TRUE
	sleep_healing = 0
	var/gain_emote = "paincrit"

/datum/wound/scarring/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("scream", TRUE)
	affected.Slowdown(20)
	shake_camera(affected, 2, 2)

/datum/wound/scarring/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/scarring))
		return FALSE
	return TRUE

/datum/wound/heatexhaustion
	name = "heat exhaustion"
	check_name = span_warning("HEATEXHAUSTION")
	severity = 0
	crit_message = ""
	whp = null
	woundpain = 0
	mob_overlay = "cut"
	can_sew = FALSE
	can_cauterize = FALSE
	critical = FALSE
	sleep_healing = 0
	bleed_rate = 0
	clotting_threshold = 0
	clotting_rate = 0
	bypass_bloody_wound_check = TRUE

	var/start_time
	var/duration = 1 MINUTES

/datum/wound/heatexhaustion/on_mob_gain(mob/living/affected)
	. = ..()
	start_time = world.time
	if(!owner.stat)
		to_chat(owner, span_warning("A wave of heat washes over me... I feel faint."))
	owner.overlay_fullscreen("heatexhaust", /atom/movable/screen/fullscreen/heatexhaust)

/datum/wound/heatexhaustion/on_life()
	. = ..()

	if(!iscarbon(owner))
		return

	var/mob/living/carbon/C = owner

	// If cooled off, remove heat exhaustion
	if(C.bodytemperature <= BODYTEMP_NORMAL_MAX)
		to_chat(C, span_notice("Cool air steadies me. The worst of the heat passes."))
		C.clear_fullscreen("heatexhaust")
		qdel(src)
		return

	// Occasional discomfort message
	if(!C.stat && prob(5))
		to_chat(C, span_warning("My vision swims from the heat..."))

	// After 1 minute, convert to heatstroke
	if(world.time >= start_time + duration)
		var/obj/item/bodypart/BP = bodypart_owner
		if(BP)
			to_chat(C, span_userdanger("The heat overwhelms me!"))
			BP.add_wound(/datum/wound/heatstroke)
		C.clear_fullscreen("heatexhaust")
		qdel(src)

/datum/wound/heatstroke
	name = "heatstroke"
	check_name = span_warning("HEATSTROKE")
	severity = 0
	crit_message = ""
	whp = null
	woundpain = 0
	mob_overlay = "cut"
	can_sew = FALSE
	can_cauterize = FALSE
	critical = FALSE
	sleep_healing = 0
	bleed_rate = 0
	clotting_threshold = 0
	clotting_rate = 0
	bypass_bloody_wound_check = TRUE
	var/cure_timer

/datum/wound/heatstroke/on_mob_gain(mob/living/affected)
	. = ..()
	cure_timer = null
	owner.overlay_fullscreen("heatstroke", /atom/movable/screen/fullscreen/heatstroke)

/datum/wound/heatstroke/on_life()
	. = ..()

	if(!iscarbon(owner))
		return

	var/mob/living/carbon/C = owner

	if(!C.stat && prob(5))
		if(prob(5))
			C.vomit(1, blood = FALSE, stun = TRUE)
		to_chat(owner, span_warning("The world is spinning!"))
		C.Dizzy(10)

	// If temperature is normal, start cure timer
	if(C.bodytemperature <= BODYTEMP_NORMAL_MAX)
		if(!cure_timer)
			to_chat(C, span_notice("The heat begins to slowly fade from my body..."))
			cure_timer = addtimer(CALLBACK(src, PROC_REF(cure_heatstroke)), 2 MINUTES)

	// If overheating again, cancel cure timer
	else
		if(cure_timer)
			deltimer(cure_timer)
			cure_timer = null

/datum/wound/heatstroke/on_mob_loss()
	. = ..()
	if(cure_timer)
		deltimer(cure_timer)
		cure_timer = null

	if(!iscarbon(owner))
		return

	var/mob/living/carbon/C = owner
	to_chat(owner, span_warning("The world has stopped spinning."))
	C.set_dizziness(0)

/datum/wound/heatstroke/proc/cure_heatstroke()
	if(!owner)
		return

	var/mob/living/carbon/human/H = owner

	to_chat(H, span_notice("The world finally stops spinning as the heat leaves me."))
	H.clear_fullscreen("heatstroke")
	qdel(src)

/datum/wound/frostbite
	name = "frostbite"
	check_name = span_blue("FROSTBITE")
	severity = 0
	crit_message = ""
	whp = null
	woundpain = 0
	mob_overlay = "cut"
	can_sew = FALSE
	can_cauterize = FALSE
	critical = FALSE
	sleep_healing = 0
	bleed_rate = 0
	clotting_threshold = 0
	clotting_rate = 0
	bypass_bloody_wound_check = TRUE
	var/stage = 1
	var/last_stage_tick
	var/stage_interval = 2 MINUTES

/datum/wound/frostbite/on_mob_gain(mob/living/affected)
	. = ..()
	last_stage_tick = world.time
	update_stage_name()
	owner.overlay_fullscreen("frostbite", /atom/movable/screen/fullscreen/frostbite)

/datum/wound/frostbite/on_life()
	. = ..()

	if(!iscarbon(owner))
		return

	var/mob/living/carbon/C = owner
	var/obj/item/bodypart/BP = bodypart_owner

	// Warmth degrades frostbite
	if(C.bodytemperature >= BODYTEMP_NORMAL_MIN)
		if(world.time >= last_stage_tick + (1 MINUTES))
			stage--
			last_stage_tick = world.time

			if(stage >= 1)
				to_chat(C, span_notice("The feeling slowly returns to my [BP]..."))
				disabling = FALSE
				update_stage_name()
			else
				stage = 1

	// Stage progression
	if(stage < 3 && world.time >= last_stage_tick + stage_interval && C.bodytemperature < BODYTEMP_NORMAL_MIN)
		stage++
		last_stage_tick = world.time
		update_stage_name()

		switch(stage)
			if(2)
				to_chat(C, span_userdanger("My [BP] is completely numb..."))
			if(3)
				to_chat(C, span_userdanger("My [BP] feels dead and brittle!"))
				disabling = TRUE

	// Damage scaling per stage
	if(!C.stat && prob(30))
		var/damage = 0
		switch(stage)
			if(1)
				damage = 2
			if(2)
				damage = 5
			if(3)
				damage = 10
		if(BP.bandage)
			damage = damage *0.25

		C.apply_damage(damage, BURN)

/datum/wound/frostbite/proc/update_stage_name()
	var/stage_text

	switch(stage)
		if(1)
			stage_text = "I"
		if(2)
			stage_text = "II"
		if(3)
			stage_text = "III"

	check_name = span_blue("FROSTBITE ([stage_text])")


/datum/wound/hypothermia
	name = "hypothermia"
	check_name = span_blue("HYPOTHERMIA")
	severity = 0
	crit_message = ""
	whp = 40
	woundpain = 0
	mob_overlay = null
	can_sew = FALSE
	can_cauterize = FALSE
	critical = FALSE
	sleep_healing = 0
	bleed_rate = 0
	clotting_threshold = 0
	clotting_rate = 0
	bypass_bloody_wound_check = TRUE

	var/start_time
	var/duration = 1 MINUTES

/datum/wound/hypothermia/on_mob_gain(mob/living/affected)
	. = ..()
	start_time = world.time
	owner.overlay_fullscreen("hypothermia", /atom/movable/screen/fullscreen/hypothermia)

/datum/wound/hypothermia/on_life()
	. = ..()

	if(!iscarbon(owner))
		return

	var/mob/living/carbon/C = owner

	// If warmed up, remove hypothermia
	if(C.bodytemperature >= BODYTEMP_NORMAL_MIN)
		to_chat(C, span_notice("Feeling returns to my body as I warm up."))
		C.clear_fullscreen("hypothermia")
		qdel(src)
		return

	// Occasional discomfort message
	if(!C.stat && prob(5))
		to_chat(C, span_warning("I can't stop shivering..."))

	// After 1 minute, convert to frostbite
	if(world.time >= start_time + duration)
		var/obj/item/bodypart/BP = bodypart_owner
		if(BP)
			to_chat(C, span_userdanger("I feel pins and needles in [BP]!"))
			BP.add_wound(/datum/wound/frostbite)
		qdel(src)
