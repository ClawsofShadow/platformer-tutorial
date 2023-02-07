extends Node2D

enum {HOVER, FALL, LAND, RISE}

var state = HOVER
var velocity = Vector2.ZERO

onready var start_position = global_position
onready var timer := $Timer
onready var raycast := $RayCast2D
onready var animatedSprite := $AnimatedSprite
onready var particles := $Particles2D

export(int) var fall_acceleration = 1000
export(int) var fall_speed = 3000
export(int) var rise_acceleration = 50
export(int) var rise_speed = 300
export(float) var delay_time = 0.75

func _ready() -> void:
	particles.one_shot = true

func _physics_process(delta: float) -> void:
	match state:
		HOVER: hover_state()
		FALL: fall_state(delta)
		LAND: land_state()
		RISE: rise_state(delta)

func hover_state() -> void:
	state = FALL


func fall_state(delta) -> void:
	animatedSprite.play("Falling")
	velocity.y = move_toward(velocity.y, fall_speed, fall_acceleration * delta)
	position.y += velocity.y * delta
	
	if raycast.is_colliding():
		var collision_point = raycast.get_collision_point()
		velocity = Vector2.ZERO
		position.y = collision_point.y
		state = LAND
		timer.start(delay_time)
		particles.emitting = true

func land_state() -> void:
	if timer.time_left == 0:
		state = RISE

func rise_state(delta) -> void:
	animatedSprite.play("Rising")
	velocity.y = move_toward(velocity.y, rise_speed * 10, rise_acceleration * delta)
	position.y -= velocity.y * delta

	if position.y <= start_position.y:
		state = HOVER
