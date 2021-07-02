PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

local digForComponent = mod.digForComponent

--- Units that can be recruited via the BoG.
mod.bog_pages = {
	{
		title = "The Frozen Feathered Ravens",
		desc = "The regiment,The Frozen Feathered Ravens, shares its name with the mercenary company. It was these warriors whom commander Grunnar Vestgrud handpicked and founded the company on. Veterans of numerous campaigns and loyal to the Commander, these warriors rivals some of the personal retinues seen among the High Lords throughout the realm. Initially The Frozen Feathered Ravens were lead by Grunnar Vestgrud himself, though with the companies expansion, the lieutenant Asgor Fjordson took over. The regiment brings with them the horn of ice and valor into battle, a rune encrusted horn carried by the honorguard of the regiment",
		img = "ui/bog/The Frozen Feathered Ravens grudge_pages layout.png",
		payload = function() mod.add_unit_to_army("zorn_bulwark") end,
		save_id = "pj_quests_irondrake_recruitment",
		limit = 1,
		first = "Asgor Fjordson",
		second = "Full Plate and Hammers",
		third = "1200",
		hide_recruitment = function() return true end,
		is_recruited = function() return true end,
	},
	{
		title = "The Iron Beaked Rooks ",
		desc = "Ulron Northgaard and his fellow guardsmen were discharged by their former employer - a unfortunate Merchant Lord. The warriors joined the mercenary band and became the Iron Beaked Rooks. Honoring they former occupation as guardsmen of especially petty merchant envoys , the warriors kept their shields and focus on defensive tactics. With numerous battles later, these former guardsmen have evolved into a senior regiment and would form the core of any army.",
		img = "ui/bog/The_Iron_Beaked_Rooks_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_dwarf_warrior_0") end,
		cost = 500,
		first = "Ulron Northgaard",
		second = "Full Plate, Axe and Shield",
		third = "1000",
		hide_recruitment = function() return true end,
		is_recruited = function() return true end,
	},
	{
		title = "The White Feathered Crows",
		desc = "The White Feathered Crows is the companies vanguard - a regiment specialized in scouting, hunting and trapping. In battle the White Feathered Crows provides utility and ranged firepower, while weak in close quarters. Equipped with crossbows and a nets, the foes can be pinned down and taken out from afar. The captain, Balder Brynskov, is a cunning character, whom seldom declines a hunt for larger preys.",
		img = "ui/bog/The_White_Feathered_Crows_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_miners_0") end,
		cost = 500,
		first = "Balder Brynskov",
		second = "Light Armor and Crossbows",
		third = "700",
		hide_recruitment = function() return true end,
		is_recruited = function() return true end,
	},
	{
		title = "The Ice Peak Magpies",
		desc = "The Ice Peak Magpies is the main firepower of the company - a typical regiment of Quarrellers. The Magpies are capable of both ranged and melee support, where especially different ranged tactics can be applied to eradicate hostilities. Their captain, Jurg Tollgaard possesses a technical curiosity, which has driven most of the ranged drills the regiment is capable of.",
		img = "ui/bog/The_Ice_Peak_Magpies_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_main_dwf_inf_quarrellers_0") end,
		cost = 500,
		first = "Jurg Tollgaard",
		second = "Light Armor and Crossbows",
		third = "700",
		hide_recruitment = function() return true end,
		is_recruited = function() return true end,
	},
	{
		title = "The Ice Jackdaws ",
		desc = "The Ice Jackdaws is the companies least experienced infantry regiment. It composes of able warriors equipped with axe and shield, whom form a bulky defensive. It is lead by the young lieutenant, Asger Blackpeak. What the Ice Jackdaws lack in experience and skill compared to the seniored regiments is leveraged by the regiments size.",
		img = "ui/bog/The_Ice_Jackdaws_grudge_pages_layout.png",
		payload = function() mod.add_unit_to_army("wh_dlc06_dwf_inf_rangers_0") end,
		cost = 500,
		first = "Asger Blackpeak",
		second = "Axe and Shield",
		third = "600",
		hide_recruitment = function() return true end,
		is_recruited = function() return true end,
	},
	{
		title = "The Draksfjord Brotherhood",
		desc = "The Draksfjord Brotherhood is a exclusive group of huntsmen. The Draksfjord and the surrounding forest is inhabited by numerous types of drakes. Few dwarfs encounter these beasts in battle and live to tell the tale, though those who emerge victorious are invited to join the Brotherhoods ranks. The Draksfjord Brotherhood are few in numbers and hunt lesser beast as per contract on a routinely basis. Occasionally, The Drakfjords Brotherhood have been associated with mercenary bands. The huntsmen are lead by Tokle Abendvis.",
		img = "ui/bog/The Draksfjord Brotherhood grudge_pages layout.png",
		payload = function()
			mod.add_unit_to_army("zorn_bulwark")
			cm:set_saved_value("pj_quests_have_recruited_DWARF_RANGERS", true)
		end,
		cost = 500,
		first = "Tokle Abendvis",
		second = "Full Plate and Dual Axes",
		third = "1300",
		hide_recruitment = function()
			return cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS")
		end,
		predicate = function()
			local valid_states = {
				[mod.states.in_sjok_after_last_inn] = true,
				[mod.states.in_sjok_after_clamp_farm] = true,
				[mod.states.in_sjok_after_shipwreck] = true,
			}

			return valid_states[mod.current_state] or cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS")
		end,
		is_recruited = function() return cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS") end,
		cannot_recruit = function() return cm:get_saved_value("pj_quests_has_left_sjoktraken_area") end,
	},
	{
		title = "The Steel Avalanche",
		desc = "The Steel Avalanche is native to the capital of Kraka Drak. The regiment is famous for leading multiple successful campaigns within the Norse underground - purging any abominations they encounter. The regiment wears obsidian armor, explosives and a axe and sheild. The Steel Avalanche is lead by Azguz Bearclaw Vendegod. They now seek enrollment in a larger mercenary company.",
		img = "ui/bog/The Steel Avalanche grudge_pages layout.png",
		payload = function()
			mod.add_unit_to_army("zorn_legion_1")
			cm:set_saved_value("pj_quests_have_recruited_DWARF_RANGERS_2", true)
		end,
		cost = 500,
		first = "Azguz Bearclaw Vendegod",
		second = "Full Plate, Axe and Shield",
		third = "1100",
		hide_recruitment = function()
			return cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS_2")
		end,
		predicate = function()
			local valid_states = {
				[mod.states.in_drak_after_lost_hold] = true,
				[mod.states.in_drak_after_norscan_camp] = true,
				[mod.states.in_drak_after_beastmen] = true,
			}

			return valid_states[mod.current_state] or cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS_2")
		end,
		is_recruited = function() return cm:get_saved_value("pj_quests_have_recruited_DWARF_RANGERS_2") end,
		cannot_recruit = function() return cm:get_saved_value("pj_quests_has_left_kraka_drak_area") end,
	},
	{
		title = "The Sunken Mountain",
		desc = "The Sunken Mountain is a young regiment consisting of former deckhands and surplus petty officers of the sea routes between Sjoktraken, Kraka Dorden and Kazad Dumund. Equipped with throwing axes and lightweight two-handed axes, the dwarf are ideal for close quarter skirmishes against lesser foes and naval encounters. A few lucky employment the past years have seen the equipment of the regiment rise to new standards. Tired of minor jobs, this regiment seek enrollment into a actual mercenary band",
		img = "ui/bog/The Sunken Mountain grudge_pages layout.png",
		cost = 500,
		first = "Elon Thankson",
		second = "Medium Armor and Axe",
		third = "850",
		payload = function()
			mod.add_unit_to_army("zorn_sentry")
			cm:set_saved_value("pj_quests_have_recruited_zorn_sentry", true)
		end,
		hide_recruitment = function()
			return cm:get_saved_value("pj_quests_have_recruited_zorn_sentry")
		end,
		predicate = function()
			local valid_states = {
				[mod.states.in_sjok_after_last_inn] = true,
				[mod.states.in_sjok_after_clamp_farm] = true,
				[mod.states.in_sjok_after_shipwreck] = true,
			}

			return valid_states[mod.current_state] or cm:get_saved_value("pj_quests_have_recruited_zorn_sentry")
		end,
		is_recruited = function() return cm:get_saved_value("pj_quests_have_recruited_zorn_sentry") end,
		cannot_recruit = function() return cm:get_saved_value("pj_quests_has_left_sjoktraken_area") end,
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
	local char = cm:get_faction(cm:get_local_faction_name(true)):faction_leader()
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

		-- obj:ResizeTextResizingComponentToInitialSize(624*1.2, 96*1.2)
		obj:Resize(624*1.2, 96*1.5)
		obj:MoveTo(x+480, y+555)

		header:SetCanResizeWidth(true)
		header:SetCanResizeHeight(true)
		header:ResizeTextResizingComponentToInitialSize(338-50, 37)
	end

	if not obj or not header then
		dout("ERROR: OBJ OR HEADER MISSING!")
		return
	end

	obj:SetStateText(desc)
	obj:SetVisible(true)
	header:SetVisible(true)
	table.insert(mod.current_bog_comps, obj)
	table.insert(mod.current_bog_comps, header)

	header:MoveTo(x+870, y+300)
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
	obj1:SetStateText("Commander:")
	obj1:SetDockingPoint(1)
	obj1:SetDockOffset(starting_x, starting_y)

	obj = digForComponent(book_of_grudges, "objective_copy_2")
	obj:SetVisible(true)
	obj:SetStateText(page_data.first)
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x+200, starting_y)

	obj = digForComponent(book_of_grudges, "objective_copy_3")
	obj:SetVisible(true)
	obj:SetStateText("Equipment:")
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x, starting_y+35)

	obj = digForComponent(book_of_grudges, "objective_copy_4")
	obj:SetVisible(true)
	obj:SetStateText(page_data.second)
	obj:SetDockingPoint(1)
	obj:SetDockOffset(starting_x+200, starting_y+35)

	obj = digForComponent(book_of_grudges, "objective_copy_5")
	obj:SetVisible(true)
	obj:SetStateText("Upkeep at full:")
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

	local img_id = "rec_img_recruited_"..(is_left_page and "left" or "right")
	local img_recruited = digForComponent(book_of_grudges, img_id)
	if not img_recruited then
		img_recruited = UIComponent(pages:CreateComponent(img_id, "ui/templates/custom_image"))
	end
	img_recruited:SetImagePath("UI/rlk_recruited.png", 4)
	img_recruited:SetVisible(false)
	img_recruited:Resize(435, 105)
	img_recruited:MoveTo(x+710, y+660)
	if page_data.is_recruited and page_data.is_recruited() then
		img_recruited:SetVisible(true)
	end

	local img_id = "rec_img_unrecruitable_"..(is_left_page and "left" or "right")
	local img_unrecruitable = digForComponent(book_of_grudges, img_id)
	if not img_unrecruitable then
		img_unrecruitable = UIComponent(pages:CreateComponent(img_id, "ui/templates/custom_image"))
	end
	img_unrecruitable:SetImagePath("UI/rlk_unrecruitable.png", 4)
	img_unrecruitable:SetVisible(false)
	img_unrecruitable:Resize(505, 97)
	img_unrecruitable:MoveTo(x+680, y+660)
	if page_data.is_recruited and not page_data.is_recruited() and page_data.cannot_recruit and page_data.cannot_recruit() then
		img_unrecruitable:SetVisible(true)
	end

	book_frame:SetImagePath(page_data.img, 1)

	local rec_button_id = "pj_rec_button_"..(is_left_page and "left" or "right")

	local rec_button = digForComponent(book_of_grudges, rec_button_id)
	if not rec_button then
		rec_button = UIComponent(pages:CreateComponent(rec_button_id, "ui/templates/square_large_text_button"))
		rec_button:MoveTo(x+680, y+690)
		rec_button:Resize(350, 50)
		rec_button:SetVisible(true)
	end

	if page_data.cost then
		rec_button:SetTooltipText("Costs "..tostring(page_data.cost).."[[img:icon_money]][[/img]].", true)
		local local_treasury = cm:get_faction(cm:get_local_faction_name(true)):treasury()
		if local_treasury < page_data.cost then
			if rec_button:CurrentState() ~= "inactive" then
				rec_button:SetState("inactive")
			end
		elseif rec_button:CurrentState() == "inactive" then
			rec_button:SetState("active")
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
				cm:treasury_mod(cm:get_local_faction_name(true), -page_data.cost)
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
