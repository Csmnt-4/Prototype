extends CharacterBody2D

@export var speed = 20
@export var limit = 0.5
@export var endPoint: Marker2D
@export var attackSpeedTimer : Timer
@export var mon_name: String

@onready var animations = $AnimationPlayer
@onready var pop_sound = $popSound
@onready var world = get_node("/root/World")

signal on_death(name)

var startPosition: Vector2
var endPosition: Vector2
"endPoint"
var isDead: bool = false

var playerChase = false
var playerAttack = false
var player : CharacterBody2D = null

func _ready():
	startPosition = position
	endPosition = endPoint.global_position
	world.connect_enemy_event(on_death)

func changeDirection():
	var tempEnd: Vector2 = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection: Vector2 = endPosition - position
	if moveDirection.length() < limit:
		position = endPosition
		moveDirection = Vector2(0,0)
		changeDirection()

	velocity = moveDirection.normalized()*speed

func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		animations.play("walk")

func _physics_process(delta):
	if isDead: return

	if (playerChase):
		chase()
	if (playerAttack):
		attack()
	else:
		updateVelocity()
		move_and_slide()
		updateAnimation()

func _on_hurt_box_area_entered(area):
	print("hurt box area entered")
	if area == $hitBox: return
	print_debug("hurt!! mon, " + mon_name)
	$hitBox.set_deferred("monitorable", false)
	$CollisionShape2D.set_deferred("monitorable", false)
	isDead = true
	pop_sound.play()
	animations.play("deathAnimation")
	await animations.animation_finished
	queue_free()
	on_death.emit(mon_name)


func _on_hurt_box_area_exited(area):
	pass # Replace with function body.


func _on_detection_area_body_entered(body):
	if (body.name == "Player"):
		player = body
		playerChase = true


func _on_detection_area_body_exited(body):
	if (body.name == "Player"):
		player = null
		playerChase = false

func chase():
	#print("chasing")
	position += (player.position - position)/50
	move_and_collide(Vector2(0,0))

func attack():
	if (attackSpeedTimer.time_left > 0):
		return
	print("attackkkkkk")
	animations.play("attack")
	attackSpeedTimer.start()

func _on_attack_range_body_entered(body):
	if (body.name == "Player"):
		playerAttack = true


func _on_attack_range_body_exited(body):
	if (body.name == "Player"):
		playerAttack = false
