/// ----------------------------------------------------------------------------
/// @file   hook_spellhook.nss
/// @author Michael A. Sinclair (Squatting Monk) <squattingmonk@gmail.com>
/// @brief  OnSpellhook event script.
/// ----------------------------------------------------------------------------

#include "core_i_framework"

void main()
{
    int nState = RunEvent(MODULE_EVENT_ON_SPELLHOOK);

    // The DENIED state stops the spell from executing
    if (nState & EVENT_STATE_DENIED)
        BlockLastSpell();
    else
    {
        // Handle the special case of casting a spell at an item
        object oItem = GetSpellTargetObject();

        if (GetObjectType(oItem) == OBJECT_TYPE_ITEM)
        {
            string sTag = GetTag(oItem);
            SetItemEvent(ITEM_EVENT_ON_SPELL_CAST_AT);
            RunLibraryScript(sTag);
        }
    }
}
