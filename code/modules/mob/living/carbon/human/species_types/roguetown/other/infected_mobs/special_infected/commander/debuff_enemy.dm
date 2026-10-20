/datum/status_effect/debuff/infected_debuff
	id = "infected_dbuff"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/infected_debuff
	effectedstats = list(STATKEY_STR = -4,STATKEY_PER = -2,STATKEY_INT = -2, STATKEY_CON = -4, STATKEY_END = -4, STATKEY_SPD = -4)
	duration = 45 SECONDS

/atom/movable/screen/alert/status_effect/debuff/infected_debuff
	name = "The Hive's Curse"
	desc = "A psionic presence is eroding my mind and body!"
	icon_state = "blackrot"


/obj/effect/proc_holder/spell/invoked/commander_curse
	name = "Commaner's Curse"
	overlay_state = "abyssal_strength1"
	releasedrain = 30
	chargetime = 15
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/items/beartrap.ogg'
	associated_skill = /datum/skill/magic/arcane
	gesture_required = TRUE // Offensive spell
	antimagic_allowed = TRUE
	recharge_time = 80 SECONDS
	miracle = FALSE
	hide_charge_effect = TRUE

/obj/effect/proc_holder/spell/invoked/commander_curse/cast(list/targets, mob/living/user)
	..()
	if(!isliving(targets[1]))
		return FALSE
	var/mob/living/carbon/target = targets[1]
	target.visible_message(span_info("A loud crunching sound has come from [target]!"), span_userdanger("I feel a painful presence numbing me in pain!"))
	target.adjustBruteLoss(30)
	target.blind_eyes(2)
	target.blur_eyes(10)
	target.apply_status_effect(/datum/status_effect/debuff/infected_debuff)
	return TRUE
