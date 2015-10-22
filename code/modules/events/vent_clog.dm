/datum/round_event_control/vent_clog
	name = "Clogged Vents"
	typepath = /datum/round_event/vent_clog
	weight = 35

/datum/round_event/vent_clog
	announceWhen	= 1
	startWhen		= 5
	endWhen			= 35
	var/interval 	= 2
	var/list/vents  = list()

/datum/round_event/vent_clog/announce()
	priority_announce("���� ��������� �������� ���������������� ����� ���������� ��������� ��������.  ����� ��������� ��������� ������� �����������.", "����������� �������")


/datum/round_event/vent_clog/setup()
	endWhen = rand(25, 100)
	for(var/obj/machinery/atmospherics/components/unary/vent_scrubber/temp_vent in machines)
		if(temp_vent.loc.z == ZLEVEL_STATION && !temp_vent.welded)
			var/datum/pipeline/temp_vent_parent = temp_vent.PARENT1
			if(temp_vent_parent.other_atmosmch.len > 20)
				vents += temp_vent
	if(!vents.len)
		return kill()

/datum/round_event/vent_clog/tick()
	if(activeFor % interval == 0)
		var/obj/vent = pick_n_take(vents)
		if(vent && vent.loc)
			var/list/gunk = list("water","carbon","flour","radium","toxin","cleaner","nutriment","condensedcapsaicin","mushroomhallucinogen","lube",
								 "plantbgone","banana","charcoal","space_drugs","morphine","holywater","ethanol","hot_coco","facid")
			var/datum/reagents/R = new/datum/reagents(50)
			R.my_atom = vent
			R.add_reagent(pick(gunk), 50)

			var/datum/effect/effect/system/smoke_spread/chem/smoke = new
			smoke.set_up(R, 1, vent, silent = 1)
			playsound(vent.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
			smoke.start()
			qdel(R)
