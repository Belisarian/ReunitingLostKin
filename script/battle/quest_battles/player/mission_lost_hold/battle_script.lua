-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_lost_hold
-- attacker
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();
bm = battle_manager:new(empire_battle:new());

local gc = generated_cutscene:new(true);

--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, loop_camera)
gc:add_element(nil, "battle_lost_hold_speech_01", "gc_medium_army_pan_back_left_to_back_right_close_medium_01", 3000, true, false, false);
gc:add_element(nil, "battle_lost_hold_speech_02", "gc_medium_enemy_army_pan_front_right_to_front_left_far_high_01", 7000, false, false, false);
gc:add_element(nil, "battle_lost_hold_speech_03", "gc_orbit_ccw_90_medium_commander_front_right_close_low_01", 9000, false, false, false);
gc:add_element(nil, "battle_lost_hold_speech_04", "gc_medium_army_pan_front_right_to_front_left_close_medium_01", 7000, false, false, false);

gb = generated_battle:new(
	true,                                     			-- screen starts black
	false,                                     			-- prevent deployment for player
	false,                                    			-- prevent deployment for ai
	function() gb:start_generated_cutscene(gc) end, 	-- intro cutscene function
	false                                      			-- debug mode
);

gb:set_cutscene_during_deployment(true);

-------------------------------------------------------------------------------------------------
---------------------------------------- INTRO VO & SUBS ----------------------------------------
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
------------------------------------------ ARMY SETUP -------------------------------------------
-------------------------------------------------------------------------------------------------

------------------------------------------PLAYER---------------------------------------------------
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- attacker


------------------------------------------ALLY---------------------------------------------------
-----------------------------------------DEPLOYED--#0---------------------------------------------
ga_battle_lost_hold_character_name_dwf_ally = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_character_name_dwf_ally"); -- #0 Units
ga_battle_lost_hold_army_dwf_ally_unit_hammers = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_unit_hammers"); -- #0 Units
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_unit_dwarf_warrior"); -- #0 Units
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_unit_quarrellers"); -- #0 Units

------------------------------------------ALLY---------------------------------------------------
--------------------------------------REINFORCEMENT--#1--------------------------------------------
ga_battle_lost_hold_character_name_dwf_ally_1 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_character_name_dwf_ally_1"); -- #0 Units
ga_battle_lost_hold_army_dwf_ally_1_flee1 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee1"); -- 1
ga_battle_lost_hold_army_dwf_ally_1_flee2 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee2"); -- 2
ga_battle_lost_hold_army_dwf_ally_1_flee3 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee3"); -- 3
ga_battle_lost_hold_army_dwf_ally_1_flee4 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee4"); -- 4
ga_battle_lost_hold_army_dwf_ally_1_flee5 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee5"); -- 5
ga_battle_lost_hold_army_dwf_ally_1_flee6 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee6"); -- 1
ga_battle_lost_hold_army_dwf_ally_1_flee7 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee7"); -- 2
ga_battle_lost_hold_army_dwf_ally_1_flee8 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee8"); -- 3
ga_battle_lost_hold_army_dwf_ally_1_flee9 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee9"); -- 4
ga_battle_lost_hold_army_dwf_ally_1_flee10 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee10"); -- 5
ga_battle_lost_hold_army_dwf_ally_1_flee11 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee11"); -- 2
ga_battle_lost_hold_army_dwf_ally_1_flee12 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee12"); -- 3
ga_battle_lost_hold_army_dwf_ally_1_flee13 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee13"); -- 4
ga_battle_lost_hold_army_dwf_ally_1_flee14 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee14"); -- 5
ga_battle_lost_hold_army_dwf_ally_1_flee15 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee15"); -- 5

------------------------------------------ALLY---------------------------------------------------
-----------------------------------------DEPLOYED--#2---------------------------------------------
-- dwarf champion
ga_battle_lost_hold_character_name_dwf_ally_2 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_character_name_dwf_ally_2"); -- #2 Char for start infighting


-----------------------------------------ENEMY---------------------------------------------------
-----------------------------------------frontal attacks-----------------------------------------------
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_spearman_wave_01"); -- #0 spearmen
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_champions_wave_01"); -- #0 Champ
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_spearman_wave_02"); -- #0 spearmen
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_champions_wave_02"); -- #0 Champ
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_spearman_wave_03"); -- #0 spearmen
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_champions_wave_03"); -- #0 Champ
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_spearman_wave_04"); -- #0 spearmen
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_champions_wave_04"); -- #0 Champ
------------------------------------------ENEMY---------------------------------------------------
--------------------------------------REINFORCEMENT for phase two--------------------------------------------
ga_battle_lost_hold_army_nor_art_hellcannon_battery = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_art_hellcannon_battery"); -- #1 manticore
ga_battle_lost_hold_character_name_nor_1 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_character_name_nor_1"); -- #4 Char / morale sink
------------------------------------------ENEMY---------------------------------------------------
--------------------------------------Large standing army--------------------------------------------
ga_battle_lost_hold_army_nor_4_unit_marauder_spearman = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_4_unit_marauder_spearman"); -- #4 Char / morale sink
ga_battle_lost_hold_army_nor_4_unit_marauder_champions = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_4_unit_marauder_champions"); -- #4 Char / morale sink
ga_battle_lost_hold_army_nor_4_unit_marauder_hunters = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_4_unit_marauder_hunters"); -- #4 Char / morale sink
ga_battle_lost_hold_character_name_nor = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_character_name_nor"); -- #4 Char / morale sink
------------------------------------------ENEMY---------------------------------------------------
-----------------------------------------norcan champion-----------------------------------------------
-- norcan champion
ga_battle_lost_hold_character_name_nor_2 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_character_name_nor_2"); -- #2 Char for start infighting

------------------------------------------ENEMY---------------------------------------------------
--------------------------------------harpy attacks--------------------------------------------
ga_battle_lost_hold_character_name_bst_3 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_character_name_bst_3"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_01 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_01"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_02 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_02"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_03 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_03"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_04 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_04"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_05 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_05"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_06 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_06"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_07 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_07"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_08 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_08"); -- #3 Char/harpies
ga_battle_lost_hold_army_bst_3_unit_harpies_09 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_bst_3_unit_harpies_09"); -- #3 Char/harpies

--extra officers
-- battle_lost_hold_character_name_dwf_ally
-- battle_lost_hold_character_name_nor
-- battle_lost_hold_character_name_nor_1
-- battle_lost_hold_character_name_bst_3
-------------------------------------------------------------------------------------------------
------------------------------------------ OBJECTIVES -------------------------------------------
-------------------------------------------------------------------------------------------------
local saved_civilians = 0;
max_civilians = 14
gb:set_objective_on_message("deployment_started", "mission_lost_hold_objective_1_tooltip", 0, 0, max_civilians); -- Safegaurd the inhabitants to the Airship
gb:set_objective_on_message("ally_retreat", "mission_lost_hold_objective_2_tooltip"); -- "Leave with the fleet within the next 18 mins or be left behind! [Use the flee button near the airship]"

gb:add_listener("Flee_at_airship", function()
    saved_civilians = saved_civilians + 1;
		core:svr_save_string("lost_hold_num_saved_civilians", tostring(saved_civilians))
    bm:set_objective("mission_lost_hold_objective_1_tooltip", saved_civilians, max_civilians);
    if saved_civilians >= max_civilians then
        bm:complete_objective("mission_lost_hold_objective_1_tooltip");
    end
end,
true);


-- ----------------------------------------------------------------------------------
-- --------------------------------- WINNING CONDITIONS ------------------
-- ---------------------------------------------------------------------------------battle_started lost_duel_dying
--check if all player units are gone, if so, vanish all unit and end the battle
ga_player:force_victory_on_message("all_player_units_are_done", 10000);

-- scans if all player units have retreated or died, alternativelly it also check if last civilians have left
gb:add_listener("hellcannon_deployed", function()
    bm:repeat_callback(function()
        local closest_unit = get_closest_standing_unit(ga_player.sunits,  v(28.718063354492, 105.57866668701, -5.0468640327454));
        if not closest_unit then
            gb.sm:trigger_message("all_player_units_are_almost_done");
        end;
        --last civilians left
        local last_top_civilian = get_closest_standing_unit(ga_battle_lost_hold_army_dwf_ally_1_flee7.sunits,  v(28.718063354492, 105.57866668701, -5.0468640327454));
        local last_bottom_civilian = get_closest_standing_unit(ga_battle_lost_hold_army_dwf_ally_1_flee14.sunits,  v(28.718063354492, 105.57866668701, -5.0468640327454));
        if (not last_top_civilian) and (not last_bottom_civilian) then
            gb.sm:trigger_message("all_player_units_are_almost_done");
        end;
    end, 10000, "check_if_battle_has_ended");
end);
gb:message_on_time_offset("all_player_units_are_done", 1740000); -- hard end after 29 minutes
gb:message_on_time_offset("all_player_units_are_done", 40000, "all_player_units_are_almost_done");
ga_player:set_enabled_on_message("all_player_units_are_done", false)

--vanish all units
ga_battle_lost_hold_character_name_dwf_ally_1:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_unit_hammers:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers:set_enabled_on_message("all_player_units_are_done", false)

ga_battle_lost_hold_army_dwf_ally_1_flee1:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee2:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee3:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee4:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee5:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee6:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee7:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee8:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee9:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee10:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee11:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee12:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee13:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_dwf_ally_1_flee14:set_enabled_on_message("all_player_units_are_done", false)

ga_battle_lost_hold_character_name_dwf_ally_2:set_enabled_on_message("all_player_units_are_done", false)

ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04:set_enabled_on_message("all_player_units_are_done", false)

ga_battle_lost_hold_army_nor_art_hellcannon_battery:set_enabled_on_message("all_player_units_are_done", false)

ga_battle_lost_hold_army_nor_4_unit_marauder_spearman:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_4_unit_marauder_champions:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_nor_4_unit_marauder_hunters:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_character_name_nor:set_enabled_on_message("all_player_units_are_done", false)

ga_battle_lost_hold_character_name_nor_2:set_enabled_on_message("all_player_units_are_done", false)

ga_battle_lost_hold_character_name_bst_3:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_01:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_02:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_03:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_04:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_05:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_06:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_07:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_08:set_enabled_on_message("all_player_units_are_done", false)
ga_battle_lost_hold_army_bst_3_unit_harpies_09:set_enabled_on_message("all_player_units_are_done", false)


-------------------------------------------------------------------------------------------------
--------------------------------------- ORDERS ----------------------------------------------
--------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--------------------------------------- LORDS DUEL --------------------------------------
--------------------------------------------------------------------------------------------------
-- duel lords and after ally lord dies retreat enemy lord to safety
ga_battle_lost_hold_character_name_nor_2:attack_force_on_message("battle_started", ga_battle_lost_hold_character_name_dwf_ally_2,1000); -- Special char duels
ga_battle_lost_hold_character_name_dwf_ally_2:attack_force_on_message("battle_started", ga_battle_lost_hold_character_name_nor_2,1000); -- Special char duels
-- ga_battle_lost_hold_character_name_dwf_ally_2:message_on_casualties("kill_order", 0.7); --  30% hp left
gb:message_on_time_offset("kill_order", 210000); -- kill lord after 4 minutes
ga_battle_lost_hold_character_name_dwf_ally_2:message_on_shattered_proportion("lost_duel_dying", 0.95); -- Dead char /or fleeing
ga_battle_lost_hold_character_name_nor_2:set_invincible_on_message("battle_started"); -- stays to prevent a win for the player with invincible to prevent rout win
ga_battle_lost_hold_character_name_dwf_ally_2:set_invincible_on_message("battle_started"); -- stays to prevent a win for the player with invincible to prevent rout win
gb:add_listener("kill_order", function() battle_kill_portion_unit(ga_battle_lost_hold_character_name_dwf_ally_2, 1) end);

gb:add_listener("lost_duel_dying", function()

    battle_command_queue(ga_battle_lost_hold_character_name_nor_2, v(-98.7, -606.6))
    battle_move_unit(ga_battle_lost_hold_character_name_nor_2, 1, v(-98.7, -606.6));
end);
gb:add_listener("lost_duel_dying", function()
    battle_command_cancel(ga_battle_lost_hold_character_name_dwf_ally_2);
    battle_command_queue(ga_battle_lost_hold_character_name_dwf_ally_2, v(1.3, -307.4))
end);

gb:add_listener("battle_started", function() battle_command_fearless(ga_battle_lost_hold_character_name_dwf_ally_2) end);
ga_battle_lost_hold_character_name_nor_2:defend_on_message("lost_duel_dying", 1.3, -307.4, 20); -- x/y radius


-------------------------------------------------------------------------------------------------
------------------------------------------- ARMY INIT-----------------------------------------------
--------------------------------------------------------------------------------------------------
--allunits on battlefield, initial setups
--hide stuff for later use
ga_battle_lost_hold_army_dwf_ally_1_flee1:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee2:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee3:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee4:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee5:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee6:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee7:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee8:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee9:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee10:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee11:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee12:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee13:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_dwf_ally_1_flee14:set_enabled(false);  -- disabled

-- this guy will stay hidden to battle is never lost
ga_battle_lost_hold_army_dwf_ally_1_flee15:set_enabled(false);  -- disabled
ga_battle_lost_hold_character_name_dwf_ally_1:set_enabled(false);  -- disabled
ga_battle_lost_hold_character_name_dwf_ally:set_enabled(false);  -- disabled

ga_battle_lost_hold_character_name_bst_3:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_01:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_02:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_03:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_04:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_05:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_06:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_07:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_08:set_enabled(false);  -- disabled
ga_battle_lost_hold_army_bst_3_unit_harpies_09:set_enabled(false);  -- disabled


-- stay in place
ga_battle_lost_hold_army_dwf_ally_unit_hammers:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend



ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
-- send ally lord to ally army
gb:add_listener("battle_started", function()
    ga_battle_lost_hold_character_name_dwf_ally_1:set_enabled(true);  -- disabled
    battle_start_teleport_units(ga_battle_lost_hold_character_name_dwf_ally_1, v(-462.2, -99.6))
    battle_move_unit(ga_battle_lost_hold_character_name_dwf_ally_1, 1, v(1.7, -328.1));
end);

-------------------------------------------------------------------------------------------------
------------------------------------------- ARMY ATTACK AND MOVE ORDERS-----------------------------------------------
--------------------------------------------------------------------------------------------------

gb:message_on_time_offset("front_attack_01",50000, "lost_duel_dying");
gb:message_on_time_offset("front_attack_01_wrap_up",420000, "lost_duel_dying");

ga_battle_lost_hold_army_nor_art_hellcannon_battery:reinforce_on_message("lost_duel_dying", 500000);
ga_battle_lost_hold_character_name_nor_1:reinforce_on_message("top_lane_spawn_civilians_07", 10000);
gb:message_on_time_offset("front_attack_02",80000, "hellcannon_deployed");
gb:message_on_time_offset("ally_retreat",80000, "hellcannon_deployed");
gb:message_on_time_offset("front_attack_03",250000, "hellcannon_deployed");
gb:message_on_time_offset("front_attack_04",400000, "hellcannon_deployed");

gb:add_listener("front_attack_01", function()
    battle_command_attack(ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01, ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior)
    battle_command_attack(ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01, ga_battle_lost_hold_army_dwf_ally_unit_hammers)
end);

ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01:rout_over_time_on_message("front_attack_01_wrap_up",5000);
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01:rout_over_time_on_message("front_attack_01_wrap_up",5000);

ga_battle_lost_hold_army_nor_art_hellcannon_battery:message_on_deployed("hellcannon_deployed"); -- Mantocore control
gb:add_listener("hellcannon_deployed", function()
    battle_move_unit(ga_battle_lost_hold_army_nor_art_hellcannon_battery, 1, v(-120.7, -646.6));
end);

gb:add_listener("front_attack_02", function()
    battle_command_queue(ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02, v(-210.3, -96.7));
    battle_command_queue(ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02, v(30.8, -89.6));
end);

ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02:message_on_proximity_to_position("ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02_meeting",
v(-210.3, 100, -96.7), 30);
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02:message_on_proximity_to_position("ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02_meeting",
v(30.8, 100, -89.6), 30);

gb:add_listener("ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02_meeting",function()
        ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02:attack()
end);

gb:add_listener("ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02_meeting",function()
        ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02:attack()
end);

gb:add_listener("ally_retreat", function()
    bm:repeat_callback(function()
        battle_command_queue(ga_battle_lost_hold_character_name_dwf_ally_1, v(-165.2, 311.9));
        battle_command_queue(ga_battle_lost_hold_army_dwf_ally_unit_hammers, v(-165.2, 311.9));
        battle_command_queue(ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior, v(-165.2, 311.9));
        battle_command_queue(ga_battle_lost_hold_army_dwf_ally_unit_quarrellers, v(-165.2, 311.9));
    end, 10000, "refresh_commands_ally");
end);
ga_battle_lost_hold_character_name_dwf_ally_1:message_on_proximity_to_position("ga_battle_lost_hold_character_name_dwf_ally_1_Flee_at_airship", v(-165.2, 100, 311.9), 30);
ga_battle_lost_hold_character_name_dwf_ally_1:rout_over_time_on_message("ga_battle_lost_hold_character_name_dwf_ally_1_Flee_at_airship",5000);
ga_battle_lost_hold_army_dwf_ally_unit_hammers:message_on_proximity_to_position("ga_battle_lost_hold_army_dwf_ally_unit_hammers_Flee_at_airship", v(-165.2, 100, 311.9), 30);
ga_battle_lost_hold_army_dwf_ally_unit_hammers:rout_over_time_on_message("ga_battle_lost_hold_army_dwf_ally_unit_hammers_Flee_at_airship",5000);
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior:message_on_proximity_to_position("ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior_Flee_at_airship", v(-165.2, 100, 311.9), 30);
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior:rout_over_time_on_message("ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior_Flee_at_airship",5000);
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers:message_on_proximity_to_position("ga_battle_lost_hold_army_dwf_ally_unit_quarrellers_Flee_at_airship", v(-165.2, 100, 311.9), 30);
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers:rout_over_time_on_message("ga_battle_lost_hold_army_dwf_ally_unit_quarrellers_Flee_at_airship",5000);

gb:add_listener("front_attack_03", function()
    ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03:attack();
    ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03:attack();
    accelerator_of_units(ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03, true);
    accelerator_of_units(ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03, true);
end);

gb:add_listener("front_attack_04", function()
    ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04:attack();
    ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04:attack();
    accelerator_of_units(ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04, true);
    accelerator_of_units(ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04, true);
end);


-- leave this army as a static background and morale sink
ga_battle_lost_hold_army_nor_4_unit_marauder_spearman:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend - dont release for background feel
ga_battle_lost_hold_army_nor_4_unit_marauder_champions:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend - dont release for background feel
ga_battle_lost_hold_army_nor_4_unit_marauder_hunters:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend - dont release for background feel
ga_battle_lost_hold_character_name_nor:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend - dont release for background feel
-- -- For cinematic/chasing purpose advande in the end
ga_battle_lost_hold_army_nor_4_unit_marauder_spearman:advance_on_message("top_lane_spawn_civilians_07", 10000);  --  advance
ga_battle_lost_hold_army_nor_4_unit_marauder_champions:advance_on_message("top_lane_spawn_civilians_07", 10000);  --  advance
ga_battle_lost_hold_army_nor_4_unit_marauder_hunters:advance_on_message("top_lane_spawn_civilians_07", 10000);  --  advance
ga_battle_lost_hold_character_name_nor:advance_on_message("top_lane_spawn_civilians_07", 10000);  --  advance

-- switch to attack mode when close
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01", 15);
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_01");
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01", 15);
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_01");

ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02", 15);
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_02");
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02", 15);
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_02");

ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03", 15);
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_03");
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03", 15);
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_03");

ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04", 15);
ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_spearman_wave_04");
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04:message_on_proximity_to_enemy("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04", 15);
ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04:attack_on_message("proximity_to_enemy_ga_battle_lost_hold_army_nor_unit_marauder_champions_wave_04");

-------------------------------------------------------------------------------------------------
-------------------------------------- CIVILIAN EVACUATION --------------------------------------
-------------------------------------------------------------------------------------------------
-- sends civilians to airships, setting them to flee at the end and attacking their path with harpies
gb:add_listener("lost_duel_dying", function()
    bm:repeat_callback(function()

        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee1, 1, v(-165.2, 311.9));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee2, 1, v(-165.2, 311.9));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee3, 1, v(-165.2, 311.9));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee4, 1, v(-165.2, 311.9));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee5, 1, v(-165.2, 311.9));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee6, 1, v(-165.2, 311.9));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee7, 1, v(-165.2, 311.9));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee8, 1, v(-573.3, -1.1));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee9, 1, v(-573.3, -1.1));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee10, 1, v(-573.3, -1.1));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee11, 1, v(-573.3, -1.1));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee12, 1, v(-573.3, -1.1));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee13, 1, v(-573.3, -1.1));
        battle_move_unit(ga_battle_lost_hold_army_dwf_ally_1_flee14, 1, v(-573.3, -1.1));
    end, 10000, "refresh_commands");
end);
-------------------------------------- Flee top first phase --------------------------------------------
-- fleeing civilians top lane
-- send civilians, attack them with two harpies on the way, flee battlefield if they reach end point

gb:add_listener("battle_started", function()
    setup_top_lane_civilians("top_lane_spawn_civilians_01", ga_battle_lost_hold_army_dwf_ally_1_flee1, ga_battle_lost_hold_army_bst_3_unit_harpies_01, ga_battle_lost_hold_army_bst_3_unit_harpies_02, 15000)
end);
gb:add_listener("battle_started", function()
    setup_top_lane_civilians("top_lane_spawn_civilians_02", ga_battle_lost_hold_army_dwf_ally_1_flee2, ga_battle_lost_hold_army_bst_3_unit_harpies_03, ga_battle_lost_hold_army_bst_3_unit_harpies_04,200000)
end);
-- gb:message_on_time_offset("show_top_lane_markings", 180000, "lost_duel_dying");

gb:add_listener("battle_started", function()
    setup_top_lane_civilians("top_lane_spawn_civilians_03", ga_battle_lost_hold_army_dwf_ally_1_flee3, ga_battle_lost_hold_army_bst_3_unit_harpies_05, ga_battle_lost_hold_army_bst_3_unit_harpies_06,400000)
end);
-- gb:message_on_time_offset("show_top_lane_markings", 380000, "lost_duel_dying");
gb:add_listener("battle_started", function()
    setup_top_lane_civilians_second_phase("top_lane_spawn_civilians_04", ga_battle_lost_hold_army_dwf_ally_1_flee4, 600000)
end);

gb:add_listener("battle_started", function()
    setup_top_lane_civilians_second_phase("top_lane_spawn_civilians_05", ga_battle_lost_hold_army_dwf_ally_1_flee5, 800000)
end);

gb:add_listener("battle_started", function()
    setup_top_lane_civilians_second_phase("top_lane_spawn_civilians_06", ga_battle_lost_hold_army_dwf_ally_1_flee6, 1000000)
end);

gb:add_listener("battle_started", function()
    setup_top_lane_civilians_second_phase("top_lane_spawn_civilians_07", ga_battle_lost_hold_army_dwf_ally_1_flee7, 1200000)
end);

function setup_top_lane_civilians(listener_marking, civilians_sent, first_enemy, second_enemy, start_time)
    gb:message_on_time_offset(listener_marking, start_time, "lost_duel_dying");
    gb:message_on_time_offset(listener_marking.."_enemy_01",10, listener_marking);
    first_enemy:message_on_proximity_to_position(listener_marking.."_enemy_01_meeting", v(30.2, 100, -4.7), 30);
    gb:message_on_time_offset(listener_marking.."_enemy_02",120000, listener_marking);
    second_enemy:message_on_proximity_to_position(listener_marking.."_enemy_02_meeting", v(-65.7, 100, 211.9), 30);
    civilians_sent:message_on_proximity_to_position(listener_marking.."_Flee_at_airship", v(-165.2, 100, 311.9), 30);
    civilians_sent:message_on_proximity_to_position("Flee_at_airship", v(-165.2, 100, 311.9), 30);
    civilians_sent:rout_over_time_on_message(listener_marking.."_Flee_at_airship",5000);

    gb:add_listener(listener_marking,
    function()
        battle_start_teleport_units(civilians_sent,
        v(164.8, -274.1))
        civilians_sent:set_enabled(true);  -- make visible
        battle_command_queue(civilians_sent, v(-165.2, 311.9));
    end);

    gb:add_listener(listener_marking.."_enemy_01",
    function()
        battle_start_teleport_unit(first_enemy, 1,
        v(-553.8, 274.1))
        battle_enable_unit(first_enemy, 1, true)
        battle_move_unit(first_enemy, 1, v(30.2, -4.7));
    end);

    gb:add_listener(listener_marking.."_enemy_01_meeting",
    function()
        first_enemy:attack()
    end);

    gb:add_listener(listener_marking.."_enemy_02",
    function()
        battle_start_teleport_unit(second_enemy, 1,
        v(-553.8, 274.1))
        battle_enable_unit(second_enemy, 1, true)
        battle_move_unit(second_enemy, 1, v(-65.7, 211.9));
    end);

    gb:add_listener(listener_marking.."_enemy_02_meeting",
    function()
        second_enemy:attack()
    end);
end;

-------------------------------------- Flee bottom first phase --------------------------------------------
-- feeling civilians bottom lane
-- send civilians, attack them with one harpy on the way, flee battlefield if they reach end point
gb:add_listener("battle_started", function()
    setup_bottom_lane_civilians("bottom_lane_spawn_civilians_01", ga_battle_lost_hold_army_dwf_ally_1_flee8, ga_battle_lost_hold_army_bst_3_unit_harpies_07,15000)
end);

gb:add_listener("battle_started", function()
    setup_bottom_lane_civilians("bottom_lane_spawn_civilians_02", ga_battle_lost_hold_army_dwf_ally_1_flee9, ga_battle_lost_hold_army_bst_3_unit_harpies_08,200000)
end);
-- gb:message_on_time_offset("show_bottom_lane_markings", 0, "lost_duel_dying");

gb:add_listener("battle_started", function()
    setup_bottom_lane_civilians("bottom_lane_spawn_civilians_03", ga_battle_lost_hold_army_dwf_ally_1_flee10, ga_battle_lost_hold_army_bst_3_unit_harpies_09,400000)
end);
-- gb:message_on_time_offset("show_bottom_lane_markings", 380000, "lost_duel_dying");
gb:add_listener("battle_started", function()
    setup_bottom_lane_civilians_second_phase("bottom_lane_spawn_civilians_04", ga_battle_lost_hold_army_dwf_ally_1_flee11, 600000)
end);

gb:add_listener("battle_started", function()
    setup_bottom_lane_civilians_second_phase("bottom_lane_spawn_civilians_05", ga_battle_lost_hold_army_dwf_ally_1_flee12, 800000)
end);

gb:add_listener("battle_started", function()
    setup_bottom_lane_civilians_second_phase("bottom_lane_spawn_civilians_06", ga_battle_lost_hold_army_dwf_ally_1_flee13, 1000000)
end);

gb:add_listener("battle_started", function()
    setup_bottom_lane_civilians_second_phase("bottom_lane_spawn_civilians_07", ga_battle_lost_hold_army_dwf_ally_1_flee14, 1200000)
end);


function setup_bottom_lane_civilians(listener_marking, civilians_sent, first_enemy, start_time)
    gb:message_on_time_offset(listener_marking, start_time, "lost_duel_dying");
    gb:message_on_time_offset(listener_marking.."_enemy_01",10, listener_marking);
    first_enemy:message_on_proximity_to_position(listener_marking.."_enemy_01_meeting", v(-389.8, 100, -95.8), 30);
    gb:message_on_time_offset(listener_marking.."_enemy_02",120000, listener_marking);
    civilians_sent:message_on_proximity_to_position(listener_marking.."_Flee_at_airship", v(-573.3, 100, -1.1), 30);
    civilians_sent:message_on_proximity_to_position("Flee_at_airship", v(-573.3, 100, -1.1), 30);
    civilians_sent:rout_over_time_on_message(listener_marking.."_Flee_at_airship",5000);


    gb:add_listener(listener_marking,
    function()
        battle_start_teleport_units(civilians_sent,
        v(-165.1, -135.1))
        civilians_sent:set_enabled(true);  -- make visible
        battle_command_queue(civilians_sent, v(-573.3, -1.1));
    end);

    gb:add_listener(listener_marking.."_enemy_01",
    function()
        battle_start_teleport_unit(first_enemy, 1,
        v(-553.8, 274.1))
        battle_enable_unit(first_enemy, 1, true)
        battle_move_unit(first_enemy, 1, v(-389.8, -95.8));
    end);

    gb:add_listener(listener_marking.."_enemy_01_meeting",
    function()
        first_enemy:attack()
    end);
end;


function setup_top_lane_civilians_second_phase(listener_marking, civilians_sent, start_time)
    gb:message_on_time_offset(listener_marking, start_time, "lost_duel_dying");
    civilians_sent:message_on_proximity_to_position(listener_marking.."_Flee_at_airship", v(-165.2, 100, 311.9), 30);
    civilians_sent:message_on_proximity_to_position("Flee_at_airship", v(-165.2, 100, 311.9), 30);
    civilians_sent:rout_over_time_on_message(listener_marking.."_Flee_at_airship",5000);

    gb:add_listener(listener_marking,
    function()
        battle_start_teleport_units(civilians_sent,
        v(78.2, -86.9))
        civilians_sent:set_enabled(true);  -- make visible
        battle_command_queue(civilians_sent, v(-165.2, 311.9));
    end);

end;


function setup_bottom_lane_civilians_second_phase(listener_marking, civilians_sent, start_time)
    gb:message_on_time_offset(listener_marking, start_time, "lost_duel_dying");
    civilians_sent:message_on_proximity_to_position(listener_marking.."_Flee_at_airship", v(-573.3, 100, -1.1), 30);
    civilians_sent:message_on_proximity_to_position("Flee_at_airship", v(-573.3, 100, -1.1), 30);
    civilians_sent:rout_over_time_on_message(listener_marking.."_Flee_at_airship",5000);

    gb:add_listener(listener_marking,
    function()
        battle_start_teleport_units(civilians_sent,
        v(-165.1, -135.1))
        civilians_sent:set_enabled(true);  -- make visible
        battle_command_queue(civilians_sent, v(-573.3, -1.1));
    end);

end;


-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ------------------------------------
-------------------------------------------------------------------------------------------------
--path markings, top and bottom lane
top_line_points = {
    v(163.9366607666, 106.41415405273, -271.99185180664),
    v(87.133895874023, 106.39053344727, -250.97885131836),
    v(31.326539993286, 106.45806884766, -209.74494934082),
    v(29.107080459595, 105.98243713379, -117.43307495117),
    v(28.718063354492, 105.57866668701, -5.0468640327454),
    v(13.295949935913, 106.36999511719, 98.531196594238),
    v(-45.334281921387, 107.06121826172, 160.5347442627),
    v(-95.031753540039, 106.3404006958, 221.99081420898),
    v(-166.07308959961, 106.40730285645, 316.91714477539),
}
gb:add_listener("show_top_lane_markings", function()
    for i=1, #(top_line_points) do
        gb:add_ping_icon_on_message("top_lane_markers", top_line_points[i], 11, 1000*i, 40000);
    end
    gb.sm:trigger_message("top_lane_markers");
end, true);

bottom_line_points = {
v(-166.73173522949, 106.19700622559, -129.59521484375),
v(-277.14837646484, 106.39053344727, -103.40455627441),
v(-378.85711669922, 106.39052581787, -94.462356567383),
v(-492.38104248047, 105.73793029785, -88.796127319336),
v(-565.158203125, 106.50161743164, 0.65812486410141),
}

gb:add_listener("show_bottom_lane_markings", function()
    for i=1, #(bottom_line_points) do
        gb:add_ping_icon_on_message("bottom_lane_markers", bottom_line_points[i], 11, 1000*i, 40000);
    end
    gb.sm:trigger_message("bottom_lane_markers");
end, true);
gb:message_on_time_offset("show_bottom_lane_markings", 20000);
gb:message_on_time_offset("show_top_lane_markings", 20000);
-- gb:message_on_time_offset("bottom_lane_markers",20000);
-- gb:message_on_time_offset("top_lane_markers",30000);

--dialogs
gb:queue_help_on_message("battle_started", "mission_lost_hold_objective_1_message", 13000, 500, 1000);
gb:queue_help_on_message("battle_started", "mission_lost_hold_objective_2_message", 18000, 500, 21000);
gb:queue_help_on_message("battle_started", "mission_lost_hold_objective_3_message", 15000, 500, 65000);

gb:queue_help_on_message("lost_duel_dying", "mission_lost_hold_objective_4_message", 7000, 500, 2000);
gb:queue_help_on_message("lost_duel_dying", "mission_lost_hold_objective_5_message", 11000, 500, 11000);

gb:queue_help_on_message("top_lane_spawn_civilians_01", "mission_lost_hold_objective_6_message", 10000, 500, 20000);
gb:queue_help_on_message("top_lane_spawn_civilians_02", "mission_lost_hold_objective_7_message", 9000, 500, 20000);
gb:queue_help_on_message("top_lane_spawn_civilians_03", "mission_lost_hold_objective_8_message", 10000, 500, 20000);

gb:queue_help_on_message("ally_retreat", "mission_lost_hold_objective_9_message", 15000, 500, 3000);
gb:queue_help_on_message("ally_retreat", "mission_lost_hold_objective_10_message", 13000, 500, 20000);
gb:queue_help_on_message("ally_retreat", "mission_lost_hold_objective_11_message", 13000, 500, 35000);

gb:queue_help_on_message("top_lane_spawn_civilians_06", "mission_lost_hold_objective_10_message", 13000, 500, 20000);
gb:queue_help_on_message("top_lane_spawn_civilians_07", "mission_lost_hold_objective_11_message", 13000, 500, 20000);
gb:queue_help_on_message("all_player_units_are_almost_done", "mission_lost_hold_objective_12_message", 13000, 500, 2000);


-- scripted_objectives_localised_text_mission_lost_hold_objective_1_message	(Lord Blackbeard) "You are finally here! Quickly secure escape routes to protect fleeing civilians, while we will hold them off"
-- scripted_objectives_localised_text_mission_lost_hold_objective_2_message	(Lord Blackbeard) "These are escape routes, be careful enemy harpies will attack anything that is not protected."
-- scripted_objectives_localised_text_mission_lost_hold_objective_3_message	(Lord Blackbeard) "My cousin has challenged Norcan champion to duel to buy us some time, lets hope he survives."

-- scripted_objectives_localised_text_mission_lost_hold_objective_4_message	(Lord Blackbeard) "Oh no, my cousin!!!"
-- scripted_objectives_localised_text_mission_lost_hold_objective_5_message	(Grolvrold, The Groundsplitter) "Hah your champion is weak, go forth my warriors, now is chance to prove yourselves in eyes of Ruinous Powers"

-- scripted_objectives_localised_text_mission_lost_hold_objective_6_message	(Lord Blackbeard) "Harpies are coming, protect the civilians!"
-- scripted_objectives_localised_text_mission_lost_hold_objective_7_message	(Lord Blackbeard) "Another wave of Harpies!"
-- scripted_objectives_localised_text_mission_lost_hold_objective_8_message	(Lord Blackbeard) "Keep civilians safe!"

-- scripted_objectives_localised_text_mission_lost_hold_objective_9_message	(Lord Blackbeard) "We are just target practice for their Hellcannons, my men must retreat."
-- scripted_objectives_localised_text_mission_lost_hold_objective_10_message	(Lord Blackbeard) "You can try holding them in alleys and hope they will keep their Hellcanon safe on other side, my warriors cannot take that risk."
-- scripted_objectives_localised_text_mission_lost_hold_objective_11_message	(Lord Blackbeard) "Retreat to the Airships if you think danger is too great.[Use Flee button near Airships to make units leave with Airships]"
-- scripted_objectives_localised_text_mission_lost_hold_objective_12_message	(Lord Dobekzhuf) "Time is up, we are leaving!!!"
-- scripted_objectives_localised_text_mission_lost_hold_objective_13_message	[Use Flee button near Airships to make units leave with Airships]


-------------------------------------------------------------------------------------------------
----------------------------------------- USEFUL FUNCTIONS --------------------------------------
-------------------------------------------------------------------------------------------------
function accelerator_of_units(unitgroup, speed)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:change_move_speed(speed)
    end;
end;

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

function attack_move_unit(unitgroup, index, coordinates_one, coordinates_two)
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit.uc:attack_line(coordinates_one, coordinates_two, true);
end;

function battle_enable_unit(unitgroup, index, enabling)
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit:set_enabled(true);
end;

function battle_kill_portion_unit(unitgroup, index)
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit.uc:kill();
end;

function battle_move_unit(unitgroup, index, coordinates)
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit.uc:goto_location(coordinates, true)
end;

function battle_command_queue(unitgroup, coordinates)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:goto_location(coordinates, true)
    end;
end;

function battle_command_cancel(unitgroup)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:withdraw(true);
    end;
end;

function battle_command_fearless(unitgroup)
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:morale_behavior_fearless();
    end;
end;


function battle_command_attack(unitgroup, target_unitgroup)
    local target_sunit = target_unitgroup.sunits:item(1);
    for i = 1, unitgroup.sunits:count() do
       local current_sunit = unitgroup.sunits:item(i);
       current_sunit.uc:attack_unit(target_sunit.unit, true, true)
    end;
end;

function attack_unit_to_unit(unitgroup, index, target_unitgroup, target_index)
    local target_sunit = target_unitgroup.sunits:item(target_index);
    local current_sunit = unitgroup.sunits:item(index);
    current_sunit.uc:attack_unit(target_sunit.unit, true, true)
end;
