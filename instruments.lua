

egnote = 0
agnote = 0
ebnote = 0
abnote = 0
knote = 0
dnote = 0

--Electric Bass & Guitar Code

minetest.register_tool("grojmod:electric_guitar", {
	description = "Electric Guitar",
	inventory_image = "grojmod_instrument_elecguitar.png",	
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.20}},
		},
		damage_groups = {fleshy=3},
	},
	wield_scale = {x=2,y=2,z=2},
	range = 10.0,
		on_use = function(itemstack, user, pointed_thing)
      if minetest.find_node_near(user:getpos(), 10, "grojmod:amp") ~= nil then
        local soundeg = "grojmod_instruments_eguitar_" ..egnote
        minetest.sound_play(soundeg, {max_hear_distance = 100,})
      end
      local r = minetest.find_node_near(user:getpos(), 5, "grojmod:recorder")
      if r ~= nil then
        local meta = minetest.get_meta(r)
        meta:set_string("e_layer", meta:get_string("e_layer").. egnote)
      end
		end,
		on_place = function(itemstack, placer, pointed_thing)
			egnote = egnote + 1
			if egnote == 7 then
				egnote = 0
			end
		end,
})


minetest.register_craft({output = '"grojmod:electric_guitar" 1',
recipe = {
{'default:wood', 'default:wood', 'farming:string'},
{'default:wood', 'farming:string', 'default:wood'},
{'default:steel_ingot','default:wood', "default:wood"}
	}
})


minetest.register_tool("grojmod:electric_bass", {
	description = "Electric Bass Guitar",
	inventory_image = "grojmod_instrument_elecbass.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.20}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	wield_scale = {x=2,y=2,z=2},
	range = 10.0,
	on_use = function(itemstack, user, pointed_thing)
    if minetest.find_node_near(user:getpos(), 10, "grojmod:amp") ~= nil then
      soundeb = "grojmod_instruments_ebass_" ..ebnote
      minetest.sound_play(soundeb, {max_hear_distance = 100,})
    end
    local r = minetest.find_node_near(user:getpos(), 5, "grojmod:recorder")
    if r ~= nil then
      local meta = minetest.get_meta(r)
      meta:set_string("b_layer", meta:get_string("b_layer").. ebnote)
    end
	end,
	on_place = function(itemstack, placer, pointed_thing)
		ebnote = ebnote + 1
		if ebnote == 7 then
			ebnote = 0
		end
	end,
	
})

minetest.register_craft({output = '"grojmod:electric_bass" 1',
recipe = {
{'default:wood', 'default:wood', 'default:steel_ingot'},
{'default:wood', 'default:steel_ingot', 'default:wood'},
{'default:steel_ingot', 'default:wood', "default:wood"},
	}
})



--Piano and Drum Kit Code

local keyboard_formspec = 
  "size[8,3]"..
  "label[2,0;Keyboard]"..
  "button[0.5,0.2;1,2;bpress;B]"..
  "button[1.5,0.2;1,2;cpress;C]"..
  "button[2.5,0.2;1,2;dpress;D]"..
  "button[3.5,0.2;1,2;epress;E]"..
  "button[4.5,0.2;1,2;fpress;F]"..
  "button[5.5,0.2;1,2;gpress;G]"..
  "button[6.5,0.2;1,2;apress;A]"..
  "button_exit[5,2;2,1;exit;Exit]"

minetest.register_node("grojmod:keyboard", {
tiles = {"grojmod_instrument_keyboard_top.png","grojmod_instrument_keyboard_bottom.png","grojmod_instrument_keyboard_sides.png","grojmod_instrument_keyboard_sides.png","grojmod_instrument_keyboard_back.png", "grojmod_instrument_keyboard_front.png"},
description = "Keyboard",
drawtype = "nodebox",
paramtype = "light",
paramtype2 = "facedir",
node_box = {
   type = "fixed",
   fixed = {-0.5, -0.5, -0.5, 1.5, 0, 0.5}
},
selection_box = {
   type = "fixed",
   fixed = {-0.5, -0.5, -0.5, 1.5, 0, 0.5}
},
groups={choppy = 2, cracky = 2},

on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", keyboard_formspec)
		meta:set_string("infotext", "Keyboard")
	end,
on_receive_fields = function(pos, formname, fields, player)
  if (fields.exit) then return end
  if (fields.bpress) then
    soundkb = "grojmod_instrument_keyboard_0"
    minetest.sound_play(soundkb, {max_hear_distance = 100,})
    knote = 0
  end
  if (fields.cpress) then
    soundkb = "grojmod_instrument_keyboard_1"
    minetest.sound_play(soundkb, {max_hear_distance = 100,})
    knote = 1
  end
  if (fields.dpress) then
    soundkb = "grojmod_instrument_keyboard_2"
    minetest.sound_play(soundkb, {max_hear_distance = 100,})
    knote = 2
  end
  if (fields.epress) then
    soundkb = "grojmod_instrument_keyboard_3"
    minetest.sound_play(soundkb, {max_hear_distance = 100,})
    knote = 3
  end
  if (fields.fpress) then
    soundkb = "grojmod_instrument_keyboard_4"
    minetest.sound_play(soundkb, {max_hear_distance = 100,})
    knote = 4
  end
  if (fields.gpress) then
    soundkb = "grojmod_instrument_keyboard_5"
    minetest.sound_play(soundkb, {max_hear_distance = 100,})
    knote = 5
  end
  if (fields.apress) then
    soundkb = "grojmod_instrument_keyboard_6"
    minetest.sound_play(soundkb, {max_hear_distance = 100,})
    knote = 6
  end
  local r = minetest.find_node_near(player:getpos(), 5, "grojmod:recorder")
  if r ~= nil then
    local meta = minetest.get_meta(r)
    meta:set_string("k_layer", meta:get_string("k_layer").. knote)
  end
end,
})
minetest.register_craft({
output = '"grojmod:keyboard" 1',
recipe = {
{'wool:blue', 'wool:blue', 'wool:blue'},
{'default:steel_ingot', 'default:wood', 'default:steel_ingot'},
{'default:wood', 'default:wood', 'default:wood'},
}
})


local drum_formspec = 
  "size[6,6]"..
  "label[0,0.35;Hi-Hat]"..
  "label[2.5,0;Drumkit]"..
  "button[0,0.4;1,2;hi_open;Open]"..
  "button[1.1,0.4;1.5,2;hi_closed;Closed]"..
  "button[4.5,0.4;1.5,2;crash;Crash]"..
  "button[0.5,2.4;1.5,2;snare;Snare]"..
  "button[1.5,1.4;1.5,2;tom1;Tom]"..
  "button[3.1,1.4;1.5,2;tom2;Tom]"..
  "button[4.1,2.4;1.5,2;tom3;Other]"..
  "button[2.3,3.5;1.5,2;bass;Bass]"..
  "button_exit[4,5.2;2,1;exit;Exit]"

minetest.register_node("grojmod:drums", {
description = "Acoustic Drum Set",
groups={choppy = 2, cracky = 2},
drawtype = "mesh",
paramtype = "light",
paramtype2 = "facedir",
mesh = "drums.b3d",
tiles = {"grojmod_drums.png",},
on_construct = function(pos)
  local meta = minetest.get_meta(pos)
  meta:set_string("formspec", drum_formspec)
  meta:set_string("infotext", "Drumkit")
end,
on_receive_fields = function(pos, formname, fields, player)
  if (fields.exit) then return end
  if (fields.hi_open) then
    soundd = "grojmod_instruments_drum_0"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 0
  end
  if (fields.hi_closed) then
    soundd = "grojmod_instruments_drum_1"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 1
  end
  if (fields.crash) then
    soundd = "grojmod_instruments_drum_2"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 2
  end
  if (fields.snare) then
    soundd = "grojmod_instruments_drum_3"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 3
  end
  if (fields.tom1) then
    soundd = "grojmod_instruments_drum_4"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 4
  end
  if (fields.tom2) then
    soundd = "grojmod_instruments_drum_5"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 5
  end
  if (fields.tom3) then
    soundd = "grojmod_instruments_drum_6"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 6
  end
  if (fields.bass) then
    soundd = "grojmod_instruments_drum_7"
    minetest.sound_play(soundd, {max_hear_distance = 100,})
    dnote = 7
  end
  local r = minetest.find_node_near(player:getpos(), 5, "grojmod:recorder")
  if r ~= nil then
    local meta = minetest.get_meta(r)
    meta:set_string("d_layer", meta:get_string("d_layer").. dnote)
  end
end,
})

minetest.register_craft({
output = '"grojmod:drums" 1',
recipe = {
{'default:gold_ingot', '', 'default:gold_ingot'},
{'default:sand', 'default:chest', ''},
{'default:wood', '', 'default:wood'},
}
})


--Acoustic Guitar and Bass

minetest.register_tool("grojmod:acoustic_guitar", {
	description = "Acoustic Guitar",
	inventory_image = "grojmod_instrument_acouguitar.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.20}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	wield_scale = {x=2,y=2,z=2},
	range = 10.0,
	on_use = function(itemstack, user, pointed_thing)
		soundag = "grojmod_instrument_aguitar_" ..agnote
		minetest.sound_play(soundag, {	max_hear_distance = 100,})
    local r = minetest.find_node_near(user:getpos(), 5, "grojmod:recorder")
    if r ~= nil then
      local meta = minetest.get_meta(r)
      meta:set_string("a_layer", meta:get_string("a_layer").. egnote)
    end
	end,
	on_place = function(itemstack, placer, pointed_thing)
		agnote = agnote + 1
		if agnote == 7 then
			agnote = 0
		end
	end,
	
})

minetest.register_craft({output = '"grojmod:acoustic_guitar" 1',
recipe = {
{'', 'default:wood', 'farming:string'},
{'default:wood', 'farming:string', 'default:wood'},
{'farming:string','default:wood', ""}
	}
})

minetest.register_tool("grojmod:acoustic_bass", {
	description = "Acoustic Bass",
	inventory_image = "grojmod_instrument_acoubass.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.20}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	wield_scale = {x=2,y=2,z=2},
	range = 10.0,
	on_use = function(itemstack, user, pointed_thing)
		soundab = "grojmod_instruments_ebass_" ..abnote
		minetest.sound_play(soundab, {max_hear_distance = 100,})
    local r = minetest.find_node_near(user:getpos(), 5, "grojmod:recorder")
    if r ~= nil then
      local meta = minetest.get_meta(r)
      meta:set_string("b_layer", meta:get_string("b_layer").. egnote)
    end
	end,
	on_place = function(itemstack, placer, pointed_thing)
		abnote = abnote + 1
		if abnote == 7 then
			abnote = 0
		end
	end,
	
})

minetest.register_craft({output = '"grojmod:acoustic_bass" 1',
recipe = {
{'', 'default:wood', 'farming:string'},
{'default:wood', 'farming:string', 'default:wood'},
{'default:steel_ingot','default:wood', ""}
	}
})



--Instrument Cases Code

local case_formspec = 
	"size[8,2.8]"..
	"list[context;main;1.8,0.2;1,1;]"..
  "label[0,0.5;Instrument]"..
	"list[current_player;main;0,1.8;8,1;]"

minetest.register_node("grojmod:guitarcase", {
	description = "Guitar Case",
	tiles = {"grojmod_case_top.png", "grojmod_case_sides.png", "grojmod_case_sides.png",
		"grojmod_case_sides.png", "grojmod_case_sides.png", "grojmod_case_sides.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
  drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.0576923, 0.5}, -- NodeBox1
			{0.45, -0.357692, -0.217311, 1.8, -0.0576923, 0.255772}, -- NodeBox2
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", case_formspec)
		meta:set_string("infotext", "Guitar Case")
		local inv = meta:get_inventory()
		inv:set_size("main", 1*1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves guitar around in case at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves a guitar to a guitar case at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes a guitar from guitar case at "..minetest.pos_to_string(pos))
	end,
})


minetest.register_craft({output = '"grojmod:guitarcase" 1',
recipe = {
{'', '', 'default:wood'},
{'default:wood','dye:black', ''},
{'default:wood','default:wood', ''}
	}
})


print("MOD: Grojmod Instruments Loaded!")
