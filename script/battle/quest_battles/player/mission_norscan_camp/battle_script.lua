-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_kraka_drak_norcan_camp
-- Attacker
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();

bm = battle_manager:new(empire_battle:new());
local gc = generated_cutscene:new(true);

--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, loop_camera)
gc:add_element(nil, "battle_norscan_camp_speech_01", "gc_slow_army_pan_front_right_to_front_left_close_medium_01", 10000, true, false, false);
gc:add_element(nil, "battle_norscan_camp_speech_02", "gc_fast_commander_back_medium_medium_to_close_low_01", 8000, false, false, false);
gc:add_element(nil, "battle_norscan_camp_speech_03", "gc_medium_enemy_army_pan_back_right_to_back_left_far_high_01", 7000, false, false, false);
gc:add_element(nil, "battle_norscan_camp_speech_04", "gc_medium_army_pan_front_right_to_front_left_close_medium_01", 8000, false, false, false);

gb = generated_battle:new(
	true,                                      		-- screen starts black
	false,                                     		-- prevent deployment for player
	false,                                      	-- prevent deployment for ai
	function() gb:start_generated_cutscene(gc) end, -- intro cutscene function
	false                                      		-- debug mode
);

gb:set_cutscene_during_deployment(true);

local detected_phase = 0;

-------------------------------------------------------------------------------------------------
---------------------------------------- INTRO VO & SUBS ----------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ARMY SETUP -------------------------------------------
-------------------------------------------------------------------------------------------------
alliances = bm:alliances();
alliance_enemy = alliances:item(2);
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- player attacker 

ga_battle_norscan_camp_army_dwf_ally__mammoth_cannon = gb:get_army(gb:get_player_alliance_num(),"battle_norscan_camp_army_dwf_ally__mammoth_cannon"); -- units
ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers = gb:get_army(gb:get_player_alliance_num(),"battle_norscan_camp_army_dwf_ally__bugmans_rangers"); -- char/army

ga_battle_norscan_camp_character_name_nor = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_character_name_nor"); -- char/army
ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_horsemen"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_spearman = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_spearman"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_berserkers"); -- units
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_mon_skinwolves"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0 = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_hunters_0"); -- units

ga_battle_norscan_camp_character_name_nor:defend_on_message("deployment_started", -496.9, 36.5, 200); -- x/y radius
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen:defend_on_message("deployment_started", -496.9, 36.5, 200); -- x/y radius
ga_battle_norscan_camp_army_nor_unit_marauder_spearman:defend_on_message("deployment_started", -496.9, 36.5, 200); -- x/y radius
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers:defend_on_message("deployment_started", -496.9, 36.5, 200); -- x/y radius
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves:defend_on_message("deployment_started", -350.1, -200.9, 200); -- x/y radius
ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0:defend_on_message("deployment_started", -496.9, 36.5, 200); -- x/y radius

ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers:defend_on_message("deployment_started", -61.4, 14.5, 100); -- x/y radius


ga_battle_norscan_camp_army_dwf_ally__mammoth_cannon:set_enabled(false);  -- instant on start invis
ga_battle_norscan_camp_character_name_nor:set_enabled(false);  -- instant on start invis
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen:set_enabled(false);  -- instant on start invis
ga_battle_norscan_camp_army_nor_unit_marauder_spearman:set_enabled(false);  -- instant on start invis
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers:set_enabled(false);  -- instant on start invis
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves:set_enabled(false);  -- instant on start invis
ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers:set_enabled(false);  -- instant on start invis
-- ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0:set_enabled(false);  -- instant on start invis


-------------------------------------------------------------------------------------------------
----------------------------------------- ARMY TELEPORT -----------------------------------------
-------------------------------------------------------------------------------------------------


gb:add_listener("battle_started", function() battle_start_teleport_unit(ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0, 1, 
    v(-641.2, 67.6)) end);
gb:add_listener("battle_started", function() battle_start_teleport_unit(ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0, 2, 
    v(-442.9, 11.4)) end);
gb:add_listener("battle_started", function() battle_start_teleport_unit(ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0, 3, 
    v(-477.5, 149.4)) end);

gb:add_listener("battle_started", function() battle_start_teleport_unit(ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth, 1, 
    v(-641.2, 67.6)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_norscan_camp_army_dwf_ally__mammoth_cannon, 
    v(-641.2, 67.6)) end);

gb:add_listener("battle_started", function()
    ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers:set_enabled(true);
    battle_start_teleport_units(ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers,v(-61.4, 14.5))
    battle_start_teleport_units(ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers,v(-61.4, 14.5))
    battle_start_teleport_units(ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers,v(-61.4, 14.5))
    end);



gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_norscan_camp_character_name_nor, 
    v(-496.9, 36.5)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_norscan_camp_army_nor_unit_marauder_horsemen, 
    v(-464.1, 164.9)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_norscan_camp_army_nor_unit_marauder_berserkers, 
    v(-399.4, -15.0)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_norscan_camp_army_nor_unit_marauder_spearman, 
    v(-621.0, -167.3)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_norscan_camp_army_nor_unit_mon_skinwolves, 
    v(-669.0, -40.0)) end);


-------------------------------------------------------------------------------------------------
------------------------------------------- CUTSCENE --------------------------------------------
-------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------
------------------------------------------ ORDERS -------------------------------------------
-------------------------------------------------------------------------------------------------
bm:repeat_callback(function() check_unit_visibility(ga_player, alliance_enemy) end, 10000, "player_detection");

gb:add_listener("player_detected_02_02", 
function() 
    ga_battle_norscan_camp_army_nor_unit_marauder_spearman:set_enabled(true);  -- make visible
end);

gb:add_listener("player_detected_02_03", 
function() 
    ga_battle_norscan_camp_army_nor_unit_marauder_berserkers:set_enabled(true);  -- make visible
end);

gb:add_listener("player_detected_02_04", 
function() 
    ga_battle_norscan_camp_army_nor_unit_marauder_horsemen:set_enabled(true);  -- make visible
end);

gb:add_listener("player_detected_02_05", 
function() 
    ga_battle_norscan_camp_army_nor_unit_mon_skinwolves:set_enabled(true);  -- make visible
end);

gb:add_listener("player_detected_02_06", 
function() 
    ga_battle_norscan_camp_character_name_nor:set_enabled(true);  -- make visible
end);

gb:add_listener("ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth_dead", 
function() 
    ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth:set_enabled(false);  -- make invisible
    battle_start_teleport_units(ga_battle_norscan_camp_army_dwf_ally__mammoth_cannon, 
    v(-641.2, 67.6))
    ga_battle_norscan_camp_army_dwf_ally__mammoth_cannon:set_enabled(true);  -- make visible
    ga_battle_norscan_camp_army_dwf_ally__mammoth_cannon:attack()
end);

ga_battle_norscan_camp_character_name_nor:attack_on_message("player_detected_02_06");
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen:attack_on_message("player_detected_02_06");
ga_battle_norscan_camp_army_nor_unit_marauder_spearman:attack_on_message("player_detected_02_06");
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers:attack_on_message("player_detected_02_06");
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves:attack_on_message("player_detected_02_06");
ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0:attack_on_message("player_detected_02_06");
ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers:attack_on_message("player_detected_02_06");

ga_battle_norscan_camp_character_name_nor:attack_on_message("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen:attack_on_message("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_spearman:attack_on_message("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers:attack_on_message("under_attack");
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves:attack_on_message("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0:attack_on_message("under_attack");
ga_battle_norscan_camp_army_dwf_ally__bugmans_rangers:attack_on_message("under_attack");

ga_battle_norscan_camp_character_name_nor:message_on_under_attack("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen:message_on_under_attack("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_spearman:message_on_under_attack("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers:message_on_under_attack("under_attack");
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves:message_on_under_attack("under_attack");
ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0:message_on_under_attack("under_attack");



ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth:message_on_shattered_proportion("ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth_dead", 0.95); -- Dead char /or fleeing


gb:message_on_time_offset("player_detected_02_01", 10, "player_detected_01_03");
gb:message_on_time_offset("player_detected_02_02",30000, "player_detected_01_03");
gb:message_on_time_offset("player_detected_02_03",60000, "player_detected_01_03");
gb:message_on_time_offset("player_detected_02_04",90000, "player_detected_01_03");
gb:message_on_time_offset("player_detected_02_05",120000, "player_detected_01_03");
gb:message_on_time_offset("player_detected_02_06",150000, "player_detected_01_03");


-- -- Battle win setup --
ga_battle_norscan_camp_character_name_nor = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_character_name_nor"); -- char/army
ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_horsemen"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_spearman = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_spearman"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_berserkers"); -- units
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_mon_skinwolves"); -- units
ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0 = gb:get_army(gb:get_non_player_alliance_num(),"battle_norscan_camp_army_nor_unit_marauder_hunters_0"); -- units

ga_battle_norscan_camp_character_name_nor:message_on_shattered_proportion("ga_battle_norscan_camp_character_name_nor_dead", 0.95);
ga_battle_norscan_camp_army_nor_unit_marauder_horsemen:message_on_shattered_proportion("ga_battle_norscan_camp_army_nor_unit_marauder_horsemen_dead", 0.95);
ga_battle_norscan_camp_army_nor_unit_marauder_spearman:message_on_shattered_proportion("ga_battle_norscan_camp_army_nor_unit_marauder_spearman_dead", 0.95);
ga_battle_norscan_camp_army_nor_unit_marauder_berserkers:message_on_shattered_proportion("ga_battle_norscan_camp_army_nor_unit_marauder_berserkers_dead", 0.95);
ga_battle_norscan_camp_army_nor_unit_mon_skinwolves:message_on_shattered_proportion("ga_battle_norscan_camp_army_nor_unit_mon_skinwolves_dead", 0.95);
ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0:message_on_shattered_proportion("ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0_dead", 0.95);

gb:message_on_all_messages_received("battle_norscan_camp_dead",
"ga_battle_norscan_camp_character_name_nor_dead",
"ga_battle_norscan_camp_army_nor_unit_marauder_horsemen_dead",
"ga_battle_norscan_camp_army_nor_unit_marauder_spearman_dead",
"ga_battle_norscan_camp_army_nor_unit_marauder_berserkers_dead",
"ga_battle_norscan_camp_army_nor_unit_mon_skinwolves_dead",
"ga_battle_norscan_camp_army_nor_unit_marauder_hunters_0_dead")

ga_player:force_victory_on_message("battle_norscan_camp_dead", 10000); 

-------------------------------------------------------------------------------------------------
----------------------------------------- USEFUL FUNCTIONS --------------------------------------
-------------------------------------------------------------------------------------------------
function battle_start_teleport_units(unitgroup, coordinates)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:teleport_to_location(coordinates, 0, 27);
    end;
end;

function check_unit_visibility(unitgroup, alliance)
    local is_visible_now = 0
	for i = 1, unitgroup.sunits:count() do
		local current_sunit = unitgroup.sunits:item(i);
		if current_sunit.unit:is_visible_to_alliance(alliance) and detected_phase < 3 then
            gb:add_ping_icon_on_message("detected", ga_player.sunits:item(i).unit:position(), 4, 1000, 8000);
            gb.sm:trigger_message("detected");
            is_visible_now = 1;
		end;
	end;
    if is_visible_now > 0 then
        detected_phase = detected_phase + 1;
        if detected_phase == 1 then
            gb.sm:trigger_message("player_detected_01_01");
        end
        if detected_phase == 2 then
            gb.sm:trigger_message("player_detected_01_02");
        end
        if detected_phase == 3 then
            gb.sm:trigger_message("player_detected_01_03");
        end
    end
    if is_visible_now == 0 and detected_phase < 3 then
        detected_phase = 0;
    end
end;

function battle_start_teleport_unit(unitgroup, index, coordinates)
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit.uc:teleport_to_location(coordinates, 0, 27);
end;

function battle_command_queue_unit(unitgroup, index, coordinates)
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit.uc:goto_location(coordinates, true)
end;

function battle_command_queue(unitgroup, coordinates)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:goto_location(coordinates, true)
    end;
end;

function battle_command_attack(unitgroup, target_unitgroup)
    local target_sunit = target_unitgroup.sunits:item(1);
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:attack_unit(target_sunit.unit, true, true)
    end;
end;

function proximity_test(coordinates, range, army)

    local closest_unit = get_closest_standing_unit(ga_player.sunits, coordinates);
    if closest_unit and closest_unit:position():distance(coordinates) < range then
                forest_warning = 1;
                gb.sm:trigger_message("forest_entry_01");
                gb.sm:block_message("forest_entry_01", true);

                local current_pos = closest_unit:position();
                army:use_special_ability("wh_main_spell_bst_camp_forest_traps", current_pos, d_to_r(0))
    end;
end;

-------------------------------------------------------------------------------------------------
------------------------------------------- OBJECTIVES ------------------------------------------
-------------------------------------------------------------------------------------------------

gb:set_objective_on_message("deployment_started", "mission_norscan_camp_objective_1_tooltip"); 

gb:set_objective_on_message("battle_started", "mission_norscan_camp_objective_2_tooltip", 9000); 
gb:set_objective_on_message("battle_started", "mission_norscan_camp_objective_3_tooltip", 36000); 

-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------

gb:queue_help_on_message("battle_started", "mission_norscan_camp_objective_3_message", 7000, 500, 0);
gb:queue_help_on_message("battle_started", "mission_norscan_camp_objective_4_message", 9000, 500, 9000);
gb:queue_help_on_message("battle_started", "mission_norscan_camp_objective_10_message", 10000, 500, 35000);

gb:queue_help_on_message("player_detected_01_01", "mission_norscan_camp_objective_5_message", 6000, 500, 0);
gb:queue_help_on_message("player_detected_01_02", "mission_norscan_camp_objective_6_message", 6000, 500, 0);
gb:queue_help_on_message("player_detected_01_03", "mission_norscan_camp_objective_7_message", 6000, 500, 0);

gb:queue_help_on_message("player_detected_02_04", "mission_norscan_camp_objective_8_message", 9000, 500, 0);
gb:queue_help_on_message("player_detected_02_06", "mission_norscan_camp_objective_9_message", 9000, 500, 0);

gb:queue_help_on_message("ga_battle_norscan_camp_army_nor_unit_norcan_camp_caged_mammoth_dead", "mission_norscan_camp_objective_11_message", 5000, 500, 0);
gb:queue_help_on_message("player_detected_02_06", "mission_norscan_camp_objective_12_message", 10000, 500, 25000);
gb:queue_help_on_message("battle_is_won", "mission_norscan_camp_objective_13_message", 5000, 500, 0);


-- scripted_objectives_localised_text_mission_norscan_camp_objective_1_tooltip	Burn eradicate Norcans and their village.
-- scripted_objectives_localised_text_mission_norscan_camp_objective_2_tooltip	(Optional) Sneak up to their village for surprise attack
-- scripted_objectives_localised_text_mission_norscan_camp_objective_3_tooltip	(Optional) Free mammoth captured by Norcans
-- scripted_objectives_localised_text_mission_norscan_camp_objective_3_message	(Grunnar Vestgrud) "Norcans did not spot us yet, keep quiet and out of sight." 
-- scripted_objectives_localised_text_mission_norscan_camp_objective_4_message	(Grunnar Vestgrud) "If we get to their camp unnoticed, we will catch them with their pants down." 
-- scripted_objectives_localised_text_mission_norscan_camp_objective_5_message	(Norcan Patrol) "What is that in the distance?"
-- scripted_objectives_localised_text_mission_norscan_camp_objective_6_message	(Norcan Patrol) "Do you see that? There is something moving."
-- scripted_objectives_localised_text_mission_norscan_camp_objective_7_message	(Norcan Patrol) "Its the scum of Grungni, the dwarves, SOUND THE ALARM!!!"
-- scripted_objectives_localised_text_mission_norscan_camp_objective_8_message	(Norcan Warrior)" Quickly, to the arms, dwarven scum is here."
-- scripted_objectives_localised_text_mission_norscan_camp_objective_9_message	(Norcan Chieftain) "Dwarves! You invade my village? You shall taste my steel."
-- scripted_objectives_localised_text_mission_norscan_camp_objective_10_message	(Bugman's Rangers) "Norcans recently captured mammoth, he has not been tamed yet, you can try to free him, maybe he will help you."
-- scripted_objectives_localised_text_mission_norscan_camp_objective_11_message	(Grunnar Vestgrud) "Mammoth has been freed, lets hope he will help us." 
-- scripted_objectives_localised_text_mission_norscan_camp_objective_12_message	(Norcan Chieftain) "Come to my axe you bearded twats"
-- scripted_objectives_localised_text_mission_norscan_camp_objective_13_message	(Grunnar Vestgrud) "Burn the village down" 