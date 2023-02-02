tool
extends Path2D

enum ANIMATION_TYPE {
	LOOP,
	BOUNCE
}

export (ANIMATION_TYPE) var animation_type setget set_animation_type
export (float) var speed = 1 setget set_speed

func set_animation_type(value):
	animation_type = value
	var animation_player = find_node("AnimationPlayer")
	play_updated_animation(animation_player)

func _ready() -> void:
	var animation_player = get_node("AnimationPlayer")
	play_updated_animation(animation_player)
	
	
func set_speed(value):
	speed = value
	var animation_player = find_node("AnimationPlayer")
	if animation_player: 
		animation_player.playback_speed = speed

func play_updated_animation(animation_player: AnimationPlayer):
	if not animation_player:
		return
		
	match animation_type:
		ANIMATION_TYPE.LOOP: animation_player.play("MoveAlongPathLoop")
		ANIMATION_TYPE.BOUNCE: animation_player.play("MoveAlongPathBounce")
