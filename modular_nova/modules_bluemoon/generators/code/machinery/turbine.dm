// Bluemoon addition - Custom generator sounds
/obj/machinery/power/turbine/core_rotor
	var/datum/looping_sound/turbine/soundloop

/obj/machinery/power/turbine/core_rotor/Initialize(mapload)
	. = ..()
	soundloop = new(src, active)

/obj/machinery/power/turbine/core_rotor/Destroy()
	QDEL_NULL(soundloop)
	return ..()

/obj/machinery/power/turbine/core_rotor/power_on()
	. = ..()
	if(active)
		playsound(src, 'modular_nova/modules_bluemoon/generators/sound/turbine_breaker.ogg', 75, TRUE)
		soundloop.start()

/obj/machinery/power/turbine/core_rotor/power_off()
	var/was_active = active
	. = ..()
	if(!active && was_active)
		playsound(src, 'modular_nova/modules_bluemoon/generators/sound/turbine_breaker.ogg', 75, TRUE)
		soundloop.stop()
