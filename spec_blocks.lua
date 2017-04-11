--code for special blocks that arent part of normal minetest.

minetest.register_node('grojmod:teal_wool', {
description = "Teal Wool",
tiles = {"grojmod_teal_wool.png"},
groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1},
})

minetest.register_node('grojmod:stagelight', {
	description = "Stage Light",
	drawtype = "nodebox",
	tiles = {'grojmod_stagelight_sides.png','grojmod_stagelight_bottom.png','grojmod_stagelight_sides.png'},
        selection_box = {
                type = "fixed",
                fixed = { -0.3, -0.5, -0.3, 0.3, 0.5, 0.3 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.3, -0.5, -0.3, 0.3, 0.5, 0.3 }
        },

	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	light_source = 1000,
})

minetest.register_craft({output = '"grojmod:stagelight" 3',
    recipe = {
        {'','default:steel_ingot',''},
        {'default:steel_ingot','default:torch','default:steel_ingot'},
        {'','',''}
    }
})

minetest.register_node("grojmod:amp", {
--tile_images = {"grojmod_amp.png"},
tiles = {"grojmod_amp_sides.png","grojmod_amp_sides.png","grojmod_amp_sides.png","grojmod_amp_sides.png","grojmod_amp_back.png", "grojmod_amp.png"},
description = "Guitar & Bass Amp",
groups={choppy = 2, cracky = 2},
paramtype2 = "facedir"
})

minetest.register_craft({
    output = '"grojmod:amp" 1',
    recipe = {
        {'wool:black', 'default:wood', 'wool:black'},
        {'default:wood', 'default:steel_ingot', 'default:wood'},
        {'wool:black', 'default:wood', 'wool:black'},
    }
})

minetest.register_node("grojmod:recorder", {
    description = "Sound Recorder",
    groups={choppy = 2, cracky = 2},
    paramtype = "light",
    paramtype2 = "facedir",
    drawtype = "mesh",
    mesh = "recorder.b3d",
    tiles = {"grojmod_recorder.png",},
    on_construct = function(pos)
      meta = minetest.get_meta(pos)
      meta:set_string("a_layer", "")
      meta:set_string("e_layer", "")
      meta:set_string("b_layer", "")
      meta:set_string("k_layer", "")
      meta:set_string("d_layer", "")
    end,
    on_punch = function(pos, node, puncher, pointed_thing)
      if node.name == "grojmod:recorder" and puncher:is_player() and puncher:get_wielded_item():is_empty() then
        local disc = ItemStack("grojmod:cd")
        disc:set_count(1)
        local meta = minetest.get_meta(pos)
        local soundstring = ":".. meta:get_string("a_layer").. ":".. meta:get_string("e_layer").. ":".. meta:get_string("b_layer").. ":".. meta:get_string("k_layer").. ":".. meta:get_string("d_layer")
        minetest.chat_send_player(puncher:get_player_name(), soundstring)

        disc:set_metadata(soundstring)
        puncher:set_wielded_item(disc)
        meta:set_string("a_layer", "")
        meta:set_string("e_layer", "")
        meta:set_string("b_layer", "")
        meta:set_string("k_layer", "")
        meta:set_string("d_layer", "")
      else
        minetest.chat_send_player(puncher:get_player_name(), "Please empty your hand before removing the disc!")
      end
    end,
})

minetest.register_craft({
    output = '"grojmod:recorder" 1',
    recipe = {
      {"default:steel_ingot", "wool:black", "default:steel_ingot"},
      {"default:wood", "default:mese", "default:wood"},
      {"default:steel_ingot", "wool:black", "default:steel_ingot"}
    }
})

minetest.register_craftitem("grojmod:cd", {
    description = "Pre-Recorded CD",
    inventory_image = "grojmod_cd.png",
})

minetest.register_craftitem("grojmod:drumsticks", {
    description = "Drum Sticks",
    inventory_image = "grojmod_drumstick.png",
})

minetest.register_craft({
    type = "shapeless",
    output = '"grojmod:drumsticks" 1',
    recipe = {"default:stick", "default:stick"}
})

print("MOD: Special Grojmod Blocks Loaded!")