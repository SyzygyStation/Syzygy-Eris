
/obj/machinery/autolathe
	var/cheap_printer = TRUE //Used for printed less affective guns/tools

/obj/machinery/autolathe/advanced
	name = "Advanced Autolathe"
	desc = "It produces items using metal and glass. Unlike the normal this is an advanced verson with a micro laser for finner printing."
	cheap_printer = FALSE
	circuit = /obj/item/weapon/electronics/circuitboard/autolathe_advanced

/obj/machinery/autolathe/advanced/loaded
	stored_material = list(
		MATERIAL_STEEL = 60,
		MATERIAL_PLASTIC = 60,
		MATERIAL_GLASS = 60,
		)

/obj/machinery/autolathe/advanced/loaded/Initialize()
	. = ..()
	container = new /obj/item/weapon/reagent_containers/glass/beaker(src)

/obj/item/weapon/electronics/circuitboard/autolathe_advanced
	name = T_BOARD("autolathe")
	build_path = /obj/machinery/autolathe/advanced
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 3, TECH_DATA = 3)
	req_components = list(
		/obj/item/weapon/stock_parts/matter_bin = 3,
		/obj/item/weapon/stock_parts/manipulator = 1,
		/obj/item/weapon/stock_parts/micro_laser = 1,
		/obj/item/weapon/stock_parts/console_screen = 1,
	)

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

