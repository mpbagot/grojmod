
minetest.log("action","MOD: Grojband characters loading ...")

local version = "1.0"

local sheep_groups = {
						sheerable=1,
						wool=1,
						not_in_creative_inventory=1
					}

--Code for Male Mobs


--Kin Kujira Code


local selectionbox_kin = {-0.65, -0.8, -0.65, 0.65, 0.45, 0.65}

mobs:register_mob("grojmod:kin", {
    type="animal",
    passive=true,
    group_attack=true,
    hp_min=8,
    hp_max=12,
    
    collisionbox=selectionbox_kin,
    visual="mesh",
    visual_size={x=1.8,y=1.2,z=1.8},
    textures={{"animal_kin_mesh.png"},},
    mesh="animal_kin.b3d",
    makes_footstep_sound=false,
    rotate=270,

    walk_velocity=1,
    run_velocity=5,
    jump=true,
    jump_height=6,
    drops = {
      name="grojmod:keyboard",
      chance=3,
      min=1,
      max=3
    },
    
    armor=2,
    lava_damage=0.5,
    fall_damage=true,
    floats=1,
    attack_type="explode",
    sounds={
      random="woah_kin_1",
      distance=10
    },
    animation={
      stand_start=61,
      stand_end=120,
      walk_start=0,
      walk_end=60,
      run_start=0,
      run_end=60,
      speed_normal=15,
      speed_run=20,
    },
  })

mobs:register_spawn("grojmod:kin", {"default:dirt_with_grass",}, 20, 10, 15000, 1, 31000, true)

minetest.log("action","\tAdding animal Kin")

minetest.log("action","MOD: animal_kin mod version " .. version .. " loaded")


--Nick Mallory Code

local selectionbox_nick = {-0.3, -0.5, -0.3, 0.3, 1.5, 0.3}

mobs:register_mob("grojmod:nick", {
    type="animal",
    passive=true,
    group_attack=true,
    hp_min=8,
    hp_max=12,
    
    collisionbox=selectionbox_nick,
    visual="mesh",
    visual_size={x=1.8,y=1.25,z=1.8},
    textures={{"animal_nick_mesh.png"},},
    mesh="animal_nick.b3d",
    makes_footstep_sound=false,
    rotate=270,

    walk_velocity=1,
    run_velocity=5,
    jump=true,
    jump_height=6,
    drops = {
      name="default:dirt_with_grass",
      chance=3,
      min=1,
      max=3
    },
    
    armor=2,
    lava_damage=0.5,
    fall_damage=true,
    floats=1,
    attack_type="explode",
    sounds={
      random="woah_kin_1",
      distance=10
    },
    animation={
      stand_start=61,
      stand_end=120,
      walk_start=0,
      walk_end=60,
      run_start=0,
      run_end=60,
      speed_normal=15,
      speed_run=20,
    },
  })

mobs:register_spawn("grojmod:nick", {"default:dirt_with_grass",}, 20, 10, 15000, 1, 31000, true)

minetest.log("action","\tAdding animal Nick")

minetest.log("action","MOD: animal_nick mod version " .. version .. " loaded")


--Kon Kujira Code

local selectionbox_kon = {-0.65, -0.8, -0.65, 0.65, 0.45, 0.65}

mobs:register_mob("grojmod:kon", {
    type="animal",
    passive=true,
    group_attack=true,
    hp_min=8,
    hp_max=12,
    
    collisionbox=selectionbox_kon,
    visual="mesh",
    visual_size={x=1.8,y=1.2,z=1.8},
    textures={{"animal_kon_mesh.png"},},
    mesh="animal_kon.b3d",
    makes_footstep_sound=false,
    rotate=270,

    walk_velocity=1,
    run_velocity=5,
    jump=true,
    jump_height=6,
    drops = {
      name="grojmod:drums",
      chance=3,
      min=1,
      max=3
    },
    
    armor=2,
    lava_damage=0.5,
    fall_damage=true,
    floats=1,
    attack_type="explode",
    sounds={
      random="woah_kin_1",
      distance=10
    },
    animation={
      stand_start=61,
      stand_end=120,
      walk_start=0,
      walk_end=60,
      run_start=0,
      run_end=60,
      speed_normal=15,
      speed_run=20,
    },
  })

mobs:register_spawn("grojmod:kon", {"default:dirt_with_grass",}, 20, 10, 15000, 1, 31000, true)

minetest.log("action","\tAdding animal Kon")

minetest.log("action","MOD: animal_kon mod version " .. version .. " loaded")


--Corey Riffin Code

local selectionbox_corey = {-0.4, -0.5, -0.4, 0.4, 1.5, 0.4}

mobs:register_mob("grojmod:corey", {
    type="animal",
    passive=true,
    group_attack=true,
    hp_min=8,
    hp_max=12,
    
    collisionbox=selectionbox_corey,
    visual="mesh",
    visual_size={x=1.6,y=1.2,z=1.6},
    textures={{"animal_corey_mesh.png"},},
    mesh="animal_corey.b3d",
    makes_footstep_sound=false,
    rotate=270,
    
    walk_velocity=1,
    run_velocity=5,
    jump=true,
    jump_height=6,
    drops = {
      name="grojmod:electric_guitar",
      chance=3,
      min=1,
      max=3
    },
    
    armor=2,
    lava_damage=0.5,
    fall_damage=true,
    floats=1,
    attack_type="explode",
    sounds={
      random="woah_kin_1",
      distance=10
    },
    animation={
      stand_start=61,
      stand_end=120,
      walk_start=0,
      walk_end=60,
      run_start=0,
      run_end=60,
      speed_normal=15,
      speed_run=20,
    },
  })

mobs:register_spawn("grojmod:corey", {"default:dirt_with_grass",}, 20, 10, 15000, 1, 31000, true)

minetest.log("action","\tAdding animal Corey")

minetest.log("action","MOD: animal_corey mod version " .. version .. " loaded")




--Code for Female Mobs


--Trina Riffin Code


local selectionbox_trina = {-0.3, -0, -0.3, 0.3, 2, 0.3}


mobs:register_mob("grojmod:trina", {
    type="animal",
    passive=true,
    group_attack=true,
    hp_min=8,
    hp_max=12,
    
    collisionbox=selectionbox_trina,
    visual="mesh",
    visual_size={x=1.5,y=1.4,z=1.5},
    textures={{"animal_trina_mesh.png"},},
    mesh="animal_trina.b3d",
    makes_footstep_sound=false,
    rotate=270,

    walk_velocity=1,
    run_velocity=5,
    jump=true,
    jump_height=6,
    drops = {
      name="wool:pink_wool",
      chance=3,
      min=1,
      max=3
    },
    
    armor=2,
    lava_damage=0.5,
    fall_damage=true,
    floats=1,
    attack_type="explode",
    sounds={
      random="woah_kin_1",
      distance=10
    },
    animation={
      stand_start=61,
      stand_end=120,
      walk_start=0,
      walk_end=60,
      run_start=0,
      run_end=60,
      speed_normal=15,
      speed_run=20,
    },
  })

mobs:register_spawn("grojmod:trina", {"default:dirt_with_grass",}, 20, 10, 15000, 1, 31000, true)

minetest.log("action","\tAdding animal Trina")

minetest.log("action","MOD: animal_trina mod version " .. version .. " loaded")



--Laney Penn Code


local selectionbox_laney = {-0.65, -0.8, -0.65, 0.65, 0.45, 0.65}


mobs:register_mob("grojmod:laney", {
    type="animal",
    passive=true,
    group_attack=true,
    hp_min=8,
    hp_max=12,
    
    collisionbox=selectionbox_laney,
    visual="mesh",
    visual_size={x=1.8,y=1.6,z=1.8},
    textures={{"animal_laney_mesh.png"},},
    mesh="animal_laney.b3d",
    makes_footstep_sound=false,
    rotate=270,

    walk_velocity=1,
    run_velocity=5,
    jump=true,
    jump_height=6,
    drops = {
      name="grojmod:electric_bass",
      chance=3,
      min=1,
      max=3
    },
    
    armor=2,
    lava_damage=0.5,
    fall_damage=true,
    floats=1,
    attack_type="explode",
    sounds={
      random="woah_kin_1",
      distance=10
    },
    animation={
      stand_start=61,
      stand_end=120,
      walk_start=0,
      walk_end=60,
      run_start=0,
      run_end=60,
      speed_normal=15,
      speed_run=20,
    },
  })

mobs:register_spawn("grojmod:laney", {"default:dirt_with_grass",}, 20, 10, 15000, 1, 31000, true)


minetest.log("action","\tAdding animal Laney")

minetest.log("action","MOD: animal_laney mod version " .. version .. " loaded")

--Mina Beff Code


local selectionbox_mina = {-0.3, -0, -0.3, 0.3, 2, 0.3}


mobs:register_mob("grojmod:mina", {
    type="animal",
    passive=true,
    group_attack=true,
    hp_min=8,
    hp_max=12,
    
    collisionbox=selectionbox_mina,
    visual="mesh",
    visual_size={x=1.8,y=1.6,z=1.8},
    textures={{"animal_mina_mesh.png"},},
    mesh="animal_mina.b3d",
    makes_footstep_sound=false,
    rotate=270,

    walk_velocity=2,
    run_velocity=5,
    jump=true,
    jump_height=6,
    drops = {
      name="grojmod:teal_wool",
      chance=3,
      min=1,
      max=3
    },
    
    armor=2,
    lava_damage=0.5,
    fall_damage=true,
    floats=1,
    attack_type="explode",
    sounds={
      random="woah_kin_1",
      distance=10
    },
    animation={
      stand_start=61,
      stand_end=120,
      walk_start=0,
      walk_end=60,
      run_start=0,
      run_end=60,
      speed_normal=30,
      speed_run=40,
    },
  })

mobs:register_spawn("grojmod:mina", {"default:dirt_with_grass",}, 20, 10, 15000, 1, 31000, true)


minetest.log("action","\tAdding animal Mina")

minetest.log("action","MOD: animal_mina mod version " .. version .. " loaded")

print("MOD: Grojmod Entities Loaded!")
