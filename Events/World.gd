extends Node2D

const PlayerScene = preload("res://Player.tscn")

onready var camera := $Camera2D
onready var player := $Player
onready var timer := $Timer

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.lightblue)
	player.connect_camera(camera)
	Events.connect("player_died", self , "_on_player_died")

func _on_player_died():
	timer.start(1.0)
	yield(timer, "timeout")
	player = PlayerScene.instance()
	add_child(player)
	player.connect_camera(camera)
