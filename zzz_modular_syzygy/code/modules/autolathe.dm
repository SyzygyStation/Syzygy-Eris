
/obj/machinery/autolathe
	var/cheap_printer = TRUE //Used for printed less affective guns/tools

/obj/machinery/autolathe/rnd
	cheap_printer = FALSE

/obj/machinery/autolathe/excelsior
	cheap_printer = FALSE

/obj/machinery/autolathe/bioprinter
	cheap_printer = FALSE

/obj/machinery/autolathe/mechfab
	cheap_printer = FALSE

/atom/proc/cheap_print()
	return

/obj/item/weapon/tool/cheap_print()
	.=..()
	if(.)
		precision -= 5
		workspeed = workspeed-0.05 //So we lose 5% of seed
		degradation += 5
		health = rand(10, max_health)

/obj/item/weapon/gun/cheap_print()
	. = ..()
	fire_delay+= 1
	recoil_buildup+= 4

