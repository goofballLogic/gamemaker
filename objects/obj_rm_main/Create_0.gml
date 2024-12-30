text_string = "Space Mercs\nBattle & Trade";					// The title text
text_target_width = room_width * 0.9;									// Width the text will fill
text_font_size = 130;											// Initial font size
text_current_scale = 0.01;										// Starting scale (small)
text_zoom_speed = 0.02;											// Speed of zoomingdraw_set_color(c_black);        // Set text color
draw_set_font(fnt_splash);              // Use the default font or set a custom one

text_final_scale = text_target_width / string_width(text_string);	// Scale to fit width