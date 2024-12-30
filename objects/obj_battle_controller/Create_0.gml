randomize()
enemy_size = obj_player.propulsion * ((irandom_range(0,90) + 10) / 100)

player_strength = obj_player.weapons * 10
player_shields = 10
player_health = 10

enemy_strength = floor(enemy_size * 10)
layer_instances = layer_get_id("Instances")
enemy_shields = obj_pip.spawn_shields(layer_instances, 10);
enemy_health = obj_pip.spawn_healths(layer_instances, 10);

function fight_battle() {
	
	show_message("You fight the battle");
	
}

function flee_battle() {
	
	show_message("You flee the battle");
	
}
