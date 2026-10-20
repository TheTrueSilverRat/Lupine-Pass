/obj/effect/proc_holder/spell/aoe_turf/buff_infected
	name = "Buff Infected"
	desc = "Buff your fellow Hive-mates."


	overlay_state = "dreamfiend"
	recharge_time = 1 MINUTES
	still_recharging_msg = span_warn("It'll take time to boost the psionic presence of the hive's local node.")

	cast_without_targets = FALSE

	invocations = list("FOR THE HIVE!!") //what is uttered when the wizard casts the spell
	invocation_type = "shout"
	range = 8 //the range of the spell; outer radius for aoe spells
	selection_type = "view" //can be "range" or "view"

	gesture_required = FALSE

/obj/effect/proc_holder/spell/aoe_turf/buff_infected/cast(list/targets, mob/user)
	. = ..()
	for(var/turf/T in targets)
		for(var/mob/living/buff_target in T.contents)
			if(buff_target.faction_check_mob(user) && buff_target != user) //Checks if they have infected faction tag AND NOT THE USER
				to_chat(world, span_notice("This is a debug message to designate things all have worked out."))
				buff_target.apply_status_effect(/datum/status_effect/buff/buff_infected)

#define INFECTED_FILTER "infected_glow"
/atom/movable/screen/alert/status_effect/buff/buff_infected
	name = "The Power of the Hive."
	desc = "The Hive's psionice presence strengthens me (+2 to all Stats)"
	icon_state = "buff"

/datum/status_effect/buff/buff_infected
	var/outline_colour ="#ad069c" // Psionic power = Ourple
	id = "psionic_buff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/buff_infected
	effectedstats = list(STATKEY_STR = 2, STATKEY_CON = 2, STATKEY_END = 2, STATKEY_INT = 2, STATKEY_LCK = 2, STATKEY_PER = 2, STATKEY_SPD = 2)
	duration = 2 MINUTES

/datum/status_effect/buff/buff_infected/on_apply()
	. = ..()
	var/filter = owner.get_filter(INFECTED_FILTER)
	if (!filter)
		owner.add_filter(INFECTED_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
		ADD_TRAIT(owner, TRAIT_STRENGTH_UNCAPPED, TRAIT_MIRACLE)
	to_chat(owner, span_warning("The Hive's collective unity strengthens me."))


/datum/status_effect/buff/buff_infected/on_remove()
	. = ..()
	to_chat(owner, span_warning("The Hive's presence fades away to reccuperate."))
	owner.remove_filter(INFECTED_FILTER)
	REMOVE_TRAIT(owner, TRAIT_STRENGTH_UNCAPPED, TRAIT_MIRACLE)

#undef INFECTED_FILTER
