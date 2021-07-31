PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

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

local function resize_dilemma()
	local event_dilemma_active = find_ui_component_str("root > events > event_dilemma_active")
	if not event_dilemma_active then return end

	local event_x, event_y = event_dilemma_active:Position()

	local dets = find_ui_component_str("root > events > event_dilemma_active > dilemma > main_holder > details_holder > dy_details_text")
	local dy_description = find_ui_component_str("root > events > event_dilemma_active > dilemma > main_holder > details_holder > dy_details_text > dy_description")

	if not dets then return end
	if not dy_description then return end

	dy_description:SetCanResizeWidth(true)
	dy_description:SetCanResizeHeight(true)
	dy_description:Resize(480, 233)

	dets:SetCanResizeWidth(true)
	dets:SetCanResizeHeight(true)
	dets:Resize(500, 180)
	dets:MoveTo(event_x-50, event_y+280)

	local event_dilemma_active = find_ui_component_str("root > events > event_dilemma_active > dilemma > main_holder > details_holder")
	event_dilemma_active:SetCanResizeWidth(true)
	event_dilemma_active:SetCanResizeHeight(true)
	event_dilemma_active:Resize(590, 313)

	event_dilemma_active:SetVisible(true)

	local dilemma = find_ui_component_str("root > events > event_dilemma_active > dilemma")
	local dx,dy = dilemma:Position()

	local dilemma_list = find_ui_component_str("root > events > event_dilemma_active > dilemma > dilemma_list")

	local x,y = dilemma_list:Position()
	dilemma_list:MoveTo(dx+25, y)

	local main_holder = find_ui_component_str("root > events > event_dilemma_active > dilemma > main_holder")
	local mh_x, mh_y = main_holder:Position()
	main_holder:MoveTo(mh_x+25, mh_y)
	dets:MoveTo(event_x-50-30, event_y+280)

	if mod.rewrite_dilemma_text then
		local text_component = find_ui_component_str("root > events > event_dilemma_active > dilemma > main_holder > details_holder > dy_details_text > dy_description")
		text_component:SetStateText(mod.rewrite_dilemma_text)
		mod.rewrite_dilemma_text = nil
	end
end

core:remove_listener("pj_quests_on_dilemma_panel_opened")
core:add_listener(
	"pj_quests_on_dilemma_panel_opened",
	"PanelOpenedCampaign",
	function(context)
		return context.string == "events"
	end,
	function()
			resize_dilemma()
	end,
	true
)

mod.set_dilemma_text = function(new_text)
	mod.rewrite_dilemma_text = new_text
end
