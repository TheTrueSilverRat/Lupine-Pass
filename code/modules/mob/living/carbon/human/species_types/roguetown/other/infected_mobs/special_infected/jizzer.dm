/mob/living/carbon/human/species/infected/jizzer
	name = "Jizzer"
	id = "infected_jizzer"
	infected_alt_sprite = "jizzer"

/datum/species/infected/jizzer/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_SEX_CUM_INTO, PROC_REF(jizzer_cum)) // Allows the immobilize effect to happen when cumming
	C.AddSpell(new /obj/effect/proc_holder/spell/self/jizzer_splat) // Making their projectile a spell since it's 
	//presumably cooldown


/datum/species/infected/jizzer/proc/jizzer_cum(mob/living/carbon/human/owner, mob/living/carbon/human/target)
	//Sends a message that causes them
	target.visible_message(span_warn("[owner.name]'s cum is utterly overflowing over [target.name]"), \
	span_warning("The Jizzer's cum overflowing and immobilizing you!"))
	target.Knockdown(20)
	target.Immobilize(20)

