extends Node2D

@onready var heartsContainer = $CanvasLayer/heartsContainer
@onready var player = $TileMap/Player

@onready var bgm = $bgm

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	bgm.play()
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_process(delta):
	pass

func _input(event):
	if(event.is_action_pressed("escape")):
		get_tree().change_scene_to_file("res://gui/start_screen.tscn")

func connect_enemy_event(_signal):
	_signal.connect(get_node("CanvasLayer/goalContainer").enemy_death)

func _on_goal_container_on_goal_done():
	print("game finished!")

func _on_player_player_death():
	get_node("CanvasLayer/GameOverText").visible = true
	print("game over")
