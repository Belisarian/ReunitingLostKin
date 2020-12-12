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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_move_mission_sjoktraken")

			local new_dilemma_text =
			[["Sjoktraken has that special feeling to it, that, you have to admit!" Nilss shouts at you while you pass by a brawl outside a tavern. You nod and turn down the road, towards the mining company headquarters.

			"A safe trip, I assume?" inquires the guild master, and places a small leather coin bag on the table.

			"The Norsemen do not travel much in this foul weather we've been having lately."
			Nilss takes the coin bag and gives it shake to feel the weight. Satisfied, and now in an even better mood, he continues: "We could certainly use more of that."

			"Then you are in luck, head down dock-side and find the port master. He's looking for axes for hire - one of the ironclads, it's gone missing!"]]
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
									cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_move_mission_sjoktraken_2")

									local new_dilemma_text =
									[[From afar you see the port master perched on top of a couple of stacked crates, bellowing to a small crowd of ragged sailors, all the while gesticulating wildly with his hands.

									As you approach the crowd, he notices you and jumps off his podium. He comes running, and finally extends his hand in greeting:
									"Finally, some dwarfs that do not require much convincing, but only a handful of coin!"
									"Better make it a giant's hand," Nilss grins at his own jest.

									The conversation continues and an agreement is reached:
									"The merchant guild's main ship has gone missing - the Last Ironclad. It was spotted yesterday outside the harbor, but the heavy winds forced it waiting outside the port."]]
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_mission_shipwreck");
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
					cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_move_mission_sjoktraken_after_shipwreck")
					local new_dilemma_text =
						"With the Ironclad back in port and most of the company at the local tavern, you are at the port master office. Nilss has already been collecting the payment agreed upon and your additional visit is a request by the port master.\n\nInside the office, the port master is flanked by a royal messenger, whom informs you that you are requested at the royal high-court, without giving any reason."
						.."\n\nBack at the companies quarters, you tell Nilss about the royal request. Nilss further informs you that he has been approached by some merchants who wish to hire the company for escort duty to a southern Kislev outpost - The last hope Inn."
						.."\n\nShould we march directly towards Kraka Drak or fill our coffers with escort money?"
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_mission_last_inn");
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
					cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_move_mission_sjoktraken_after_last_inn");
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
							cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_move_mission_kraka_drak")

							local new_dilemma_text =
							[[The inhospitable winds of the northern lands seize a smaller royal banner as the mercenaries pass the last turn leading up to the main gate.

							Inside the Royal keep of Kraka Drak, the cold wind is no more and one can for the moment forget the surrounding lands unwillingness to support life.

							The guards at the gate inspect the royal decree which has brought you here and inform you about the current beastmen incursions north of the hold.

							A few minutes pass and the royal commander of Kraka Drak appears. The commander is brief, without unnecessary courtesy, and explains the situation:
							The capital is threatened by a rift between the mortal plane and that of the chaos realm. A large host of beastmen has gathered at the rift, which must be destroyed. Retinues from nearby holds and sellswords have been summoned, all bound by oath to the high king and the safety of the northern mountains.

							The assault will be split into two parts: a major army bound to attack the current location of the raging beastmen, and a considerable smaller host of dwarfs which will attempt to sneak pass the enemies lines and assault the rift itself.]]
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
											cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_move_mission_kraka_drak_2")

											local new_dilemma_text =
											[[In the lower levels of the city, the Frozen Feathers finds a suitable establishment for their stay in the capital.

											During dinner your bookkeeper Nilss complains about the payment dictated for enrollment in the crown's affairs. While at a rare pause from eating and ranting, Nilss surveys the room and points at the entrance of the brewhouse. A dwarf enters, his formal clothing at odds with the type of place he had just entered.

											He approaches your table and introduces himself as thane of the Ironvaults, Torken Ironvein, and ends his monologue with a swift hand gesture to the barkeep: "A round of ale for the table!"

											"Now heres one from court who isn't afraid of spending a few coin!" Nilss proclaims and pulls a chair out. "Please, how can we be of service?" Nilss grins, and is back in his usual high spirit.]]
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_mission_beastmen_camp");
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
					cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_in_drak_after_beastmen")

					local new_dilemma_text =
					[[With the savage Beastmen slain, the Frozen Feathers returns to Kraka Drak. As part of the smaller retinue designated for the rift battle, they are among the last to reach Kraka Drak.

					They reach the capital in high spirits, but the find the hold in grief and silence. The High King lies wounded in his ancestral halls.

					The royal commander of Kraka Drak informs of the hard earned battle away from the rift, which shifted towards the norse dwarf's favor as the rift collapsed.
					Furthermore, he ensures that the meager payment dictated by the crown is paid and, as a personal gesture, provides a dozen full plates from the royal armory.]]
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_mountain_pass_ambush");
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "in_kraka_ravn")

			local new_dilemma_text =
			[[Kraka Ravnsvake is the southernmost Norse Dwarfhold, and the last safe bastion before the frozen Land of Kislev.

			Decades of hardship and threats to the hold and its surrounding lands have left the ruling clans secluded and unwilling to oppose the inevitable. Left to fend for themselves, those appointed to serve here are fighting a losing battle. Few in numbers, the royal guard have all but abandoned the outermost possessions and continue to patrol only a few routes northwards.

			Jorin Asserbo, high armourer of the keep has inquired of our services.]]
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_ice_trolls");
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "after_fimir_bog");
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
					cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "in_kraka_ravn_after_ice_trolls");
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
					cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "in_kraka_ravn_after_fimir_bog");
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
			cm:trigger_dilemma("wh2_main_dwf_karak_zorn", "game_end");
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
				end
			)
		end, 0.7)
	end,
	true
)
