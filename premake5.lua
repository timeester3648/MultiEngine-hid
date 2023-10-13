include "../../premake/common_premake_defines.lua"

project "hid"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./**.h"
	}

	includedirs {
		"%{IncludeDir.hid}/hidapi"
	}

	excludes {
		"./version"
	}

 	filter "system:windows"
		files { "./windows/*.c" }