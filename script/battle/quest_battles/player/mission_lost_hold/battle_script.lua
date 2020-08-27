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
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- attacker


------------------------------------------ALLY---------------------------------------------------
-----------------------------------------DEPLOYED--#0---------------------------------------------
ga_battle_lost_hold_character_name_dwf_ally = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_character_name_dwf_ally"); -- #0 Char 
ga_battle_lost_hold_army_dwf_ally_unit_hammers = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_unit_hammers"); -- #0 Units 
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_unit_dwarf_warrior"); -- #0 Units 
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_unit_quarrellers"); -- #0 Units 

------------------------------------------ALLY---------------------------------------------------
-----------------------------------------DEPLOYED--#2---------------------------------------------
ga_battle_lost_hold_character_name_dwf_ally_2 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_character_name_dwf_ally_2"); -- #2 Char for start infighting 

------------------------------------------ALLY---------------------------------------------------
--------------------------------------REINFORCEMENT--#1--------------------------------------------
ga_battle_lost_hold_character_name_dwf_ally_1 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_character_name_dwf_ally_1"); -- #1 Char "King"
ga_battle_lost_hold_army_dwf_ally_1_flee1 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee1"); -- 1
ga_battle_lost_hold_army_dwf_ally_1_flee2 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee2"); -- 2
ga_battle_lost_hold_army_dwf_ally_1_flee3 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee3"); -- 3
ga_battle_lost_hold_army_dwf_ally_1_flee4 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee4"); -- 4
ga_battle_lost_hold_army_dwf_ally_1_flee5 = gb:get_army(gb:get_player_alliance_num(),"battle_lost_hold_army_dwf_ally_1_flee5"); -- 5

 ------------------------------------------ENEMY---------------------------------------------------
 -----------------------------------------DEPLOYED-- #0-----------------------------------------------
ga_battle_lost_hold_character_name_nor = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_character_name_nor"); -- #0 Char 
ga_battle_lost_hold_army_nor_unit_marauder_spearman = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_spearman"); -- #0 spearmen
ga_battle_lost_hold_army_nor_unit_marauder_champions = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_champions"); -- #0 Champ
ga_battle_lost_hold_army_nor_unit_marauder_berserkers = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_unit_marauder_berserkers"); -- #0 Champ

------------------------------------------ENEMY---------------------------------------------------
-----------------------------------------DEPLOYED-- #2-----------------------------------------------
ga_battle_lost_hold_character_name_nor_2 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_character_name_nor_2"); -- #2 Char for start infighting 
------------------------------------------ENEMY---------------------------------------------------
--------------------------------------REINFORCEMENT--#1--------------------------------------------
ga_battle_lost_hold_character_name_nor_1 = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_character_name_nor_1"); -- #1 Char
ga_battle_lost_hold_army_nor_1_unit_marauder_spearman = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_1_unit_marauder_spearman"); -- #1 spearmen
ga_battle_lost_hold_army_nor_1_unit_feral_manticore = gb:get_army(gb:get_non_player_alliance_num(),"battle_lost_hold_army_nor_1_unit_feral_manticore"); -- #1 manticore


-------------------------------------------------------------------------------------------------
------------------------------------------ OBJECTIVES -------------------------------------------
-------------------------------------------------------------------------------------------------
gb:set_objective_on_message("deployment_started", "mission_lost_hold_objective_1_tooltip"); -- Safegaurd the inhabitants to the Airship 
gb:set_objective_on_message("deployment_started", "mission_lost_hold_objective_2_tooltip"); -- Ensure you regiments does not get left behind



-------------------------------------------------------------------------------------------------
--------------------------------- TIME KEEPER FROM BATTLE START --------------------------------
-------------------------------------------------------------------------------------------------
gb:message_on_time_offset("Wait_10",10000);
gb:message_on_time_offset("Wait_1min",60000);
gb:message_on_time_offset("Wait_1min+",80000);
gb:message_on_time_offset("Wait_2min",120000);
gb:message_on_time_offset("Wait_2min+",14000);
gb:message_on_time_offset("Wait_3min",180000);
gb:message_on_time_offset("Wait_3min+",200000);
gb:message_on_time_offset("Wait_4min",240000);
gb:message_on_time_offset("Wait_4min+",260000);
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


-------------------------------------------------------------------------------------------------
---------------------------------------Lords STARTS FIGHTING --------------------------------------
--------------------------------------------------------------------------------------------------
ga_battle_lost_hold_character_name_nor_2:set_invincible_on_message("battle_started"); -- Norcan duel part is invincible
ga_battle_lost_hold_character_name_nor_2:attack_force_on_message("battle_started", ga_battle_lost_hold_character_name_dwf_ally_2,1000); -- Special char duels
ga_battle_lost_hold_character_name_dwf_ally_2:attack_force_on_message("battle_started", ga_battle_lost_hold_character_name_nor_2,1000); -- Special char duels
ga_battle_lost_hold_character_name_dwf_ally_2:message_on_casualties("lost_duel_dying",0.6); --  60% hp left
ga_battle_lost_hold_character_name_dwf_ally:attack_force_on_message("lost_duel_dying", ga_battle_lost_hold_character_name_nor_2,1000); -- Next dwf in duel 

-------------------------------------------------------------------------------------------------
---------------------------------------ALLY ORDERS-----------------------------------------------
--------------------------------------------------------------------------------------------------
ga_battle_lost_hold_character_name_dwf_ally:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_dwf_ally_unit_hammers:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend


ga_battle_lost_hold_character_name_dwf_ally:advance_on_message("lost_duel_dying", 60000); -- allready deployed advance
ga_battle_lost_hold_army_dwf_ally_unit_hammers:advance_on_message("lost_duel_dying", 60000); -- allready deployed advance
ga_battle_lost_hold_army_dwf_ally_unit_dwarf_warrior:advance_on_message("lost_duel_dying", 60000); -- allready deployed advance
ga_battle_lost_hold_army_dwf_ally_unit_quarrellers:advance_on_message("lost_duel_dying", 60000); -- allready deployed advance
-------------------------------------------------------------------------------------------------
---------------------------------------ENEMY ORDERS-----------------------------------------------
--------------------------------------------------------------------------------------------------
-- stay in place

ga_battle_lost_hold_character_name_nor:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_spearman:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_champions:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend
ga_battle_lost_hold_army_nor_unit_marauder_berserkers:teleport_to_start_location_offset_on_message("battle_started",0,0);-- tp at deployment for defend


ga_battle_lost_hold_character_name_nor:advance_on_message("lost_duel_dying", 60000); -- allready deployed advance
ga_battle_lost_hold_army_nor_unit_marauder_spearman:advance_on_message("lost_duel_dying", 60000);  -- allready deployed advance
ga_battle_lost_hold_army_nor_unit_marauder_champions:advance_on_message("lost_duel_dying", 60000); -- allready deployed advance
ga_battle_lost_hold_army_nor_unit_marauder_berserkers:advance_on_message("lost_duel_dying", 60000); -- allready deployed advance

-- manticore attack civilians 
ga_battle_lost_hold_army_nor_1_unit_feral_manticore:message_on_deployed("manticore_deployed"); -- Mantocore control
ga_battle_lost_hold_army_nor_1_unit_feral_manticore:attack_force_on_message("manticore_deployed", ga_battle_lost_hold_army_dwf_ally_1_flee2,1000); -- attack civilians

-------------------------------------------------------------------------------------------------
-------------------------------------- REINFORCEMENT --------------------------------------------
-------------------------------------------------------------------------------------------------

-------------------------------------- ENEMY REINFORCEMENT----------------------------------------
ga_battle_lost_hold_character_name_nor_1:reinforce_on_message("Wait_4min", 1000); -- #1 Ememy second lord enters
ga_battle_lost_hold_army_nor_1_unit_marauder_spearman:reinforce_on_message("Wait_4min", 1000); -- #1 spearmen
ga_battle_lost_hold_army_nor_1_unit_feral_manticore:reinforce_on_message("Wait_4min", 1000); -- #1 Manticore




-------------------------------------- KING#1 REINFORCEMENT-------------------------------------
ga_battle_lost_hold_character_name_dwf_ally_1:reinforce_on_message("Wait_5min", 1000); -- King enters


-------------------------------------- Flee#1 --------------------------------------------
ga_battle_lost_hold_army_dwf_ally_1_flee1:reinforce_on_message("Wait_1min", 1000); -- Flee #1
ga_battle_lost_hold_army_dwf_ally_1_flee1:message_on_deployed("Flee1_deployed"); -- Flee #1 control
ga_battle_lost_hold_army_dwf_ally_1_flee1:move_to_position_on_message("Flee1_deployed", v(-100, 100, 150));
gb:queue_help_on_message("Flee1_deployed", "mission_lost_hold_objective_1_message", 8000, 2000, 1000); -- "Escort the civilians to the airship"
gb:queue_help_on_message("Flee1_deployed", "mission_lost_hold_objective_2_message", 8000, 2000, 1000); -- "Dont let the norscan near them - they might panic back into the hold!"
ga_battle_lost_hold_army_dwf_ally_1_flee1:message_on_proximity_to_position("Flee1_at_airship", v(-100, 100, 150), 50);
ga_battle_lost_hold_army_dwf_ally_1_flee1:rout_over_time_on_message("Flee1_at_airship",5000);


-------------------------------------- Flee#2 --------------------------------------------
ga_battle_lost_hold_army_dwf_ally_1_flee2:reinforce_on_message("Wait_3min", 1000); -- Flee #1
ga_battle_lost_hold_army_dwf_ally_1_flee2:message_on_deployed("Flee2_deployed"); -- Flee #1 control
ga_battle_lost_hold_army_dwf_ally_1_flee2:move_to_position_on_message("Flee2_deployed", v(-100, 100, 150));
ga_battle_lost_hold_army_dwf_ally_1_flee2:message_on_proximity_to_position("Flee2_at_airship", v(-100, 100, 150), 50);
ga_battle_lost_hold_army_dwf_ally_1_flee2:rout_over_time_on_message("Flee2_at_airship",5000);

-------------------------------------- Flee#3 --------------------------------------------
ga_battle_lost_hold_army_dwf_ally_1_flee3:reinforce_on_message("Wait_5min", 1000); -- Flee #1
ga_battle_lost_hold_army_dwf_ally_1_flee3:message_on_deployed("Flee3_deployed"); -- Flee #1 control
ga_battle_lost_hold_army_dwf_ally_1_flee3:move_to_position_on_message("Flee3_deployed", v(-100, 100, 150));
ga_battle_lost_hold_army_dwf_ally_1_flee3:message_on_proximity_to_position("Flee3_at_airship", v(-100, 100, 150), 50);
ga_battle_lost_hold_army_dwf_ally_1_flee3:rout_over_time_on_message("Flee3_at_airship",5000);

-------------------------------------- Flee#4 --------------------------------------------
ga_battle_lost_hold_army_dwf_ally_1_flee4:reinforce_on_message("Wait_7min", 1000); -- Flee #1
ga_battle_lost_hold_army_dwf_ally_1_flee4:message_on_deployed("Flee4_deployed"); -- Flee #1 control
ga_battle_lost_hold_army_dwf_ally_1_flee4:move_to_position_on_message("Flee4_deployed", v(-100, 100, 150));
ga_battle_lost_hold_army_dwf_ally_1_flee4:message_on_proximity_to_position("Flee4_at_airship", v(-100, 100, 150), 50);
ga_battle_lost_hold_army_dwf_ally_1_flee4:rout_over_time_on_message("Flee4_at_airship",5000);

-------------------------------------- Flee#5 --------------------------------------------
ga_battle_lost_hold_army_dwf_ally_1_flee5:reinforce_on_message("Wait_9min", 1000); -- Flee #1
ga_battle_lost_hold_army_dwf_ally_1_flee5:message_on_deployed("Flee5_deployed"); -- Flee #1 control
ga_battle_lost_hold_army_dwf_ally_1_flee5:move_to_position_on_message("Flee5_deployed", v(-100, 100, 150));
ga_battle_lost_hold_army_dwf_ally_1_flee5:message_on_proximity_to_position("Flee5_at_airship", v(-100, 100, 150), 50);
ga_battle_lost_hold_army_dwf_ally_1_flee5:rout_over_time_on_message("Flee5_at_airship",5000);



-------------------------------------------------------------------------------------------------
------------------------------------ AIRSHIP LEAVES --------------------------------------------
-------------------------------------------------------------------------------------------------
ga_player:remove_on_message("Wait_14min");
ga_player:force_victory_on_message("Wait_14min", 20000); -- Player wins  20sec



-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------


-------------------------------------------------TESTING------------------------------------
gb:add_ping_icon_on_message("test", v(-100, 0, 150), 4, 1000, 16000);
