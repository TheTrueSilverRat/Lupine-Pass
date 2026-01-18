/datum/round_event_control/antagonist/solo/lich
	name = "Lich"
	tags = list(
		TAG_COMBAT,
		TAG_HAUNTED,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_LICH
	shared_occurence_type = SHARED_HIGH_THREAT

	denominator = 80

	base_antags = 1
	maximum_antags = 2

	weight = 3	//i love you
	max_occurrences = 0 //temp back to migrant wave only

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/lich
	antag_datum = /datum/antagonist/lich

	restricted_roles = list(
		"Grand Duke",
		"Grand Duchess",
		"Consort",
		"Dungeoneer",
		"Sergeant",
		"Men-at-arms",
		"Marshal",
		"Merchant",
		"Bishop",
		TITLE_PRIEST,
		"Martyr",
		"Templar",
		"Councillor",
		TITLE_RAIDER_NOMAD,
		"Prince",
		"Princess",
		"Hand",
		"Steward",
		"Court Physician",
		"Town Elder",
		"Knight Captain",
		"Archivist",
		TITLE_STELLARI,
		TITLE_VALA,
		"Inquisitor",
		"Orthodoxist",
		"Absolver",
		TITLE_SKOGAMOR,
		"Squire",
		TITLE_BURGMEISTER,
		"Apothecary"
	)

/datum/round_event/antagonist/solo/lich
