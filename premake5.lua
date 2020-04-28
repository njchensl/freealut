project "alut"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/AL/alut.h",
        "src/**.**"
    }

    includedirs {
        "include", "Hazel/vendor/OpenAL/include"
    }

    defines {
        "HAVE_STDINT_H"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        buildoptions {
            "/O2", "/Ob2", "/Ot", "/Oy", "/GT", "/LTCG", "/GL"
        }    
    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        buildoptions {
            "/O2", "/Ob2", "/Ot", "/Oy", "/GT", "/LTCG", "/GL"
        }

