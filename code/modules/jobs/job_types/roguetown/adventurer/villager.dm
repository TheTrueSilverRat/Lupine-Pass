/datum/job/roguetown/villager
	title = TITLE_SMIOR
	flag = VILLAGER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_races = list(RACES_KEEP)
	tutorial = "You are a skilled craftsman, sent to ply your trade to the warriors of the fort.   Though you are respected for your talents, expect no preferential treatment.\
				You are merely laborer guests here.  Even still, you stand to make good coin; You’ve heard the vault is positively loaded."
	advclass_cat_rolls = list(CTAG_TOWNER = 20)
	outfit = null
	outfit_female = null
	bypass_lastclass = TRUE
	bypass_jobban = FALSE
	display_order = JDO_VILLAGER
	give_bank_account = TRUE
	min_pq = -15
	max_pq = null
	round_contrib_points = 2
	wanderer_examine = FALSE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	same_job_respawn_delay = 0
	class_setup_examine = FALSE	//Nooo thank you
	cmode_music = 'sound/music/cmode/towner/combat_towner.ogg'

/datum/job/roguetown/villager/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		H.faction |= "Keep"

/*
/datum/job/roguetown/adventurer/villager/New()
	. = ..()
	for(var/X in GLOB.peasant_positions)
		peopleiknow += X
		peopleknowme += X
	for(var/X in GLOB.yeoman_positions)
		peopleiknow += X
	for(var/X in GLOB.church_positions)
		peopleiknow += X
	for(var/X in GLOB.garrison_positions)
		peopleiknow += X
	for(var/X in GLOB.noble_positions)
		peopleiknow += X*/
