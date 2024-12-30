// Draw Eventdraw_set_color(c_aqua);        // Set text color
draw_set_font(fnt_splash);              // Use the default font or set a custom one
draw_set_halign(fa_center);     // Center the text horizontally
draw_set_valign(fa_middle);     // Center the text vertically

// Calculate the center position of the screen
var center_x = room_width / 2;
var center_y = room_height / 2;

// Draw the scaled text
draw_set_color(c_black);
draw_text_transformed(center_x, center_y, text_string, text_current_scale * 1.001, text_current_scale * 1.001, 0);
draw_set_color(c_red);
draw_text_transformed(center_x, center_y, text_string, text_current_scale, text_current_scale, 0);

// Gradually zoom the text
if (text_current_scale < text_final_scale) {
    text_current_scale += text_zoom_speed; // Increment scale
} else {
    text_current_scale = text_final_scale; // Snap to final scale if overshooting
}

if (layer_exists("Background")) {
	
    var background_id = layer_background_get_id("Background");
	var alpha = 1 - (text_current_scale / (text_final_scale * 1.5));
	layer_background_alpha(background_id, alpha);

}