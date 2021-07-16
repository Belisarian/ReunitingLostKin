PJ_QUESTS = PJ_QUESTS or {}
local mod = PJ_QUESTS

------------------------------------
--- after_move_mission_sjoktraken---
------------------------------------
core:remove_listener("after_move_mission_sjoktraken_play_intro_event")
core:add_listener(
	"after_move_mission_sjoktraken_play_intro_event",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_sjok
	end,
	function()
		cm:callback(function()
			cm:repeat_callback(
				function()
					if not effect.is_any_movie_playing() then
						cm:callback(function()
							core:trigger_event("pj_quests_play_movie", "sjok_1")
						end, 0.1)
						cm:remove_callback("pj_quests_check_intro_movie_playing_cb")
					end
				end,
				0.1,
				"pj_quests_check_intro_movie_playing_cb"
			)

			cm:play_movie_in_ui("warhammer2/hef/hef_horned_rat")
		end, 1)
	end,
	true
)

core:remove_listener("after_move_mission_sjoktraken_play_sjok_movie_1")
core:add_listener(
	"after_move_mission_sjoktraken_play_sjok_movie_1",
	"pj_quests_play_movie",
	function(context)
		return context.string == "sjok_1"
	end,
	function()
		cm:callback(function()
			cm:repeat_callback(
				function()
					if not effect.is_any_movie_playing() then
						cm:callback(function()
							core:trigger_event("pj_quests_on_after_event", "after_move_mission_sjoktraken")
						end, 0.1)
						cm:remove_callback("pj_quests_check_intro_movie_playing_cb")
					end
				end,
				0.1,
				"pj_quests_check_intro_movie_playing_cb"
			)

			cm:play_movie_in_ui("warhammer2/hef/hef_intro")
		end, 1)
	end,
	true
)

core:remove_listener("after_move_mission_sjoktraken")
core:add_listener(
	"after_move_mission_sjoktraken",
	"pj_quests_on_after_event",
	function(context)
		return context.string == "after_move_mission_sjoktraken"
	end,
	function()
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "after_move_mission_sjoktraken")

			local new_dilemma_text =
			[["Sjoktraken has that special feeling to it, that, you have to admit!" Nilss shouts at you while you pass by a brawl outside a tavern. You nod and turn down the road, towards the mining company headquarters.

			"A safe trip, I assume?" inquires the guild master, and places a small leather coin bag on the table.

			"The Norsemen do not travel much in this foul weather we've been having as of late."
			Nilss takes the coin bag and gives it a shake to get a feel for the weight. Satisfied, and in a freshly improved mood, he continues: "We could certainly use more of that."

			"Then you are in luck. Head down dock-side and find the port master, he's looking for axes for hire - one of the ironclads, it's gone missing!"]]
			mod.set_dilemma_text(new_dilemma_text)
		end, 1)
	end,
	true
)

core:add_listener(
    "after_move_mission_sjoktraken_2",
    "DilemmaChoiceMadeEvent",
		function(context)
			return context:dilemma() == "after_move_mission_sjoktraken"
		end,
		function(context)
			local choice = context:choice()
			cm:callback(function()
				cm:repeat_callback(
					function()
						if not effect.is_any_movie_playing() then
							cm:callback(function()
								if choice == 0 or choice == 1 then
									cm:trigger_dilemma(cm:get_local_faction_name(), "after_move_mission_sjoktraken_2")

									local new_dilemma_text =
									[[From afar you spot the port master. He's perched on top of a couple of stacked crates, bellowing to a small crowd of ragged sailors, all the while gesticulating wildly with his hands.

									As you approach the crowd, he notices you and jumps off his makeshift podium. He comes running, and finally extends his hand in greeting:
									"Finally, some dwarfs that do not require much convincing, but only a handful of coin!"
									"Better make it a giant's hand," Nilss says, grinning at his own jest.

									The conversation continues and an agreement is reached:
									"The merchant guild's main ship has gone missing - the Last Ironclad. It was spotted yesterday outside the harbor, but the heavy winds forced it waiting outside the port. Make sure the ironclad is safe!"]]
									mod.set_dilemma_text(new_dilemma_text)
								end
							end, 0.1)
							cm:remove_callback("pj_quests_check_intro_movie_playing_cb")
						end
					end,
					0.1,
					"pj_quests_check_intro_movie_playing_cb"
				)

				cm:play_movie_in_ui("warhammer2/skv/skv_ritual_1")
			end, 0.5)
    end,
    true
)
----------------------------------------------------
--- after_shipwreck (battle)------------------------
----------------------------------------------------
core:remove_listener("after_mission_shipwreck")
core:add_listener(
	"after_mission_shipwreck",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.after_shipwreck
	end,
	function(context)
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "after_mission_shipwreck");
		end, 1)
	end,
	true
)
----------------------------------------------------
--- after_move_mission_sjoktraken_after_shipwreck---
----------------------------------------------------
core:remove_listener("after_move_mission_sjoktraken_after_shipwreck")
core:add_listener(
	"after_move_mission_sjoktraken_after_shipwreck",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_sjok_after_shipwreck
	end,
	function()
		cm:callback(function()
			mod.complete_contract(
				6000,
 -- Payment entry
				function()
					cm:trigger_dilemma(cm:get_local_faction_name(), "after_move_mission_sjoktraken_after_shipwreck")
					local new_dilemma_text =
						"With the Ironclad back in port and most of the company at the local tavern, you are at the port master's office. Nilss had already collected the agreed upon payment and your additional visit was requested by the port master.\n\nInside the office the port master is flanked by a royal messenger, and he informs you that you are requested at the royal court, without providing a reason."
						.."\n\nWhen back at the company's quarters you tell Nilss about the royal request. But Nilss' mind can think only of company business, and he tells you he's been approached by some merchants who wish to hire the company for escort duty to a southern Kislev outpost: The Last Hope Inn."
						.."\n\nShould we march directly towards Kraka Drak, opt for the escort mission or look for other contracts?"
					mod.set_dilemma_text(new_dilemma_text)
				end
			)
		end, 0.7)
	end,
	true
)
----------------------------------------------------
---after_last_inn (batlle)--------------------------
----------------------------------------------------
core:remove_listener("after_mission_last_inn")
core:add_listener(
	"after_mission_last_inn",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.after_last_inn
	end,
	function(context)
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "after_mission_last_inn");
		end, 1)
	end,
	true
)
----------------------------------------------------
--- after_move_mission_sjoktraken_after_last_inn---
-----------------------------------------------------
core:remove_listener("after_move_mission_sjoktraken_after_last_inn")
core:add_listener(
	"after_move_mission_sjoktraken_after_last_inn",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_sjok_after_last_inn
	end,
	function(context)
		cm:callback(function()
			mod.complete_contract(
				3500,
 -- Payment entry
				function()
					cm:trigger_dilemma(cm:get_local_faction_name(), "after_move_mission_sjoktraken_after_last_inn");
				end
			)
		end, 0.7)
	end,
	true
)
---------------------------------------------------
--- In Kraka Drak ---------------------------------
---------------------------------------------------
core:remove_listener("in_kraka_drak")
core:add_listener(
	"in_kraka_drak",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_kraka_drak
	end,
	function(context)
		cm:callback(function()
			cm:repeat_callback(
				function()
					if not effect.is_any_movie_playing() then
						cm:callback(function()
							cm:trigger_dilemma(cm:get_local_faction_name(), "after_move_mission_kraka_drak")

							local new_dilemma_text =
							[[The inhospitable winds of the northern lands flutter a small royal banner as the mercenaries pass the last turn leading up to the main gate.

							Inside the Royal Keep of Kraka Drak the cold wind is felt no more, a rare sensation for those inhabiting the frozen north.

							The guards at the gate inspect the royal decree which has brought you here. The guards are on edge, apparently a beastmen incursions has been spotted in the wilderness north of the hold.

							You are left to wait, and finally the royal commander of Kraka Drak appears. He is brief, dispensing of unnecessary courtesy, and explains the situation:
							The capital is threatened by a rift between the mortal plane and that of the chaos realm. A large host of beastmen has been drawn there, and the rift must be destroyed. Retinues from nearby holds and sellswords have been summoned, all bound by oaths to the High King and to the safety of the northern mountains.

							The assault will be split into two parts: the main army will engage the host of the raging beastmen, and a considerably smaller host will sneak past the enemy lines to assault the rift itself.]]
							mod.set_dilemma_text(new_dilemma_text)
						end, 0.1)
						cm:remove_callback("pj_quests_check_intro_movie_playing_cb")
					end
				end,
				0.1,
				"pj_quests_check_intro_movie_playing_cb"
			)

			cm:play_movie_in_ui("warhammer2/lzd/lzd_intro")
		end, 1)
	end,
	true
)
core:add_listener(
    "after_move_mission_kraka_drak_2",
    "DilemmaChoiceMadeEvent",
    true,
    function(context)
            if context:dilemma() == "after_move_mission_kraka_drak"
            then
                    if context:choice() == 0 or context:choice() == 1 then
											cm:trigger_dilemma(cm:get_local_faction_name(), "after_move_mission_kraka_drak_2")

											local new_dilemma_text =
											[[In the lower levels of the city, the Frozen Feathered Ravens finds a suitable establishment for their stay in the capital.

											During dinner Nilss the bookkeeper complains about the modest payment dictated for enrollment in the Crown's affairs. While taking a rare pause from eating and ranting Nilss surveys the room and points to the brewhouse entrance. A dwarf is entering, his formal clothing at odds with this type of place.

											He approaches your table and introduces himself as Torken Ironvein, thane of Clan Stekbrud, and ends his monologue with a swift hand gesture to the barkeep: "A round of ale for the table!"

											"Now here's one from court who isn't afraid of spending a few coins!" Nilss proclaims and pulls a chair out. "Please, how can we be of service?" Nilss grins, and is back in his usual high spirits. You leave Nills to the thane and what business they might have. The Beastmen incursion is on your mind - you leave the establishment...]]
											mod.set_dilemma_text(new_dilemma_text)
                    end;
            end;
    end,
    true
)
----------------------------------------------------
---after_beastmen_camp (battle)---------------------
----------------------------------------------------
core:remove_listener("after_mission_beastmen_camp")
core:add_listener(
	"after_mission_beastmen_camp",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.after_beastmen_camp
	end,
	function(context)
		cm:callback(function()
			cm:repeat_callback(
				function()
					if not effect.is_any_movie_playing() then
						cm:callback(function()
							cm:trigger_dilemma(cm:get_local_faction_name(), "after_mission_beastmen_camp")
						end, 0.1)
						cm:remove_callback("pj_quests_check_beastmen_movie_playing_cb")
					end
				end,
				0.1,
				"pj_quests_check_beastmen_movie_playing_cb"
			)

			cm:play_movie_in_ui("warhammer2/lzd/lzd_horned_rat")
		end, 1)
	end,
	true
)
----------------------------------------------------------------
--- Kraka Drak after beastmen ---------------------------------
---------------------------------------------------------------
core:remove_listener("after_in_drak_after_beastmen")
core:add_listener(
	"after_in_drak_after_beastmen",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_drak_after_beastmen
	end,
	function(context)
		cm:callback(function()
			mod.complete_contract(
				7000,
 -- -- Payment entry
				function()
					cm:trigger_dilemma(cm:get_local_faction_name(), "after_in_drak_after_beastmen")

					local new_dilemma_text =
					[[With the savage Beastmen slain the Frozen Feathered Ravens return to Kraka Drak. As part of the smaller retinue designated for the rift battle, they are among the last to arrive back to the hold.

					They reach the capital in high spirits, but finds the hold in grief and silence. The High King lies wounded in his ancestral halls.

					The royal commander of Kraka Drak informs you of the hard earned battle away from the rift, which shifted towards the Norse Dwarf's favor as the rift collapsed.
					As a personal gesture the royal commander swears an oath to you for your deeds at the battle of the rift.

					Back at the quarters, Nills informs you that Torken Ironvein has been debating numerous grandiose plots with him. While further negotiations proceed, we should find other work...]]
					mod.set_dilemma_text(new_dilemma_text)
				end
			)
		end, 0.7)
	end,
	true
)
----------------------------------------------------------------
--- after skaven ambush (battle) ---------------------------------
---------------------------------------------------------------
core:remove_listener("after_mountain_pass_ambush")
core:add_listener(
	"after_mountain_pass_ambush",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.after_mountain_pass_ambush
	end,
	function(context)
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "after_mountain_pass_ambush");
		end, 1)
	end,
	true
)
----------------------------------------------------------------
--- in_kraka_ravn ---------------------------------
---------------------------------------------------------------
core:remove_listener("in_kraka_ravn")
core:add_listener(
	"in_kraka_ravn",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_kraka_ravn
	end,
	function(context)
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "in_kraka_ravn")

			local new_dilemma_text =
			[[Kraka Ravnsvake is the southernmost Norse Dwarfhold, and the last safe bastion before the frozen Land of Kislev.

			Decades of hardship and threats to the hold and its surrounding lands have left the ruling clans secluded and unwilling to oppose the inevitable. Left to fend for themselves, those appointed to serve here are fighting a losing battle. Few in numbers, the royal guard have all but abandoned the outermost possessions and continue to patrol only a few routes northwards.

			Jorin Asserbo, high armourer of the keep has inquired of our services.

			We should stock up on extra supplies before leaving the realm, lets look for work while supply is gathered. ]]
			mod.set_dilemma_text(new_dilemma_text)
		end, 1)
	end,
	true
)
----------------------------------------------------------------
--- after_ice_trolls ---------------------------------
---------------------------------------------------------------
core:remove_listener("after_ice_trolls")
core:add_listener(
	"after_ice_trolls",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.after_ice_trolls
	end,
	function(context)
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "after_ice_trolls");
		end, 1)
	end,
	true
)
----------------------------------------------------------------
--- after_fimir_bog ---------------------------------
---------------------------------------------------------------
core:remove_listener("after_fimir_bog")
core:add_listener(
	"after_fimir_bog",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.after_fimir_bog
	end,
	function(context)
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "after_fimir_bog");
		end, 1)
	end,
	true
)
----------------------------------------------------------------
--- in_kraka_ravn_after_ice_trolls ---------------------------------
---------------------------------------------------------------
core:remove_listener("in_kraka_ravn_after_ice_trolls")
core:add_listener(
	"in_kraka_ravn_after_ice_trolls",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_kraka_ravn_after_ice_trolls
	end,
	function(context)
		cm:callback(function()
			mod.complete_contract(
				3000,
 -- Payment entry
				function()
					cm:trigger_dilemma(cm:get_local_faction_name(), "in_kraka_ravn_after_ice_trolls");
				end
			)
		end, 0.7)
	end,
	true
)
----------------------------------------------------------------
--- in_kraka_ravn_after_fimir_bog ---------------------------------
---------------------------------------------------------------
core:remove_listener("in_kraka_ravn_after_fimir_bog")
core:add_listener(
	"in_kraka_ravn_after_fimir_bog",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_kraka_ravn_after_fimir_bog
	end,
	function(context)
		cm:callback(function()
			mod.complete_contract(
				4000,
 -- Payment entry
				function()
					cm:trigger_dilemma(cm:get_local_faction_name(), "in_kraka_ravn_after_fimir_bog");
				end
			)
		end, 0.7)
	end,
	true
)
----------------------------------------------------------------
--- END  ---------------------------------
---------------------------------------------------------------
core:remove_listener("Game_End")
core:add_listener(
	"Game_End",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.game_end
	end,
	function(context)
		cm:callback(function()
			cm:trigger_dilemma(cm:get_local_faction_name(), "game_end");
		end, 1)
	end,
	true
)

core:remove_listener("in_sjok_after_clamp_farm")
core:add_listener(
	"in_sjok_after_clamp_farm",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_sjok_after_clamp_farm
	end,
	function(context)
		cm:callback(function()
			mod.complete_contract(
				3000,
 -- Payment entry
				function()
				end
			)
		end, 0.7)
	end,
	true
)

core:remove_listener("in_drak_after_norscan_camp")
core:add_listener(
	"in_drak_after_norscan_camp",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_drak_after_norscan_camp
	end,
	function(context)
		cm:callback(function()
			mod.complete_contract(
				4000,
 -- Payment entry
				function()
				end
			)
		end, 0.7)
	end,
	true
)

core:remove_listener("in_drak_after_lost_hold")
core:add_listener(
	"in_drak_after_lost_hold",
	"pj_quests_on_state_changed",
	function(context)
		local state = context.string
		return state == mod.states.in_drak_after_lost_hold
	end,
	function(context)
		cm:callback(function()
			mod.complete_contract(
				7000,
 -- Payment entry
				function()
					cm:callback(function()
						cm:play_movie_in_ui("warhammer2/skv/skv_intro")
					end, 1)
				end
			)
		end, 0.7)
	end,
	true
)
