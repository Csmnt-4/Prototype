extends Node2D

@export var spawn_list: Array
@export var spawn_position: Marker2D
@export var enemy1_endpoint: Marker2D
@export var enemy2_endpoint: Marker2D

@onready var enemy_detector = $EnemyDetector/CollisionShape2D
var num_bodies = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	if (num_bodies > 0): return
	for enemy in spawn_list:
		var new_enemy = enemy.instantiate()
		new_enemy.position = spawn_position.position
		new_enemy.endPoint = enemy1_endpoint
		add_child(new_enemy)


func _on_enemy_detector_body_entered(body):
	print("body entered")
	num_bodies += 1

func _on_enemy_detector_body_exited(body):
	print("body exited")
	num_bodies -= 1
