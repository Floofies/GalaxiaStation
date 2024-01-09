// Re-labels TG brainproblems to be more generic. There never was a tumor anyways!
/datum/quirk/item_quirk/brainproblems
	name = "Brain Degeneration"
	desc = "You have a lethal condition in your brain that is slowly destroying it. Better bring some mannitol!"
	medical_record_text = "Patient has a lethal condition in their brain that is slowly causing brain death."
	icon = FA_ICON_BRAIN
	species_quirks = list(/datum/species/synthetic = /datum/quirk/item_quirk/brainproblems/synth)

// Override of Brain Tumor quirk for synthetic species with synthetic brains.
// Does not appear in TGUI or the character preferences window.
/datum/quirk/item_quirk/brainproblems/synth
	gain_text = "<span class='danger'>You feel glitchy.</span>"
	lose_text = "<span class='notice'>You no longer feel glitchy.</span>"
	mail_goodies = list(/obj/item/storage/pill_bottle/liquid_solder/braintumor)
	hidden_quirk = TRUE

// Adds custom medical flavortext for synthetic brains.
/datum/quirk/item_quirk/brainproblems/synth/add()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/internal/brain/synth_brain = human_holder.get_organ_slot(ORGAN_SLOT_BRAIN)
	if (istype(synth_brain, /obj/item/organ/internal/brain/synth/circuit))
		name = "Processor Firmware Bug"
	else if (istype(synth_brain, /obj/item/organ/internal/brain/synth/mmi))
		name = "Interface Rejection Syndrome"
	else
		name = "Positronic Cascade Anomaly"

	medical_record_text = "Patient has a malfunction in their [synth_brain.name] that is slowly causing brain death."
	..()

// Synthetics get liquid_solder with Brain Tumor instead of mannitol.
/datum/quirk/item_quirk/brainproblems/synth/add_unique(client/client_source)
	give_item_to_holder(
		/obj/item/storage/pill_bottle/liquid_solder/braintumor,
		list(
			LOCATION_LPOCKET = ITEM_SLOT_LPOCKET,
			LOCATION_RPOCKET = ITEM_SLOT_RPOCKET,
			LOCATION_BACKPACK = ITEM_SLOT_BACKPACK,
			LOCATION_HANDS = ITEM_SLOT_HANDS,
		),
		flavour_text = "These will keep you alive until you can secure a supply of medication. Don't rely on them too much!",
	)
