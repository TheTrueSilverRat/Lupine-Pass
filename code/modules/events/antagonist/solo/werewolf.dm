/datum/round_event_control/antagonist/solo/werewolf
	name = "Verevolfs"
	tags = list(
		TAG_COMBAT,
		TAG_HAUNTED,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_WEREWOLF
	shared_occurence_type = SHARED_HIGH_THREAT

	denominator = 50

	base_antags = 1
	maximum_antags = 2
	min_players = 25
	weight = 7

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/werewolf
	antag_datum = /datum/antagonist/werewolf

	restricted_roles = list(
		"Grand Duke",
		"Grand Duchess",
		"Knight Captain",
		"Consort",
		"Sergeant",
		"Men-at-Arms",
		"Woman-at-Arms",
		"Marshal",
		"Merchant",
		"Bishop",
		TITLE_PRIEST,
		"Martyr",
		"Templar",
		TITLE_RAIDER_NOMAD,
		"Prince",
		"Princess",
		"Hand",
		"Steward",
		"Court Physician",
		"Town Elder",
		"Captain",
		"Archivist",
		"Knight",
		"Dame",
		"Court Magician",
		"Inquisitor",
		"Orthodoxist",
		"Absolver",
		"Warden",
		"Squire",
		TITLE_BURGMEISTER,
		"Apothecary"
	)

/datum/round_event/antagonist/solo/werewolf
