extends Area2D

@onready var shape = $CollisionShape2D
@onready var sprite = $Sprite2D
@onready var animations = $AnimationPlayer

func enable():
	shape.disabled = false
	
func disable():
	shape.disabled = true

func primary_attack():
	animations.play("primary_attack")
	enable()
	await animations.animation_finished
	animations.play("RESET")
	disable()
	
func secondary_attack():
	animations.play("secondary_attack")
	enable()
	await animations.animation_finished
	animations.play("RESET")
	disable()
