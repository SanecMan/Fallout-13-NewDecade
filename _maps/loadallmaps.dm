#define TRAVIS_MASS_MAP_BUILD
#define MAP_TRANSITION_CONFIG DEFAULT_MAP_TRANSITION_CONFIG

#include "oregon.dm"
#ifdef MAP_OVERRIDE_FILES
	#undef MAP_OVERRIDE_FILES
#endif

	#include "map_files\TexasWasteland\oregon_legacy.dmm"
	#include "map_files\TexasWasteland\z2_legacy.dmm"


#undef TRAVIS_MASS_MAP_BUILD

#ifdef TRAVISBUILDING
#include "templates.dm"
#endif

#define BYOND_WHY_YOU_NO_ALLOW_INCLUDE_LAST_LINE //because byond fails to compile if the last thing in a file is an include.