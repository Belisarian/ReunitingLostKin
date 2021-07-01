local digForComponent = function(startingComponent, componentName, max_depth)
	local function digForComponent_iter(startingComponent, componentName, max_depth, current_depth)
		local childCount = startingComponent:ChildCount()
		for i=0, childCount-1  do
				local child = UIComponent(startingComponent:Find(i))
				if child:Id() == componentName then
						return child
				else
					if not max_depth or current_depth+1 <= max_depth then
						local dugComponent = digForComponent_iter(child, componentName, max_depth, current_depth+1)
						if dugComponent then
								return dugComponent
						end
					end
				end
		end
		return nil
	end

	return digForComponent_iter(startingComponent, componentName, max_depth, 1)
end

local function hide_other_lords()
	local faction_list = find_uicomponent(core:get_ui_root(), "sp_grand_campaign", "dockers", "top_docker", "lord_select_list", "list", "list_clip", "list_box");
	if not faction_list then
		return
	end

	for i = 0, faction_list:ChildCount() - 1 do
		local child = UIComponent(faction_list:Find(i))
		if child:Id() ~= "Thrund Holdfast" then
			child:SetVisible(false)
		else
			child:SimulateLClick()
		end
	end
end

local function rejig_lord_select_screen()
	local ui_root = core:get_ui_root()
	local portrait_frame = digForComponent(ui_root, "portrait_frame")
	if not portrait_frame then return end

	-- width is now 942, if we change this make sure the check for this
	-- in pj_quests_on_sp_grand_campaign_transition is changes as well
	local h = 530
	portrait_frame:ResizeTextResizingComponentToInitialSize(h*16/9, h)
	local x,y = portrait_frame:Position()
	portrait_frame:MoveTo(x-2, y-2)

	local race_details_panel = digForComponent(ui_root, "race_details_panel")
	local x,y = race_details_panel:Position()
	race_details_panel:MoveTo(x-220, y)

	local lord_details_panel = digForComponent(ui_root, "lord_details_panel")
	local x,y = lord_details_panel:Position()
	lord_details_panel:MoveTo(x+220, y)

	local tab_map = digForComponent(ui_root, "tab_map")
	tab_map:SetVisible(false)
	local tab_movie = digForComponent(ui_root, "tab_movie")
	tab_movie:SetVisible(false)

	local faction_list = find_uicomponent(core:get_ui_root(), "sp_grand_campaign", "dockers", "top_docker", "lord_select_list", "list", "list_clip", "list_box")
	faction_list:SetVisible(false)

	local tp = digForComponent(ui_root, "title_plaque")
	local tx = digForComponent(tp, "tx_header")
	tx:SetStateText("Reuniting Lost Kin")

	local faction_leader = find_uicomponent(core:get_ui_root(), "sp_grand_campaign", "dockers", "centre_docker", "portrait_frame", "dy_faction_leader")
	faction_leader:SetStateText("Grunnar Vestgrud")
end

local function create_frontend_listeners()
	core:add_listener(
		"pj_quests_on_sp_grand_campaign_transition",
		"FrontendScreenTransition",
		function(context)
			return context.string == "sp_grand_campaign"
		end,
		function()
			hide_other_lords()
			real_timer.unregister("pj_quest_frontend_delay")
			real_timer.register_repeating("pj_quest_frontend_delay", 0)
		end,
		true
	)

	core:remove_listener("pj_quest_frontend_delay_cb")
	core:add_listener(
			"pj_quest_frontend_delay_cb",
			"RealTimeTrigger",
			function(context)
					return context.string == "pj_quest_frontend_delay"
			end,
			function()
				local ui_root = core:get_ui_root()
				local portrait_frame = digForComponent(ui_root, "portrait_frame")
				if not portrait_frame then return end
				portrait_frame:SetVisible(false)

				local race_details_panel = digForComponent(ui_root, "race_details_panel")
				if not race_details_panel then return end

				local x1 = portrait_frame:Position()
				local x2 = race_details_panel:Position()

				if x1-x2 == 477 then
					real_timer.unregister("pj_quest_frontend_delay")
					portrait_frame:SetVisible(true)
					return
				end

				rejig_lord_select_screen()
			end,
			true
	)

	core:add_listener(
		"pj_quests_on_campaign_select_transition",
		"FrontendScreenTransition",
		function(context) return context.string == "campaign_select" end,
		function()
			local wh2_main_great_vortex = digForComponent(core:get_ui_root(), "wh2_main_great_vortex")
			if wh2_main_great_vortex then
				wh2_main_great_vortex:SetVisible(false)
			end

			local main_warhammer = digForComponent(core:get_ui_root(), "main_warhammer")
			if not main_warhammer then return end

			local button_campaign_entry = digForComponent(main_warhammer, "button_campaign_entry")
			if not button_campaign_entry then return end

			button_campaign_entry:SimulateLClick()
		end,
		true
	)

	core:remove_listener("rlk_quest_battles_CampaignTransitionListener")
	core:add_listener(
		"rlk_quest_battles_CampaignTransitionListener",
		"FrontendScreenTransition",
		function(context) return context.string == "quest_battles" end,
		function(context)
			local ui_root = core:get_ui_root()
			local map_panel = find_uicomponent(ui_root, "quest_battles", "panel", "map_parent", "map_clip", "map_panel")
			if not map_panel then return end

			for i=0, map_panel:ChildCount()-1 do
				local battle = UIComponent(map_panel:Find(i))
				battle:SetDockingPoint(1)
				battle:SetDockOffset((i%5)*180+50, math.floor(i/5)*90)
			end
		end,
		true
	)
end

core:add_ui_created_callback(
	function()
		create_frontend_listeners()
	end
)
