/datum/species/infected/flasher
	name = "Flasher"
	id = "infected_flasher"
	infected_alt_sprite = "flasher"

/datum/species/infected/flasher/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.AddSpell()
