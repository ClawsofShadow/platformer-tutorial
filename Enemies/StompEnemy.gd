extends Node2D

enum {HOVER, FALL, LAND, RISE}

var state = HOVER

onready var start_position = global_position
onready var timer: = $Timer
onready var raycast: = $RayCast2D

func _physics_process(delta):
	match state:
		HOVER: pass
		FALL: pass
		LAND: pass
		RISE: pass

func hover_state():
	state = FALL


func fall_state():
	position.y += 10
	if raycast.is_colliding():
		var collision_point = raycast.get_collision_point()
		position.y = collision_point.y