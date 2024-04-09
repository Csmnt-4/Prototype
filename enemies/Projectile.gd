extends Area2D

@export var speed = 200
@export var direction = Vector2(1, 0)
@onready var animation = $AnimationPlayer

func _ready():
	animation.play("default")

func _process(delta):
	position += direction * speed * delta
	#print(position)
