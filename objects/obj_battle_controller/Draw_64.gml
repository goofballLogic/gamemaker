if(room == rm_combat) {

	draw_set_font(fnt_main)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	
	var unit_height = string_height("Ip") + 10
	
	draw_set_color(c_black)
	draw_set_alpha(0.7)
	draw_rectangle(0, 0, room_width, unit_height * 3, false)
	
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text(unit_height, unit_height, string("Hostile detected ___ SIZE-( {0} ) ___", enemy_size))
	draw_text(unit_height, unit_height * 2, string("Win the battle to increase your weapons or propulsion"))

}