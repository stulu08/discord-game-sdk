project "Discord C Game SDK"
	kind "StaticLib"
	language "C"
	staticruntime "off"
	location "c"

	targetdir ("bin/" .. outputdir .. "")
	objdir ("bin-int/" .. outputdir .. "")

	files
	{
		"c/**.h",
		"c/**.c"
	}

	includedirs
	{
		"c",
	}
	
	links {
		"discord_game_sdk.dll.lib"
	}
	libdirs {
		"lib/%{cfg.architecture}/"
	}
	
	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "ST_DEBUG"
		runtime "Debug"
		optimize "off"
		symbols "on"

	filter "configurations:Release"
		defines "ST_RELEASE"
		runtime "Release"
		optimize "on"
		symbols "on"

	filter "configurations:Dist"
		defines "ST_DIST"
		runtime "Release"
		optimize "on"
		symbols "off"