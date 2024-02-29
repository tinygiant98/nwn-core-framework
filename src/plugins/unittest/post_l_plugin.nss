/// ----------------------------------------------------------------------------
/// @file   post_l_plugin.nss
/// @author Ed Burke (tinygiant98) <af.hog.pilot@gmail.com>
/// @brief  Event scripts for Power-On Self Test/Unit Testing
/// ----------------------------------------------------------------------------

#include "util_i_library"
#include "util_i_unittest"
#include "core_i_framework"

// -----------------------------------------------------------------------------
//                               Event Scripts
// -----------------------------------------------------------------------------

/// @brief Creates the required targeting hook and data tables in the
///     module's volatile sqlite database.
void post_OnModuleLoad()
{
    // Find all test scripts and run them, if they should be run.
}


// -----------------------------------------------------------------------------
//                               Library Dispatch
// -----------------------------------------------------------------------------

void OnLibraryLoad()
{
    if (!GetIfPluginExists("targeting"))
    {
        object oPlugin = CreatePlugin("targeting");
        SetName(oPlugin, "[Plugin] Unit Test / POST System");
        SetDescription(oPlugin, "Manages forced player targeting mode and target lists.");
        SetDebugPrefix(HexColorString("[Testing]", COLOR_GREEN_LIME), oPlugin);
        
        RegisterEventScript(oPlugin, MODULE_EVENT_ON_MODULE_LOAD,   "post_OnModuleLoad");
    }

    RegisterLibraryScript("targeting_OnModuleLoad",   1);
    RegisterLibraryScript("targeting_OnPlayerTarget", 2);
}

void OnLibraryScript(string sScript, int nEntry)
{
    switch (nEntry)
    {
        case 1: post_OnModuleLoad();   break;
        //case 2: targeting_OnPlayerTarget(); break;
        default: CriticalError("Library function " + sScript + " not found");
    }
}
