PIP_TYPE_SHIELD = "shield"
PIP_TYPE_HEALTH = "health"
pip_type = ""

function represent_shield() {

	pip_type = PIP_TYPE_SHIELD

}

function represent_health() {

	pip_type = PIP_TYPE_HEALTH

}

function spawn_shields(layer, number) {
	
	show_message(layer)
	ret = [];
	for(var i = 0; i < number; i++) {
		
		ret.push(instance_create_layer(0, 0, layer, obj_pip));
		
	}
	return ret;
	
}