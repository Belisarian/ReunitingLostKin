-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_clamp_farm
-- Defender
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();
bm = battle_manager:new(empire_battle:new());

local gc = generated_cutscene:new(true);

--generated_cutscene:add_element(sfx_name, subtitle, camera, min_length, wait_for_vo, wait_for_camera, loop_camera)
gc:add_element(nil, "battle_clamp_farm_speech_01", "army_pan_rear_close", 7000, true, false, false);
gc:add_element(nil, "battle_clamp_farm_speech_02", "gc_orbit_360_slow_commander_back_left_close_low_01", 8000, false, false, false);
gc:add_element(nil, "battle_clamp_farm_speech_03", "army_pan_front_close", 10000, false, false, false);
gc:add_element(nil, "battle_clamp_farm_speech_04", "gc_orbit_ccw_90_medium_commander_back_right_extreme_high_01", 6000, false, false, false);

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
ga_player = gb:get_army(gb:get_player_alliance_num(), 2, ""); -- 1 - attacker 2 -defender


------------------------------------------ALLY---------------------------------------------------

------------------------------------------ENEMY---------------------------------------------------
ga_battle_clamp_farm_character_name_nor = gb:get_army(gb:get_non_player_alliance_num(),"battle_clamp_farm_character_name_nor"); --Enemy
ga_battle_clamp_farm_character_name_nor1 = gb:get_army(gb:get_non_player_alliance_num(),"battle_clamp_farm_character_name_nor1"); --Enemy1 (for hidden effect)

------------------------------------------ NO LORDS -------------------------------------------------
ga_battle_clamp_farm_character_name_nor:set_enabled(false);  -- disabled
ga_battle_clamp_farm_character_name_nor1:set_enabled(false);  -- disabled
ga_battle_clamp_farm_character_name_nor:remove_on_message("battle_started");  -- remove 
ga_battle_clamp_farm_character_name_nor1:remove_on_message("battle_started"); -- remove 

-------------------------------------------SPIDERS------------------------------------------------
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human = gb:get_army(gb:get_non_player_alliance_num(),"battle_clamp_farm_army_nor1_unit_spider_champion_human"); -- Spider0 enemy01
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human2 = gb:get_army(gb:get_non_player_alliance_num(),"battle_clamp_farm_army_nor1_unit_spider_champion_human2"); -- Spider1 enemy01
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3 = gb:get_army(gb:get_non_player_alliance_num(),"battle_clamp_farm_army_nor1_unit_spider_champion_human3"); -- Spider2 enemy01
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human:set_enabled(false);  -- instant on start invis
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human2:set_enabled(false);  -- instant on start invis
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:set_enabled(false);  -- instant on start invis


------------------------------------------------------------------------------------------------
------------------------------------------ OBJECTIVES -------------------------------------------
-------------------------------------------------------------------------------------------------
gb:set_objective_on_message("deployment_started", "mission_clamp_farm_objective_1_tooltip");
gb:set_objective_on_message("deployment_started", "mission_clamp_farm_objective_2_tooltip");

------------------------------------------FAIL---------------------------------------------------

------------------------------------------WIN---------------------------------------------------

-------------------------------------------------------------------------------------------------
--------------------------------- TIME KEEPER FROM BATTLE START --------------------------------
-------------------------------------------------------------------------------------------------

gb:message_on_time_offset("Wait_1min",60000);
gb:message_on_time_offset("Wait_2min",120000);
gb:message_on_time_offset("Wait_3min",180000);
gb:message_on_time_offset("Wait_3,5min",210000);
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
---------------------------------------ORDERS----------------------------------------------
--------------------------------------------------------------------------------------------------



-----------------------------------------Spider 00----------------------------------------------
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human:teleport_to_start_location_offset_on_message("battle_started",0,250);-- tp at deployment (still invis)

gb:message_on_time_offset("Wait_5sec",5000);
gb:message_on_time_offset("Wait_6sec",6000);
gb:message_on_time_offset("Wait_30sec",30000);

ga_battle_clamp_farm_army_nor1_unit_spider_champion_human:set_enabled_on_message("Wait_5sec", true); -- reveal 
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human:move_to_position_on_message("Wait_6sec", v(-100, 0, 250)); -- move
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human:remove_on_message("Wait_1min");

-----------------------------------------Spider 02 -------------------------------------------------
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human2:teleport_to_start_location_offset_on_message("battle_started",-50,0);-- tp at deployment (still invis)
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human2:set_enabled_on_message("Wait_1min", true); -- reveal 
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human2:move_to_position_on_message("Wait_1min", v(300, 0, 50));  -- big fan of vectors
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human2:remove_on_message("Wait_3min");

-----------------------------------------Spider 03 -------------------------------------------------

ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:teleport_to_start_location_offset_on_message("battle_started",100,0);-- tp at deployment (still invis)
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:set_enabled_on_message("Wait_3,5min", true); -- reveal 
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:move_to_position_on_message("Wait_3,5min", v(-50, 0,76));  -- big fan of vectors
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:move_to_position_on_message("Wait_4min", v(-150, 0,76));  -- move back to forest

ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:message_on_under_attack("under_attack"); --under attack alert
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:move_to_position_on_message("under_attack", v(-150, 0,76));  -- move to forest

ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:message_on_proximity_to_enemy("proximity_to_enemy", 50); -- Player is close
ga_battle_clamp_farm_army_nor1_unit_spider_champion_human3:attack_on_message("proximity_to_enemy");  -- forest attack


-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ------------------------------------
-------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ------------------------------------
-------------------------------------------------------------------------------------------------

gb:queue_help_on_message("battle_started", "mission_clamp_farm_objective_1_message", 8000, 2000, 1000);--"A single wanderer harassing these farms?"
gb:queue_help_on_message("Wait_1min", "mission_clamp_farm_objective_2_message", 8000, 2000, 1000);--"Something is not right - foul  witchcraft is a place" 
gb:queue_help_on_message("Wait_3min", "mission_clamp_farm_objective_3_message", 8000, 2000, 1000);--"He hides in the forest - lets not linger out here"
gb:queue_help_on_message("Wait_4min", "mission_clamp_farm_objective_4_message", 8000, 2000, 1000);--"Look to the mountain ridge, he evades us again!" 
gb:queue_help_on_message("Wait_5min", "mission_clamp_farm_objective_5_message", 8000, 2000, 1000);--"Search the upper forest"
