/mob/dead/observer/Login()
	..()
	if(client && client.banprisoned)
		Logout()
		qdel(src)
	ghost_accs = client.prefs.ghost_accs
	ghost_others = client.prefs.ghost_others
	var/preferred_form = null

	if(check_rights(R_ADMIN, 0))
		has_unlimited_silicon_privilege = 1

	if(client.prefs.unlock_content)
		preferred_form = client.prefs.ghost_form
		ghost_orbit = client.prefs.ghost_orbit

	update_icon(preferred_form)
	updateghostimages()
