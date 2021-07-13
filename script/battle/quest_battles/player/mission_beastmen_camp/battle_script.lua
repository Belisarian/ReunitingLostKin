-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_kraka_drak_beastmen_camp
-- Attacker
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();

bm = battle_manager:new(empire_battle:new());
local gc = generated_cutscene:new(true);

--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, loop_camera)
gc:add_element(nil, "battle_beastmen_camp_speech_01", "gc_slow_army_pan_front_right_to_front_left_close_medium_01", 5000, true, false, false);
gc:add_element(nil, "battle_beastmen_camp_speech_02", "gc_fast_commander_back_medium_medium_to_close_low_01", 8000, false, false, false);
gc:add_element(nil, "battle_beastmen_camp_speech_03", "gc_medium_enemy_army_pan_back_right_to_back_left_far_high_01", 7000, false, false, false);
gc:add_element(nil, "battle_beastmen_camp_speech_04", "gc_medium_army_pan_front_right_to_front_left_close_medium_01", 4000, false, false, false);

gb = generated_battle:new(
	true,                                      		-- screen starts black
	false,                                     		-- prevent deployment for player
	false,                                      	-- prevent deployment for ai
	function() gb:start_generated_cutscene(gc) end, -- intro cutscene function
	false                                      		-- debug mode
);

gb:set_cutscene_during_deployment(true);
local forest_warning = 0;
-------------------------------------------------------------------------------------------------
---------------------------------------- INTRO VO & SUBS ----------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ARMY SETUP -------------------------------------------
-------------------------------------------------------------------------------------------------
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- player attacker 

ga_battle_beastmen_camp_character_name_dwf_ally = gb:get_army(gb:get_player_alliance_num(),"battle_beastmen_camp_character_name_dwf_ally"); -- char/army
ga_battle_beastmen_camp_army_dwf_ally_unit_slayers = gb:get_army(gb:get_player_alliance_num(),"battle_beastmen_camp_army_dwf_ally_unit_slayers"); -- units

bm_battle_beastmen_camp_character_name_bst = bm:alliances():item(2):armies():item(1)
ga_battle_beastmen_camp_character_name_bst = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_character_name_bst"); -- char/army
ga_battle_beastmen_camp_army_bst_unit_gor_herd = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_bst_unit_gor_herd"); -- units
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_0 = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_bst_unit_ungor_spearmen_0"); -- units
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_1 = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_bst_unit_ungor_spearmen_1"); -- units
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_bst_unit_ungor_spearmen"); -- units
ga_battle_beastmen_camp_army_bst_unit_centigors = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_bst_unit_centigors"); -- units
ga_battle_beastmen_camp_army_bst_unit_ungor_raiders = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_bst_unit_ungor_raiders"); -- units
ga_battle_beastmen_camp_army_bst_unit_minotaurs = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_bst_unit_minotaurs"); -- units

ga_battle_beastmen_camp_army_beastmen_camp_totem_01 = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_beastmen_camp_totem_01"); -- units
ga_battle_beastmen_camp_army_beastmen_camp_totem_02 = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_beastmen_camp_totem_02"); -- units
ga_battle_beastmen_camp_army_beastmen_camp_totem_03 = gb:get_army(gb:get_non_player_alliance_num(),"battle_beastmen_camp_army_beastmen_camp_totem_03"); -- units


-------------------------------------------------------------------------------------------------
----------------------------------------- ARMY TELEPORT -----------------------------------------
-------------------------------------------------------------------------------------------------
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_beastmen_camp_army_beastmen_camp_totem_01, 
    v(-869.9, 141.3)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_beastmen_camp_army_beastmen_camp_totem_02, 
    v(-428.3, 71.6)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_beastmen_camp_army_beastmen_camp_totem_03, 
    v(-476.8, -584.4)) end);


gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_0, 
    v(-869.9, 141.3)) end);
gb:add_listener("battle_started", function() battle_start_teleport_units(ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_1, 
    v(-476.8, -584.4)) end);


-------------------------------------------------------------------------------------------------
------------------------------------------- CUTSCENE --------------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ORDERS -------------------------------------------
-------------------------------------------------------------------------------------------------

ga_battle_beastmen_camp_character_name_bst:defend_on_message("deployment_started", -102.33, -229.48, 50); -- x/y radius
ga_battle_beastmen_camp_army_bst_unit_gor_herd:defend_on_message("deployment_started", -102.33, -229.48, 50); -- x/y radius
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen:defend_on_message("deployment_started", -102.33, -229.48, 50); -- x/y radius
ga_battle_beastmen_camp_army_bst_unit_centigors:defend_on_message("deployment_started", -102.33, -229.48, 50); -- x/y radius
ga_battle_beastmen_camp_army_bst_unit_ungor_raiders:defend_on_message("deployment_started", -102.33, -229.48, 50); -- x/y radius
ga_battle_beastmen_camp_army_bst_unit_minotaurs:defend_on_message("deployment_started", -102.33, -229.48, 50); -- x/y radius


-- navigate allies to enemy camp and then let them wait for a player
gb:add_listener("queue_ally_dwarves_01", function() battle_command_queue(ga_battle_beastmen_camp_character_name_dwf_ally, 
v(-813.7, -204.2)) end);
gb:add_listener("queue_ally_dwarves_02", function() battle_command_queue(ga_battle_beastmen_camp_character_name_dwf_ally, 
v(-721.4, -151.1)) end);
gb:add_listener("queue_ally_dwarves_03", function() battle_command_queue(ga_battle_beastmen_camp_character_name_dwf_ally, 
v(-567.5, -200.2)) end);
gb:add_listener("queue_ally_dwarves_04", function() battle_command_queue(ga_battle_beastmen_camp_character_name_dwf_ally, 
v(-412.2, -76.2)) end);

gb:add_listener("queue_ally_dwarves_01", function() battle_command_queue(ga_battle_beastmen_camp_army_dwf_ally_unit_slayers, 
v(-813.7, -204.2)) end);
gb:add_listener("queue_ally_dwarves_02", function() battle_command_queue(ga_battle_beastmen_camp_army_dwf_ally_unit_slayers, 
v(-721.4, -151.1)) end);
gb:add_listener("queue_ally_dwarves_03", function() battle_command_queue(ga_battle_beastmen_camp_army_dwf_ally_unit_slayers, 
v(-567.5, -200.2)) end);
gb:add_listener("queue_ally_dwarves_04", function() battle_command_queue(ga_battle_beastmen_camp_army_dwf_ally_unit_slayers, 
v(-412.2, -76.2)) end);

ga_battle_beastmen_camp_character_name_dwf_ally:defend_on_message("queue_ally_dwarves_05", -412.2, -76.2, 10); -- x/y radius
ga_battle_beastmen_camp_army_dwf_ally_unit_slayers:defend_on_message("queue_ally_dwarves_05", -412.2, -76.2, 10); -- x/y radius

gb:message_on_time_offset("queue_ally_dwarves_01",10);
gb:message_on_time_offset("queue_ally_dwarves_02",10);
gb:message_on_time_offset("queue_ally_dwarves_03",30000);
gb:message_on_time_offset("queue_ally_dwarves_04",80000);
gb:message_on_time_offset("queue_ally_dwarves_05",140000);
gb:message_on_time_offset("queue_ally_dwarves_06",160000);


-- activate forest traps
gb:message_on_time_offset("forest_traps_timer_01",1000);
gb:message_on_time_offset("forest_traps_timer_02",2000);
gb:message_on_time_offset("forest_traps_timer_03",3000);
gb:message_on_time_offset("forest_traps_timer_04",4000);
gb:message_on_time_offset("forest_traps_timer_05",5000);
gb:message_on_time_offset("forest_traps_timer_06",6000);
gb:message_on_time_offset("forest_traps_timer_07",7000);
gb:message_on_time_offset("forest_traps_timer_08",8000);
gb:message_on_time_offset("forest_traps_timer_09",9000);
gb:message_on_time_offset("forest_traps_timer_10",10000);

-- close left
bm:repeat_callback(function() proximity_test(v(-848.9, -87.4), 105, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_01");
-- left
gb:add_listener("forest_traps_timer_01", function()
bm:repeat_callback(function() proximity_test(v(-585.6, -18.4), 130, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_02");end);
gb:add_listener("forest_traps_timer_04", function()
bm:repeat_callback(function() proximity_test(v(-634.9, 217.0), 220, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_03");end);
gb:add_listener("forest_traps_timer_07", function()
bm:repeat_callback(function() proximity_test(v(-759.8, 138.7), 100, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_04");end);
-- right close
gb:add_listener("forest_traps_timer_02", function()
bm:repeat_callback(function() proximity_test(v(-708.6, -327.5), 125, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_05");end);
gb:add_listener("forest_traps_timer_05", function()
bm:repeat_callback(function() proximity_test(v(-855.4, -379.4), 110, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_06");end);
gb:add_listener("forest_traps_timer_09", function()
bm:repeat_callback(function() proximity_test(v(-665.4, -520.5), 140, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_07");end);
-- middle
gb:add_listener("forest_traps_timer_03", function()
bm:repeat_callback(function() proximity_test(v(-421.6, -257.7), 100, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_08");end);
-- far right
gb:add_listener("forest_traps_timer_08", function()
bm:repeat_callback(function() proximity_test(v(-356.1, -499.8), 100, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_09");end);
-- far left
gb:add_listener("forest_traps_timer_06", function()
bm:repeat_callback(function() proximity_test(v(-262.8, 71.8), 100, bm_battle_beastmen_camp_character_name_bst) end, 10000, "forest_traps_10");end);

-- warning when entering forest
gb:add_listener("forest_traps_timer_10", function()
    bm:repeat_callback(function() 
        if forest_warning > 0 then            
            gb.sm:block_message("forest_entry_01", false);
            gb:queue_help_on_message("forest_entry_01", "mission_kraka_drak_beastmen_camp_objective_10_message", 4000, 500, 0); 
            forest_warning = 0
        end;
    end, 20000, "forest_traps_11")
;end);


ga_battle_beastmen_camp_character_name_bst:message_on_proximity_to_enemy("proximity_to_enemy", 200); 
ga_battle_beastmen_camp_army_bst_unit_gor_herd:message_on_proximity_to_enemy("proximity_to_enemy", 200); 
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen:message_on_proximity_to_enemy("proximity_to_enemy", 200); 
ga_battle_beastmen_camp_army_bst_unit_centigors:message_on_proximity_to_enemy("proximity_to_enemy", 200); 
ga_battle_beastmen_camp_army_bst_unit_ungor_raiders:message_on_proximity_to_enemy("proximity_to_enemy", 200); 
ga_battle_beastmen_camp_army_bst_unit_minotaurs:message_on_proximity_to_enemy("proximity_to_enemy", 200); 

ga_battle_beastmen_camp_army_beastmen_camp_totem_01:message_on_proximity_to_enemy("proximity_to_enemy_totem_01", 200); 
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_0:message_on_proximity_to_enemy("proximity_to_enemy_totem_01", 200); 
ga_battle_beastmen_camp_army_beastmen_camp_totem_03:message_on_proximity_to_enemy("proximity_to_enemy_totem_03", 200); 
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_1:message_on_proximity_to_enemy("proximity_to_enemy_totem_03", 200); 

ga_battle_beastmen_camp_character_name_bst:message_on_proximity_to_enemy("proximity_to_enemy_ally_attack", 240); 
ga_battle_beastmen_camp_army_bst_unit_gor_herd:message_on_proximity_to_enemy("proximity_to_enemy_ally_attack", 240); 
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen:message_on_proximity_to_enemy("proximity_to_enemy_ally_attack", 240); 
ga_battle_beastmen_camp_army_bst_unit_centigors:message_on_proximity_to_enemy("proximity_to_enemy_ally_attack", 240); 
ga_battle_beastmen_camp_army_bst_unit_ungor_raiders:message_on_proximity_to_enemy("proximity_to_enemy_ally_attack", 240); 
ga_battle_beastmen_camp_army_bst_unit_minotaurs:message_on_proximity_to_enemy("proximity_to_enemy_ally_attack", 240); 

ga_battle_beastmen_camp_character_name_bst:attack_on_message("proximity_to_enemy");
ga_battle_beastmen_camp_army_bst_unit_gor_herd:attack_on_message("proximity_to_enemy");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen:attack_on_message("proximity_to_enemy");
ga_battle_beastmen_camp_army_bst_unit_centigors:attack_on_message("proximity_to_enemy");
ga_battle_beastmen_camp_army_bst_unit_ungor_raiders:attack_on_message("proximity_to_enemy");
ga_battle_beastmen_camp_army_bst_unit_minotaurs:attack_on_message("proximity_to_enemy");
-- guards of totems attack when player gets close
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_0:attack_on_message("proximity_to_enemy_totem_01");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_1:attack_on_message("proximity_to_enemy_totem_03");

-- ally will charge enemy when player gets close
gb:add_listener("proximity_to_enemy_ally_attack", function() battle_command_attack(ga_battle_beastmen_camp_character_name_dwf_ally, ga_battle_beastmen_camp_character_name_bst) end);
gb:add_listener("proximity_to_enemy_ally_attack", function() battle_command_attack(ga_battle_beastmen_camp_army_dwf_ally_unit_slayers, ga_battle_beastmen_camp_army_bst_unit_minotaurs) end);

-- under attack setup -- 
ga_battle_beastmen_camp_character_name_bst:message_on_under_attack("under_attack");
ga_battle_beastmen_camp_army_bst_unit_gor_herd:message_on_under_attack("under_attack");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen:message_on_under_attack("under_attack");
ga_battle_beastmen_camp_army_bst_unit_centigors:message_on_under_attack("under_attack");
ga_battle_beastmen_camp_army_bst_unit_ungor_raiders:message_on_under_attack("under_attack");
ga_battle_beastmen_camp_army_bst_unit_minotaurs:message_on_under_attack("under_attack");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_0:release_on_message("under_attack_totem_01");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_1:release_on_message("under_attack_totem_03");


ga_battle_beastmen_camp_character_name_bst:attack_on_message("under_attack");
ga_battle_beastmen_camp_army_bst_unit_gor_herd:attack_on_message("under_attack");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen:attack_on_message("under_attack");
ga_battle_beastmen_camp_army_bst_unit_centigors:attack_on_message("under_attack");
ga_battle_beastmen_camp_army_bst_unit_ungor_raiders:attack_on_message("under_attack");
ga_battle_beastmen_camp_army_bst_unit_minotaurs:attack_on_message("under_attack");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_0:release_on_message("under_attack_totem_01");
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_1:release_on_message("under_attack_totem_03");

-- Battle win setup --
ga_battle_beastmen_camp_character_name_bst:message_on_shattered_proportion("ga_battle_beastmen_camp_character_name_bst_dead", 0.95);
ga_battle_beastmen_camp_army_bst_unit_gor_herd:message_on_shattered_proportion("ga_battle_beastmen_camp_army_bst_unit_gor_herd_dead", 0.95);
ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen:message_on_shattered_proportion("ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_dead", 0.95);
ga_battle_beastmen_camp_army_bst_unit_centigors:message_on_shattered_proportion("ga_battle_beastmen_camp_army_bst_unit_centigors_dead", 0.95);
ga_battle_beastmen_camp_army_bst_unit_minotaurs:message_on_shattered_proportion("ga_battle_beastmen_camp_army_bst_unit_minotaurs_dead", 0.95);

gb:message_on_all_messages_received("battle_beastmen_camp_character_name_beastmen_camp_dead",
"ga_battle_beastmen_camp_character_name_bst_dead",
"ga_battle_beastmen_camp_army_bst_unit_gor_herd_dead",
"ga_battle_beastmen_camp_army_bst_unit_ungor_spearmen_dead",
"ga_battle_beastmen_camp_army_bst_unit_centigors_dead",
"ga_battle_beastmen_camp_army_bst_unit_minotaurs_dead")

ga_player:force_victory_on_message("battle_beastmen_camp_character_name_beastmen_camp_dead", 10000); 

-- Rune lord objective fail setup --
ga_battle_beastmen_camp_character_name_dwf_ally:message_on_shattered_proportion("battle_beastmen_camp_character_name_dwf_ally_dead", 0.95); -- Dead char /or fleeing
gb:fail_objective_on_message("battle_beastmen_camp_character_name_dwf_ally_dead", "mission_kraka_drak_beastmen_camp_objective_2_tooltip", 5); -- fail setup
ga_battle_beastmen_camp_character_name_bst:force_victory_on_message("battle_beastmen_camp_character_name_dwf_ally_dead", 10000); -- Force loss -> Ensure the Rune Lord's survival

-------------------------------------------------------------------------------------------------
----------------------------------------- USEFUL FUNCTIONS --------------------------------------
-------------------------------------------------------------------------------------------------
function battle_start_teleport_units(unitgroup, coordinates)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:teleport_to_location(coordinates, 0, 27);
    end;
end;

function battle_start_teleport_unit(unitgroup, index, coordinates)
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit.uc:teleport_to_location(coordinates, 0, 27);
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

gb:set_objective_on_message("deployment_started", "mission_kraka_drak_beastmen_camp_objective_1_tooltip"); -- Get the Rune Lord to the Rift  
gb:set_objective_on_message("deployment_started", "mission_kraka_drak_beastmen_camp_objective_2_tooltip"); -- Ensure the Rune Lord's survival

gb:set_objective_on_message("deployment_started", "mission_kraka_drak_beastmen_camp_objective_3_tooltip", 0, 0, 3); -- (Optional) Destroy 3 Herdstones
gb:set_objective_on_message("deployment_started", "mission_kraka_drak_beastmen_camp_objective_4_tooltip"); -- (Optional) Stay on the road

gb:set_objective_on_message("one_totem", "mission_kraka_drak_beastmen_camp_objective_3_tooltip", 0, 1, 3); -- 1/3
gb:set_objective_on_message("two_totems", "mission_kraka_drak_beastmen_camp_objective_3_tooltip", 0, 2, 3); -- 2/3
gb:set_objective_on_message("all_totems", "mission_kraka_drak_beastmen_camp_objective_3_tooltip", 0, 3, 3); -- 3/3

gb:complete_objective_on_message("all_totems","mission_kraka_drak_beastmen_camp_objective_3_tooltip", 1000); -- tick of the objektive 

ga_battle_beastmen_camp_army_beastmen_camp_totem_01:message_on_shattered_proportion("totem_1", 0.95);
ga_battle_beastmen_camp_army_beastmen_camp_totem_02:message_on_shattered_proportion("totem_2", 0.95);
ga_battle_beastmen_camp_army_beastmen_camp_totem_03:message_on_shattered_proportion("totem_3", 0.95);

gb:message_on_any_message_received("one_totem","totem_1","totem_2","totem_3");
gb:message_on_all_messages_received("two_totems","totem_1","totem_2");
gb:message_on_all_messages_received("two_totems","totem_1","totem_3");
gb:message_on_all_messages_received("two_totems","totem_2","totem_3");
gb:message_on_all_messages_received("all_totems","totem_1","totem_2","totem_3");

-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------

gb:queue_help_on_message("battle_started", "mission_kraka_drak_beastmen_camp_objective_5_message", 12000, 500, 1000);
gb:queue_help_on_message("queue_ally_dwarves_03", "mission_kraka_drak_beastmen_camp_objective_6_message", 15000, 500, 1000);
gb:queue_help_on_message("queue_ally_dwarves_04", "mission_kraka_drak_beastmen_camp_objective_7_message", 8000, 500, 1000);
gb:queue_help_on_message("proximity_to_enemy", "mission_kraka_drak_beastmen_camp_objective_8_message", 5000, 500, 1);
gb:queue_help_on_message("proximity_to_enemy", "mission_kraka_drak_beastmen_camp_objective_9_message", 6000, 500, 6000);



-- scripted_objectives_localised_text_mission_kraka_drak_beastmen_camp_objective_5_message	(Runelord Olag) "Stay on the road, these forests are filled with traps and evil beastmen magic."	false
-- scripted_objectives_localised_text_mission_kraka_drak_beastmen_camp_objective_6_message	(Runelord Olag) "It would be good idea to destroy Herdstones, they drain power from Great Trees and boosts Beasts and Monsters with unnatural power"	false
-- scripted_objectives_localised_text_mission_kraka_drak_beastmen_camp_objective_7_message	(Runelord Olag) "Well we will go ahead and wait for you at the edge of their camp."	false
-- scripted_objectives_localised_text_mission_kraka_drak_beastmen_camp_objective_8_message	(Grunnar Vestgrud) "Pave way, Break the Beasts"	false
-- scripted_objectives_localised_text_mission_kraka_drak_beastmen_camp_objective_9_message	(Runelord Olag) "For the Karaz Ankor."	false
-- scripted_objectives_localised_text_mission_kraka_drak_beastmen_camp_objective_10_message	(Grunnar Vestgrud) "By Grungni, dark magic, stay clear of the forests!!!"	false