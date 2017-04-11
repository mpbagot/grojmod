minetest.register_abm({
		nodenames = {"grojmod:stage_firework_explode"},
		interval = 8,
		chance = 1,	
		
		action = function(pos, node, active_object_count, active_object_count_wider)
		if node.name == "grojmod:stage_firework_explode" then
		          minetest.env:remove_node(pos,{name="grojmod:stage_firework_explode"})
		  
			end
		end
})


minetest.register_node("grojmod:stage_firework", {
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
   		type = "fixed",
   		fixed = {-0.5, -0.5, -0.5, 0.5, 0.6, 0.5}
	},

	description = "Stage Fireworks",
	tiles = {"stage_firework_tiles.png"},
	is_ground_content = true,
	groups = {cracky=3},

	after_place_node = function(pos)
		minetest.add_node(pos, {name="grojmod:stage_firework", param2=0})
	end,
	mesecons = {effector = {
		action_on = function (pos, node)
			fireworks_activate(pos, node)
		end
}}
})

minetest.register_craft({output = '"grojmod:stage_firework" 2',
    recipe = {
        {'wool:yellow','dye:yellow','wool:yellow'},
        {'default:sign_wall','tnt:gunpowder','default:sign_wall'},
        {'wool:yellow','wool:yellow','wool:yellow'}
    }
})

minetest.register_entity("grojmod:fireworks", {
    physical = true,
      visual_size = {x=0.25, y=0.25},
      collisionbox = {-0.05, -0.05, -0.05, 0.05, 0.05, 0.05},
    visual = "sprite",
    textures = {"firework_fizz.png"},
    on_step = function(self, dtime)
      self.object:setacceleration({x=0, y=5, z=0})
      self.timer = self.timer + dtime
      if self.timer > 2 then
        self.object:remove()
      end
    end,
    timer = 0,
})

minetest.register_abm({
    nodenames = {"grojmod:stage_firework_explode"},
    interval = 0.00000000000000000000001,
    chance = 0.00001,
    action = function(pos)
      minetest.env:add_entity({x=pos.x+math.random()*0.5, y=pos.y+0.75+math.random(), z=pos.z+math.random()*0.5}, "grojmod:fireworks")
    end,
})

minetest.register_node("grojmod:stage_firework_explode", {
	drawtype = "plantlike",
	description = "On-Stage",
	tiles = {"stage_firework_tiles_explode.png"},
	paramtype = "light",
	walkable = false,
	light_source = 18,
	pointable = false,
	is_ground_content = true,
	groups = {cracky=3,not_in_creative_inventory=1},
})

local fireworks = {
	handler = {},
	{name="Firework", length=14, gain=1}
}
local play_sound = function(list, number)
		local gain = 1.0
		local handler = minetest.sound_play(list[number].name, {gain=gain})
end


function fireworks_activate (pos, node)
--play_sound(fireworks, 1)

zrand = math.random(-1, 1)
xrand = math.random(-1,1)
yrand = math.random(2, 3)

if node.name == "grojmod:stage_firework" 
then
local radius = 1 
for x=-radius,radius do
for y=-radius,radius do
for z=-radius,radius do
   if x*x+y*y+z*z <= radius*radius then
      minetest.env:add_node({x=pos.x+x+xrand,y=pos.y+y+yrand,z=pos.z+z+zrand},{name='grojmod:stage_firework_explode'}) 
end
end
end
end
minetest.env:remove_node(pos,{name="grojmod:stage_firework"})
end
end
minetest.register_on_punchnode(fireworks_activate)

print("MOD: Grojmod Fireworks Loaded!")