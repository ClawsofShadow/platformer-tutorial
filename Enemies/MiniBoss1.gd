extends KinematicBody2D

export (int) var health := 100
var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

onready var ledgeCheckRight: = $LedgeCheckRight
onready var ledgeCheckLeft: = $LedgeCheckLeft
onready var sprite: = $AnimatedSprite

func _physics_process(_delta):
	var found_wall = is_on_wall()
	var found_ledge = not ledgeCheckRight.is_colliding() or not ledgeCheckLeft.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1
	
	sprite.flip_h = direction.x > 0
	
	velocity = direction * 25
	velocity = move_and_slide(velocity, Vector2.UP)



func _on_Hitbox_body_entered(body:Node):
	if body is Player:
		health -= 20
		body.velocity.y += -150

	if health <= 0:
		queue_free()
