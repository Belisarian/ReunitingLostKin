PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local digForComponent = mod.digForComponent

mod.create_quests_panel = function()
	if not mod.are_camera_settings_adjusted then
		mod.adjust_camera_settings()
		mod.are_camera_settings_adjusted = true
		cm:callback(mod.create_quests_panel, 0.1)
		return
	end

	CampaignUI.ClearSelection()

	local existingFrame = Util.getComponentWithName("Quests")
	if existingFrame then
			return
	end

	local myFrame = Frame.new("Quests")

	myFrame:Resize(920+100+152, 800+100+75+50)
	Util.centreComponentOnScreen(myFrame)
	myFrame:Move(0, 5)
	myFrame.uic:RegisterTopMost()

	local traitImage = Image.new("pj_quests_bg_image", myFrame, "ui/Roadmap.png");
	traitImage:Resize(1136, 610+100)
	traitImage:Move(5, 5)

	local quest_description_title = Text.new("pj_quests_quest_description_title", myFrame, "NORMAL", "")--mission_sjoktraken_shipwreck.locs.title)
	local quest_description = Text.new("pj_quests_quest_description", myFrame, "NORMAL", "")--mission_sjoktraken_shipwreck.locs.mission_desc)
	quest_description:Resize(545+350, 300)
	quest_description_title:Resize(545+350, 50)
	quest_description_title:PositionRelativeTo(myFrame, 275+70+130, 140+3*50+200+250-80)
	quest_description:PositionRelativeTo(myFrame, 275+70-75-100, 140+3*50+200+250-40-50-5-18)

	local start_quest_button = TextButton.new("pj_quests_start_quest_button", myFrame, "TEXT", "Select a quest on the map")

	local current_missions = mod.missions_list[mod.current_state] or {}
	for _, mission_data in ipairs(current_missions) do
		if not mission_data.condition or mission_data.condition() then
			local mission_key = mission_data.key
			local title = mission_data.locs and mission_data.locs and mission_data.locs.title or effect.get_localised_string("missions_localised_title_"..mission_key)
			local desc = mission_data.locs and mission_data.locs and mission_data.locs.desc or effect.get_localised_string("missions_localised_description_"..mission_key)
			local quest_button = Button.new("pj_quests_"..mission_key.."_button", myFrame, "CIRCULAR", mission_data.icon)
			quest_button:Resize(60, 60)
			local data_quest_button_x, data_quest_button_y = unpack(mission_data.ui_offsets)

			local quest_button_x = -25+data_quest_button_x*1.32258
			local quest_button_y = -160+data_quest_button_y*1.184

			quest_button:PositionRelativeTo(myFrame, quest_button_x, quest_button_y)
			quest_button.uic:SetTooltipText(title.."||".."Start the \""..desc.."\" quest.",  true)

			quest_button.uic:StartPulseHighlight()

			quest_button:RegisterForClick(function()
				mod.selected_quest = mission_key
				start_quest_button:SetButtonText(title)
				start_quest_button:SetDisabled(false)

				local text_width = quest_description_title.uic:TextDimensionsForText(title)

				local quest_description_x = 275+55+238-text_width/2
				local quest_description_y = 140+3*50+200+250-80-50-10
				quest_description_title:PositionRelativeTo(myFrame, quest_description_x, quest_description_y)

				quest_description_title:SetText(title)
				quest_description:SetText(mission_data.locs.mission_desc)
			end)

			local img = Image.new("pj_quests"..mission_key.."_text_bg", myFrame, "ui/skins/warhammer2/unit_card_post_battle_banner.png")
			local x,y = quest_button:Position()
			img:Resize(300, 50)
			img:MoveTo(x-115, y+50)

			local parchment_text = Text.new("pj_quests"..mission_key.."_text", myFrame, "NORMAL", title)
			parchment_text:Resize(500, 50)
			local parchment_text_width = parchment_text.uic:TextDimensionsForText(title)
			img:Resize(parchment_text_width+parchment_text_width/2, 50)
			parchment_text:Resize(parchment_text_width+parchment_text_width/2, 50)

			local parchment_text_bg_x = x-parchment_text_width/2+30-parchment_text_width/4
			local parchment_text_bg_y = y+50
			local parchement_text_x = x+30-parchment_text_width/2
			local parchement_text_y = y+70

			local ui_pivot = mission_data.ui_pivot
			if ui_pivot then
				local offset_x = 0
				local offset_y = 0

				if ui_pivot == "right" then
					offset_x = 110
					offset_y = -45
				end
				if ui_pivot == "top" then
					offset_x = 0
					offset_y = -95
				end
				parchement_text_x = parchement_text_x+offset_x
				parchement_text_y = parchement_text_y+offset_y
				parchment_text_bg_x = parchment_text_bg_x+offset_x
				parchment_text_bg_y = parchment_text_bg_y+offset_y
			end
			img:MoveTo(parchment_text_bg_x, parchment_text_bg_y)
			parchment_text:MoveTo(parchement_text_x, parchement_text_y)
		end
	end

	start_quest_button:SetDisabled(true)
	start_quest_button:PositionRelativeTo(myFrame, 275+60, 140+3*50+200+150+65+50)
	start_quest_button:Resize(500, 50)
	start_quest_button:RegisterForClick(function()
		cm:callback(function()
			CampaignUI.ClearSelection()
			myFrame:Delete()
			core:trigger_event("pj_quests_start_quest", mod.selected_quest)
		end, 0.1)
	end)

	local parchment = digForComponent(myFrame.uic, "parchment")
	if parchment then
		parchment:SetDockOffset(0, 162+50-50+20)
	end
	local bg_img = digForComponent(myFrame.uic, "pj_quests_bg_image")
	if bg_img then
		local img_x, img_y = bg_img:Position()
		bg_img:MoveTo(img_x, img_y-70-15-50)
	end

	myFrame:AddCloseButton(function()
		mod.selected_quest = nil
	end)
end

---@return CA_UIC
local function find_ui_component_str(starting_comp, str)
	local has_starting_comp = str ~= nil
	if not has_starting_comp then
		str = starting_comp
	end
	local fields = {}
	local pattern = string.format("([^%s]+)", " > ")
	string.gsub(str, pattern, function(c)
		if c ~= "root" then
			fields[#fields+1] = c
		end
	end)
	return find_uicomponent(has_starting_comp and starting_comp or core:get_ui_root(), unpack(fields))
end

mod.rework_faction_buttons_wheel = function()
	local notification_frame = find_ui_component_str("root > layout > faction_buttons_docker > end_turn_docker > notification_frame")
	-- notification_frame:SetVisible(false)

	local faction_buttons_docker = find_ui_component_str("root > layout > faction_buttons_docker")
	local faction_buttons_docker_frame = find_ui_component_str(faction_buttons_docker, "frame")
	local endt = find_ui_component_str(faction_buttons_docker, "end_turn_docker > button_end_turn")
	local end_turn_docker = find_ui_component_str(faction_buttons_docker, "end_turn_docker > button_end_turn")

	local rlk_quests_button = find_uicomponent(end_turn_docker, "rlk_quests_button")
	if not rlk_quests_button then
		rlk_quests_button = UIComponent(end_turn_docker:CreateComponent("rlk_quests_button", "ui/templates/round_large_button"))
	end

	rlk_quests_button:SetCanResizeWidth(true)
	rlk_quests_button:SetCanResizeHeight(true)
	rlk_quests_button:Resize(endt:Width(),endt:Height())
	rlk_quests_button:SetVisible(true)

	rlk_quests_button:SetTooltipText("Frozen Ravens Quests Ledger", true)
	endt:Adopt(rlk_quests_button:Address())
	rlk_quests_button:SetDockingPoint(1)
	rlk_quests_button:SetDockOffset(0,0)
	rlk_quests_button:SetImagePath("ui/skins/default/icon_god_choice_grombrindal.png", 0)

	faction_buttons_docker_frame:SetImagePath("ui/end_turn.png", 0)

	local turn = find_ui_component_str(faction_buttons_docker, "end_turn_docker > label_turn_count")
	turn:SetVisible(false)

	local b = find_ui_component_str(faction_buttons_docker, "button_group_management > button_grudges > label_grudges_count")
	b:SetVisible(false)
end

cm:add_first_tick_callback(function()
	core:remove_listener('pj_unit_upgrades_on_clicked_retrain_button34234')
	core:add_listener(
		'pj_unit_upgrades_on_clicked_retrain_button34234',
		'ComponentLClickUp',
		function(context)
			return context.string == "rlk_quests_button"
		end,
		function(context)
			pulse_uicomponent(UIComponent(context.component), false, 5, false, "active")
			mod.create_quests_panel()
		end,
		true
	)

	mod.rework_faction_buttons_wheel()
end)
