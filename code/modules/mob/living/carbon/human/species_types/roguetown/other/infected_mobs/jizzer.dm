/datum/species/infected/jizzer
	name = "Jizzer"
	id = "infected_jizzer"
	infected_alt_sprite = "jizzer"

/datum/species/infected/jizzer/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_SEX_CUM_INTO, PROC_REF(jizzer_cum))


/datum/species/infected/jizzer/proc/jizzer_cum(mob/living/carbon/human/owner, mob/living/carbon/human/target)
	to_chat(src, "test")
