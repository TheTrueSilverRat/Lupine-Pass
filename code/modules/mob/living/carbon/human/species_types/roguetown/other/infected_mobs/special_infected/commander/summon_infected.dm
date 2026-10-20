/obj/effect/proc_holder/spell/invoked/summon_infected
	name = "Summon Infected"
	desc = "Call a common member of the hive to heed your call."
	clothes_req = FALSE
	overlay_state = "animate"
	range = 7
	sound = list('sound/magic/magnet.ogg')
	releasedrain = 40
	chargetime = 60
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	gesture_required = TRUE // Summon spell
	associated_skill = /datum/skill/magic/arcane
	recharge_time = 30 SECONDS
	var/cabal_affine = FALSE
	var/is_summoned = FALSE
	hide_charge_effect = TRUE

/obj/effect/proc_holder/spell/invoked/summon_infected/cast(list/targets, mob/living/user)
	. = ..()
	var/turf/T = get_turf(targets[1])
	if(!isopenturf(T))
		to_chat(user, span_warning("The targeted location is blocked. The infected cannot climb out here."))
		return FALSE
	new /mob/living/carbon/human/species/infected/npc(T, user)
	new /mob/living/carbon/human/species/infected/npc(T, user)
	new /mob/living/carbon/human/species/infected/npc(T, user)
	return TRUE
