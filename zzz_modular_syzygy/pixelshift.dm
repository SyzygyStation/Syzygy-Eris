/mob/verb/eastshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_x <= 16)
		pixel_x++
//		is_shifted = TRUE

/mob/verb/westshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_x >= -16)
		pixel_x--
//		is_shifted = TRUE

/mob/verb/northshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_y <= 16)
		pixel_y++
//		is_shifted = TRUE

/mob/verb/southshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_y >= -16)
		pixel_y--
//		is_shifted = TRUE

//Syxygy overwrite for pixel shifting movement

/datum/movement_handler/mob/movement/DoMove(var/direction, var/mob/mover)
	. = MOVEMENT_HANDLED
	if(mob.moving)
		return

	if(!mob.lastarea)
		mob.lastarea = get_area(mob.loc)

	//We are now going to move
	mob.moving = 1

	direction = mob.AdjustMovementDirection(direction)
	var/old_turf = get_turf(mob)
	step(mob, direction)

	// Something with pulling things
	var/extra_delay = HandleGrabs(direction, old_turf)
	mob.add_move_cooldown(extra_delay)

	/* TODO: Bay grab system
	for (var/obj/item/weapon/grab/G in mob)
		if (G.assailant_reverse_facing())
			mob.set_dir(GLOB.reverse_dir[direction])
		G.assailant_moved()
	for (var/obj/item/weapon/grab/G in mob.grabbed_by)
		G.adjust_position()
	*/

	mob.pixel_x = mob.default_pixel_x //Reset pixel shifting x
	mob.pixel_y = mob.default_pixel_y //REset pixel shifting y

	mob.moving = 0