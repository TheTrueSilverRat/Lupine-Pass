/obj/effect/proc_holder/spell/aoe_turf/buff_infected
	name = "Spell"
	desc = ""

	recharge_time = 1 MINUTES
	still_recharging_msg = span_warn("It'll take time to boost the psionic presence of the hive's local node.")

	var/cast_without_targets = FALSE

	invocations = list("FOR THE HIVE!!") //what is uttered when the wizard casts the spell
	invocation_type = "shout"
	range = 8 //the range of the spell; outer radius for aoe spells
	selection_type = "view" //can be "range" or "view"

	gesture_required = FALSE

