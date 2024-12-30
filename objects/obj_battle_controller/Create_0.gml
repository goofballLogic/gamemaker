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
		if(i <= value)
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
	var cols = 5;
	
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
		cols, xdelta, delta
	);
	var shield_color = make_color_hsv(
		color_get_hue(def.color),
		color_get_saturation(def.color),
		color_get_value(def.color) * 0.5
	);
	draw_pips(
		pipx + (cols * xdelta), pipy,
		shield_color, def.shields_original, def.shields,
		cols, xdelta, delta
	);
	
}