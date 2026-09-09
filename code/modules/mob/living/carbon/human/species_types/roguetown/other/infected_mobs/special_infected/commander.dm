/datum/species/infected/commander
	name = "Commander"
	id = "infected_commander"
	infected_alt_sprite = "commander"

/datum/species/infected/flasher/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.AddSpell()
	C.AddSpell()
	C.AddSpell()
	

