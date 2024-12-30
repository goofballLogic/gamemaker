unit_size = 40
gap_size = 10

c_pip = make_color_rgb(128, 128, 128);

var c_pip_player_shield = make_color_rgb(0, 128, 0);
var c_pip_player_health = make_color_rgb(0, 255, 0);
var c_pip_enemy_shield = make_color_rgb(128, 0, 0);
var c_pip_enemy_health = make_color_rgb(255, 0, 0);

function draw_pip_placeholder(x, y) {

	draw_set_alpha(0.6)
	draw_set_color(c_pip)
	draw_rectangle(x, y, x + unit_size, y + unit_size, false);
	
}

function draw_pip(x, y, color) {

	draw_set_alpha(1)
	draw_set_color(color)
	draw_rectangle(x + 5, y + 5, x + unit_size - 5, y + unit_size - 5, false);
	
}


function draw_pips(x_start, y_start, color, limit, value, columns, x_delta, y_delta) {
	
	x = x_start
	y = y_start
	c = 0;
	for(var i = 0; i < limit; i++) {

		draw_pip_placeholder(x, y);
		if(i <= value)
			draw_pip(x, y, color);

		c++;
		if(c == columns) {

			// new line
			c = 0;
			x = x_start;
			y += y_delta;
			
		} else {
			
			x += x_delta;
			
		}
	
	}
	
}

draw_player_panel({
	name: "Player",
	is_right: false,
	strength: player_strength,
	color: make_color_rgb(128, 255, 0),
	shields: player_shields,
	shields_original: player_shields_original,
	health: player_health,
	health_original: player_health_original,
})
	
draw_player_panel({
	name: "Enemy",
	is_right: true,
	strength: enemy_strength,
	color: make_color_rgb(255, 0, 0),
	shields: enemy_shields,
	shields_original: enemy_shields_original,
	health: enemy_health,
	health_original: enemy_health_original
});

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
	