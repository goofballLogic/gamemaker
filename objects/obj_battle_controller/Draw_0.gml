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