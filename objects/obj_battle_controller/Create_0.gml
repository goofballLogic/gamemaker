randomize()
enemy_size = obj_player.propulsion * ((irandom_range(0,90) + 10) / 100)

player_strength = obj_player.weapons * 10

player_health_original = 10
player_health = player_health_original

player_shields_original = 10
player_shields = player_shields_original - 4

enemy_strength = floor(enemy_size * 10)

enemy_shields_original = 10
enemy_shields = enemy_shields_original

enemy_health_original = 10
enemy_health = enemy_health_original - 3

function fight_battle() {
	
	show_message("You fight the battle");
	
}

function flee_battle() {
	
	show_message("You flee the battle");
	
}
