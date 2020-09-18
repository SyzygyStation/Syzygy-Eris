/*
	Syzygy snowflake changes to stash datums.
*/

//Called after selected_direction is set,  from one of several places.
//This creates the direction string which will be inserted into the note,
//It does this by combining a base string with supplied data
/datum/stash/proc/create_direction_string(var/data)
	if (direction_string != "")
		//Don't create it twice
		return

	//Creating it from a landmark
	if (selected_direction == DIRECTION_LANDMARK)
		var/obj/landmark/storyevent/midgame_stash_spawn/S = data
		direction_string = replacetext(direction_string_base_landmark,"%L", S.navigation)

	//Creating coords from an atom
	else if (selected_direction == DIRECTION_COORDS)
		var/turf/T = get_turf(data)
		direction_string = direction_string_base_coords
		direction_string = replacetext(direction_string, "%X", "[T.x]")
		direction_string = replacetext(direction_string, "%Y", "[T.y]")
		direction_string = replacetext(direction_string, "%Z", "[-(T.z)+6]") //Syzygy change; makes it so that the returned z level is always the same as the deck.