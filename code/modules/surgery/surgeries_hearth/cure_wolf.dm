
/datum/surgery/cure_wolf
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/excise_wolf,
		/datum/surgery_step/cauterize
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery_step/excise_wolf
	name = "excise the wolf"
	implements = list(
		/obj/item/clothing/neck/roguetown/psicross = 85,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	time = 8 SECONDS
	surgery_flags = SURGERY_INCISED
	skill_min = SKILL_LEVEL_APPRENTICE
	preop_sound = 'sound/surgery/cautery1.ogg'
	success_sound = 'sound/surgery/cautery2.ogg'

/datum/surgery_step/burn_rot/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)

	if(!(target.has_status_effect(/datum/status_effect/werewolf_infection)))
		to_chat(user, span_green("What are you doing? This target isn't infected"))

	display_results(user, target, span_notice("I begin to excise the wolf parasite within [target]'s heart with the cross..."),
		span_notice("[user] begins to burn out the wolf from [target]'s heart."),
		span_notice("[user] begins to burn out the wolf from [target]'s heart."))
	return TRUE

// calls the remove_rot which is shared with the pestra prayer to remove rot
/datum/surgery_step/burn_rot/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	if(!(target.has_status_effect(/datum/status_effect/werewolf_infection))) //in case the earlier thing didn't work
		return

	var/burndam = 100
	if(user.mind)
		var/medskill = user.get_skill_level(/datum/skill/magic/holy) //Miracles determine how easily can you use a cross to burn the wolf out
		burndam -= (medskill * 2)
		if(medskill > SKILL_LEVEL_EXPERT)
			burndam = 0
		
		target.adjustFireLoss(burndam*2)
		target.adjust_fire_stacks(burndam)
		target.IgniteMob()

		if(burndam > 0)
			target.visible_message(
				span_warningbig("[target] suddenly ignites in fire as the wolf howls its death's throes"),
				span_warningbig("HOLY FUCKING SHIT IT HURTS!!!!!")
			)

		target.remove_status_effect(/datum/status_effect/werewolf_infection)
	return TRUE
