/datum/species/infected/jizzer
	name = "Jizzer"
	id = "infected_jizzer"
	infected_alt_sprite = "jizzer"

/datum/species/infected/jizzer/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_SEX_CUM_INTO, PROC_REF(jizzer_cum)) // Allows the immobilize effect to happen when cumming
	C.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/jizzer_splat) // Making their projectile a spell since it's 
	//presumably cooldown


/datum/species/infected/jizzer/proc/jizzer_cum(mob/living/carbon/human/owner, mob/living/carbon/human/target)
	//Sends a message that causes them
	target.visible_message(span_warn("[owner.name]'s cum is utterly overflowing over [target.name]"), \
	span_warning("The Jizzer's cum overflowing and immobilizing you!"))
	target.Knockdown(20)
	target.Immobilize(20)


/obj/effect/proc_holder/spell/invoked/projectile/jizzer_splat
	name = "Jizzer Shoot"
	desc = "Shoot out a thick wad of Jizz to fuck someone else over."
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/bullet/spider
	overlay_state = "ravox_tug"
	sound = 'sound/magic/webspin.ogg'
	recharge_time = 2 SECONDS
	no_early_release = FALSE
	movement_interrupt = FALSE
	invocations = list("HISS!")
	invocation_type = "shout"
	associated_skill = /datum/skill/combat/slings
	cost = 5
	xp_gain = TRUE


/obj/effect/proc_holder/spell/invoked/projectile/jizzer_splat/fire_projectile(mob/living/user, atom/target)
//Have to do it like this so that I can make it based on per over int
	current_amount--
	for(var/i in 1 to projectiles_per_fire)
		var/obj/projectile/P = new projectile_type(user.loc)
		if(istype(P, /obj/projectile/magic/bloodsteal))
			var/obj/projectile/magic/bloodsteal/B = P
			B.sender = user
		P.def_zone = user.zone_selected
		// Accuracy modification code, same as bow rebalance PR
		P.accuracy += (user.STAPER - 9) * 4
		P.bonus_accuracy += (user.STAPER - 8) * 3
		if(user.mind)
			P.bonus_accuracy += (user.get_skill_level(associated_skill) * 5) // +5% per level
		P.firer = user
		P.preparePixelProjectile(target, user)
		for(var/V in projectile_var_overrides)
			if(P.vars[V])
				P.vv_edit_var(V, projectile_var_overrides[V])
		ready_projectile(P, target, user, i)
		P.fire()
	return TRUE
	