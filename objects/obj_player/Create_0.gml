weapons = 2;
propulsion = 2;
shields = 10;

function weapons_recovered(added_weapons) {
	weapons += added_weapons;
}

function engines_recovered(added_engines) {
	propulsion += added_engines;
}

function shields_recovered(added_shields) {
	shields += added_shields;
}