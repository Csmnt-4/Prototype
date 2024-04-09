extends Area2D

@onready var animations = $AnimationPlayer
@onready var primaryCollisionBox = $PrimaryCollision
@onready var secondaryCollisionBox = $SecondaryCollision

func disable():
	primaryCollisionBox.disabled = true
	secondaryCollisionBox.disabled = true

func primary_attack():
	animations.play("primary_attack")
	await animations.animation_finished
	animations.seek(0, true)

func secondary_attack():
	animations.play("secondary_attack")
	await animations.animation_finished
	animations.seek(0, true)
