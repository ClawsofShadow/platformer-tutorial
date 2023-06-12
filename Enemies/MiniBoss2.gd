extends KinematicBody2D
class_name MiniBoss2

export (int) var health := 100
var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

onready var animatedSprite := $AnimatedSprite

func _physics_process(_delta) -> void:
	var found_wall = is_on_wall()
	animatedSprite.animation = "flying"

	if found_wall:
		direction *= -1

	animatedSprite.flip_h = direction.x > 0

	velocity = direction * 100
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Hitbox_body_entered(body:Node):
	if body is Player:
		health -= 20
		body.velocity.y += -1000
		

	if health <= 0:
		queue_free()
