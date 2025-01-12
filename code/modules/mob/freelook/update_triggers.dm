//UPDATE TRIGGERS, when the chunk (and the surrounding chunks) should update.

// TURFS

/proc/updateVisibility(atom/A, opacity_check = 1)
	for(var/datum/visualnet/VN in GLOB.visual_nets)
		VN.updateVisibility(A, opacity_check)

/turf
	var/list/image/obfuscations

// STRUCTURES

/obj/structure/Destroy()
	updateVisibility(src)
	return ..()

/obj/structure/Initialize(mapload)
	. = ..()
	updateVisibility(src)

// EFFECTS

/obj/effect/Destroy()
	updateVisibility(src)
	return ..()

/obj/effect/Initialize(mapload)
	. = ..()
	if(!mapload)
		updateVisibility(src)

// DOORS

// Simply updates the visibility of the area when it opens/closes/destroyed.
/obj/machinery/door/update_nearby_tiles(need_rebuild)
	. = ..(need_rebuild)
	// Glass door glass = 1
	// don't check then?
	if(!glass)
		updateVisibility(src, 0)
