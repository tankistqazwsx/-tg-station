/*
The /tg/ codebase currently requires you to have 7 z-levels of the same size dimensions.
z-level order is important, the order you put them in inside this file will determine what z level number they are assigned ingame.
Names of z-level do not matter, but order does greatly, for instances such as checking alive status of revheads on z1

current as of 2014/11/24
z1 = station
z2 = centcomm
z3 = derelict telecomms satellite
z4 = derelict station
z5 = mining
z6 = empty space
z7 = empty space
*/

#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "lavaland"

        #include "map_files\TerrorStation\MetaStation.v41I.dmm"
        #include "map_files\TerrorStation\z2t.dmm"
        #include "map_files\TerrorStation\z3.dmm"
        #include "map_files\TerrorStation\z4.dmm"
        #include "map_files\TerrorStation\lavaland_t.dmm"
        #include "map_files\TerrorStation\z6.dmm"
        #include "map_files\TerrorStation\z7.dmm"
        //#include "map_files\monorail_ivent\monorail.dmm" //Monorail Maks750rus
        #include "map_files\TerrorStation\z9.dmm" //prison

        #define MAP_PATH "map_files/TerrorStation"
        #define MAP_FILE "MetaStation.v41GS.dmm"
        #define MAP_NAME "Terror MetaStation"

        #define MAP_TRANSITION_CONFIG	list(MAIN_STATION = CROSSLINKED, CENTCOMM = SELFLOOPING, ABANDONED_SATELLITE = CROSSLINKED, DERELICT = CROSSLINKED, MINING = SELFLOOPING, EMPTY_AREA_1 = CROSSLINKED, EMPTY_AREA_2 = CROSSLINKED, ASTEROID = SELFLOOPING, BANPRISON = SELFLOOPING)

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring Terror's MetaStation.

#endif