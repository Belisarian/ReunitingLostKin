-------------------------------------------------------------------------------------------------
------------------------------------------- KEY INFO --------------------------------------------
-------------------------------------------------------------------------------------------------
-- ReunitingLostKins
-- mission_kraka_ravnsvake_icetrolls
-- Attacker
-------------------------------------------------------------------------------------------------
------------------------------------------- PRELOADS --------------------------------------------
-------------------------------------------------------------------------------------------------
load_script_libraries();

bm = battle_manager:new(empire_battle:new());
local gc = generated_cutscene:new(true);


--Generate random seed that will change between playthroughs (don't have to worry about desync in singleplayer)
math.randomseed(os.time());

--No deployment, start from black
bm:camera():fade(true, 0);


--Add subtitles and shots to cutscene
gc:add_element(nil, "battle_ice_trolls_speech_01", "gc_commander_personal_front", 4500, true, false, false);
gc:add_element(nil, "battle_ice_trolls_speech_02", "gc_medium_absolute_glaciers_01", 5000, false, false, false);
gc:add_element(nil, "battle_ice_trolls_speech_03", "army_pan_front_personal", 4500, false, false, false);
gc:add_element(nil, "battle_ice_trolls_speech_04", "gc_medium_absolute_glaciers_02", 7000, false, false, false);
gc:add_element(nil, "battle_ice_trolls_speech_05", "gc_medium_army_pan_back_left_to_back_right_close_medium_01", 5000, false, false, false);


--Initialize battle
gb = generated_battle:new(
	false,                                     			-- screen starts black
	true,                                     			-- prevent deployment for player
	false,                                    			-- prevent deployment for ai
	function() end_deployment_phase() end, 	-- intro cutscene function
	false                                      			-- debug mode
);

--Begin cutscene
gb:set_cutscene_during_deployment(false);
function end_deployment_phase()
    bm:camera():fade(false, 1);
    gb:start_generated_cutscene(gc);
end;


-------------------------------------------------------------------------------------------------
------------------------------------------ ARMY SETUP -------------------------------------------
-------------------------------------------------------------------------------------------------
ga_player = gb:get_army(gb:get_player_alliance_num(), 1, ""); -- player
ga_trolls = gb:get_army(gb:get_non_player_alliance_num(), "battle_icetrolls"); -- enemy

gb:add_listener("battle_started", function() battle_start_teleport_units() end);
gb:add_listener("send_troll_1", function() send_troll(1) end);
gb:add_listener("send_troll_2", function() send_troll(2) end);
gb:add_listener("send_troll_3", function() send_troll(3) end);
gb:add_listener("send_troll_4", function() send_troll(4) end);
gb:add_listener("send_troll_5", function() send_troll(5) end);
gb:add_listener("send_troll_6", function() send_troll(6) end);
gb:add_listener("send_troll_7", function() send_troll(7) end);
gb:add_listener("send_troll_8", function() send_troll(8) end);
gb:add_listener("send_troll_9", function() send_troll(9) end);
gb:add_listener("send_troll_10", function() send_troll(10) end);
gb:add_listener("send_troll_11", function() send_troll(11) end);
gb:add_listener("send_troll_12", function() send_troll(12) end);
gb:add_listener("send_troll_13", function() send_troll(13) end);
gb:add_listener("send_troll_14", function() send_troll(14) end);
gb:add_listener("send_troll_15", function() send_troll(15) end);
gb:add_listener("send_troll_16", function() send_troll(16) end);
--[[gb:add_listener("send_troll_17", function() send_troll(17) end);
gb:add_listener("send_troll_18", function() send_troll(18) end);
gb:add_listener("send_troll_19", function() send_troll(19) end);
gb:add_listener("send_troll_20", function() send_troll(20) end);]]--

--Wave 1:
gb:message_on_time_offset("send_troll_2",1000);
gb:message_on_time_offset("send_troll_3",2000);
gb:message_on_time_offset("send_troll_4",3000);

--Wave 2:
gb:message_on_time_offset("send_troll_5",90000);
gb:message_on_time_offset("send_troll_6",91000);
gb:message_on_time_offset("send_troll_7",92000);
gb:message_on_time_offset("send_troll_8",93000);
gb:message_on_time_offset("send_troll_9",94000);

--Wave 3:
gb:message_on_time_offset("send_troll_1",181000);
gb:message_on_time_offset("send_troll_10",181000);
gb:message_on_time_offset("send_troll_11",182000);
gb:message_on_time_offset("send_troll_12",183000);
gb:message_on_time_offset("send_troll_13",184000);
gb:message_on_time_offset("send_troll_14",185000);
gb:message_on_time_offset("send_troll_15",186000);
gb:message_on_time_offset("send_troll_16",187000);
--[[gb:message_on_time_offset("send_troll_17",140000);
gb:message_on_time_offset("send_troll_18",145000);
gb:message_on_time_offset("send_troll_19",150000);
gb:message_on_time_offset("send_troll_20",155000);]]--

--Freeze Player Units
gb:add_listener("freeze_units", function() freeze_unit() end, true);

gb:message_on_time_offset("freeze_units", 75000);
gb:message_on_time_offset("freeze_units", 155000);
gb:message_on_time_offset("freeze_units", 230000);


-------------------------------------------------------------------------------------------------
----------------------------------------- USEFUL FUNCTIONS --------------------------------------
-------------------------------------------------------------------------------------------------

--Test if there are any player units near
--Note: this function doesn't work in patrol_manager because of a bug in checking position
function proximity_test(current_sunit)
    local current_pos = current_sunit.unit:position();
	local closest_unit = get_closest_standing_unit(ga_player.sunits, current_pos);
	if closest_unit and closest_unit:position():distance(current_pos) < 75 then
		return true;
	end;
	return false;
end;

--Once in close quarters, just start attacking
function blind_attack(current_sunit, pm)
    pm:stop();
    current_sunit:release_control();
end;

--Gives a random player unit the extra frostbite effect
function freeze_unit()
    local num_units = ga_player.sunits:count();
    local rand1 = math.random(num_units);
    local rand2 = math.random(6);
    --local rand1 = bm:random_number(num_units);
    --local rand2 = bm:random_number(6);
    if not is_routing_or_dead(ga_trolls.sunits:item(1)) then
        ga_trolls.sunits:item(1).uc:perform_special_ability("unit_crystal", ga_player.sunits:item(rand1).unit);
        if rand2 == 1 then
            gb.sm:trigger_message("help_1");
        elseif rand2 == 2 then
            gb.sm:trigger_message("help_2");
        elseif rand2 == 3 then
            gb.sm:trigger_message("help_3");
        elseif rand2 == 4 then
            gb.sm:trigger_message("help_4");
        elseif rand2 == 5 then
            gb.sm:trigger_message("help_5");
        elseif rand2 == 6 then
            gb.sm:trigger_message("help_6");
        end;
    end;
end;


-------------------------------------------------------------------------------------------------
----------------------------------------- ARMY TELEPORT AND ORDERS ------------------------------
-------------------------------------------------------------------------------------------------

--Center: 350, 410
--Paths: (460, 120) -> (380, 340)
--       (330, 50) -> (220, 420)
--       (160, 650) -> (220, 420)
--       (320, 650) -> (320, 490)
--       (320, 650) -> (410, 440)
--       (25, 650) -> (120, 530) -> (220, 420) -- THIS ONE IS SOMEWHAT REDUNDANT
--       (25, 650) -> (120, 530) -> (150, 410) -> (220, 420)

--Teleport all units to one corner of the map, hidden, which is the hub for where they get teleported from
function battle_start_teleport_units()
     for i = 1, ga_trolls.sunits:count() do
        local current_sunit = ga_trolls.sunits:item(i);
        current_sunit:set_invisible_to_all(true);
        current_sunit.uc:teleport_to_location(v(320, 650), 0, 27);
     end;
end;

--Pick a random path for each troll to take to get to the center
function send_troll(value)
    local player_armies = bm:alliances():item(gb:get_player_alliance_num()):armies();
    local current_sunit = ga_trolls.sunits:item(value);
    local random_path = math.random(7);
    --local random_path = bm:random_number(7);
    local pm = patrol_manager:new(current_sunit.name .. "troll_patrol", current_sunit, player_armies, 200);
    if random_path == 1 then
        current_sunit.uc:teleport_to_location(v(460, 120), 0, 27);
        pm:add_waypoint(v(380, 340), true);
    elseif random_path == 2 then
        current_sunit.uc:teleport_to_location(v(330, 50), 0, 27);
        pm:add_waypoint(v(220, 420), true);
    elseif random_path == 3 then
        current_sunit.uc:teleport_to_location(v(160, 650), 0, 27);
        pm:add_waypoint(v(220, 420), true);
    elseif random_path == 4 then
        current_sunit.uc:teleport_to_location(v(320, 650), 0, 27);
        pm:add_waypoint(v(320, 490), true);
    elseif random_path == 5 then
        current_sunit.uc:teleport_to_location(v(320, 650), 0, 27);
        pm:add_waypoint(v(410, 440), true);
    elseif random_path == 6 then
        current_sunit.uc:teleport_to_location(v(25, 650), 0, 27);
        pm:add_waypoint(v(120, 530), true);
        pm:add_waypoint(v(220, 420), true);
    elseif random_path == 7 then
        current_sunit.uc:teleport_to_location(v(25, 650), 0, 27);
        pm:add_waypoint(v(120, 530), true);
        pm:add_waypoint(v(150, 410), true);
        pm:add_waypoint(v(220, 420), true);
    end;
    pm:add_waypoint(v(350,410), true);
    pm:loop(true);
    pm:set_stop_on_intercept(false);
    pm:set_stop_on_rout(false);
    pm:start();
    current_sunit:set_invisible_to_all(false);
    bm:watch(
        function()
            return proximity_test(current_sunit)
        end,
        0,
        function()
            blind_attack(current_sunit, pm)
        end,
        current_sunit.name .. "_new_patrol"
    );
end;
                          
-------------------------------------------------------------------------------------------------
------------------------------------------- OBJECTIVES ------------------------------------------
-------------------------------------------------------------------------------------------------

gb:set_objective_on_message("deployment_started", "mission_kraka_ravnsvake_icetrolls_objective_1_tooltip");
gb:set_objective_on_message("deployment_started", "mission_kraka_ravnsvake_icetrolls_objective_2_tooltip");

ga_trolls:message_on_commander_dead_or_shattered("dead_snake_head");
ga_trolls:message_on_defeat("dead_snake");

gb:complete_objective_on_message("dead_snake_head", "mission_kraka_ravnsvake_icetrolls_objective_1_tooltip");
gb:complete_objective_on_message("dead_snake", "mission_kraka_ravnsvake_icetrolls_objective_2_tooltip");

-------------------------------------------------------------------------------------------------
--------------------------------------------- HINTS/MESSAGES ---------------------------------------------
-------------------------------------------------------------------------------------------------

gb:queue_help_on_message("cutscene_ended", "mission_kraka_ravnsvake_icetrolls_objective_3_message", 8000, 2000, 1000);
gb:queue_help_on_message("help_1", "mission_kraka_ravnsvake_icetrolls_help_1_message");
gb:queue_help_on_message("help_2", "mission_kraka_ravnsvake_icetrolls_help_2_message");
gb:queue_help_on_message("help_3", "mission_kraka_ravnsvake_icetrolls_help_3_message");
gb:queue_help_on_message("help_4", "mission_kraka_ravnsvake_icetrolls_help_4_message");
gb:queue_help_on_message("help_5", "mission_kraka_ravnsvake_icetrolls_help_5_message");
gb:queue_help_on_message("help_6", "mission_kraka_ravnsvake_icetrolls_help_6_message");