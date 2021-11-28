// imgui_dll.cpp : Defines the exported functions for the DLL.
//

#include "pch.h"
#include "framework.h"
#include "imgui_dll.h"


// This is an example of an exported variable
IMGUIDLL_API int nimguidll=0;

// This is an example of an exported function.
IMGUIDLL_API int fnimguidll(void)
{
    return 0;
}

// This is the constructor of a class that has been exported.
Cimguidll::Cimguidll()
{
    return;
}
