-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_kraka_ravnsvake_fimir bog
-- Attacker
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();
bm = battle_manager:new(empire_battle:new());

local gc = generated_cutscene:new(true);

--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, loop_camera)
gc:add_element(nil, nil, "gc_orbit_90_medium_commander_back_close_low_01", 16000, true, false, false);

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
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- Attacker
------------------------------------------ALLY---------------------------------------------------



------------------------------------------ENEMY---------------------------------------------------
ga_battle_fimir_bog_character_name_nor = gb:get_army(gb:get_non_player_alliance_num(),"battle_fimir_bog_character_name_nor"); -- Char 
ga_battle_fimir_bog_army_nor_unit_fimir_ror = gb:get_army(gb:get_non_player_alliance_num(),"battle_fimir_bog_army_nor_unit_fimir_ror"); -- Fimir ROR
ga_battle_fimir_bog_army_nor_unit_fimir_0 = gb:get_army(gb:get_non_player_alliance_num(),"battle_fimir_bog_army_nor_unit_fimir_0"); -- Fimir 0
ga_battle_fimir_bog_army_nor_unit_fimir_1 = gb:get_army(gb:get_non_player_alliance_num(),"battle_fimir_bog_army_nor_unit_fimir_1"); -- Fimir 1

------------------------------------------ENEMY REINFORCEMENT---------------------------------------------------

-------------------------------------------------------------------------------------------------
------------------------------------------ OBJECTIVES -------------------------------------------
-------------------------------------------------------------------------------------------------
gb:set_objective_on_message("deployment_started", "mission_kraka_ravnsvake_fimir_bog_objective_1_tooltip");
gb:set_objective_on_message("deployment_started", "mission_kraka_ravnsvake_fimir_bog_objective_2_tooltip");

------------------------------------------FAIL---------------------------------------------------

------------------------------------------WIN---------------------------------------------------
gb:complete_objective_on_message("player_at_fimir_base","mission_lost_hold_objective_1_tooltip", 30000);  -- 30 secs at tower,  
-------------------------------------------------------------------------------------------------
--------------------------------- TIME KEEPER FROM BATTLE START --------------------------------
-------------------------------------------------------------------------------------------------

gb:message_on_time_offset("Wait_1min",60000);
gb:message_on_time_offset("Wait_2min",120000);
gb:message_on_time_offset("Wait_3min",180000);
gb:message_on_time_offset("Wait_4min",240000);
gb:message_on_time_offset("Wait_5min",300000);
gb:message_on_time_offset("Wait_6min",360000);
gb:message_on_time_offset("Wait_7min",420000);
gb:message_on_time_offset("Wait_8min",480000);
gb:message_on_time_offset("Wait_9min",540000);
gb:message_on_time_offset("Wait_10min",600000);
gb:message_on_time_offset("Wait_11min",660000);
gb:message_on_time_offset("Wait_12min",720000);
gb:message_on_time_offset("Wait_13min",780000);
gb:message_on_time_offset("Wait_14min",840000);
gb:message_on_time_offset("Wait_15min",900000);
gb:message_on_time_offset("Wait_16min",960000);
gb:message_on_time_offset("Wait_17min",1020000);
gb:message_on_time_offset("Wait_18min",1080000);
gb:message_on_time_offset("Wait_19min",1140000);
gb:message_on_time_offset("Wait_20min",1200000);


-------------------------------------------------------------------------------------------------
---------------------------------------CUSTOM ORDERS----------------------------------------------
--------------------------------------------------------------------------------------------------
ga_battle_fimir_bog_character_name_nor:set_enabled(false); -- Hide all fimir at start
ga_battle_fimir_bog_army_nor_unit_fimir_ror:set_enabled(false); 
ga_battle_fimir_bog_army_nor_unit_fimir_0:set_enabled(false);  
ga_battle_fimir_bog_army_nor_unit_fimir_1:set_enabled(false);  

ga_battle_fimir_bog_character_name_nor:teleport_to_start_location_offset_on_message("battle_started",0,250); -- spread the fimir units out
ga_battle_fimir_bog_army_nor_unit_fimir_ror:teleport_to_start_location_offset_on_message("battle_started",0,-250);
ga_battle_fimir_bog_army_nor_unit_fimir_0:teleport_to_start_location_offset_on_message("battle_started",250,0);
ga_battle_fimir_bog_army_nor_unit_fimir_1:teleport_to_start_location_offset_on_message("battle_started",-250,0); 


ga_player:message_on_proximity_to_position("player_at_fimir_base", v(200, 100, -200), 50); -- detect when player is close to fimir hold
gb:message_on_time_offset("release",120000,"player_at_fimir_base"); -- wait 2 min, so player will fully arive there


ga_battle_fimir_bog_character_name_nor:set_enabled_on_message("release", true); -- reveal the units 
ga_battle_fimir_bog_army_nor_unit_fimir_ror:set_enabled_on_message("release", true);  
ga_battle_fimir_bog_army_nor_unit_fimir_0:set_enabled_on_message("release", true);  
ga_battle_fimir_bog_army_nor_unit_fimir_1:set_enabled_on_message("release", true); 

ga_battle_fimir_bog_character_name_nor:advance_on_message("release", 1000); -- attack the player
ga_battle_fimir_bog_army_nor_unit_fimir_ror:advance_on_message("release", 1000);
ga_battle_fimir_bog_army_nor_unit_fimir_0:advance_on_message("release", 1000);
ga_battle_fimir_bog_army_nor_unit_fimir_1:advance_on_message("release", 1000);



-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------

gb:queue_help_on_message("battle_started", "mission_kraka_ravnsvake_fimir_bog_objective_3_message", 8000, 2000, 1000); -- Lift the curse, purge the Beasts
gb:queue_help_on_message("battle_started", "mission_kraka_ravnsvake_fimir_bog_objective_4_message", 8000, 2000, 25000); -- (25 sec) With fire and steel, razed the Fimir Den. (Move to the Tower)  
gb:queue_help_on_message("player_at_fimir_base", "mission_kraka_ravnsvake_fimir_bog_objective_5_message", 8000, 2000, 1000); -- Wait unil the Fire catches on!  (Stay by the tower)  
gb:queue_help_on_message("release", "mission_kraka_ravnsvake_fimir_bog_objective_6_message", 8000, 2000, 1000); -- The foul Beasts are upon us! Axes Ready!  