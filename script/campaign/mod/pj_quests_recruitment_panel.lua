PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local digForComponent = mod.digForComponent

--- Units that can be recruited via the BoG.
mod.bog_pages = {
	{
		title = "The Frozen Feathered Ravens",
		desc = "The Frozen Feathered Ravens, shares the name of the company. These dwarfs are a heavy armoured regiment of veteran warriors, that wields two-handed hammers. These fiece warriors are lead by Grunnar Vestgrud and carry with them the horn of ice and valor.",
		img = "ui/bog/bog1.png",
		payload = function() mod.add_unit_to_army("zorn_bulwark") end,
		save_id = "pj_quests_irondrake_recruitment",
		limit = 1,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return true end,
	},
	{
		title = "The Iron Beaked Rooks ",
		desc = "The Iron Beaked Rooks is a regiment of experienced warriors that wields an single handed axe and a great shield. These dwarfs excels at defensive tactics and provides a sturdy defensive line. They are lead by the companies second in command, Ulron Northgaard, a seniored warrior and capable drinker.",
		img = "ui/bog/The_Iron_Beaked_Rooks_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_dwarf_warrior_0") end,
		cost = 500,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return true end,
	},
	{
		title = "The White Feathered Crows",
		desc = "The White Feathered Crows is a regiment specialized in scouting and ranged support. These rangers are equipped with crossbows and single handed weapons. They all wear capes fabricated from the hide of a single mammoth, imbued with powerful Runes.",
		img = "ui/bog/The_White_Feathered_Crows_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_miners_0") end,
		cost = 500,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return true end,
	},
	{
		title = "The Ice Peak Magpies",
		desc = "The Ice Peak Magpies is a regiment of Quarrellers equipped with crossbows and great weapons. The regiment is capable of both ranged and melee support. Their captain, Jurg Tollgaard possesses a technical curiosity, which have led to the development of the partial automated crossbow wielded by the regiment.",
		img = "ui/bog/The_Ice_Peak_Magpies_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_quarrellers_0") end,
		cost = 500,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return true end,
	},
	{
		title = "The Ice Jackdaws ",
		desc = "The Ice Jackdaws is the junior infantry regiment of the company, which composes of able warriors equipped with axe and shield. It is lead by the young lieutenant, Asger Blackpeak. What the Ice Jackdaws lack in experience and skill compared to the seniored regiments is leveraged by the regiments size.",
		img = "ui/bog/The_Ice_Jackdaws_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_dlc06_dwf_inf_rangers_0") end,
		cost = 500,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return true end,
	},
	{
		title = "DWARF RANGERS",
		desc = "The Ice Jackdaws is the junior infantry regiment of the company, which composes of able warriors equipped with axe and shield. It is lead by the young lieutenant, Asger Blackpeak. What the Ice Jackdaws lack in experience and skill compared to the seniored regiments is leveraged by the regiments size.",
		img = "ui/bog/The_Ice_Jackdaws_grudge_pages_layout.png",
		payload = function()
			mod.add_unit_to_army("wh_dlc06_dwf_inf_rangers_0")
			cm:set_saved_value("pj_quests_have_recruited_DWARF_RANGERS", true)
		end,
		cost = 500,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS") end,
	},
	{
		title = "DWARF RANGERS 2",
		desc = "The Ice Jackdaws is the junior infantry regiment of the company, which composes of able warriors equipped with axe and shield. It is lead by the young lieutenant, Asger Blackpeak. What the Ice Jackdaws lack in experience and skill compared to the seniored regiments is leveraged by the regiments size.",
		img = "ui/bog/The_Ice_Jackdaws_grudge_pages_layout.png",
		payload = function()
			mod.add_unit_to_army("wh_dlc06_dwf_inf_rangers_0")
			cm:set_saved_value("pj_quests_have_recruited_DWARF_RANGERS_2", true)
		end,
		cost = 500,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS_2") end,
		predicate = function() return cm:get_saved_value("pj_quests_RANGER_2_RECRUITMENT") end,
	},
	{
		title = "DWARF RANGERS 3",
		desc = "The Ice Jackdaws is the junior infantry regiment of the company, which composes of able warriors equipped with axe and shield. It is lead by the young lieutenant, Asger Blackpeak. What the Ice Jackdaws lack in experience and skill compared to the seniored regiments is leveraged by the regiments size.",
		img = "ui/bog/The_Ice_Jackdaws_grudge_pages_layout.png",
		payload = function()
			mod.add_unit_to_army("wh_dlc06_dwf_inf_rangers_0")
			cm:set_saved_value("pj_quests_have_recruited_DWARF_RANGERS_3", true)
		end,
		cost = 500,
		first = "First",
		second = "Second",
		third = "Third",
		hide_recruitment = function() return cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS_3") end,
		predicate = function() return cm:get_saved_value("pj_quests_RANGER_3_RECRUITMENT") end,
	},
}

mod.get_num_valid_bog_pages = function()
	local num_pages = 0
	for _, page_data in ipairs(mod.bog_pages) do
		if not page_data.predicate or page_data.predicate() then
			num_pages = num_pages + 1
		end
	end
	return num_pages
end

mod.get_bog_page = function(page_num)
	local page_index = 0
	for i, page_data in ipairs(mod.bog_pages) do
		if not page_data.predicate or page_data.predicate() then
			page_index = page_index + 1
			if page_index == page_num then
				return mod.bog_pages[i]
			end
		end
	end
	return nil
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

	---@type CA_UIC
	local book_frame = digForComponent(book_of_grudges, "book_frame")

	local page_data = mod.get_bog_page(page_num)
	local title = page_data.title
	local desc = page_data.desc

	local is_left_page = true
	local list = left_list

	local pages = digForComponent(book_of_grudges, "pages")
	local dy_objective = digForComponent(book_of_grudges, "dy_objective")
	---@type CA_UIC
	local description_view = digForComponent(book_of_grudges, "description_view")
	local tx_objectives_header = digForComponent(description_view, "dy_title")
	local obj_id = "objective_copy_"..(is_left_page and "left" or "right")
	local obj = digForComponent(book_of_grudges, obj_id)
	local header_id = "tx_objectives_header_copy_"..(is_left_page and "left" or "right")
	local header = digForComponent(book_of_grudges, header_id)

	local x, y = list:Position()

	if not obj then
		obj = UIComponent(dy_objective:CopyComponent(obj_id))
		header = UIComponent(tx_objectives_header:CopyComponent(header_id))
		pages:Adopt(header:Address())
		pages:Adopt(obj:Address())

		obj:SetCanResizeWidth(true)
		obj:SetCanResizeHeight(true)
		obj:ResizeTextResizingComponentToInitialSize(520*1.2, 48*1.2)
		obj:MoveTo(x+550, y+555)
		obj:RegisterTopMost()
		obj:SetStateText(desc)

		header:SetCanResizeWidth(true)
		header:SetCanResizeHeight(true)
		header:ResizeTextResizingComponentToInitialSize(338-50, 37)
	end

	if not obj or not header then
		dout("ERROR: OBJ OR HEADER MISSING!")
		return
	end

	obj:SetVisible(true)
	header:SetVisible(true)
	table.insert(mod.current_bog_comps, obj)
	table.insert(mod.current_bog_comps, header)

	obj:MoveTo(x+550, y+575)
	header:MoveTo(x+870, y+300)
	header:RegisterTopMost()
	header:SetStateText(title)

	local obj1 = digForComponent(book_of_grudges, "objective_copy_1")

	if not obj1 then
		for i=0, 10 do
			local obj = UIComponent(dy_objective:CopyComponent("objective_copy_"..i))
			pages:Adopt(obj:Address())
			obj:SetVisible(false)
		end

		obj1 = digForComponent(book_of_grudges, "objective_copy_1")
	end

	local starting_x = 910
	local starting_y = 410
	obj1:SetVisible(true)
	obj1:SetStateText("DESCRIPTION")
	obj1:SetDockingPoint(1)
	obj1:SetDockOffset(starting_x, starting_y)

	obj = digForComponent(book_of_grudges, "objective_copy_2")
	obj:SetVisible(true)
	obj:SetStateText(page_data.first)
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x+200, starting_y)

	obj = digForComponent(book_of_grudges, "objective_copy_3")
	obj:SetVisible(true)
	obj:SetStateText("DESCRIPTION")
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x, starting_y+35)

	obj = digForComponent(book_of_grudges, "objective_copy_4")
	obj:SetVisible(true)
	obj:SetStateText(page_data.second)
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x+200, starting_y+35)

	obj = digForComponent(book_of_grudges, "objective_copy_5")
	obj:SetVisible(true)
	obj:SetStateText("DESCRIPTION")
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x, starting_y+70)

	obj = digForComponent(book_of_grudges, "objective_copy_6")
	obj:SetVisible(true)
	obj:SetStateText(page_data.third)
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x+200, starting_y+70)

	local img_id = "rec_l_img_"..(is_left_page and "left" or "right")
	local img = digForComponent(book_of_grudges, img_id)
	if not img then
		img = UIComponent(pages:CreateComponent(img_id, "ui/templates/custom_image"))
	end
	img:SetImagePath(page_data.img, 4)
	img:SetVisible(false)
	img:Resize(200, 400)
	img:MoveTo(x+450, y+0)

	book_frame:SetImagePath(page_data.img, 1)

	local rec_button_id = "pj_rec_button_"..(is_left_page and "left" or "right")

	local rec_button = digForComponent(book_of_grudges, rec_button_id)
	if not rec_button then
		rec_button = UIComponent(pages:CreateComponent(rec_button_id, "ui/templates/square_large_text_button"))
		rec_button:MoveTo(x+680, y+675)
		rec_button:Resize(350, 50)
		rec_button:SetVisible(true)

		if page_data.cost then
			rec_button:SetTooltipText("Costs "..tostring(page_data.cost).."[[img:icon_money]][[/img]]", true)
			local local_treasury = cm:get_faction(cm:get_local_faction(true)):treasury()
			if local_treasury < page_data.cost and rec_button:CurrentState() == "active" then
				rec_button:SetState("inactive")
			elseif rec_button:CurrentState() == "inactive" then
				rec_button:SetState("active")
			end
		end
	end
	if page_data.limit then
		local save_value = cm:get_saved_value(page_data.save_id) or 0
		local num_available_for_recruitment = page_data.limit - save_value

		local button_txt = UIComponent(rec_button:Find("button_txt"))
		button_txt:SetStateText("Recruit ".."("..tostring(num_available_for_recruitment).." available)")
	else
		local button_txt = UIComponent(rec_button:Find("button_txt"))
		button_txt:SetStateText("Recruit")
	end

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

	rec_button:SetVisible(true)
	if page_data.hide_recruitment and page_data.hide_recruitment() then
		rec_button:SetVisible(false)
	end
end

core:remove_listener("pj_quests_on_book_of_grudges_clicked_book_arrows")
core:add_listener(
	"pj_quests_on_book_of_grudges_clicked_book_arrows",
	"ComponentLClickUp",
	function(context)
		return context.string == "button_R" or context.string == "button_L"
	end,
	function(context)
		local book_of_grudges = digForComponent(core:get_ui_root(), "book_of_grudges")
		if not book_of_grudges then return end

		---@type CA_UIC
		local dy_page = digForComponent(book_of_grudges, "dy_page")

		if not dy_page then return end
		local text = dy_page:GetStateText()
		local current_page = tonumber(string.sub(text, 1, string.find(text, "/")-1))
		local num_valid_pages = mod.get_num_valid_bog_pages()

		local next_page = current_page
		if context.string == "button_R" then
			next_page = current_page + 1
		else
			next_page = current_page - 1
		end
		dy_page:SetStateText(next_page.."/"..num_valid_pages)
	end,
	true
)

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

	mod.current_bog_comps = {}

	if mod.get_bog_page(page_num) then
		mod.draw_bog_page(page_num)
	end
end

mod.on_book_of_grudges_panel_opening = function()
	mod.remove_invalid_recruitment_entries()
	local book_of_grudges = digForComponent(core:get_ui_root(), "book_of_grudges")
	if not book_of_grudges then return end
	---@type CA_UIC
	local dy_page = digForComponent(book_of_grudges, "dy_page")
	---@type CA_UIC
	local button_L = digForComponent(book_of_grudges, "button_L")
	---@type CA_UIC
	local button_R = digForComponent(book_of_grudges, "button_R")
	if not dy_page then return end
	local text = dy_page:GetStateText()
	local current_page = tonumber(string.sub(text, 1, string.find(text, "/")-1))
	local num_valid_pages = mod.get_num_valid_bog_pages()
	dy_page:SetStateText(current_page.."/"..num_valid_pages)
	if current_page ~= 1 then
		button_L:SetState("active")
	else
		button_L:SetState("inactive")
	end
	if current_page ~= num_valid_pages then
		button_R:SetState("active")
	else
		button_R:SetState("inactive")
	end
	if not mod.current_bog_page or mod.current_bog_page ~= current_page then
		mod.current_bog_page = current_page
		mod.redraw_bog(current_page)
	end
end

local function init()
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

-- to enable recuruitment of RANGERS_3:
-- cm:set_saved_value("pj_quests_RANGER_3_RECRUITMENT", true)
