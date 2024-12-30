/// @param player_power
/// @param enemy_power 
function scr_combat() {

	// Generate random odds
	var player_chance = argument0 * random_range(0.5, 1.5);
	var enemy_chance = argument1 * random_range(0.5, 1.5);

	// Resolve combat
	if (player_chance >= enemy_chance) {
	    return { outcome: "win", reward: 1 }; // Gain 1 weapon
	} else {
	    return { outcome: "lose", penalty: 1 }; // Lose 1 transport power
	}

}
