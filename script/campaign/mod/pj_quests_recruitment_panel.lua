PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local digForComponent = mod.digForComponent

--- Units that can be recruited via the BoG.
mod.bog_pages = mod.bog_pages or {
	{
		title = "The Frozen Feathered Ravens",
		desc = "The Frozen Feathered Ravens, shares the name of the company. These dwarfs are a heavy armoured regiment of veteran warriors, that wields two-handed hammers. These fiece warriors are lead by Grunnar Vestgrud and carry with them the horn of ice and valor.",
		img = "ui/a_recruitment_pic/4.png",
		payload = function() mod.add_unit_to_army("zorn_bulwark") end,
		save_id = "pj_quests_irondrake_recruitment",
		limit = 1,
	},
	{
		title = "The Iron Beaked Rooks ",
		desc = "The Iron Beaked Rooks is a regiment of experienced warriors that wields an single handed axe and a great shield. These dwarfs excels at defensive tactics and provides a sturdy defensive line. They are lead by the companies second in command, Ulron Northgaard, a seniored warrior and capable drinker.",
		img = "ui/a_recruitment_pic/5.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_dwarf_warrior_0") end,
		cost = 500,
	},
	{
		title = "The White Feathered Crows",
		desc = "The White Feathered Crows is a regiment specialized in scouting and ranged support. These rangers are equipped with crossbows and single handed weapons. They all wear capes fabricated from the hide of a single mammoth, imbued with powerful Runes.",
		img = "ui/a_recruitment_pic/2.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_miners_0") end,
		cost = 500,
	},
	{
		title = "The Ice Peak Magpies",
		desc = "The Ice Peak Magpies is a regiment of Quarrellers equipped with crossbows and great weapons. The regiment is capable of both ranged and melee support. Their captain, Jurg Tollgaard possesses a technical curiosity, which have led to the development of the partial automated crossbow wielded by the regiment.",
		img = "ui/a_recruitment_pic/3.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_quarrellers_0") end,
		cost = 500,
	},
	{
		title = "The Ice Jackdaws ",
		desc = "The Ice Jackdaws is the junior infantry regiment of the company, which composes of able warriors equipped with axe and shield. It is lead by the young lieutenant, Asger Blackpeak. What the Ice Jackdaws lack in experience and skill compared to the seniored regiments is leveraged by the regiments size.",
		img = "ui/a_recruitment_pic/1.png",
		payload = function() mod.add_unit_to_army("wh_dlc06_dwf_inf_rangers_0") end,
		cost = 500,
	},
}

--- Add a bunch of grudges so we can have pages to turn in the Book of Grudges.
mod.add_grudges = function()
	cm:disable_event_feed_events(true, "all", "", "")
	for i=1, 6 do
		local grudge_mission = mission_manager:new(
		cm:get_local_faction(true),
		"wh_dlc06_grudge_belegar_eight_peaks"
		);

		grudge_mission:add_new_objective("CONSTRUCT_N_BUILDINGS_FROM");
		grudge_mission:add_condition("total 1")
		grudge_mission:add_condition("building_level wh_main_dwf_barracks_3")
		grudge_mission:add_condition("faction wh_main_dwf_dwarfs");
		grudge_mission:add_payload("effect_bundle{bundle_key wh_dlc06_bundle_eight_peaks_recapture;turns 0;}");
		grudge_mission:set_should_cancel_before_issuing(false);
		grudge_mission:trigger();
	end
	cm:disable_event_feed_events(false, "all", "", "")
end

--- Current index of the Book of grudges page on the left, tracked to know when to refresh the BoG UI.
mod.current_bog_page = nil

--- Add a unit to the faction leader.
mod.add_unit_to_army = function(unit_key)
	local char = cm:get_faction(cm:get_local_faction(true)):faction_leader()
	if not char or char:is_null_interface() then return end

	cm:grant_unit_to_character(cm:char_lookup_str(char), unit_key)
end

--- Keep track of currently visible BoG UI components so we can hide them when turning pages.
mod.current_bog_comps = {}

--- Remove units from the mod.bog_pages list that exceeded their recruitment limit.
mod.remove_invalid_recruitment_entries = function()
	for i=#mod.bog_pages, 1, -1 do
		local page = mod.bog_pages[i]
		if page.limit and page.save_id then
			local save_value = cm:get_saved_value(page.save_id) or 0
			if save_value >= page.limit then
				table.remove(mod.bog_pages, i)
			end
		end
	end
end

--- Simulate clicking the OK button to close the BoG.
mod.close_book_of_grudges = function()
	local book_of_grudges = digForComponent(core:get_ui_root(), "book_of_grudges")
	if not book_of_grudges then return end
	local button_ok = digForComponent(book_of_grudges, "button_ok")
	if not button_ok then return end
	button_ok:SimulateLClick()
end

--- Draw a page of BoG with our own UI.
mod.draw_bog_page = function(page_num)
	local book_of_grudges = digForComponent(core:get_ui_root(), "book_of_grudges")
	local left_list = digForComponent(book_of_grudges, "list_left")
	local right_list = digForComponent(book_of_grudges, "list_right")

	local page_data = mod.bog_pages[page_num]
	local title = page_data.title
	local desc = page_data.desc

	local is_left_page = page_num%2 == 1
	local list = left_list
	if page_num%2 == 0 then
		list = right_list
	end

	local pages = digForComponent(book_of_grudges, "pages")
	local dy_objective = digForComponent(book_of_grudges, "dy_objective")
	---@type CA_UIC
	local description_view = digForComponent(book_of_grudges, "description_view")
	local tx_objectives_header = digForComponent(description_view, "dy_title")
	local obj_id = "objective_copy_"..(is_left_page and "left" or "right")
	local obj = digForComponent(book_of_grudges, obj_id)
	local header_id = "tx_objectives_header_copy_"..(is_left_page and "left" or "right")
	local header = digForComponent(book_of_grudges, header_id)

	if not obj then
		obj = UIComponent(dy_objective:CopyComponent(obj_id))
		header = UIComponent(tx_objectives_header:CopyComponent(header_id))
		pages:Adopt(header:Address())
		pages:Adopt(obj:Address())
	end
	obj:SetVisible(true)
	header:SetVisible(true)
	table.insert(mod.current_bog_comps, obj)
	table.insert(mod.current_bog_comps, header)

	local x, y = list:Position()
	if header then
		header:MoveTo(x+115, y+100)
		header:RegisterTopMost()
		header:SetStateText(title)
	end
	if obj then
		local w = obj:Width()
		obj:SetCanResizeHeight(true)
		obj:Resize(w, 48*3+20)
		obj:MoveTo(x+40, y+450-20)
		obj:RegisterTopMost()
		obj:SetStateText(desc)
	end

	local img_id = "rec_l_img_"..(is_left_page and "left" or "right")
	local img = digForComponent(book_of_grudges, img_id)
	if not img then
		img = UIComponent(pages:CreateComponent(img_id, "ui/templates/custom_image"))
	end
	img:SetImagePath(page_data.img, 4)
	img:Resize(300, 600)
	img:MoveTo(x+190, y+180)

	local rec_button_id = "pj_rec_button_"..(is_left_page and "left" or "right")

	local rec_button = digForComponent(book_of_grudges, rec_button_id) or UIComponent(pages:CreateComponent(rec_button_id, "ui/templates/square_large_text_button"))
	if page_data.limit then
		local save_value = cm:get_saved_value(page_data.save_id) or 0
		local num_available_for_recruitment = page_data.limit - save_value

		local button_txt = UIComponent(rec_button:Find("button_txt"))
		button_txt:SetStateText("Recruit ".."("..tostring(num_available_for_recruitment).." available)")
	else
		local button_txt = UIComponent(rec_button:Find("button_txt"))
		button_txt:SetStateText("Recruit")
	end

	rec_button:MoveTo(x+100+25, y+625)
	rec_button:Resize(350, 50)

	img:SetVisible(true)
	rec_button:SetVisible(true)
	table.insert(mod.current_bog_comps, img)
	table.insert(mod.current_bog_comps, rec_button)

	local rec_button_listener_id = "pj_rec_button_"..rec_button_id.."_on_click"
	core:remove_listener(rec_button_listener_id)
	core:add_listener(
		rec_button_listener_id,
		"ComponentLClickUp",
		function(context)
			return rec_button == UIComponent(context.component);
		end,
		function()
			if not page_data.payload then return end
			page_data.payload()
			if page_data.cost then
				cm:treasury_mod(cm:get_local_faction(true), -page_data.cost)
			end

			if page_data.limit then
				local save_value = cm:get_saved_value(page_data.save_id) or 0
				cm:set_saved_value(page_data.save_id, save_value+1)
				cm:callback(function()
					local success, ret = pcall(mod.remove_invalid_recruitment_entries)
					if not success then
						out(ret)
					end
				end, 1)
			end

			mod.close_book_of_grudges()
		end,
		true
	)

	if page_data.cost then
		rec_button:SetTooltipText("Costs "..tostring(page_data.cost).."[[img:icon_money]][[/img]]", true)
		local local_treasury = cm:get_faction(cm:get_local_faction(true)):treasury()
		if local_treasury < page_data.cost then
			rec_button:SetDisabled(true)
		end
	end
end

--- Redraw the opened BoG with our own UI.
mod.redraw_bog = function(page_num)
	local book_of_grudges = digForComponent(core:get_ui_root(), "book_of_grudges")
	if not book_of_grudges then return end
	if not book_of_grudges:Visible() then return end

	local bog_priority = book_of_grudges:Priority()
	if bog_priority ~= 200 then
		book_of_grudges:PropagatePriority(200)
		book_of_grudges:LockPriority()
	end

	local grudge_bar = digForComponent(book_of_grudges, "grudge_bar")
	grudge_bar:SetVisible(false)

	local tx_header = digForComponent(book_of_grudges, "tx_header")
	tx_header:SetStateText("Recruitment Ledger")

	local l = digForComponent(book_of_grudges, "list_left")
	local r = digForComponent(book_of_grudges, "list_right")
	if not l or not r then return end
	l:SetVisible(false)
	r:SetVisible(false)

	-- for _, comp in ipairs(mod.current_bog_comps) do
	-- 	comp:SetVisible(false)
	-- end

	mod.current_bog_comps = {}

	if mod.bog_pages[page_num] then
		mod.draw_bog_page(page_num)
	end
	if mod.bog_pages[page_num+1] then
		mod.draw_bog_page(page_num+1)
	end
end

mod.on_book_of_grudges_panel_opening = function()
	mod.remove_invalid_recruitment_entries()
	local book_of_grudges = digForComponent(core:get_ui_root(), "book_of_grudges")
	if not book_of_grudges then return end
	local dy_page = digForComponent(book_of_grudges, "dy_page")
	if not dy_page then return end
	local text = dy_page:GetStateText()
	local current_page = tonumber(string.sub(text, 1, string.find(text, "/")-1))
	if not mod.current_bog_page or mod.current_bog_page ~= current_page then
		mod.current_bog_page = current_page
		mod.redraw_bog(current_page*2-1)
	end
end

local function init()
	mod.add_grudges()
	local success, ret = pcall(mod.remove_invalid_recruitment_entries)
	if not success then
		out(ret)
	end

	-- start running the book of grudges update loop when we open the Book of Grudges panel
	core:remove_listener("pj_quests_on_book_of_grudges_panel_opened")
	core:add_listener(
		"pj_quests_on_book_of_grudges_panel_opened",
		"PanelOpenedCampaign",
		function(context)
			return context.string == "book_of_grudges"
		end,
		function()
			cm:remove_callback("pj_quests_book_of_grudges_update_id")
			cm:repeat_callback(
				function()
					local success, ret = pcall(mod.on_book_of_grudges_panel_opening)

					if not success then
						out(ret)
					end
				end,
				0,
				"pj_quests_book_of_grudges_update_id"
			)

			local success, ret = pcall(mod.on_book_of_grudges_panel_opening)
			if not success then
				out(ret)
			end
		end,
		true
	)

	-- stop running the book of grudges update loop
	core:remove_listener("pj_quests_on_book_of_grudges_panel_closed")
	core:add_listener(
		"pj_quests_on_book_of_grudges_panel_closed",
		"PanelClosedCampaign",
		function(context)
			return context.string == "book_of_grudges"
		end,
		function()
			cm:remove_callback("pj_quests_book_of_grudges_update_id")
			mod.current_bog_page = nil
			local book_of_grudges = digForComponent(core:get_ui_root(), "book_of_grudges")
			if book_of_grudges then
				book_of_grudges:UnLockPriority()
			end
		end,
		true
	)
end

cm:add_first_tick_callback(function()
	init()
end)
if debug.traceback():find('pj_loadfile') then
	init()
end
