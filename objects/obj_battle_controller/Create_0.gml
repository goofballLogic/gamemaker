randomize()
enemy_size = obj_player.propulsion * ((irandom_range(0,90) + 10) / 100)

player_strength = obj_player.weapons * 10

player_health_original = 10
player_health = player_health_original

player_shields_original = obj_player.shields
player_shields = player_shields_original

enemy_strength = floor(enemy_size * 10) // e.g. 1.44 * 10 = 14

enemy_shields_original = floor(10 * enemy_size * max(0.1, random(1))) // e.g. 10 * 1.44 * 0.45 = 6
enemy_shields = enemy_shields_original

enemy_health_original = 10
enemy_health = enemy_health_original

function fight_battle() {
	
	var player_random = random(2) * player_strength;
	var enemy_random = random(2) * enemy_strength;
	if(player_random > enemy_random) {
	
		hit_enemy();
		
	} else {
		
		hit_player();
		
	}
	if(enemy_health < 1) {
		
		player_won();
	
	} else if(player_health < 1) {
		
		player_lost();
		
	}
	
}

function player_won() {
	
	/*
		if you win the battle, 
		some of the enemy's engines, shields and weapons are destroyed
		others are added to your ship
	*/
	destruction_quotient = random(1) * random(1) * random(1);
	won_shields = floor(enemy_shields_original * destruction_quotient);
	won_engines = floor(enemy_size * 10 * destruction_quotient * random(1));
	won_weapons = floor(enemy_size * 10 * destruction_quotient);
	
	transcript = "You defeated the enemy!\n";
	recovered = "";
	if (won_shields > 0) recovered += string(" - Shields: {0}\n", won_shields)
	if (won_engines > 0) recovered += string(" - Engines: {0}\n", won_engines)
	if (won_weapons > 0) recovered += string(" - Weapons: {0}\n", won_weapons)
	if (recovered == "")
		recovered = "Everything was destroyed - you recovered nothing.";
	else
		recovered = "You recovered some of the enemy's equipment:\n" + recovered
	transcript += recovered;

	show_message(transcript);

	obj_player.shields_recovered(won_shields);
	obj_player.engines_recovered(won_engines);
	obj_player.weapons_recovered(won_weapons);

	room_goto(rm_go);
	
}

function player_lost() {
	
	show_message("Not implemented: calculate losses");
	room_goto(rm_go);
	
}

function hit_enemy() {

	if(enemy_shields > 0) {
		
		enemy_shields--;
		
	} else if(enemy_health > 0) {
		
		enemy_health--;
		
	}
	
}


function hit_player() {

	if(player_shields > 0) {
		
		player_shields--;
		
	} else if(player_health > 0) {
		
		player_health--;
		
	}
	
}


function flee_battle() {
	
	show_message("You flee the battle");
	
}

unit_size = 40
gap_size = 10

function draw_pip(pip) {

	draw_set_alpha(pip.alpha);
	draw_set_color(pip.color);
	draw_rectangle(
		pip.x + pip.inset, pip.y + pip.inset,
		pip.x + unit_size - pip.inset, pip.y + unit_size - pip.inset,
		false
	);
	
}	

function draw_pips(x_start, y_start, color, limit, value, columns, x_delta, y_delta) {
	
	var px = x_start;
	var py = y_start;
	var c = 0;
	var c_pip = make_color_rgb(200, 200, 200);
	for(var i = 0; i < limit; i++) {

		draw_pip({ x: px, y: py, inset: 0, alpha: 0.6, color: c_pip });
		if(i < value)
			draw_pip({ x: px, y: py, inset: 5, color, alpha: 1 });
		c++;
		if(c == columns) {

			// new line
			c = 0;
			px = x_start;
			py += y_delta;
			
		} else {
			
			px += x_delta;
			
		}
	
	}
	
}

function draw_player_panel(def) {

	var delta = gap_size + unit_size;
	var health_cols = 2; // i.e. 5 rows
	var shields_cols = min(10, ceil(def.shields_original / 5));
	
	var text = string("{0} strength: {1}", def.name, def.strength);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	var textx = def.is_right 
		? room_width - unit_size - string_width(text)
		: unit_size; 
	draw_text(textx, 200, text);

	var pipy = 200 + string_height(text) + gap_size
	var pipx = def.is_right ? room_width - unit_size - unit_size : unit_size;
	var xdelta = def.is_right ? -delta : delta;
	draw_pips(
		pipx, pipy,
		def.color, def.health_original, def.health,
		health_cols, xdelta, delta
	);
	var shield_color = make_color_hsv(
		color_get_hue(def.color),
		color_get_saturation(def.color),
		color_get_value(def.color) * 0.5
	);
	draw_pips(
		pipx + (health_cols * xdelta), pipy,
		shield_color, def.shields_original, def.shields,
		shields_cols, xdelta, delta
	);
	
}