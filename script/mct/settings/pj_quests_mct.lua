if not mct then return end

local mct_mod = mct:register_mod("pj_quests")
mct_mod:set_title("RLK")
mct_mod:set_author("et al")
mct_mod:set_description("Options.")

local regional_mercs = mct_mod:add_new_option("pj_quests_skip_contract_completed", "checkbox")
regional_mercs:set_default_value(false)
regional_mercs:set_text("Skip Contract Completed")
regional_mercs:set_tooltip_text("Skip the contract completed popup. Always get 10000 gold.")

local option = mct_mod:add_new_option("pj_quests_autoresolve_cheat", "checkbox")
option:set_default_value(false)
option:set_text("Start with full army")
option:set_tooltip_text("For autoresolving battles.")
