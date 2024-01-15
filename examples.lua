project "CPP"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"
	location "examples"

	targetdir ("examples/bin/" .. outputdir .. "")
	objdir ("examples/bin-int/" .. outputdir .. "")

	files
	{
		"examples/cpp/**.h",
		"examples/cpp/**.cpp"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
	}

	includedirs
	{
		"cpp",
		"examples/cpp"
	}
	
	links {
		"CPP SDK",
	}
	libdirs {
		"lib/%{cfg.architecture}/"
	}
	
	postbuildcommands {
		"{COPYFILE} \"%{wks.location}lib/%{cfg.architecture}/discord_game_sdk.dll\" \"%{wks.location}examples/bin/" .. outputdir .. "/discord_game_sdk.dll\""
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
		
		
project "C"
	kind "ConsoleApp"
	language "C"
	staticruntime "off"
	location "examples/c"

	targetdir ("examples/bin/" .. outputdir .. "")
	objdir ("examples/bin-int/" .. outputdir .. "")

	files
	{
		"examples/c/**.h",
		"examples/c/**.c",
	}

	includedirs
	{
		"c",
		"examples/c"
	}
	
	links {
		"C SDK"
	}
	
	postbuildcommands {
		"{COPYFILE} \"%{wks.location}lib/%{cfg.architecture}/discord_game_sdk.dll\" \"%{wks.location}examples/bin/" .. outputdir .. "/discord_game_sdk.dll\""
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
		
project "CSharp"
	kind "ConsoleApp"
	language "C#"
	location "examples/csharp"
	
	namespace ""
	framework "4.8"

	targetdir ("examples/bin/" .. outputdir .. "")
	objdir ("examples/bin-int/" .. outputdir .. "")
	
	files
	{
		"examples/csharp/**.cs",
	}
	
	links {
		"Microsoft.Csharp",
		"System",
		"System.Core",
		"System.Data",
		"System.Data.DataSetExtensions",
		"System.Net.Http",
		"System.Xml",
		"System.Xml.Linq",
	}
	
	links {
		"CSharp SDK"
	}
	
	postbuildcommands {
		"{COPYFILE} \"%{wks.location}lib/%{cfg.architecture}/discord_game_sdk.dll\" \"%{wks.location}examples/bin/" .. outputdir .. "/discord_game_sdk.dll\""
	}

	filter "configurations:Debug"
		runtime "Debug"
		optimize "off"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
