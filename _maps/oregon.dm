#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map

		#define MINETYPE "lavaland"

// хз насколько вообще актуально этим пользоваться
#ifndef TRAVIS_MASS_MAP_BUILD

		///#include "map_files\debug\wasteland.dmm"
		///#include "map_files\TexasWasteland\navarro.dmm"
		///#include "map_files\TexasWasteland\fartexas.dmm"
        ///#include "map_files\TexasWasteland\z3.dmm"
		#include "map_files\TexasWasteland\oregon_legacy.dmm"
		#include "map_files\TexasWasteland\z2_legacy.dmm"

		#define MAP_PATH "map_files/TexasWasteland"
        #define MAP_FILE "oregon_legacy.dmm"
        #define MAP_NAME "Oregon Wasteland"
        #define MAP_FACTIONS_LIST list("vault", "vault_npc", "bs", "bs_npc", "enclave", "enclave_npc", "none", "none_npc", "city", "city_npc", "raiders", "raiders_npc","ncr", "ncr_npc","legion","legion_npc","followers","followers_npc","coc")

		#define MAP_TRANSITION_CONFIG list()
#endif
#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring wasteland debug.

#endif
